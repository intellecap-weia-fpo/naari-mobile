import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:package_info_plus/package_info_plus.dart';
import '../graphql/queries/surveys.graphql.dart';
import '../schema.graphql.dart';
import 'auth_service.dart';

class SurveyService {
  static SurveyService? _instance;
  static SurveyService get instance => _instance ??= SurveyService._();

  SurveyService._();

  GraphQLClient get _client => AuthService.instance.client;

  String? _cachedAppVersion;

  /// Returns the running app (APK) version, e.g. "1.0.11+113".
  /// Cached after the first lookup. Returns null if it can't be determined.
  Future<String?> _getAppVersion() async {
    if (_cachedAppVersion != null) return _cachedAppVersion;
    try {
      final info = await PackageInfo.fromPlatform();
      if (info.version.isEmpty) return null;
      _cachedAppVersion = info.buildNumber.isEmpty
          ? info.version
          : '${info.version}+${info.buildNumber}';
      return _cachedAppVersion;
    } catch (e) {
      debugPrint('Survey: Could not resolve app version: $e');
      return null;
    }
  }

  String? _normalizeLocalIdForBackend(String? localId) {
    if (localId == null || localId.isEmpty) return localId;

    final uuidPattern = RegExp(
      r'[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}',
    );
    final uuidMatch = uuidPattern.firstMatch(localId);
    if (uuidMatch != null) {
      return uuidMatch.group(0);
    }

    return localId.startsWith('local_') ? localId.substring(6) : localId;
  }

  Future<List<Query$AccessibleSurveys$accessibleSurveys$edges$node>>
  getAccessibleSurveys({int? first = 20, String? after}) async {
    try {
      debugPrint('Survey: Fetching accessible surveys');
      debugPrint('Survey: Auth token: ${AuthService.instance.token}');
      debugPrint(
        'Survey: Is authenticated: ${AuthService.instance.isAuthenticated}',
      );
      debugPrint('Survey: Auth status: ${AuthService.instance.status}');
      debugPrint('Survey: User: ${AuthService.instance.user}');

      final result = await _client.query$AccessibleSurveys(
        Options$Query$AccessibleSurveys(
          variables: Variables$Query$AccessibleSurveys(
            first: first,
            after: after,
          ),
        ),
      );

      if (result.hasException) {
        debugPrint('Survey: Error fetching surveys: ${result.exception}');
        throw Exception('Failed to fetch surveys: ${result.exception}');
      }
      final surveys =
          result.parsedData?.accessibleSurveys?.edges
              .where((edge) => edge?.node != null)
              .map((edge) => edge!.node!)
              .toList() ??
          [];
      return surveys;
    } catch (e) {
      rethrow;
    }
  }

  /// Fetches basic survey info (without questions) - use for detail page
  Future<Query$SurveyBasic$survey?> getSurveyBasic(
    String id, {
    FetchPolicy? fetchPolicy,
  }) async {
    try {
      debugPrint('Survey: Fetching basic survey info for ID: $id');

      final result = await _client.query$SurveyBasic(
        Options$Query$SurveyBasic(
          variables: Variables$Query$SurveyBasic(id: id),
          fetchPolicy: fetchPolicy ?? FetchPolicy.cacheFirst,
        ),
      );

      if (result.hasException) {
        debugPrint('Survey: Error fetching basic survey: ${result.exception}');
        throw Exception('Failed to fetch survey: ${result.exception}');
      }

      return result.parsedData?.survey;
    } catch (e) {
      debugPrint('Survey: Error in getSurveyBasic: $e');
      rethrow;
    }
  }

