import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:uuid/uuid.dart';

import '../graphql/queries/surveys.graphql.dart';
import '../schema.graphql.dart';
import 'offline_file_storage_service.dart';
import 'offline_storage_service.dart';
import 'offline_survey_service.dart';
import 'sync_manager.dart';

class OfflineSyncSeedResult {
  final String surveyId;
  final String surveyTitle;
  final int submissionCount;
  final int answerCount;
  final int fileCount;
  final int consentCount;

  const OfflineSyncSeedResult({
    required this.surveyId,
    required this.surveyTitle,
    required this.submissionCount,
    required this.answerCount,
    required this.fileCount,
    required this.consentCount,
  });
}

/// Debug helper for creating realistic offline sync data from real survey IDs.
class OfflineSyncTestSeedService {
  static OfflineSyncTestSeedService? _instance;
  static OfflineSyncTestSeedService get instance =>
      _instance ??= OfflineSyncTestSeedService._();

  OfflineSyncTestSeedService._();

  final OfflineStorageService _storage = OfflineStorageService.instance;

  static const String _naariSurveyRelayId = 'U3VydmV5Tm9kZTo2';
  static const String _naariSurveyRawId = '6';
  static const String _naariSurveyTitle = 'NAARI Survey';

  Future<OfflineSyncSeedResult> seedLocalSurveySixOfflineSyncTest({
    int submissionCount = 40,
    String? language,
  }) async {
    final survey = await _getCachedNaariSurvey(language: language);
    if (survey == null) {
      throw Exception(
        'NAARI Survey was not found in the local mobile DB. Download/cache it first.',
      );
    }

    final questions = _collectAnswerableQuestions(survey);
    if (questions.isEmpty) {
      throw Exception('Survey ${survey.title} has no answerable questions');
    }

    var totalAnswers = 0;
    var totalFiles = 0;
    var totalConsent = 0;

    for (var index = 0; index < submissionCount; index++) {
      final localId = 'local_${const Uuid().v4()}';
      final answers = _buildAnswers(questions, index);
      totalAnswers += answers.length;

      await _storage.saveOfflineSubmission(
        OfflineSubmission(
          localId: localId,
          surveyId: survey.id,
          answersJson: jsonEncode(answers.map((a) => a.toJson()).toList()),
          language: language,
          surveyVersionUsed: survey.updatedAt,
          status: OfflineSubmissionStatus.pendingSync,
        ),
      );

      await _storage.addToSyncQueue(
        SyncQueueItem(
          operationType: SyncOperationType.submitSurvey,
          dataJson: jsonEncode({
            'localId': localId,
            'surveyId': survey.id,
            'answers': answers.map((a) => a.toJson()).toList(),
            'language': language,
            'latitude': null,
            'longitude': null,
            'surveyVersionUsed': survey.updatedAt.toIso8601String(),
          }),
          priority: 5,
        ),
      );

      final signaturePath = await _createSeedFile(
        localId: localId,
        fileType: OfflineFileType.signature,
        index: index,
      );
      await _queuePendingFile(
        localPath: signaturePath,
        fileType: 'signature',
        submissionId: localId,
      );
      totalFiles++;

      final photoPath = await _createSeedFile(
        localId: localId,
        fileType: OfflineFileType.photo,
        index: index,
      );
      await _queuePendingFile(
        localPath: photoPath,
        fileType: 'photo',
        submissionId: localId,
      );
      totalFiles++;

      await _storage.saveConsentAcceptance(
        surveyId: survey.id,
        language: language ?? _defaultLanguageCode(survey),
        consentVersionHash: _consentVersionHash(survey),
        userId: localId,
      );
      totalConsent++;
    }

    await _storage.addSyncLog(
      SyncLogEntry(
        operationType: 'testSeed',
        status: SyncStatus.completed,
        message:
            'Seeded $submissionCount offline submissions, $totalAnswers answers, $totalFiles files, $totalConsent consent rows',
        surveyId: survey.id,
      ),
    );
    await SyncManager.instance.refreshPendingCount();

    return OfflineSyncSeedResult(
      surveyId: survey.id,
      surveyTitle: survey.title,
      submissionCount: submissionCount,
      answerCount: totalAnswers,
      fileCount: totalFiles,
      consentCount: totalConsent,
    );
  }

  Future<Query$Survey$survey?> _getCachedNaariSurvey({
    String? language,
  }) async {
    for (final id in [_naariSurveyRelayId, _naariSurveyRawId]) {
      final survey = await _getCachedSurveyByIdOrNull(id, language: language);
      if (survey != null) return survey;
    }

    final cachedSurveys = await _storage.getAllCachedSurveys();
    for (final cached in cachedSurveys) {
      try {
        final json = jsonDecode(cached.surveyJson) as Map<String, dynamic>;
        final title = json['title']?.toString();
        final id = json['id']?.toString();
        if (title == _naariSurveyTitle || id == _naariSurveyRelayId) {
          return Query$Survey$survey.fromJson(json);
        }
      } catch (_) {
        // Some cache rows are list/basic survey objects, not full survey JSON.
      }
    }

    return null;
  }

  Future<Query$Survey$survey?> _getCachedSurveyByIdOrNull(
    String surveyId, {
    String? language,
  }) async {
    final cached = await _storage.getCachedSurvey(surveyId, language: language);
    if (cached == null) return null;

    try {
      final json = jsonDecode(cached.surveyJson) as Map<String, dynamic>;
      return Query$Survey$survey.fromJson(json);
    } catch (_) {
      return null;
    }
  }

