import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../graphql/queries/reports.graphql.dart';
import '../graphql/queries/statistics.graphql.dart';
import '../schema.graphql.dart';
import 'auth_service.dart';

class MySubmissionsResult {
  final List<Query$MySubmissionsReport$mySubmissions$edges$node> submissions;
  final bool hasNextPage;
  final String? endCursor;

  MySubmissionsResult({
    required this.submissions,
    required this.hasNextPage,
    this.endCursor,
  });
}

class ReportService {
  static ReportService? _instance;
  static ReportService get instance => _instance ??= ReportService._();
  
  ReportService._();

  GraphQLClient get _client => AuthService.instance.client;

  // Get submission statistics
  Future<Query$SubmissionStatistics$submissionStatistics?> getSubmissionStatistics() async {
    try {
      debugPrint('Report: Fetching submission statistics');
      
      final result = await _client.query$SubmissionStatistics(
        Options$Query$SubmissionStatistics(
          fetchPolicy: FetchPolicy.networkOnly,
        ),
      );

      if (result.hasException) {
        debugPrint('Report: Error fetching submission statistics: ${result.exception}');
        throw Exception('Failed to fetch submission statistics: ${result.exception}');
      }

      debugPrint('Report: Successfully fetched submission statistics');
      return result.parsedData?.submissionStatistics;
    } catch (e) {
      debugPrint('Report: Error in getSubmissionStatistics: $e');
      rethrow;
    }
  }

  // Get report statistics (using the reports.graphql query)
  Future<Query$ReportStatistics$submissionStatistics?> getReportStatistics() async {
    try {
      debugPrint('Report: Fetching report statistics');
      
      final result = await _client.query$ReportStatistics(
        Options$Query$ReportStatistics(
          fetchPolicy: FetchPolicy.networkOnly,
        ),
      );

      if (result.hasException) {
        debugPrint('Report: Error fetching report statistics: ${result.exception}');
        throw Exception('Failed to fetch report statistics: ${result.exception}');
      }

      debugPrint('Report: Successfully fetched report statistics');
      return result.parsedData?.submissionStatistics;
    } catch (e) {
      debugPrint('Report: Error in getReportStatistics: $e');
      rethrow;
    }
  }

  // Get user's surveys with detailed information
  Future<List<Query$MySurveysReport$mySurveys$edges$node>> getMySurveysReport({
    int? first = 50,
    String? after,
  }) async {
    try {
      debugPrint('Report: Fetching my surveys report');
      
      final result = await _client.query$MySurveysReport(
        Options$Query$MySurveysReport(
          variables: Variables$Query$MySurveysReport(
            first: first,
            after: after,
          ),
          fetchPolicy: FetchPolicy.networkOnly,
        ),
      );

      if (result.hasException) {
        debugPrint('Report: Error fetching my surveys report: ${result.exception}');
        throw Exception('Failed to fetch my surveys report: ${result.exception}');
      }

      final surveys = result.parsedData?.mySurveys?.edges
          .where((edge) => edge?.node != null)
          .map((edge) => edge!.node!)
          .toList() ?? [];

      debugPrint('Report: Fetched ${surveys.length} surveys for report');
      return surveys;
    } catch (e) {
      debugPrint('Report: Error in getMySurveysReport: $e');
      rethrow;
    }
  }

  // Get user's submissions with filtering
  Future<MySubmissionsResult> getMySubmissionsReport({
    int? first = 10,
    String? after,
    Enum$SurveySubmissionStatusChoices? status,
  }) async {
    try {
      debugPrint('Report: Fetching my submissions report with status: $status');
      
      final result = await _client.query$MySubmissionsReport(
        Options$Query$MySubmissionsReport(
          variables: Variables$Query$MySubmissionsReport(
            first: first,
            after: after,
            status: status,
          ),
          fetchPolicy: FetchPolicy.networkOnly,
        ),
      );

      if (result.hasException) {
        debugPrint('Report: Error fetching my submissions report: ${result.exception}');
        throw Exception('Failed to fetch my submissions report: ${result.exception}');
      }

      final connection = result.parsedData?.mySubmissions;
      final submissions = connection?.edges
          .where((edge) => edge?.node != null)
          .map((edge) => edge!.node!)
          .toList() ?? [];

      debugPrint('Report: Fetched ${submissions.length} submissions for my submissions report');
      return MySubmissionsResult(
        submissions: submissions,
        hasNextPage: connection?.pageInfo.hasNextPage ?? false,
        endCursor: connection?.pageInfo.endCursor,
      );
    } catch (e) {
      debugPrint('Report: Error in getMySubmissionsReport: $e');
      rethrow;
    }
  }