  /// Fetches full survey with all questions - use for survey form
  Future<Query$Survey$survey?> getSurvey(
    String id, {
    String? language,
    FetchPolicy? fetchPolicy,
  }) async {
    try {
      debugPrint(
        'Survey: Fetching full survey details for ID: $id with language: $language',
      );

      // When a language is specified, we MUST use noCache to prevent the
      // GraphQL normalized cache from merging localized fields across languages.
      // The normalized cache keys objects by __typename:id, so QuestionNode,
      // SurveyPageNode, and QuestionOptionNode objects with the same id but
      // different languages get merged — causing localizedText from one language
      // to overwrite another. This results in e.g. English survey showing
      // Assamese text. Using noCache bypasses the normalized cache entirely.
      final effectivePolicy =
          fetchPolicy ??
          (language != null ? FetchPolicy.noCache : FetchPolicy.cacheFirst);

      final result = await _client.query$Survey(
        Options$Query$Survey(
          variables: language != null
              ? Variables$Query$Survey(id: id, language: language)
              : Variables$Query$Survey(id: id),
          fetchPolicy: effectivePolicy,
        ),
      );

      if (result.hasException) {
        debugPrint('Survey: Error fetching survey: ${result.exception}');
        throw Exception('Failed to fetch survey: ${result.exception}');
      }

      final survey = result.parsedData?.survey;
      return survey;
    } catch (e) {
      debugPrint('Survey: Error in getSurvey: $e');
      rethrow;
    }
  }

  Future<Mutation$CreateSubmission$createSubmission$submission?>
  createSubmission({required String surveyId, String? status = 'draft', String? localId}) async {
    try {
      debugPrint(
        'Survey: Creating submission for survey: $surveyId with status: $status',
      );
      debugPrint(
        'Survey: Client authenticated: ${AuthService.instance.isAuthenticated}',
      );
      debugPrint(
        'Survey: Token: ${AuthService.instance.token != null ? 'Present' : 'Missing'}',
      );

      final result = await _client.mutate$CreateSubmission(
        Options$Mutation$CreateSubmission(
          variables: Variables$Mutation$CreateSubmission(
            surveyId: surveyId,
            status: status,
            localId: _normalizeLocalIdForBackend(localId),
          ),
        ),
      );

      debugPrint(
        'Survey: CreateSubmission - hasException: ${result.hasException}',
      );
      debugPrint('Survey: CreateSubmission - raw data: ${result.data}');
      debugPrint(
        'Survey: CreateSubmission - parsedData: ${result.parsedData?.toJson()}',
      );

      if (result.hasException) {
        debugPrint('Survey: Error creating submission: ${result.exception}');
        debugPrint(
          'Survey: Exception details: ${result.exception?.graphqlErrors}',
        );
        debugPrint(
          'Survey: Network exception: ${result.exception?.linkException}',
        );
        throw Exception('Failed to create submission: ${result.exception}');
      }

      final submission = result.parsedData?.createSubmission?.submission;
      debugPrint(
        'Survey: Successfully created submission with ID: ${submission?.id}',
      );
      return submission;
    } catch (e) {
      debugPrint('Survey: Error in createSubmission: $e');
      debugPrint('Survey: Stack trace: ${StackTrace.current}');
      rethrow;
    }
  }

  Future<Mutation$SaveAnswer$saveAnswer$answer?> saveAnswer({
    required String submissionId,
    required String questionId,
    String? textAnswer,
    List<String>? selectedOptionIds,
    String? otherText,
  }) async {
    try {
      debugPrint(
        'Survey: Saving answer for submission: $submissionId, question: $questionId',
      );

      final result = await _client.mutate$SaveAnswer(
        Options$Mutation$SaveAnswer(
          variables: Variables$Mutation$SaveAnswer(
            submissionId: submissionId,
            questionId: questionId,
            textAnswer: textAnswer,
            selectedOptionIds: selectedOptionIds,
            otherText: otherText,
          ),
        ),
      );

      if (result.hasException) {
        debugPrint('Survey: Error saving answer: ${result.exception}');
        throw Exception('Failed to save answer: ${result.exception}');
      }

      final savedAnswer = result.parsedData?.saveAnswer;
      if (savedAnswer?.success != true) {
        throw Exception('Failed to save answer: ${savedAnswer?.errors}');
      }
      debugPrint(
        'Survey: SaveAnswer response - success: ${savedAnswer?.success}, '
        'errors: ${savedAnswer?.errors}, '
        'answerId: ${savedAnswer?.answer?.id}, '
        'textAnswer: "${savedAnswer?.answer?.textAnswer}", '
        'selectedOptions: ${savedAnswer?.answer?.selectedOptions.edges.length ?? 0}',
      );
      return savedAnswer?.answer;
    } catch (e) {
      debugPrint('Survey: Error in saveAnswer: $e');
      rethrow;
    }
  }