  List<Fragment$QuestionFetch> _collectAnswerableQuestions(
    Query$Survey$survey survey,
  ) {
    final questions = <Fragment$QuestionFetch>[];
    for (final pageEdge in survey.pages.edges) {
      final page = pageEdge?.node;
      if (page == null) continue;
      for (final questionEdge in page.questions.edges) {
        final question = questionEdge?.node;
        if (question == null) continue;
        if (_answerForQuestion(question, 0) != null) {
          questions.add(question);
        }
      }
    }
    questions.sort((a, b) => a.order.compareTo(b.order));
    return questions;
  }

  List<Input$AnswerInput> _buildAnswers(
    List<Fragment$QuestionFetch> questions,
    int submissionIndex,
  ) {
    final answers = <Input$AnswerInput>[];
    for (final question in questions) {
      final answer = _answerForQuestion(question, submissionIndex);
      if (answer != null) answers.add(answer);
    }
    return answers;
  }

  Input$AnswerInput? _answerForQuestion(
    Fragment$QuestionFetch question,
    int submissionIndex,
  ) {
    switch (question.questionType) {
      case Enum$SurveyQuestionQuestionTypeChoices.RADIO:
      case Enum$SurveyQuestionQuestionTypeChoices.DROPDOWN:
        final options = _optionIds(question).toList();
        final option = options.isEmpty ? null : options.first;
        if (option == null) return null;
        return Input$AnswerInput(
          questionId: question.id,
          selectedOptionIds: [option],
        );
      case Enum$SurveyQuestionQuestionTypeChoices.CHECKBOX:
        final options = _optionIds(question).take(2).toList();
        if (options.isEmpty) return null;
        return Input$AnswerInput(
          questionId: question.id,
          selectedOptionIds: options,
        );
      case Enum$SurveyQuestionQuestionTypeChoices.TEXT:
      case Enum$SurveyQuestionQuestionTypeChoices.TEXTAREA:
        return Input$AnswerInput(
          questionId: question.id,
          textAnswer: 'Offline test answer ${submissionIndex + 1}',
        );
      case Enum$SurveyQuestionQuestionTypeChoices.EMAIL:
        return Input$AnswerInput(
          questionId: question.id,
          textAnswer: 'offline.test.${submissionIndex + 1}@example.com',
        );
      case Enum$SurveyQuestionQuestionTypeChoices.NUMBER:
        return Input$AnswerInput(
          questionId: question.id,
          textAnswer: '${submissionIndex + 1}',
        );
      case Enum$SurveyQuestionQuestionTypeChoices.DATE:
        return Input$AnswerInput(
          questionId: question.id,
          textAnswer: DateTime.now()
              .subtract(Duration(days: submissionIndex))
              .toIso8601String()
              .split('T')
              .first,
        );
      case Enum$SurveyQuestionQuestionTypeChoices.DATETIME:
        return Input$AnswerInput(
          questionId: question.id,
          textAnswer: DateTime.now()
              .subtract(Duration(minutes: submissionIndex))
              .toIso8601String(),
        );
      case Enum$SurveyQuestionQuestionTypeChoices.TIME:
        final hour = (9 + submissionIndex) % 24;
        return Input$AnswerInput(
          questionId: question.id,
          textAnswer: '${hour.toString().padLeft(2, '0')}:00',
        );
      case Enum$SurveyQuestionQuestionTypeChoices.CONSENT:
      case Enum$SurveyQuestionQuestionTypeChoices.NOTE:
      case Enum$SurveyQuestionQuestionTypeChoices.$unknown:
        return null;
    }
  }

  Iterable<String> _optionIds(Fragment$QuestionFetch question) {
    return question.options.edges
        .map((edge) => edge?.node?.id)
        .whereType<String>();
  }

  Future<String> _createSeedFile({
    required String localId,
    required OfflineFileType fileType,
    required int index,
  }) async {
    final base = await OfflineFileStorageService.instance.baseDirectory;
    final dirName = fileType == OfflineFileType.signature
        ? 'signatures'
        : 'photos';
    final dir = Directory(path.join(base.path, dirName));
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }
    final fileName =
        '${localId}_${fileType == OfflineFileType.signature ? 'signature' : 'photo'}_$index.png';
    final file = File(path.join(dir.path, fileName));
    await file.writeAsBytes(base64Decode(_onePixelPngBase64), flush: true);
    return file.path;
  }

  Future<void> _queuePendingFile({
    required String localPath,
    required String fileType,
    required String submissionId,
  }) async {
    await _storage.addPendingFile(
      localPath: localPath,
      fileType: fileType,
      submissionId: submissionId,
    );
    await _storage.addToSyncQueue(
      SyncQueueItem(
        operationType: fileType == 'signature'
            ? SyncOperationType.uploadSignature
            : SyncOperationType.uploadPhoto,
        dataJson: jsonEncode({
          'localPath': localPath,
          'submissionId': submissionId,
        }),
        priority: 8,
      ),
    );
  }

  String _defaultLanguageCode(Query$Survey$survey survey) {
    final available = survey.availableLanguages
        ?.whereType<String>()
        .where((lang) => lang.isNotEmpty)
        .toList();
    if (available != null && available.isNotEmpty) {
      return available.first;
    }
    return survey.defaultLanguage.name.toLowerCase();
  }

  String _consentVersionHash(Query$Survey$survey survey) {
    final source = [
      survey.consentText ?? '',
      survey.defaultLanguage.name,
      survey.id,
      survey.updatedAt.toIso8601String(),
    ].join('|');
    return '${source.hashCode.abs()}_${source.length}';
  }
}

const String _onePixelPngBase64 =
    'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mP8/x8AAwMCAO+/p9sAAAAASUVORK5CYII=';