  // Get all users report (admin view)
  Future<List<Query$AllUsersReport$allUsers$edges$node>> getAllUsersReport({
    int? first = 50,
    String? after,
    bool? isActive,
  }) async {
    try {
      debugPrint('Report: Fetching all users report');
      
      final result = await _client.query$AllUsersReport(
        Options$Query$AllUsersReport(
          variables: Variables$Query$AllUsersReport(
            first: first,
            after: after,
            isActive: isActive,
          ),
          fetchPolicy: FetchPolicy.networkOnly,
        ),
      );

      if (result.hasException) {
        debugPrint('Report: Error fetching all users report: ${result.exception}');
        throw Exception('Failed to fetch all users report: ${result.exception}');
      }

      final users = result.parsedData?.allUsers?.edges
          .where((edge) => edge?.node != null)
          .map((edge) => edge!.node!)
          .toList() ?? [];

      debugPrint('Report: Fetched ${users.length} users for report');
      return users;
    } catch (e) {
      debugPrint('Report: Error in getAllUsersReport: $e');
      rethrow;
    }
  }

  // Get detailed survey analytics
  Future<Query$SurveyAnalytics$survey?> getSurveyAnalytics(String surveyId) async {
    try {
      debugPrint('Report: Fetching survey analytics for ID: $surveyId');
      
      final result = await _client.query$SurveyAnalytics(
        Options$Query$SurveyAnalytics(
          variables: Variables$Query$SurveyAnalytics(
            surveyId: surveyId,
          ),
          fetchPolicy: FetchPolicy.networkOnly,
        ),
      );

      if (result.hasException) {
        debugPrint('Report: Error fetching survey analytics: ${result.exception}');
        throw Exception('Failed to fetch survey analytics: ${result.exception}');
      }

      debugPrint('Report: Successfully fetched survey analytics');
      return result.parsedData?.survey;
    } catch (e) {
      debugPrint('Report: Error in getSurveyAnalytics: $e');
      rethrow;
    }
  }

  // Helper method to calculate response rates
  Map<String, dynamic> calculateResponseRates(List<dynamic> surveys) {
    int totalSurveys = surveys.length;
    int totalSubmissions = 0;
    int activeSurveys = 0;

    for (var survey in surveys) {
      if (survey.submissionCount != null) {
        totalSubmissions += survey.submissionCount as int;
      }
      if (survey.isActive == true) {
        activeSurveys++;
      }
    }

    double avgResponseRate = totalSurveys > 0 ? totalSubmissions / totalSurveys : 0.0;

    return {
      'totalSurveys': totalSurveys,
      'totalSubmissions': totalSubmissions,
      'activeSurveys': activeSurveys,
      'averageResponseRate': avgResponseRate,
    };
  }

  // Helper method to group submissions by status
  Map<String, int> groupSubmissionsByStatus(List<dynamic> submissions) {
    Map<String, int> statusCounts = {
      'COMPLETED': 0,
      'PENDING': 0,
      'DRAFT': 0,
    };

    for (var submission in submissions) {
      String status = submission.status?.name ?? 'UNKNOWN';
      statusCounts[status] = (statusCounts[status] ?? 0) + 1;
    }

    return statusCounts;
  }

  // Helper method to get submissions by date range
  List<dynamic> getSubmissionsByDateRange(
    List<dynamic> submissions,
    DateTime startDate,
    DateTime endDate,
  ) {
    return submissions.where((submission) {
      if (submission.submittedAt == null) return false;
      DateTime submittedDate = DateTime.parse(submission.submittedAt);
      return submittedDate.isAfter(startDate) && submittedDate.isBefore(endDate);
    }).toList();
  }
}