  Future<Mutation$SubmitSurvey$submitSurvey?> submitSurvey({
    required String surveyId,
    required List<Input$AnswerInput> answers,
    String? language,
    String? submissionId,
    String? localId,
  }) async {
    try {
      debugPrint(
        'Survey: Submitting survey: $surveyId with ${answers.length} answers',
      );

      final result = await _client.mutate$SubmitSurvey(
        Options$Mutation$SubmitSurvey(
          variables: Variables$Mutation$SubmitSurvey(
            surveyId: surveyId,
            answers: answers,
            language: language,
            submissionId: submissionId,
            localId: _normalizeLocalIdForBackend(localId),
          ),
        ),
      );

      if (result.hasException) {
        debugPrint('Survey: Error submitting survey: ${result.exception}');
        throw Exception('Failed to submit survey: ${result.exception}');
      }

      final submitResult = result.parsedData?.submitSurvey;
      if (submitResult?.success != true) {
        throw Exception('Failed to submit survey: ${submitResult?.errors}');
      }

      debugPrint('Survey: Successfully submitted survey');
      return submitResult;
    } catch (e) {
      debugPrint('Survey: Error in submitSurvey: $e');
      rethrow;
    }
  }

  /// Submits a survey, attaching the app (APK) version and, when provided,
  /// latitude/longitude. Falls back to the generated mutation if the server
  /// doesn't yet accept the extra arguments.
  /// Returns the server submission ID if available.
  Future<String?> submitSurveyWithLocation({
    required String surveyId,
    required List<Input$AnswerInput> answers,
    String? language,
    double? latitude,
    double? longitude,
    String? localId,
    String? submissionId,
  }) async {
    try {
      final appVersion = await _getAppVersion();
      debugPrint(
        'Survey: Submitting survey=$surveyId answers=${answers.length} '
        'lat=$latitude lng=$longitude appVersion=$appVersion',
      );

      final doc = graphql.gql(r'''
        mutation SubmitSurveyWithMeta(
          $surveyId: ID!,
          $answers: [AnswerInput!]!,
          $language: String,
          $latitude: Float,
          $longitude: Float,
          $localId: String,
          $submissionId: ID,
          $appVersion: String
        ) {
          submitSurvey(
            surveyId: $surveyId,
            answers: $answers,
            language: $language,
            latitude: $latitude,
            longitude: $longitude,
            localId: $localId,
            submissionId: $submissionId,
            appVersion: $appVersion
          ) {
            success
            errors
            submission { id localId status }
          }
        }
      ''');

      final result = await _client.mutate(
        graphql.MutationOptions(
          document: doc,
          variables: {
            'surveyId': surveyId,
            'answers': answers.map((a) => a.toJson()).toList(),
            'language': language,
            'latitude': latitude,
            'longitude': longitude,
            'localId': _normalizeLocalIdForBackend(localId),
            'submissionId': submissionId,
            'appVersion': appVersion,
          },
        ),
      );

      if (result.hasException) {
        debugPrint(
          'Survey: Error submitting with metadata: ${result.exception}',
        );
        final hasUnknownArg =
            result.exception?.graphqlErrors.any(
              (e) =>
                  e.message.contains('Unknown argument') ||
                  e.message.contains('Unknown field'),
            ) ==
            true;
        if (hasUnknownArg) {
          debugPrint(
            'Survey: Server does not accept the extra arguments yet. '
            'Falling back to the basic submission.',
          );
          final fallbackResult = await submitSurvey(
            surveyId: surveyId,
            answers: answers,
            language: language,
            submissionId: submissionId,
            localId: localId,
          );
          return fallbackResult?.submission?.id;
        }
        throw Exception(
          'Failed to submit survey with metadata: ${result.exception}',
        );
      }

      final data = result.data?['submitSurvey'];
      final success = data?['success'] == true;
      if (!success) {
        debugPrint('Survey: submitSurvey returned errors: ${data?['errors']}');
        throw Exception('Failed to submit survey: ${data?['errors']}');
      }

      final resultSubmissionId = data?['submission']?['id'] as String?;
      debugPrint(
        'Survey: Successfully submitted survey, submission ID: $resultSubmissionId',
      );
      return resultSubmissionId;
    } catch (e) {
      debugPrint('Survey: Error in submitSurveyWithLocation: $e');
      rethrow;
    }
  }
}
