import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../graphql/queries/submissions.graphql.dart';
import 'auth_service.dart';
import '../config.dart';

class SubmissionService {
  static SubmissionService? _instance;
  static SubmissionService get instance => _instance ??= SubmissionService._();

  SubmissionService._();

  GraphQLClient get _client => AuthService.instance.client;

  String _normalizeLocalIdForBackend(String localId) {
    final uuidPattern = RegExp(
      r'[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}',
    );
    final uuidMatch = uuidPattern.firstMatch(localId);
    if (uuidMatch != null) {
      return uuidMatch.group(0)!;
    }

    return localId.startsWith('local_') ? localId.substring(6) : localId;
  }

  Future<Map<String, dynamic>> getMySubmissionsWithPagination({
    int? first = 5,
    String? after,
    String? surveyId,
  }) async {
    try {
      debugPrint(
        'Submission: Fetching my submissions with pagination${surveyId != null ? ' for survey $surveyId' : ''}',
      );

      final result = await _client.query$MySubmissions(
        Options$Query$MySubmissions(
          variables: Variables$Query$MySubmissions(
            first: first,
            after: after,
            surveyId: surveyId,
          ),
        ),
      );

      if (result.hasException) {
        debugPrint(
          'Submission: Error fetching submissions: ${result.exception}',
        );
        throw Exception('Failed to fetch submissions: ${result.exception}');
      }

      final submissions =
          result.parsedData?.mySubmissions?.edges
              .where((edge) => edge?.node != null)
              .map((edge) => edge!.node!)
              .toList() ??
          [];

      final pageInfo = result.parsedData?.mySubmissions?.pageInfo;

      debugPrint('Submission: Fetched ${submissions.length} submissions');
      return {'submissions': submissions, 'pageInfo': pageInfo};
    } catch (e) {
      debugPrint('Submission: Error in getMySubmissionsWithPagination: $e');
      rethrow;
    }
  }

  /// Lightweight version for list views - only fetches essential fields
  Future<Map<String, dynamic>> getMySubmissionsList({
    int? first = 5,
    String? after,
    String? surveyId,
  }) async {
    try {
      debugPrint(
        'Submission: Fetching lightweight submission list${surveyId != null ? ' for survey $surveyId' : ''}',
      );

      final result = await _client.query$MySubmissionsList(
        Options$Query$MySubmissionsList(
          variables: Variables$Query$MySubmissionsList(
            first: first,
            after: after,
            surveyId: surveyId,
          ),
        ),
      );

      if (result.hasException) {
        debugPrint(
          'Submission: Error fetching submission list: ${result.exception}',
        );
        throw Exception('Failed to fetch submission list: ${result.exception}');
      }

      final submissions =
          result.parsedData?.mySubmissions?.edges
              .where((edge) => edge?.node != null)
              .map((edge) => edge!.node!)
              .toList() ??
          [];

      final pageInfo = result.parsedData?.mySubmissions?.pageInfo;

      debugPrint('Submission: Fetched ${submissions.length} submission list items');
      return {'submissions': submissions, 'pageInfo': pageInfo};
    } catch (e) {
      debugPrint('Submission: Error in getMySubmissionsList: $e');
      rethrow;
    }
  }

  // Keep the original method for backward compatibility
  Future<List<Fragment$SubmissionFields>> getMySubmissions({
    int? first = 5,
    String? after,
  }) async {
    final result = await getMySubmissionsWithPagination(
      first: first,
      after: after,
    );
    return result['submissions'] as List<Fragment$SubmissionFields>;
  }

  Future<Fragment$SubmissionFields?> getSubmissionById(String id) async {
    try {
      debugPrint('Submission: Fetching submission by ID: $id');

      final result = await _client.query$GetSubmissionById(
        Options$Query$GetSubmissionById(
          variables: Variables$Query$GetSubmissionById(id: id),
          fetchPolicy: FetchPolicy.noCache,
        ),
      );

      if (result.hasException) {
        debugPrint(
          'Submission: Error fetching submission by ID: ${result.exception}',
        );
        throw Exception('Failed to fetch submission: ${result.exception}');
      }

      final submission = result.parsedData?.submission;
      debugPrint('Submission: Fetched submission successfully');
      return submission;
    } catch (e) {
      debugPrint('Submission: Error in getSubmissionById: $e');
      rethrow;
    }
  }

  Future<Fragment$SubmissionFields?> getSubmissionByLocalId(
    String localId,
  ) async {
    try {
      final normalizedLocalId = _normalizeLocalIdForBackend(localId);
      debugPrint(
        'Submission: Fetching submission by localId: $normalizedLocalId',
      );

      var result = await _client.query$GetSubmissionByLocalId(
        Options$Query$GetSubmissionByLocalId(
          variables: Variables$Query$GetSubmissionByLocalId(
            localId: normalizedLocalId,
          ),
          fetchPolicy: FetchPolicy.noCache,
        ),
      );

      if (result.hasException) {
        debugPrint(
          'Submission: Error fetching submission by localId: ${result.exception}',
        );
        throw Exception('Failed to fetch submission: ${result.exception}');
      }

      var submission = result.parsedData?.submissionByLocalId;
      if (submission == null && normalizedLocalId != localId) {
        debugPrint(
          'Submission: No submission for normalized localId. Retrying raw localId.',
        );
        result = await _client.query$GetSubmissionByLocalId(
          Options$Query$GetSubmissionByLocalId(
            variables: Variables$Query$GetSubmissionByLocalId(localId: localId),
            fetchPolicy: FetchPolicy.noCache,
          ),
        );

        if (result.hasException) {
          debugPrint(
            'Submission: Error fetching submission by raw localId: ${result.exception}',
          );
          throw Exception('Failed to fetch submission: ${result.exception}');
        }

        submission = result.parsedData?.submissionByLocalId;
      }
      debugPrint('Submission: Fetched submission by localId: ${submission?.id}');
      return submission;
    } catch (e) {
      debugPrint('Submission: Error in getSubmissionByLocalId: $e');
      rethrow;
    }
  }

  Future<Fragment$SubmissionFields?> getSubmissionForSurvey(
    String surveyId,
  ) async {
    try {
      final submissions = await getMySubmissions();

      for (final submission in submissions) {
        if (submission.survey.id == surveyId) {
          return submission;
        }
      }

      return null;
    } catch (e) {
      debugPrint(
        'Submission: Error getting submission for survey $surveyId: $e',
      );
      rethrow;
    }
  }

  Future<Map<String, dynamic>> uploadSignatureImage(
    String submissionId,
    File imageFile,
  ) async {
    try {
      debugPrint(
        'Submission: Uploading signature image for submission $submissionId',
      );

      // Create multipart request
      final uri = Uri.parse(
        '${Config.activeEndpointBase}/survey/api/submission/$submissionId/upload-signature/',
      );
      final request = http.MultipartRequest('POST', uri);

      // Add authorization header
      final token = AuthService.instance.token;
      if (token == null) {
        throw Exception('No authentication token available');
      }
      request.headers['Authorization'] = 'Bearer $token';

      // Add image file
      final fileStream = http.ByteStream(imageFile.openRead());
      final fileLength = await imageFile.length();
      final multipartFile = http.MultipartFile(
        'signature',
        fileStream,
        fileLength,
        filename: imageFile.path.split('/').last,
      );
      request.files.add(multipartFile);

      // Send request
      final response = await request.send().timeout(Config.uploadTimeout);
      final responseBody = await response.stream.bytesToString();

      if (response.statusCode != 200) {
        throw Exception(
          'Failed to upload signature: ${response.statusCode} - $responseBody',
        );
      }

      final result = json.decode(responseBody);
      debugPrint('Submission: Signature uploaded successfully: $result');
      return result;
    } catch (e) {
      debugPrint('Submission: Error uploading signature: $e');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> uploadPhotoImage(
    String submissionId,
    File imageFile,
  ) async {
    try {
      debugPrint(
        'Submission: Uploading photo image for submission $submissionId',
      );

      // Create multipart request
      final uri = Uri.parse(
        '${Config.activeEndpointBase}/survey/api/submission/$submissionId/upload-photo/',
      );
      final request = http.MultipartRequest('POST', uri);

      // Add authorization header
      final token = AuthService.instance.token;
      if (token == null) {
        throw Exception('No authentication token available');
      }
      request.headers['Authorization'] = 'Bearer $token';

      // Add image file
      final fileStream = http.ByteStream(imageFile.openRead());
      final fileLength = await imageFile.length();
      final multipartFile = http.MultipartFile(
        'photo',
        fileStream,
        fileLength,
        filename: imageFile.path.split('/').last,
      );
      request.files.add(multipartFile);

      // Send request
      final response = await request.send().timeout(Config.uploadTimeout);
      final responseBody = await response.stream.bytesToString();

      if (response.statusCode != 200) {
        throw Exception(
          'Failed to upload photo: ${response.statusCode} - $responseBody',
        );
      }

      final result = json.decode(responseBody);
      debugPrint('Submission: Photo uploaded successfully: $result');
      return result;
    } catch (e) {
      debugPrint('Submission: Error uploading photo: $e');
      rethrow;
    }
  }

  // Language storage methods for survey resume functionality
  Future<void> storeSubmissionLanguage(
    String submissionId,
    String language,
  ) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final key = 'submission_language_$submissionId';
      await prefs.setString(key, language);
      debugPrint(
        'SubmissionService: Stored language $language for submission $submissionId',
      );
    } catch (e) {
      debugPrint('SubmissionService: Error storing submission language: $e');
    }
  }

  Future<String?> getSubmissionLanguage(String submissionId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final key = 'submission_language_$submissionId';
      final language = prefs.getString(key);
      debugPrint(
        'SubmissionService: Retrieved language $language for submission $submissionId',
      );
      return language;
    } catch (e) {
      debugPrint('SubmissionService: Error retrieving submission language: $e');
      return null;
    }
  }

  Future<void> removeSubmissionLanguage(String submissionId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final key = 'submission_language_$submissionId';
      await prefs.remove(key);
      debugPrint(
        'SubmissionService: Removed language for submission $submissionId',
      );
    } catch (e) {
      debugPrint('SubmissionService: Error removing submission language: $e');
    }
  }
}
