import '../../schema.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Query$ReportStatistics {
  Query$ReportStatistics({
    this.submissionStatistics,
    this.$__typename = 'Query',
  });

  factory Query$ReportStatistics.fromJson(Map<String, dynamic> json) {
    final l$submissionStatistics = json['submissionStatistics'];
    final l$$__typename = json['__typename'];
    return Query$ReportStatistics(
      submissionStatistics: l$submissionStatistics == null
          ? null
          : Query$ReportStatistics$submissionStatistics.fromJson(
              (l$submissionStatistics as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$ReportStatistics$submissionStatistics? submissionStatistics;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$submissionStatistics = submissionStatistics;
    _resultData['submissionStatistics'] = l$submissionStatistics?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$submissionStatistics = submissionStatistics;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$submissionStatistics,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$ReportStatistics || runtimeType != other.runtimeType) {
      return false;
    }
    final l$submissionStatistics = submissionStatistics;
    final lOther$submissionStatistics = other.submissionStatistics;
    if (l$submissionStatistics != lOther$submissionStatistics) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$ReportStatistics on Query$ReportStatistics {
  CopyWith$Query$ReportStatistics<Query$ReportStatistics> get copyWith =>
      CopyWith$Query$ReportStatistics(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$ReportStatistics<TRes> {
  factory CopyWith$Query$ReportStatistics(
    Query$ReportStatistics instance,
    TRes Function(Query$ReportStatistics) then,
  ) = _CopyWithImpl$Query$ReportStatistics;

  factory CopyWith$Query$ReportStatistics.stub(TRes res) =
      _CopyWithStubImpl$Query$ReportStatistics;

  TRes call({
    Query$ReportStatistics$submissionStatistics? submissionStatistics,
    String? $__typename,
  });
  CopyWith$Query$ReportStatistics$submissionStatistics<TRes>
      get submissionStatistics;
}

class _CopyWithImpl$Query$ReportStatistics<TRes>
    implements CopyWith$Query$ReportStatistics<TRes> {
  _CopyWithImpl$Query$ReportStatistics(
    this._instance,
    this._then,
  );

  final Query$ReportStatistics _instance;

  final TRes Function(Query$ReportStatistics) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? submissionStatistics = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$ReportStatistics(
        submissionStatistics: submissionStatistics == _undefined
            ? _instance.submissionStatistics
            : (submissionStatistics
                as Query$ReportStatistics$submissionStatistics?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$ReportStatistics$submissionStatistics<TRes>
      get submissionStatistics {
    final local$submissionStatistics = _instance.submissionStatistics;
    return local$submissionStatistics == null
        ? CopyWith$Query$ReportStatistics$submissionStatistics.stub(
            _then(_instance))
        : CopyWith$Query$ReportStatistics$submissionStatistics(
            local$submissionStatistics, (e) => call(submissionStatistics: e));
  }
}

class _CopyWithStubImpl$Query$ReportStatistics<TRes>
    implements CopyWith$Query$ReportStatistics<TRes> {
  _CopyWithStubImpl$Query$ReportStatistics(this._res);

  TRes _res;

  call({
    Query$ReportStatistics$submissionStatistics? submissionStatistics,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$ReportStatistics$submissionStatistics<TRes>
      get submissionStatistics =>
          CopyWith$Query$ReportStatistics$submissionStatistics.stub(_res);
}

const documentNodeQueryReportStatistics = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'ReportStatistics'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'submissionStatistics'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'totalCount'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'completedCount'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'pendingCount'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'draftCount'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Query$ReportStatistics _parserFn$Query$ReportStatistics(
        Map<String, dynamic> data) =>
    Query$ReportStatistics.fromJson(data);
typedef OnQueryComplete$Query$ReportStatistics = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$ReportStatistics?,
);

class Options$Query$ReportStatistics
    extends graphql.QueryOptions<Query$ReportStatistics> {
  Options$Query$ReportStatistics({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$ReportStatistics? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$ReportStatistics? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null
                        ? null
                        : _parserFn$Query$ReportStatistics(data),
                  ),
          onError: onError,
          document: documentNodeQueryReportStatistics,
          parserFn: _parserFn$Query$ReportStatistics,
        );

  final OnQueryComplete$Query$ReportStatistics? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$ReportStatistics
    extends graphql.WatchQueryOptions<Query$ReportStatistics> {
  WatchOptions$Query$ReportStatistics({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$ReportStatistics? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryReportStatistics,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$ReportStatistics,
        );
}

class FetchMoreOptions$Query$ReportStatistics extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$ReportStatistics(
      {required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQueryReportStatistics,
        );
}

extension ClientExtension$Query$ReportStatistics on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$ReportStatistics>> query$ReportStatistics(
          [Options$Query$ReportStatistics? options]) async =>
      await this.query(options ?? Options$Query$ReportStatistics());
  graphql.ObservableQuery<Query$ReportStatistics> watchQuery$ReportStatistics(
          [WatchOptions$Query$ReportStatistics? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$ReportStatistics());
  void writeQuery$ReportStatistics({
    required Query$ReportStatistics data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation:
                graphql.Operation(document: documentNodeQueryReportStatistics)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$ReportStatistics? readQuery$ReportStatistics({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryReportStatistics)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$ReportStatistics.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$ReportStatistics>
    useQuery$ReportStatistics([Options$Query$ReportStatistics? options]) =>
        graphql_flutter.useQuery(options ?? Options$Query$ReportStatistics());
graphql.ObservableQuery<Query$ReportStatistics> useWatchQuery$ReportStatistics(
        [WatchOptions$Query$ReportStatistics? options]) =>
    graphql_flutter
        .useWatchQuery(options ?? WatchOptions$Query$ReportStatistics());

class Query$ReportStatistics$Widget
    extends graphql_flutter.Query<Query$ReportStatistics> {
  Query$ReportStatistics$Widget({
    widgets.Key? key,
    Options$Query$ReportStatistics? options,
    required graphql_flutter.QueryBuilder<Query$ReportStatistics> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$ReportStatistics(),
          builder: builder,
        );
}

class Query$ReportStatistics$submissionStatistics {
  Query$ReportStatistics$submissionStatistics({
    this.totalCount,
    this.completedCount,
    this.pendingCount,
    this.draftCount,
    this.$__typename = 'SubmissionStatsType',
  });

  factory Query$ReportStatistics$submissionStatistics.fromJson(
      Map<String, dynamic> json) {
    final l$totalCount = json['totalCount'];
    final l$completedCount = json['completedCount'];
    final l$pendingCount = json['pendingCount'];
    final l$draftCount = json['draftCount'];
    final l$$__typename = json['__typename'];
    return Query$ReportStatistics$submissionStatistics(
      totalCount: (l$totalCount as int?),
      completedCount: (l$completedCount as int?),
      pendingCount: (l$pendingCount as int?),
      draftCount: (l$draftCount as int?),
      $__typename: (l$$__typename as String),
    );
  }

  final int? totalCount;

  final int? completedCount;

  final int? pendingCount;

  final int? draftCount;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$totalCount = totalCount;
    _resultData['totalCount'] = l$totalCount;
    final l$completedCount = completedCount;
    _resultData['completedCount'] = l$completedCount;
    final l$pendingCount = pendingCount;
    _resultData['pendingCount'] = l$pendingCount;
    final l$draftCount = draftCount;
    _resultData['draftCount'] = l$draftCount;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$totalCount = totalCount;
    final l$completedCount = completedCount;
    final l$pendingCount = pendingCount;
    final l$draftCount = draftCount;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$totalCount,
      l$completedCount,
      l$pendingCount,
      l$draftCount,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$ReportStatistics$submissionStatistics ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$totalCount = totalCount;
    final lOther$totalCount = other.totalCount;
    if (l$totalCount != lOther$totalCount) {
      return false;
    }
    final l$completedCount = completedCount;
    final lOther$completedCount = other.completedCount;
    if (l$completedCount != lOther$completedCount) {
      return false;
    }
    final l$pendingCount = pendingCount;
    final lOther$pendingCount = other.pendingCount;
    if (l$pendingCount != lOther$pendingCount) {
      return false;
    }
    final l$draftCount = draftCount;
    final lOther$draftCount = other.draftCount;
    if (l$draftCount != lOther$draftCount) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$ReportStatistics$submissionStatistics
    on Query$ReportStatistics$submissionStatistics {
  CopyWith$Query$ReportStatistics$submissionStatistics<
          Query$ReportStatistics$submissionStatistics>
      get copyWith => CopyWith$Query$ReportStatistics$submissionStatistics(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$ReportStatistics$submissionStatistics<TRes> {
  factory CopyWith$Query$ReportStatistics$submissionStatistics(
    Query$ReportStatistics$submissionStatistics instance,
    TRes Function(Query$ReportStatistics$submissionStatistics) then,
  ) = _CopyWithImpl$Query$ReportStatistics$submissionStatistics;

  factory CopyWith$Query$ReportStatistics$submissionStatistics.stub(TRes res) =
      _CopyWithStubImpl$Query$ReportStatistics$submissionStatistics;

  TRes call({
    int? totalCount,
    int? completedCount,
    int? pendingCount,
    int? draftCount,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$ReportStatistics$submissionStatistics<TRes>
    implements CopyWith$Query$ReportStatistics$submissionStatistics<TRes> {
  _CopyWithImpl$Query$ReportStatistics$submissionStatistics(
    this._instance,
    this._then,
  );

  final Query$ReportStatistics$submissionStatistics _instance;

  final TRes Function(Query$ReportStatistics$submissionStatistics) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? totalCount = _undefined,
    Object? completedCount = _undefined,
    Object? pendingCount = _undefined,
    Object? draftCount = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$ReportStatistics$submissionStatistics(
        totalCount: totalCount == _undefined
            ? _instance.totalCount
            : (totalCount as int?),
        completedCount: completedCount == _undefined
            ? _instance.completedCount
            : (completedCount as int?),
        pendingCount: pendingCount == _undefined
            ? _instance.pendingCount
            : (pendingCount as int?),
        draftCount: draftCount == _undefined
            ? _instance.draftCount
            : (draftCount as int?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$ReportStatistics$submissionStatistics<TRes>
    implements CopyWith$Query$ReportStatistics$submissionStatistics<TRes> {
  _CopyWithStubImpl$Query$ReportStatistics$submissionStatistics(this._res);

  TRes _res;

  call({
    int? totalCount,
    int? completedCount,
    int? pendingCount,
    int? draftCount,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$MySurveysReport {
  factory Variables$Query$MySurveysReport({
    int? first,
    String? after,
  }) =>
      Variables$Query$MySurveysReport._({
        if (first != null) r'first': first,
        if (after != null) r'after': after,
      });

  Variables$Query$MySurveysReport._(this._$data);

  factory Variables$Query$MySurveysReport.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('first')) {
      final l$first = data['first'];
      result$data['first'] = (l$first as int?);
    }
    if (data.containsKey('after')) {
      final l$after = data['after'];
      result$data['after'] = (l$after as String?);
    }
    return Variables$Query$MySurveysReport._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get first => (_$data['first'] as int?);

  String? get after => (_$data['after'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('first')) {
      final l$first = first;
      result$data['first'] = l$first;
    }
    if (_$data.containsKey('after')) {
      final l$after = after;
      result$data['after'] = l$after;
    }
    return result$data;
  }

  CopyWith$Variables$Query$MySurveysReport<Variables$Query$MySurveysReport>
      get copyWith => CopyWith$Variables$Query$MySurveysReport(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$MySurveysReport ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$first = first;
    final lOther$first = other.first;
    if (_$data.containsKey('first') != other._$data.containsKey('first')) {
      return false;
    }
    if (l$first != lOther$first) {
      return false;
    }
    final l$after = after;
    final lOther$after = other.after;
    if (_$data.containsKey('after') != other._$data.containsKey('after')) {
      return false;
    }
    if (l$after != lOther$after) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$first = first;
    final l$after = after;
    return Object.hashAll([
      _$data.containsKey('first') ? l$first : const {},
      _$data.containsKey('after') ? l$after : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$MySurveysReport<TRes> {
  factory CopyWith$Variables$Query$MySurveysReport(
    Variables$Query$MySurveysReport instance,
    TRes Function(Variables$Query$MySurveysReport) then,
  ) = _CopyWithImpl$Variables$Query$MySurveysReport;

  factory CopyWith$Variables$Query$MySurveysReport.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$MySurveysReport;

  TRes call({
    int? first,
    String? after,
  });
}

class _CopyWithImpl$Variables$Query$MySurveysReport<TRes>
    implements CopyWith$Variables$Query$MySurveysReport<TRes> {
  _CopyWithImpl$Variables$Query$MySurveysReport(
    this._instance,
    this._then,
  );

  final Variables$Query$MySurveysReport _instance;

  final TRes Function(Variables$Query$MySurveysReport) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? first = _undefined,
    Object? after = _undefined,
  }) =>
      _then(Variables$Query$MySurveysReport._({
        ..._instance._$data,
        if (first != _undefined) 'first': (first as int?),
        if (after != _undefined) 'after': (after as String?),
      }));
}

class _CopyWithStubImpl$Variables$Query$MySurveysReport<TRes>
    implements CopyWith$Variables$Query$MySurveysReport<TRes> {
  _CopyWithStubImpl$Variables$Query$MySurveysReport(this._res);

  TRes _res;

  call({
    int? first,
    String? after,
  }) =>
      _res;
}

class Query$MySurveysReport {
  Query$MySurveysReport({
    this.mySurveys,
    this.$__typename = 'Query',
  });

  factory Query$MySurveysReport.fromJson(Map<String, dynamic> json) {
    final l$mySurveys = json['mySurveys'];
    final l$$__typename = json['__typename'];
    return Query$MySurveysReport(
      mySurveys: l$mySurveys == null
          ? null
          : Query$MySurveysReport$mySurveys.fromJson(
              (l$mySurveys as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$MySurveysReport$mySurveys? mySurveys;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$mySurveys = mySurveys;
    _resultData['mySurveys'] = l$mySurveys?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$mySurveys = mySurveys;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$mySurveys,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$MySurveysReport || runtimeType != other.runtimeType) {
      return false;
    }
    final l$mySurveys = mySurveys;
    final lOther$mySurveys = other.mySurveys;
    if (l$mySurveys != lOther$mySurveys) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$MySurveysReport on Query$MySurveysReport {
  CopyWith$Query$MySurveysReport<Query$MySurveysReport> get copyWith =>
      CopyWith$Query$MySurveysReport(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$MySurveysReport<TRes> {
  factory CopyWith$Query$MySurveysReport(
    Query$MySurveysReport instance,
    TRes Function(Query$MySurveysReport) then,
  ) = _CopyWithImpl$Query$MySurveysReport;

  factory CopyWith$Query$MySurveysReport.stub(TRes res) =
      _CopyWithStubImpl$Query$MySurveysReport;

  TRes call({
    Query$MySurveysReport$mySurveys? mySurveys,
    String? $__typename,
  });
  CopyWith$Query$MySurveysReport$mySurveys<TRes> get mySurveys;
}

class _CopyWithImpl$Query$MySurveysReport<TRes>
    implements CopyWith$Query$MySurveysReport<TRes> {
  _CopyWithImpl$Query$MySurveysReport(
    this._instance,
    this._then,
  );

  final Query$MySurveysReport _instance;

  final TRes Function(Query$MySurveysReport) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? mySurveys = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$MySurveysReport(
        mySurveys: mySurveys == _undefined
            ? _instance.mySurveys
            : (mySurveys as Query$MySurveysReport$mySurveys?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$MySurveysReport$mySurveys<TRes> get mySurveys {
    final local$mySurveys = _instance.mySurveys;
    return local$mySurveys == null
        ? CopyWith$Query$MySurveysReport$mySurveys.stub(_then(_instance))
        : CopyWith$Query$MySurveysReport$mySurveys(
            local$mySurveys, (e) => call(mySurveys: e));
  }
}

class _CopyWithStubImpl$Query$MySurveysReport<TRes>
    implements CopyWith$Query$MySurveysReport<TRes> {
  _CopyWithStubImpl$Query$MySurveysReport(this._res);

  TRes _res;

  call({
    Query$MySurveysReport$mySurveys? mySurveys,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$MySurveysReport$mySurveys<TRes> get mySurveys =>
      CopyWith$Query$MySurveysReport$mySurveys.stub(_res);
}

const documentNodeQueryMySurveysReport = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'MySurveysReport'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'first')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'after')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'mySurveys'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'first'),
            value: VariableNode(name: NameNode(value: 'first')),
          ),
          ArgumentNode(
            name: NameNode(value: 'after'),
            value: VariableNode(name: NameNode(value: 'after')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'edges'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'node'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'title'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'isActive'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'visibility'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'createdAt'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'submissionCount'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'pageInfo'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'hasNextPage'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'endCursor'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Query$MySurveysReport _parserFn$Query$MySurveysReport(
        Map<String, dynamic> data) =>
    Query$MySurveysReport.fromJson(data);
typedef OnQueryComplete$Query$MySurveysReport = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$MySurveysReport?,
);

class Options$Query$MySurveysReport
    extends graphql.QueryOptions<Query$MySurveysReport> {
  Options$Query$MySurveysReport({
    String? operationName,
    Variables$Query$MySurveysReport? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$MySurveysReport? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$MySurveysReport? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null ? null : _parserFn$Query$MySurveysReport(data),
                  ),
          onError: onError,
          document: documentNodeQueryMySurveysReport,
          parserFn: _parserFn$Query$MySurveysReport,
        );

  final OnQueryComplete$Query$MySurveysReport? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$MySurveysReport
    extends graphql.WatchQueryOptions<Query$MySurveysReport> {
  WatchOptions$Query$MySurveysReport({
    String? operationName,
    Variables$Query$MySurveysReport? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$MySurveysReport? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryMySurveysReport,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$MySurveysReport,
        );
}

class FetchMoreOptions$Query$MySurveysReport extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$MySurveysReport({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$MySurveysReport? variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables?.toJson() ?? {},
          document: documentNodeQueryMySurveysReport,
        );
}

extension ClientExtension$Query$MySurveysReport on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$MySurveysReport>> query$MySurveysReport(
          [Options$Query$MySurveysReport? options]) async =>
      await this.query(options ?? Options$Query$MySurveysReport());
  graphql.ObservableQuery<Query$MySurveysReport> watchQuery$MySurveysReport(
          [WatchOptions$Query$MySurveysReport? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$MySurveysReport());
  void writeQuery$MySurveysReport({
    required Query$MySurveysReport data,
    Variables$Query$MySurveysReport? variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryMySurveysReport),
          variables: variables?.toJson() ?? const {},
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$MySurveysReport? readQuery$MySurveysReport({
    Variables$Query$MySurveysReport? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryMySurveysReport),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$MySurveysReport.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$MySurveysReport> useQuery$MySurveysReport(
        [Options$Query$MySurveysReport? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$MySurveysReport());
graphql.ObservableQuery<Query$MySurveysReport> useWatchQuery$MySurveysReport(
        [WatchOptions$Query$MySurveysReport? options]) =>
    graphql_flutter
        .useWatchQuery(options ?? WatchOptions$Query$MySurveysReport());

class Query$MySurveysReport$Widget
    extends graphql_flutter.Query<Query$MySurveysReport> {
  Query$MySurveysReport$Widget({
    widgets.Key? key,
    Options$Query$MySurveysReport? options,
    required graphql_flutter.QueryBuilder<Query$MySurveysReport> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$MySurveysReport(),
          builder: builder,
        );
}

class Query$MySurveysReport$mySurveys {
  Query$MySurveysReport$mySurveys({
    required this.edges,
    required this.pageInfo,
    this.$__typename = 'SurveyNodeConnection',
  });

  factory Query$MySurveysReport$mySurveys.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$pageInfo = json['pageInfo'];
    final l$$__typename = json['__typename'];
    return Query$MySurveysReport$mySurveys(
      edges: (l$edges as List<dynamic>)
          .map((e) => e == null
              ? null
              : Query$MySurveysReport$mySurveys$edges.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      pageInfo: Query$MySurveysReport$mySurveys$pageInfo.fromJson(
          (l$pageInfo as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$MySurveysReport$mySurveys$edges?> edges;

  final Query$MySurveysReport$mySurveys$pageInfo pageInfo;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$edges = edges;
    _resultData['edges'] = l$edges.map((e) => e?.toJson()).toList();
    final l$pageInfo = pageInfo;
    _resultData['pageInfo'] = l$pageInfo.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$edges = edges;
    final l$pageInfo = pageInfo;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$edges.map((v) => v)),
      l$pageInfo,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$MySurveysReport$mySurveys ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$edges = edges;
    final lOther$edges = other.edges;
    if (l$edges.length != lOther$edges.length) {
      return false;
    }
    for (int i = 0; i < l$edges.length; i++) {
      final l$edges$entry = l$edges[i];
      final lOther$edges$entry = lOther$edges[i];
      if (l$edges$entry != lOther$edges$entry) {
        return false;
      }
    }
    final l$pageInfo = pageInfo;
    final lOther$pageInfo = other.pageInfo;
    if (l$pageInfo != lOther$pageInfo) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$MySurveysReport$mySurveys
    on Query$MySurveysReport$mySurveys {
  CopyWith$Query$MySurveysReport$mySurveys<Query$MySurveysReport$mySurveys>
      get copyWith => CopyWith$Query$MySurveysReport$mySurveys(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$MySurveysReport$mySurveys<TRes> {
  factory CopyWith$Query$MySurveysReport$mySurveys(
    Query$MySurveysReport$mySurveys instance,
    TRes Function(Query$MySurveysReport$mySurveys) then,
  ) = _CopyWithImpl$Query$MySurveysReport$mySurveys;

  factory CopyWith$Query$MySurveysReport$mySurveys.stub(TRes res) =
      _CopyWithStubImpl$Query$MySurveysReport$mySurveys;

  TRes call({
    List<Query$MySurveysReport$mySurveys$edges?>? edges,
    Query$MySurveysReport$mySurveys$pageInfo? pageInfo,
    String? $__typename,
  });
  TRes edges(
      Iterable<Query$MySurveysReport$mySurveys$edges?> Function(
              Iterable<
                  CopyWith$Query$MySurveysReport$mySurveys$edges<
                      Query$MySurveysReport$mySurveys$edges>?>)
          _fn);
  CopyWith$Query$MySurveysReport$mySurveys$pageInfo<TRes> get pageInfo;
}

class _CopyWithImpl$Query$MySurveysReport$mySurveys<TRes>
    implements CopyWith$Query$MySurveysReport$mySurveys<TRes> {
  _CopyWithImpl$Query$MySurveysReport$mySurveys(
    this._instance,
    this._then,
  );

  final Query$MySurveysReport$mySurveys _instance;

  final TRes Function(Query$MySurveysReport$mySurveys) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? pageInfo = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$MySurveysReport$mySurveys(
        edges: edges == _undefined || edges == null
            ? _instance.edges
            : (edges as List<Query$MySurveysReport$mySurveys$edges?>),
        pageInfo: pageInfo == _undefined || pageInfo == null
            ? _instance.pageInfo
            : (pageInfo as Query$MySurveysReport$mySurveys$pageInfo),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes edges(
          Iterable<Query$MySurveysReport$mySurveys$edges?> Function(
                  Iterable<
                      CopyWith$Query$MySurveysReport$mySurveys$edges<
                          Query$MySurveysReport$mySurveys$edges>?>)
              _fn) =>
      call(
          edges: _fn(_instance.edges.map((e) => e == null
              ? null
              : CopyWith$Query$MySurveysReport$mySurveys$edges(
                  e,
                  (i) => i,
                ))).toList());

  CopyWith$Query$MySurveysReport$mySurveys$pageInfo<TRes> get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return CopyWith$Query$MySurveysReport$mySurveys$pageInfo(
        local$pageInfo, (e) => call(pageInfo: e));
  }
}

class _CopyWithStubImpl$Query$MySurveysReport$mySurveys<TRes>
    implements CopyWith$Query$MySurveysReport$mySurveys<TRes> {
  _CopyWithStubImpl$Query$MySurveysReport$mySurveys(this._res);

  TRes _res;

  call({
    List<Query$MySurveysReport$mySurveys$edges?>? edges,
    Query$MySurveysReport$mySurveys$pageInfo? pageInfo,
    String? $__typename,
  }) =>
      _res;

  edges(_fn) => _res;

  CopyWith$Query$MySurveysReport$mySurveys$pageInfo<TRes> get pageInfo =>
      CopyWith$Query$MySurveysReport$mySurveys$pageInfo.stub(_res);
}

class Query$MySurveysReport$mySurveys$edges {
  Query$MySurveysReport$mySurveys$edges({
    this.node,
    this.$__typename = 'SurveyNodeEdge',
  });

  factory Query$MySurveysReport$mySurveys$edges.fromJson(
      Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$MySurveysReport$mySurveys$edges(
      node: l$node == null
          ? null
          : Query$MySurveysReport$mySurveys$edges$node.fromJson(
              (l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$MySurveysReport$mySurveys$edges$node? node;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$node = node;
    _resultData['node'] = l$node?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$node = node;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$node,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$MySurveysReport$mySurveys$edges ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$node = node;
    final lOther$node = other.node;
    if (l$node != lOther$node) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$MySurveysReport$mySurveys$edges
    on Query$MySurveysReport$mySurveys$edges {
  CopyWith$Query$MySurveysReport$mySurveys$edges<
          Query$MySurveysReport$mySurveys$edges>
      get copyWith => CopyWith$Query$MySurveysReport$mySurveys$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$MySurveysReport$mySurveys$edges<TRes> {
  factory CopyWith$Query$MySurveysReport$mySurveys$edges(
    Query$MySurveysReport$mySurveys$edges instance,
    TRes Function(Query$MySurveysReport$mySurveys$edges) then,
  ) = _CopyWithImpl$Query$MySurveysReport$mySurveys$edges;

  factory CopyWith$Query$MySurveysReport$mySurveys$edges.stub(TRes res) =
      _CopyWithStubImpl$Query$MySurveysReport$mySurveys$edges;

  TRes call({
    Query$MySurveysReport$mySurveys$edges$node? node,
    String? $__typename,
  });
  CopyWith$Query$MySurveysReport$mySurveys$edges$node<TRes> get node;
}

class _CopyWithImpl$Query$MySurveysReport$mySurveys$edges<TRes>
    implements CopyWith$Query$MySurveysReport$mySurveys$edges<TRes> {
  _CopyWithImpl$Query$MySurveysReport$mySurveys$edges(
    this._instance,
    this._then,
  );

  final Query$MySurveysReport$mySurveys$edges _instance;

  final TRes Function(Query$MySurveysReport$mySurveys$edges) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$MySurveysReport$mySurveys$edges(
        node: node == _undefined
            ? _instance.node
            : (node as Query$MySurveysReport$mySurveys$edges$node?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$MySurveysReport$mySurveys$edges$node<TRes> get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Query$MySurveysReport$mySurveys$edges$node.stub(
            _then(_instance))
        : CopyWith$Query$MySurveysReport$mySurveys$edges$node(
            local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Query$MySurveysReport$mySurveys$edges<TRes>
    implements CopyWith$Query$MySurveysReport$mySurveys$edges<TRes> {
  _CopyWithStubImpl$Query$MySurveysReport$mySurveys$edges(this._res);

  TRes _res;

  call({
    Query$MySurveysReport$mySurveys$edges$node? node,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$MySurveysReport$mySurveys$edges$node<TRes> get node =>
      CopyWith$Query$MySurveysReport$mySurveys$edges$node.stub(_res);
}

class Query$MySurveysReport$mySurveys$edges$node {
  Query$MySurveysReport$mySurveys$edges$node({
    required this.id,
    required this.title,
    required this.isActive,
    required this.visibility,
    required this.createdAt,
    this.submissionCount,
    this.$__typename = 'SurveyNode',
  });

  factory Query$MySurveysReport$mySurveys$edges$node.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$isActive = json['isActive'];
    final l$visibility = json['visibility'];
    final l$createdAt = json['createdAt'];
    final l$submissionCount = json['submissionCount'];
    final l$$__typename = json['__typename'];
    return Query$MySurveysReport$mySurveys$edges$node(
      id: (l$id as String),
      title: (l$title as String),
      isActive: (l$isActive as bool),
      visibility:
          fromJson$Enum$SurveySurveyVisibilityChoices((l$visibility as String)),
      createdAt: DateTime.parse((l$createdAt as String)),
      submissionCount: (l$submissionCount as int?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final bool isActive;

  final Enum$SurveySurveyVisibilityChoices visibility;

  final DateTime createdAt;

  final int? submissionCount;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$isActive = isActive;
    _resultData['isActive'] = l$isActive;
    final l$visibility = visibility;
    _resultData['visibility'] =
        toJson$Enum$SurveySurveyVisibilityChoices(l$visibility);
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt.toIso8601String();
    final l$submissionCount = submissionCount;
    _resultData['submissionCount'] = l$submissionCount;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$isActive = isActive;
    final l$visibility = visibility;
    final l$createdAt = createdAt;
    final l$submissionCount = submissionCount;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$isActive,
      l$visibility,
      l$createdAt,
      l$submissionCount,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$MySurveysReport$mySurveys$edges$node ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$isActive = isActive;
    final lOther$isActive = other.isActive;
    if (l$isActive != lOther$isActive) {
      return false;
    }
    final l$visibility = visibility;
    final lOther$visibility = other.visibility;
    if (l$visibility != lOther$visibility) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
      return false;
    }
    final l$submissionCount = submissionCount;
    final lOther$submissionCount = other.submissionCount;
    if (l$submissionCount != lOther$submissionCount) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$MySurveysReport$mySurveys$edges$node
    on Query$MySurveysReport$mySurveys$edges$node {
  CopyWith$Query$MySurveysReport$mySurveys$edges$node<
          Query$MySurveysReport$mySurveys$edges$node>
      get copyWith => CopyWith$Query$MySurveysReport$mySurveys$edges$node(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$MySurveysReport$mySurveys$edges$node<TRes> {
  factory CopyWith$Query$MySurveysReport$mySurveys$edges$node(
    Query$MySurveysReport$mySurveys$edges$node instance,
    TRes Function(Query$MySurveysReport$mySurveys$edges$node) then,
  ) = _CopyWithImpl$Query$MySurveysReport$mySurveys$edges$node;

  factory CopyWith$Query$MySurveysReport$mySurveys$edges$node.stub(TRes res) =
      _CopyWithStubImpl$Query$MySurveysReport$mySurveys$edges$node;

  TRes call({
    String? id,
    String? title,
    bool? isActive,
    Enum$SurveySurveyVisibilityChoices? visibility,
    DateTime? createdAt,
    int? submissionCount,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$MySurveysReport$mySurveys$edges$node<TRes>
    implements CopyWith$Query$MySurveysReport$mySurveys$edges$node<TRes> {
  _CopyWithImpl$Query$MySurveysReport$mySurveys$edges$node(
    this._instance,
    this._then,
  );

  final Query$MySurveysReport$mySurveys$edges$node _instance;

  final TRes Function(Query$MySurveysReport$mySurveys$edges$node) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? isActive = _undefined,
    Object? visibility = _undefined,
    Object? createdAt = _undefined,
    Object? submissionCount = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$MySurveysReport$mySurveys$edges$node(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        isActive: isActive == _undefined || isActive == null
            ? _instance.isActive
            : (isActive as bool),
        visibility: visibility == _undefined || visibility == null
            ? _instance.visibility
            : (visibility as Enum$SurveySurveyVisibilityChoices),
        createdAt: createdAt == _undefined || createdAt == null
            ? _instance.createdAt
            : (createdAt as DateTime),
        submissionCount: submissionCount == _undefined
            ? _instance.submissionCount
            : (submissionCount as int?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$MySurveysReport$mySurveys$edges$node<TRes>
    implements CopyWith$Query$MySurveysReport$mySurveys$edges$node<TRes> {
  _CopyWithStubImpl$Query$MySurveysReport$mySurveys$edges$node(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    bool? isActive,
    Enum$SurveySurveyVisibilityChoices? visibility,
    DateTime? createdAt,
    int? submissionCount,
    String? $__typename,
  }) =>
      _res;
}

class Query$MySurveysReport$mySurveys$pageInfo {
  Query$MySurveysReport$mySurveys$pageInfo({
    required this.hasNextPage,
    this.endCursor,
    this.$__typename = 'PageInfo',
  });

  factory Query$MySurveysReport$mySurveys$pageInfo.fromJson(
      Map<String, dynamic> json) {
    final l$hasNextPage = json['hasNextPage'];
    final l$endCursor = json['endCursor'];
    final l$$__typename = json['__typename'];
    return Query$MySurveysReport$mySurveys$pageInfo(
      hasNextPage: (l$hasNextPage as bool),
      endCursor: (l$endCursor as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool hasNextPage;

  final String? endCursor;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$hasNextPage = hasNextPage;
    _resultData['hasNextPage'] = l$hasNextPage;
    final l$endCursor = endCursor;
    _resultData['endCursor'] = l$endCursor;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$hasNextPage = hasNextPage;
    final l$endCursor = endCursor;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$hasNextPage,
      l$endCursor,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$MySurveysReport$mySurveys$pageInfo ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$hasNextPage = hasNextPage;
    final lOther$hasNextPage = other.hasNextPage;
    if (l$hasNextPage != lOther$hasNextPage) {
      return false;
    }
    final l$endCursor = endCursor;
    final lOther$endCursor = other.endCursor;
    if (l$endCursor != lOther$endCursor) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$MySurveysReport$mySurveys$pageInfo
    on Query$MySurveysReport$mySurveys$pageInfo {
  CopyWith$Query$MySurveysReport$mySurveys$pageInfo<
          Query$MySurveysReport$mySurveys$pageInfo>
      get copyWith => CopyWith$Query$MySurveysReport$mySurveys$pageInfo(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$MySurveysReport$mySurveys$pageInfo<TRes> {
  factory CopyWith$Query$MySurveysReport$mySurveys$pageInfo(
    Query$MySurveysReport$mySurveys$pageInfo instance,
    TRes Function(Query$MySurveysReport$mySurveys$pageInfo) then,
  ) = _CopyWithImpl$Query$MySurveysReport$mySurveys$pageInfo;

  factory CopyWith$Query$MySurveysReport$mySurveys$pageInfo.stub(TRes res) =
      _CopyWithStubImpl$Query$MySurveysReport$mySurveys$pageInfo;

  TRes call({
    bool? hasNextPage,
    String? endCursor,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$MySurveysReport$mySurveys$pageInfo<TRes>
    implements CopyWith$Query$MySurveysReport$mySurveys$pageInfo<TRes> {
  _CopyWithImpl$Query$MySurveysReport$mySurveys$pageInfo(
    this._instance,
    this._then,
  );

  final Query$MySurveysReport$mySurveys$pageInfo _instance;

  final TRes Function(Query$MySurveysReport$mySurveys$pageInfo) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? hasNextPage = _undefined,
    Object? endCursor = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$MySurveysReport$mySurveys$pageInfo(
        hasNextPage: hasNextPage == _undefined || hasNextPage == null
            ? _instance.hasNextPage
            : (hasNextPage as bool),
        endCursor: endCursor == _undefined
            ? _instance.endCursor
            : (endCursor as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$MySurveysReport$mySurveys$pageInfo<TRes>
    implements CopyWith$Query$MySurveysReport$mySurveys$pageInfo<TRes> {
  _CopyWithStubImpl$Query$MySurveysReport$mySurveys$pageInfo(this._res);

  TRes _res;

  call({
    bool? hasNextPage,
    String? endCursor,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$SurveySubmissionsReport {
  factory Variables$Query$SurveySubmissionsReport({
    int? first,
    String? after,
  }) =>
      Variables$Query$SurveySubmissionsReport._({
        if (first != null) r'first': first,
        if (after != null) r'after': after,
      });

  Variables$Query$SurveySubmissionsReport._(this._$data);

  factory Variables$Query$SurveySubmissionsReport.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('first')) {
      final l$first = data['first'];
      result$data['first'] = (l$first as int?);
    }
    if (data.containsKey('after')) {
      final l$after = data['after'];
      result$data['after'] = (l$after as String?);
    }
    return Variables$Query$SurveySubmissionsReport._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get first => (_$data['first'] as int?);

  String? get after => (_$data['after'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('first')) {
      final l$first = first;
      result$data['first'] = l$first;
    }
    if (_$data.containsKey('after')) {
      final l$after = after;
      result$data['after'] = l$after;
    }
    return result$data;
  }

  CopyWith$Variables$Query$SurveySubmissionsReport<
          Variables$Query$SurveySubmissionsReport>
      get copyWith => CopyWith$Variables$Query$SurveySubmissionsReport(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$SurveySubmissionsReport ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$first = first;
    final lOther$first = other.first;
    if (_$data.containsKey('first') != other._$data.containsKey('first')) {
      return false;
    }
    if (l$first != lOther$first) {
      return false;
    }
    final l$after = after;
    final lOther$after = other.after;
    if (_$data.containsKey('after') != other._$data.containsKey('after')) {
      return false;
    }
    if (l$after != lOther$after) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$first = first;
    final l$after = after;
    return Object.hashAll([
      _$data.containsKey('first') ? l$first : const {},
      _$data.containsKey('after') ? l$after : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$SurveySubmissionsReport<TRes> {
  factory CopyWith$Variables$Query$SurveySubmissionsReport(
    Variables$Query$SurveySubmissionsReport instance,
    TRes Function(Variables$Query$SurveySubmissionsReport) then,
  ) = _CopyWithImpl$Variables$Query$SurveySubmissionsReport;

  factory CopyWith$Variables$Query$SurveySubmissionsReport.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$SurveySubmissionsReport;

  TRes call({
    int? first,
    String? after,
  });
}

class _CopyWithImpl$Variables$Query$SurveySubmissionsReport<TRes>
    implements CopyWith$Variables$Query$SurveySubmissionsReport<TRes> {
  _CopyWithImpl$Variables$Query$SurveySubmissionsReport(
    this._instance,
    this._then,
  );

  final Variables$Query$SurveySubmissionsReport _instance;

  final TRes Function(Variables$Query$SurveySubmissionsReport) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? first = _undefined,
    Object? after = _undefined,
  }) =>
      _then(Variables$Query$SurveySubmissionsReport._({
        ..._instance._$data,
        if (first != _undefined) 'first': (first as int?),
        if (after != _undefined) 'after': (after as String?),
      }));
}

class _CopyWithStubImpl$Variables$Query$SurveySubmissionsReport<TRes>
    implements CopyWith$Variables$Query$SurveySubmissionsReport<TRes> {
  _CopyWithStubImpl$Variables$Query$SurveySubmissionsReport(this._res);

  TRes _res;

  call({
    int? first,
    String? after,
  }) =>
      _res;
}

class Query$SurveySubmissionsReport {
  Query$SurveySubmissionsReport({
    this.surveySubmissions,
    this.$__typename = 'Query',
  });

  factory Query$SurveySubmissionsReport.fromJson(Map<String, dynamic> json) {
    final l$surveySubmissions = json['surveySubmissions'];
    final l$$__typename = json['__typename'];
    return Query$SurveySubmissionsReport(
      surveySubmissions: l$surveySubmissions == null
          ? null
          : Query$SurveySubmissionsReport$surveySubmissions.fromJson(
              (l$surveySubmissions as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$SurveySubmissionsReport$surveySubmissions? surveySubmissions;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$surveySubmissions = surveySubmissions;
    _resultData['surveySubmissions'] = l$surveySubmissions?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$surveySubmissions = surveySubmissions;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$surveySubmissions,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$SurveySubmissionsReport ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$surveySubmissions = surveySubmissions;
    final lOther$surveySubmissions = other.surveySubmissions;
    if (l$surveySubmissions != lOther$surveySubmissions) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$SurveySubmissionsReport
    on Query$SurveySubmissionsReport {
  CopyWith$Query$SurveySubmissionsReport<Query$SurveySubmissionsReport>
      get copyWith => CopyWith$Query$SurveySubmissionsReport(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$SurveySubmissionsReport<TRes> {
  factory CopyWith$Query$SurveySubmissionsReport(
    Query$SurveySubmissionsReport instance,
    TRes Function(Query$SurveySubmissionsReport) then,
  ) = _CopyWithImpl$Query$SurveySubmissionsReport;

  factory CopyWith$Query$SurveySubmissionsReport.stub(TRes res) =
      _CopyWithStubImpl$Query$SurveySubmissionsReport;

  TRes call({
    Query$SurveySubmissionsReport$surveySubmissions? surveySubmissions,
    String? $__typename,
  });
  CopyWith$Query$SurveySubmissionsReport$surveySubmissions<TRes>
      get surveySubmissions;
}

class _CopyWithImpl$Query$SurveySubmissionsReport<TRes>
    implements CopyWith$Query$SurveySubmissionsReport<TRes> {
  _CopyWithImpl$Query$SurveySubmissionsReport(
    this._instance,
    this._then,
  );

  final Query$SurveySubmissionsReport _instance;

  final TRes Function(Query$SurveySubmissionsReport) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? surveySubmissions = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$SurveySubmissionsReport(
        surveySubmissions: surveySubmissions == _undefined
            ? _instance.surveySubmissions
            : (surveySubmissions
                as Query$SurveySubmissionsReport$surveySubmissions?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$SurveySubmissionsReport$surveySubmissions<TRes>
      get surveySubmissions {
    final local$surveySubmissions = _instance.surveySubmissions;
    return local$surveySubmissions == null
        ? CopyWith$Query$SurveySubmissionsReport$surveySubmissions.stub(
            _then(_instance))
        : CopyWith$Query$SurveySubmissionsReport$surveySubmissions(
            local$surveySubmissions, (e) => call(surveySubmissions: e));
  }
}

class _CopyWithStubImpl$Query$SurveySubmissionsReport<TRes>
    implements CopyWith$Query$SurveySubmissionsReport<TRes> {
  _CopyWithStubImpl$Query$SurveySubmissionsReport(this._res);

  TRes _res;

  call({
    Query$SurveySubmissionsReport$surveySubmissions? surveySubmissions,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$SurveySubmissionsReport$surveySubmissions<TRes>
      get surveySubmissions =>
          CopyWith$Query$SurveySubmissionsReport$surveySubmissions.stub(_res);
}

const documentNodeQuerySurveySubmissionsReport = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'SurveySubmissionsReport'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'first')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'after')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'surveySubmissions'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'first'),
            value: VariableNode(name: NameNode(value: 'first')),
          ),
          ArgumentNode(
            name: NameNode(value: 'after'),
            value: VariableNode(name: NameNode(value: 'after')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'edges'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'node'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'submittedAt'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'status'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'user'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                        name: NameNode(value: 'username'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: '__typename'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                    ]),
                  ),
                  FieldNode(
                    name: NameNode(value: 'survey'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                        name: NameNode(value: 'id'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'title'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: '__typename'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                    ]),
                  ),
                  FieldNode(
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'pageInfo'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'hasNextPage'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'endCursor'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Query$SurveySubmissionsReport _parserFn$Query$SurveySubmissionsReport(
        Map<String, dynamic> data) =>
    Query$SurveySubmissionsReport.fromJson(data);
typedef OnQueryComplete$Query$SurveySubmissionsReport = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$SurveySubmissionsReport?,
);

class Options$Query$SurveySubmissionsReport
    extends graphql.QueryOptions<Query$SurveySubmissionsReport> {
  Options$Query$SurveySubmissionsReport({
    String? operationName,
    Variables$Query$SurveySubmissionsReport? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$SurveySubmissionsReport? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$SurveySubmissionsReport? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null
                        ? null
                        : _parserFn$Query$SurveySubmissionsReport(data),
                  ),
          onError: onError,
          document: documentNodeQuerySurveySubmissionsReport,
          parserFn: _parserFn$Query$SurveySubmissionsReport,
        );

  final OnQueryComplete$Query$SurveySubmissionsReport? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$SurveySubmissionsReport
    extends graphql.WatchQueryOptions<Query$SurveySubmissionsReport> {
  WatchOptions$Query$SurveySubmissionsReport({
    String? operationName,
    Variables$Query$SurveySubmissionsReport? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$SurveySubmissionsReport? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQuerySurveySubmissionsReport,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$SurveySubmissionsReport,
        );
}

class FetchMoreOptions$Query$SurveySubmissionsReport
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$SurveySubmissionsReport({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$SurveySubmissionsReport? variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables?.toJson() ?? {},
          document: documentNodeQuerySurveySubmissionsReport,
        );
}

extension ClientExtension$Query$SurveySubmissionsReport
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$SurveySubmissionsReport>>
      query$SurveySubmissionsReport(
              [Options$Query$SurveySubmissionsReport? options]) async =>
          await this.query(options ?? Options$Query$SurveySubmissionsReport());
  graphql.ObservableQuery<
      Query$SurveySubmissionsReport> watchQuery$SurveySubmissionsReport(
          [WatchOptions$Query$SurveySubmissionsReport? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$SurveySubmissionsReport());
  void writeQuery$SurveySubmissionsReport({
    required Query$SurveySubmissionsReport data,
    Variables$Query$SurveySubmissionsReport? variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerySurveySubmissionsReport),
          variables: variables?.toJson() ?? const {},
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$SurveySubmissionsReport? readQuery$SurveySubmissionsReport({
    Variables$Query$SurveySubmissionsReport? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQuerySurveySubmissionsReport),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$SurveySubmissionsReport.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$SurveySubmissionsReport>
    useQuery$SurveySubmissionsReport(
            [Options$Query$SurveySubmissionsReport? options]) =>
        graphql_flutter
            .useQuery(options ?? Options$Query$SurveySubmissionsReport());
graphql.ObservableQuery<Query$SurveySubmissionsReport>
    useWatchQuery$SurveySubmissionsReport(
            [WatchOptions$Query$SurveySubmissionsReport? options]) =>
        graphql_flutter.useWatchQuery(
            options ?? WatchOptions$Query$SurveySubmissionsReport());

class Query$SurveySubmissionsReport$Widget
    extends graphql_flutter.Query<Query$SurveySubmissionsReport> {
  Query$SurveySubmissionsReport$Widget({
    widgets.Key? key,
    Options$Query$SurveySubmissionsReport? options,
    required graphql_flutter.QueryBuilder<Query$SurveySubmissionsReport>
        builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$SurveySubmissionsReport(),
          builder: builder,
        );
}

class Query$SurveySubmissionsReport$surveySubmissions {
  Query$SurveySubmissionsReport$surveySubmissions({
    required this.edges,
    required this.pageInfo,
    this.$__typename = 'SubmissionNodeConnection',
  });

  factory Query$SurveySubmissionsReport$surveySubmissions.fromJson(
      Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$pageInfo = json['pageInfo'];
    final l$$__typename = json['__typename'];
    return Query$SurveySubmissionsReport$surveySubmissions(
      edges: (l$edges as List<dynamic>)
          .map((e) => e == null
              ? null
              : Query$SurveySubmissionsReport$surveySubmissions$edges.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      pageInfo:
          Query$SurveySubmissionsReport$surveySubmissions$pageInfo.fromJson(
              (l$pageInfo as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$SurveySubmissionsReport$surveySubmissions$edges?> edges;

  final Query$SurveySubmissionsReport$surveySubmissions$pageInfo pageInfo;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$edges = edges;
    _resultData['edges'] = l$edges.map((e) => e?.toJson()).toList();
    final l$pageInfo = pageInfo;
    _resultData['pageInfo'] = l$pageInfo.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$edges = edges;
    final l$pageInfo = pageInfo;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$edges.map((v) => v)),
      l$pageInfo,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$SurveySubmissionsReport$surveySubmissions ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$edges = edges;
    final lOther$edges = other.edges;
    if (l$edges.length != lOther$edges.length) {
      return false;
    }
    for (int i = 0; i < l$edges.length; i++) {
      final l$edges$entry = l$edges[i];
      final lOther$edges$entry = lOther$edges[i];
      if (l$edges$entry != lOther$edges$entry) {
        return false;
      }
    }
    final l$pageInfo = pageInfo;
    final lOther$pageInfo = other.pageInfo;
    if (l$pageInfo != lOther$pageInfo) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$SurveySubmissionsReport$surveySubmissions
    on Query$SurveySubmissionsReport$surveySubmissions {
  CopyWith$Query$SurveySubmissionsReport$surveySubmissions<
          Query$SurveySubmissionsReport$surveySubmissions>
      get copyWith => CopyWith$Query$SurveySubmissionsReport$surveySubmissions(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$SurveySubmissionsReport$surveySubmissions<TRes> {
  factory CopyWith$Query$SurveySubmissionsReport$surveySubmissions(
    Query$SurveySubmissionsReport$surveySubmissions instance,
    TRes Function(Query$SurveySubmissionsReport$surveySubmissions) then,
  ) = _CopyWithImpl$Query$SurveySubmissionsReport$surveySubmissions;

  factory CopyWith$Query$SurveySubmissionsReport$surveySubmissions.stub(
          TRes res) =
      _CopyWithStubImpl$Query$SurveySubmissionsReport$surveySubmissions;

  TRes call({
    List<Query$SurveySubmissionsReport$surveySubmissions$edges?>? edges,
    Query$SurveySubmissionsReport$surveySubmissions$pageInfo? pageInfo,
    String? $__typename,
  });
  TRes edges(
      Iterable<Query$SurveySubmissionsReport$surveySubmissions$edges?> Function(
              Iterable<
                  CopyWith$Query$SurveySubmissionsReport$surveySubmissions$edges<
                      Query$SurveySubmissionsReport$surveySubmissions$edges>?>)
          _fn);
  CopyWith$Query$SurveySubmissionsReport$surveySubmissions$pageInfo<TRes>
      get pageInfo;
}

class _CopyWithImpl$Query$SurveySubmissionsReport$surveySubmissions<TRes>
    implements CopyWith$Query$SurveySubmissionsReport$surveySubmissions<TRes> {
  _CopyWithImpl$Query$SurveySubmissionsReport$surveySubmissions(
    this._instance,
    this._then,
  );

  final Query$SurveySubmissionsReport$surveySubmissions _instance;

  final TRes Function(Query$SurveySubmissionsReport$surveySubmissions) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? pageInfo = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$SurveySubmissionsReport$surveySubmissions(
        edges: edges == _undefined || edges == null
            ? _instance.edges
            : (edges as List<
                Query$SurveySubmissionsReport$surveySubmissions$edges?>),
        pageInfo: pageInfo == _undefined || pageInfo == null
            ? _instance.pageInfo
            : (pageInfo
                as Query$SurveySubmissionsReport$surveySubmissions$pageInfo),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes edges(
          Iterable<Query$SurveySubmissionsReport$surveySubmissions$edges?> Function(
                  Iterable<
                      CopyWith$Query$SurveySubmissionsReport$surveySubmissions$edges<
                          Query$SurveySubmissionsReport$surveySubmissions$edges>?>)
              _fn) =>
      call(
          edges: _fn(_instance.edges.map((e) => e == null
              ? null
              : CopyWith$Query$SurveySubmissionsReport$surveySubmissions$edges(
                  e,
                  (i) => i,
                ))).toList());

  CopyWith$Query$SurveySubmissionsReport$surveySubmissions$pageInfo<TRes>
      get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return CopyWith$Query$SurveySubmissionsReport$surveySubmissions$pageInfo(
        local$pageInfo, (e) => call(pageInfo: e));
  }
}

class _CopyWithStubImpl$Query$SurveySubmissionsReport$surveySubmissions<TRes>
    implements CopyWith$Query$SurveySubmissionsReport$surveySubmissions<TRes> {
  _CopyWithStubImpl$Query$SurveySubmissionsReport$surveySubmissions(this._res);

  TRes _res;

  call({
    List<Query$SurveySubmissionsReport$surveySubmissions$edges?>? edges,
    Query$SurveySubmissionsReport$surveySubmissions$pageInfo? pageInfo,
    String? $__typename,
  }) =>
      _res;

  edges(_fn) => _res;

  CopyWith$Query$SurveySubmissionsReport$surveySubmissions$pageInfo<TRes>
      get pageInfo =>
          CopyWith$Query$SurveySubmissionsReport$surveySubmissions$pageInfo
              .stub(_res);
}

class Query$SurveySubmissionsReport$surveySubmissions$edges {
  Query$SurveySubmissionsReport$surveySubmissions$edges({
    this.node,
    this.$__typename = 'SubmissionNodeEdge',
  });

  factory Query$SurveySubmissionsReport$surveySubmissions$edges.fromJson(
      Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$SurveySubmissionsReport$surveySubmissions$edges(
      node: l$node == null
          ? null
          : Query$SurveySubmissionsReport$surveySubmissions$edges$node.fromJson(
              (l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$SurveySubmissionsReport$surveySubmissions$edges$node? node;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$node = node;
    _resultData['node'] = l$node?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$node = node;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$node,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$SurveySubmissionsReport$surveySubmissions$edges ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$node = node;
    final lOther$node = other.node;
    if (l$node != lOther$node) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$SurveySubmissionsReport$surveySubmissions$edges
    on Query$SurveySubmissionsReport$surveySubmissions$edges {
  CopyWith$Query$SurveySubmissionsReport$surveySubmissions$edges<
          Query$SurveySubmissionsReport$surveySubmissions$edges>
      get copyWith =>
          CopyWith$Query$SurveySubmissionsReport$surveySubmissions$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$SurveySubmissionsReport$surveySubmissions$edges<
    TRes> {
  factory CopyWith$Query$SurveySubmissionsReport$surveySubmissions$edges(
    Query$SurveySubmissionsReport$surveySubmissions$edges instance,
    TRes Function(Query$SurveySubmissionsReport$surveySubmissions$edges) then,
  ) = _CopyWithImpl$Query$SurveySubmissionsReport$surveySubmissions$edges;

  factory CopyWith$Query$SurveySubmissionsReport$surveySubmissions$edges.stub(
          TRes res) =
      _CopyWithStubImpl$Query$SurveySubmissionsReport$surveySubmissions$edges;

  TRes call({
    Query$SurveySubmissionsReport$surveySubmissions$edges$node? node,
    String? $__typename,
  });
  CopyWith$Query$SurveySubmissionsReport$surveySubmissions$edges$node<TRes>
      get node;
}

class _CopyWithImpl$Query$SurveySubmissionsReport$surveySubmissions$edges<TRes>
    implements
        CopyWith$Query$SurveySubmissionsReport$surveySubmissions$edges<TRes> {
  _CopyWithImpl$Query$SurveySubmissionsReport$surveySubmissions$edges(
    this._instance,
    this._then,
  );

  final Query$SurveySubmissionsReport$surveySubmissions$edges _instance;

  final TRes Function(Query$SurveySubmissionsReport$surveySubmissions$edges)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$SurveySubmissionsReport$surveySubmissions$edges(
        node: node == _undefined
            ? _instance.node
            : (node
                as Query$SurveySubmissionsReport$surveySubmissions$edges$node?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$SurveySubmissionsReport$surveySubmissions$edges$node<TRes>
      get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Query$SurveySubmissionsReport$surveySubmissions$edges$node
            .stub(_then(_instance))
        : CopyWith$Query$SurveySubmissionsReport$surveySubmissions$edges$node(
            local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Query$SurveySubmissionsReport$surveySubmissions$edges<
        TRes>
    implements
        CopyWith$Query$SurveySubmissionsReport$surveySubmissions$edges<TRes> {
  _CopyWithStubImpl$Query$SurveySubmissionsReport$surveySubmissions$edges(
      this._res);

  TRes _res;

  call({
    Query$SurveySubmissionsReport$surveySubmissions$edges$node? node,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$SurveySubmissionsReport$surveySubmissions$edges$node<TRes>
      get node =>
          CopyWith$Query$SurveySubmissionsReport$surveySubmissions$edges$node
              .stub(_res);
}

class Query$SurveySubmissionsReport$surveySubmissions$edges$node {
  Query$SurveySubmissionsReport$surveySubmissions$edges$node({
    required this.id,
    required this.submittedAt,
    required this.status,
    this.user,
    required this.survey,
    this.$__typename = 'SubmissionNode',
  });

  factory Query$SurveySubmissionsReport$surveySubmissions$edges$node.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$submittedAt = json['submittedAt'];
    final l$status = json['status'];
    final l$user = json['user'];
    final l$survey = json['survey'];
    final l$$__typename = json['__typename'];
    return Query$SurveySubmissionsReport$surveySubmissions$edges$node(
      id: (l$id as String),
      submittedAt: DateTime.parse((l$submittedAt as String)),
      status: fromJson$Enum$SurveySubmissionStatusChoices((l$status as String)),
      user: l$user == null
          ? null
          : Query$SurveySubmissionsReport$surveySubmissions$edges$node$user
              .fromJson((l$user as Map<String, dynamic>)),
      survey: Query$SurveySubmissionsReport$surveySubmissions$edges$node$survey
          .fromJson((l$survey as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final DateTime submittedAt;

  final Enum$SurveySubmissionStatusChoices status;

  final Query$SurveySubmissionsReport$surveySubmissions$edges$node$user? user;

  final Query$SurveySubmissionsReport$surveySubmissions$edges$node$survey
      survey;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$submittedAt = submittedAt;
    _resultData['submittedAt'] = l$submittedAt.toIso8601String();
    final l$status = status;
    _resultData['status'] = toJson$Enum$SurveySubmissionStatusChoices(l$status);
    final l$user = user;
    _resultData['user'] = l$user?.toJson();
    final l$survey = survey;
    _resultData['survey'] = l$survey.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$submittedAt = submittedAt;
    final l$status = status;
    final l$user = user;
    final l$survey = survey;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$submittedAt,
      l$status,
      l$user,
      l$survey,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$SurveySubmissionsReport$surveySubmissions$edges$node ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$submittedAt = submittedAt;
    final lOther$submittedAt = other.submittedAt;
    if (l$submittedAt != lOther$submittedAt) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$user = user;
    final lOther$user = other.user;
    if (l$user != lOther$user) {
      return false;
    }
    final l$survey = survey;
    final lOther$survey = other.survey;
    if (l$survey != lOther$survey) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$SurveySubmissionsReport$surveySubmissions$edges$node
    on Query$SurveySubmissionsReport$surveySubmissions$edges$node {
  CopyWith$Query$SurveySubmissionsReport$surveySubmissions$edges$node<
          Query$SurveySubmissionsReport$surveySubmissions$edges$node>
      get copyWith =>
          CopyWith$Query$SurveySubmissionsReport$surveySubmissions$edges$node(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$SurveySubmissionsReport$surveySubmissions$edges$node<
    TRes> {
  factory CopyWith$Query$SurveySubmissionsReport$surveySubmissions$edges$node(
    Query$SurveySubmissionsReport$surveySubmissions$edges$node instance,
    TRes Function(Query$SurveySubmissionsReport$surveySubmissions$edges$node)
        then,
  ) = _CopyWithImpl$Query$SurveySubmissionsReport$surveySubmissions$edges$node;

  factory CopyWith$Query$SurveySubmissionsReport$surveySubmissions$edges$node.stub(
          TRes res) =
      _CopyWithStubImpl$Query$SurveySubmissionsReport$surveySubmissions$edges$node;

  TRes call({
    String? id,
    DateTime? submittedAt,
    Enum$SurveySubmissionStatusChoices? status,
    Query$SurveySubmissionsReport$surveySubmissions$edges$node$user? user,
    Query$SurveySubmissionsReport$surveySubmissions$edges$node$survey? survey,
    String? $__typename,
  });
  CopyWith$Query$SurveySubmissionsReport$surveySubmissions$edges$node$user<TRes>
      get user;
  CopyWith$Query$SurveySubmissionsReport$surveySubmissions$edges$node$survey<
      TRes> get survey;
}

class _CopyWithImpl$Query$SurveySubmissionsReport$surveySubmissions$edges$node<
        TRes>
    implements
        CopyWith$Query$SurveySubmissionsReport$surveySubmissions$edges$node<
            TRes> {
  _CopyWithImpl$Query$SurveySubmissionsReport$surveySubmissions$edges$node(
    this._instance,
    this._then,
  );

  final Query$SurveySubmissionsReport$surveySubmissions$edges$node _instance;

  final TRes Function(
      Query$SurveySubmissionsReport$surveySubmissions$edges$node) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? submittedAt = _undefined,
    Object? status = _undefined,
    Object? user = _undefined,
    Object? survey = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$SurveySubmissionsReport$surveySubmissions$edges$node(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        submittedAt: submittedAt == _undefined || submittedAt == null
            ? _instance.submittedAt
            : (submittedAt as DateTime),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as Enum$SurveySubmissionStatusChoices),
        user: user == _undefined
            ? _instance.user
            : (user
                as Query$SurveySubmissionsReport$surveySubmissions$edges$node$user?),
        survey: survey == _undefined || survey == null
            ? _instance.survey
            : (survey
                as Query$SurveySubmissionsReport$surveySubmissions$edges$node$survey),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$SurveySubmissionsReport$surveySubmissions$edges$node$user<TRes>
      get user {
    final local$user = _instance.user;
    return local$user == null
        ? CopyWith$Query$SurveySubmissionsReport$surveySubmissions$edges$node$user
            .stub(_then(_instance))
        : CopyWith$Query$SurveySubmissionsReport$surveySubmissions$edges$node$user(
            local$user, (e) => call(user: e));
  }

  CopyWith$Query$SurveySubmissionsReport$surveySubmissions$edges$node$survey<
      TRes> get survey {
    final local$survey = _instance.survey;
    return CopyWith$Query$SurveySubmissionsReport$surveySubmissions$edges$node$survey(
        local$survey, (e) => call(survey: e));
  }
}

class _CopyWithStubImpl$Query$SurveySubmissionsReport$surveySubmissions$edges$node<
        TRes>
    implements
        CopyWith$Query$SurveySubmissionsReport$surveySubmissions$edges$node<
            TRes> {
  _CopyWithStubImpl$Query$SurveySubmissionsReport$surveySubmissions$edges$node(
      this._res);

  TRes _res;

  call({
    String? id,
    DateTime? submittedAt,
    Enum$SurveySubmissionStatusChoices? status,
    Query$SurveySubmissionsReport$surveySubmissions$edges$node$user? user,
    Query$SurveySubmissionsReport$surveySubmissions$edges$node$survey? survey,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$SurveySubmissionsReport$surveySubmissions$edges$node$user<TRes>
      get user =>
          CopyWith$Query$SurveySubmissionsReport$surveySubmissions$edges$node$user
              .stub(_res);

  CopyWith$Query$SurveySubmissionsReport$surveySubmissions$edges$node$survey<
          TRes>
      get survey =>
          CopyWith$Query$SurveySubmissionsReport$surveySubmissions$edges$node$survey
              .stub(_res);
}

class Query$SurveySubmissionsReport$surveySubmissions$edges$node$user {
  Query$SurveySubmissionsReport$surveySubmissions$edges$node$user({
    required this.username,
    this.$__typename = 'UserNode',
  });

  factory Query$SurveySubmissionsReport$surveySubmissions$edges$node$user.fromJson(
      Map<String, dynamic> json) {
    final l$username = json['username'];
    final l$$__typename = json['__typename'];
    return Query$SurveySubmissionsReport$surveySubmissions$edges$node$user(
      username: (l$username as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String username;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$username = username;
    _resultData['username'] = l$username;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$username = username;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$username,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other
            is! Query$SurveySubmissionsReport$surveySubmissions$edges$node$user ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$username = username;
    final lOther$username = other.username;
    if (l$username != lOther$username) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$SurveySubmissionsReport$surveySubmissions$edges$node$user
    on Query$SurveySubmissionsReport$surveySubmissions$edges$node$user {
  CopyWith$Query$SurveySubmissionsReport$surveySubmissions$edges$node$user<
          Query$SurveySubmissionsReport$surveySubmissions$edges$node$user>
      get copyWith =>
          CopyWith$Query$SurveySubmissionsReport$surveySubmissions$edges$node$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$SurveySubmissionsReport$surveySubmissions$edges$node$user<
    TRes> {
  factory CopyWith$Query$SurveySubmissionsReport$surveySubmissions$edges$node$user(
    Query$SurveySubmissionsReport$surveySubmissions$edges$node$user instance,
    TRes Function(
            Query$SurveySubmissionsReport$surveySubmissions$edges$node$user)
        then,
  ) = _CopyWithImpl$Query$SurveySubmissionsReport$surveySubmissions$edges$node$user;

  factory CopyWith$Query$SurveySubmissionsReport$surveySubmissions$edges$node$user.stub(
          TRes res) =
      _CopyWithStubImpl$Query$SurveySubmissionsReport$surveySubmissions$edges$node$user;

  TRes call({
    String? username,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$SurveySubmissionsReport$surveySubmissions$edges$node$user<
        TRes>
    implements
        CopyWith$Query$SurveySubmissionsReport$surveySubmissions$edges$node$user<
            TRes> {
  _CopyWithImpl$Query$SurveySubmissionsReport$surveySubmissions$edges$node$user(
    this._instance,
    this._then,
  );

  final Query$SurveySubmissionsReport$surveySubmissions$edges$node$user
      _instance;

  final TRes Function(
      Query$SurveySubmissionsReport$surveySubmissions$edges$node$user) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? username = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$SurveySubmissionsReport$surveySubmissions$edges$node$user(
        username: username == _undefined || username == null
            ? _instance.username
            : (username as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$SurveySubmissionsReport$surveySubmissions$edges$node$user<
        TRes>
    implements
        CopyWith$Query$SurveySubmissionsReport$surveySubmissions$edges$node$user<
            TRes> {
  _CopyWithStubImpl$Query$SurveySubmissionsReport$surveySubmissions$edges$node$user(
      this._res);

  TRes _res;

  call({
    String? username,
    String? $__typename,
  }) =>
      _res;
}

class Query$SurveySubmissionsReport$surveySubmissions$edges$node$survey {
  Query$SurveySubmissionsReport$surveySubmissions$edges$node$survey({
    required this.id,
    required this.title,
    this.$__typename = 'SurveyNode',
  });

  factory Query$SurveySubmissionsReport$surveySubmissions$edges$node$survey.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$$__typename = json['__typename'];
    return Query$SurveySubmissionsReport$surveySubmissions$edges$node$survey(
      id: (l$id as String),
      title: (l$title as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other
            is! Query$SurveySubmissionsReport$surveySubmissions$edges$node$survey ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$SurveySubmissionsReport$surveySubmissions$edges$node$survey
    on Query$SurveySubmissionsReport$surveySubmissions$edges$node$survey {
  CopyWith$Query$SurveySubmissionsReport$surveySubmissions$edges$node$survey<
          Query$SurveySubmissionsReport$surveySubmissions$edges$node$survey>
      get copyWith =>
          CopyWith$Query$SurveySubmissionsReport$surveySubmissions$edges$node$survey(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$SurveySubmissionsReport$surveySubmissions$edges$node$survey<
    TRes> {
  factory CopyWith$Query$SurveySubmissionsReport$surveySubmissions$edges$node$survey(
    Query$SurveySubmissionsReport$surveySubmissions$edges$node$survey instance,
    TRes Function(
            Query$SurveySubmissionsReport$surveySubmissions$edges$node$survey)
        then,
  ) = _CopyWithImpl$Query$SurveySubmissionsReport$surveySubmissions$edges$node$survey;

  factory CopyWith$Query$SurveySubmissionsReport$surveySubmissions$edges$node$survey.stub(
          TRes res) =
      _CopyWithStubImpl$Query$SurveySubmissionsReport$surveySubmissions$edges$node$survey;

  TRes call({
    String? id,
    String? title,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$SurveySubmissionsReport$surveySubmissions$edges$node$survey<
        TRes>
    implements
        CopyWith$Query$SurveySubmissionsReport$surveySubmissions$edges$node$survey<
            TRes> {
  _CopyWithImpl$Query$SurveySubmissionsReport$surveySubmissions$edges$node$survey(
    this._instance,
    this._then,
  );

  final Query$SurveySubmissionsReport$surveySubmissions$edges$node$survey
      _instance;

  final TRes Function(
      Query$SurveySubmissionsReport$surveySubmissions$edges$node$survey) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$SurveySubmissionsReport$surveySubmissions$edges$node$survey(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$SurveySubmissionsReport$surveySubmissions$edges$node$survey<
        TRes>
    implements
        CopyWith$Query$SurveySubmissionsReport$surveySubmissions$edges$node$survey<
            TRes> {
  _CopyWithStubImpl$Query$SurveySubmissionsReport$surveySubmissions$edges$node$survey(
      this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? $__typename,
  }) =>
      _res;
}

class Query$SurveySubmissionsReport$surveySubmissions$pageInfo {
  Query$SurveySubmissionsReport$surveySubmissions$pageInfo({
    required this.hasNextPage,
    this.endCursor,
    this.$__typename = 'PageInfo',
  });

  factory Query$SurveySubmissionsReport$surveySubmissions$pageInfo.fromJson(
      Map<String, dynamic> json) {
    final l$hasNextPage = json['hasNextPage'];
    final l$endCursor = json['endCursor'];
    final l$$__typename = json['__typename'];
    return Query$SurveySubmissionsReport$surveySubmissions$pageInfo(
      hasNextPage: (l$hasNextPage as bool),
      endCursor: (l$endCursor as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool hasNextPage;

  final String? endCursor;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$hasNextPage = hasNextPage;
    _resultData['hasNextPage'] = l$hasNextPage;
    final l$endCursor = endCursor;
    _resultData['endCursor'] = l$endCursor;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$hasNextPage = hasNextPage;
    final l$endCursor = endCursor;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$hasNextPage,
      l$endCursor,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$SurveySubmissionsReport$surveySubmissions$pageInfo ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$hasNextPage = hasNextPage;
    final lOther$hasNextPage = other.hasNextPage;
    if (l$hasNextPage != lOther$hasNextPage) {
      return false;
    }
    final l$endCursor = endCursor;
    final lOther$endCursor = other.endCursor;
    if (l$endCursor != lOther$endCursor) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$SurveySubmissionsReport$surveySubmissions$pageInfo
    on Query$SurveySubmissionsReport$surveySubmissions$pageInfo {
  CopyWith$Query$SurveySubmissionsReport$surveySubmissions$pageInfo<
          Query$SurveySubmissionsReport$surveySubmissions$pageInfo>
      get copyWith =>
          CopyWith$Query$SurveySubmissionsReport$surveySubmissions$pageInfo(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$SurveySubmissionsReport$surveySubmissions$pageInfo<
    TRes> {
  factory CopyWith$Query$SurveySubmissionsReport$surveySubmissions$pageInfo(
    Query$SurveySubmissionsReport$surveySubmissions$pageInfo instance,
    TRes Function(Query$SurveySubmissionsReport$surveySubmissions$pageInfo)
        then,
  ) = _CopyWithImpl$Query$SurveySubmissionsReport$surveySubmissions$pageInfo;

  factory CopyWith$Query$SurveySubmissionsReport$surveySubmissions$pageInfo.stub(
          TRes res) =
      _CopyWithStubImpl$Query$SurveySubmissionsReport$surveySubmissions$pageInfo;

  TRes call({
    bool? hasNextPage,
    String? endCursor,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$SurveySubmissionsReport$surveySubmissions$pageInfo<
        TRes>
    implements
        CopyWith$Query$SurveySubmissionsReport$surveySubmissions$pageInfo<
            TRes> {
  _CopyWithImpl$Query$SurveySubmissionsReport$surveySubmissions$pageInfo(
    this._instance,
    this._then,
  );

  final Query$SurveySubmissionsReport$surveySubmissions$pageInfo _instance;

  final TRes Function(Query$SurveySubmissionsReport$surveySubmissions$pageInfo)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? hasNextPage = _undefined,
    Object? endCursor = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$SurveySubmissionsReport$surveySubmissions$pageInfo(
        hasNextPage: hasNextPage == _undefined || hasNextPage == null
            ? _instance.hasNextPage
            : (hasNextPage as bool),
        endCursor: endCursor == _undefined
            ? _instance.endCursor
            : (endCursor as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$SurveySubmissionsReport$surveySubmissions$pageInfo<
        TRes>
    implements
        CopyWith$Query$SurveySubmissionsReport$surveySubmissions$pageInfo<
            TRes> {
  _CopyWithStubImpl$Query$SurveySubmissionsReport$surveySubmissions$pageInfo(
      this._res);

  TRes _res;

  call({
    bool? hasNextPage,
    String? endCursor,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$MySubmissionsReport {
  factory Variables$Query$MySubmissionsReport({
    int? first,
    String? after,
    Enum$SurveySubmissionStatusChoices? status,
  }) =>
      Variables$Query$MySubmissionsReport._({
        if (first != null) r'first': first,
        if (after != null) r'after': after,
        if (status != null) r'status': status,
      });

  Variables$Query$MySubmissionsReport._(this._$data);

  factory Variables$Query$MySubmissionsReport.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('first')) {
      final l$first = data['first'];
      result$data['first'] = (l$first as int?);
    }
    if (data.containsKey('after')) {
      final l$after = data['after'];
      result$data['after'] = (l$after as String?);
    }
    if (data.containsKey('status')) {
      final l$status = data['status'];
      result$data['status'] = l$status == null
          ? null
          : fromJson$Enum$SurveySubmissionStatusChoices((l$status as String));
    }
    return Variables$Query$MySubmissionsReport._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get first => (_$data['first'] as int?);

  String? get after => (_$data['after'] as String?);

  Enum$SurveySubmissionStatusChoices? get status =>
      (_$data['status'] as Enum$SurveySubmissionStatusChoices?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('first')) {
      final l$first = first;
      result$data['first'] = l$first;
    }
    if (_$data.containsKey('after')) {
      final l$after = after;
      result$data['after'] = l$after;
    }
    if (_$data.containsKey('status')) {
      final l$status = status;
      result$data['status'] = l$status == null
          ? null
          : toJson$Enum$SurveySubmissionStatusChoices(l$status);
    }
    return result$data;
  }

  CopyWith$Variables$Query$MySubmissionsReport<
          Variables$Query$MySubmissionsReport>
      get copyWith => CopyWith$Variables$Query$MySubmissionsReport(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$MySubmissionsReport ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$first = first;
    final lOther$first = other.first;
    if (_$data.containsKey('first') != other._$data.containsKey('first')) {
      return false;
    }
    if (l$first != lOther$first) {
      return false;
    }
    final l$after = after;
    final lOther$after = other.after;
    if (_$data.containsKey('after') != other._$data.containsKey('after')) {
      return false;
    }
    if (l$after != lOther$after) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (_$data.containsKey('status') != other._$data.containsKey('status')) {
      return false;
    }
    if (l$status != lOther$status) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$first = first;
    final l$after = after;
    final l$status = status;
    return Object.hashAll([
      _$data.containsKey('first') ? l$first : const {},
      _$data.containsKey('after') ? l$after : const {},
      _$data.containsKey('status') ? l$status : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$MySubmissionsReport<TRes> {
  factory CopyWith$Variables$Query$MySubmissionsReport(
    Variables$Query$MySubmissionsReport instance,
    TRes Function(Variables$Query$MySubmissionsReport) then,
  ) = _CopyWithImpl$Variables$Query$MySubmissionsReport;

  factory CopyWith$Variables$Query$MySubmissionsReport.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$MySubmissionsReport;

  TRes call({
    int? first,
    String? after,
    Enum$SurveySubmissionStatusChoices? status,
  });
}

class _CopyWithImpl$Variables$Query$MySubmissionsReport<TRes>
    implements CopyWith$Variables$Query$MySubmissionsReport<TRes> {
  _CopyWithImpl$Variables$Query$MySubmissionsReport(
    this._instance,
    this._then,
  );

  final Variables$Query$MySubmissionsReport _instance;

  final TRes Function(Variables$Query$MySubmissionsReport) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? first = _undefined,
    Object? after = _undefined,
    Object? status = _undefined,
  }) =>
      _then(Variables$Query$MySubmissionsReport._({
        ..._instance._$data,
        if (first != _undefined) 'first': (first as int?),
        if (after != _undefined) 'after': (after as String?),
        if (status != _undefined)
          'status': (status as Enum$SurveySubmissionStatusChoices?),
      }));
}

class _CopyWithStubImpl$Variables$Query$MySubmissionsReport<TRes>
    implements CopyWith$Variables$Query$MySubmissionsReport<TRes> {
  _CopyWithStubImpl$Variables$Query$MySubmissionsReport(this._res);

  TRes _res;

  call({
    int? first,
    String? after,
    Enum$SurveySubmissionStatusChoices? status,
  }) =>
      _res;
}

class Query$MySubmissionsReport {
  Query$MySubmissionsReport({
    this.mySubmissions,
    this.$__typename = 'Query',
  });

  factory Query$MySubmissionsReport.fromJson(Map<String, dynamic> json) {
    final l$mySubmissions = json['mySubmissions'];
    final l$$__typename = json['__typename'];
    return Query$MySubmissionsReport(
      mySubmissions: l$mySubmissions == null
          ? null
          : Query$MySubmissionsReport$mySubmissions.fromJson(
              (l$mySubmissions as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$MySubmissionsReport$mySubmissions? mySubmissions;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$mySubmissions = mySubmissions;
    _resultData['mySubmissions'] = l$mySubmissions?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$mySubmissions = mySubmissions;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$mySubmissions,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$MySubmissionsReport ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$mySubmissions = mySubmissions;
    final lOther$mySubmissions = other.mySubmissions;
    if (l$mySubmissions != lOther$mySubmissions) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$MySubmissionsReport
    on Query$MySubmissionsReport {
  CopyWith$Query$MySubmissionsReport<Query$MySubmissionsReport> get copyWith =>
      CopyWith$Query$MySubmissionsReport(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$MySubmissionsReport<TRes> {
  factory CopyWith$Query$MySubmissionsReport(
    Query$MySubmissionsReport instance,
    TRes Function(Query$MySubmissionsReport) then,
  ) = _CopyWithImpl$Query$MySubmissionsReport;

  factory CopyWith$Query$MySubmissionsReport.stub(TRes res) =
      _CopyWithStubImpl$Query$MySubmissionsReport;

  TRes call({
    Query$MySubmissionsReport$mySubmissions? mySubmissions,
    String? $__typename,
  });
  CopyWith$Query$MySubmissionsReport$mySubmissions<TRes> get mySubmissions;
}

class _CopyWithImpl$Query$MySubmissionsReport<TRes>
    implements CopyWith$Query$MySubmissionsReport<TRes> {
  _CopyWithImpl$Query$MySubmissionsReport(
    this._instance,
    this._then,
  );

  final Query$MySubmissionsReport _instance;

  final TRes Function(Query$MySubmissionsReport) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? mySubmissions = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$MySubmissionsReport(
        mySubmissions: mySubmissions == _undefined
            ? _instance.mySubmissions
            : (mySubmissions as Query$MySubmissionsReport$mySubmissions?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$MySubmissionsReport$mySubmissions<TRes> get mySubmissions {
    final local$mySubmissions = _instance.mySubmissions;
    return local$mySubmissions == null
        ? CopyWith$Query$MySubmissionsReport$mySubmissions.stub(
            _then(_instance))
        : CopyWith$Query$MySubmissionsReport$mySubmissions(
            local$mySubmissions, (e) => call(mySubmissions: e));
  }
}

class _CopyWithStubImpl$Query$MySubmissionsReport<TRes>
    implements CopyWith$Query$MySubmissionsReport<TRes> {
  _CopyWithStubImpl$Query$MySubmissionsReport(this._res);

  TRes _res;

  call({
    Query$MySubmissionsReport$mySubmissions? mySubmissions,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$MySubmissionsReport$mySubmissions<TRes> get mySubmissions =>
      CopyWith$Query$MySubmissionsReport$mySubmissions.stub(_res);
}

const documentNodeQueryMySubmissionsReport = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'MySubmissionsReport'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'first')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'after')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'status')),
        type: NamedTypeNode(
          name: NameNode(value: 'SurveySubmissionStatusChoices'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'mySubmissions'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'first'),
            value: VariableNode(name: NameNode(value: 'first')),
          ),
          ArgumentNode(
            name: NameNode(value: 'after'),
            value: VariableNode(name: NameNode(value: 'after')),
          ),
          ArgumentNode(
            name: NameNode(value: 'status'),
            value: VariableNode(name: NameNode(value: 'status')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'edges'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'node'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'submittedAt'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'status'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'survey'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                        name: NameNode(value: 'id'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'title'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: '__typename'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                    ]),
                  ),
                  FieldNode(
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'pageInfo'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'hasNextPage'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'endCursor'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Query$MySubmissionsReport _parserFn$Query$MySubmissionsReport(
        Map<String, dynamic> data) =>
    Query$MySubmissionsReport.fromJson(data);
typedef OnQueryComplete$Query$MySubmissionsReport = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$MySubmissionsReport?,
);

class Options$Query$MySubmissionsReport
    extends graphql.QueryOptions<Query$MySubmissionsReport> {
  Options$Query$MySubmissionsReport({
    String? operationName,
    Variables$Query$MySubmissionsReport? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$MySubmissionsReport? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$MySubmissionsReport? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null
                        ? null
                        : _parserFn$Query$MySubmissionsReport(data),
                  ),
          onError: onError,
          document: documentNodeQueryMySubmissionsReport,
          parserFn: _parserFn$Query$MySubmissionsReport,
        );

  final OnQueryComplete$Query$MySubmissionsReport? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$MySubmissionsReport
    extends graphql.WatchQueryOptions<Query$MySubmissionsReport> {
  WatchOptions$Query$MySubmissionsReport({
    String? operationName,
    Variables$Query$MySubmissionsReport? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$MySubmissionsReport? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryMySubmissionsReport,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$MySubmissionsReport,
        );
}

class FetchMoreOptions$Query$MySubmissionsReport
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$MySubmissionsReport({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$MySubmissionsReport? variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables?.toJson() ?? {},
          document: documentNodeQueryMySubmissionsReport,
        );
}

extension ClientExtension$Query$MySubmissionsReport on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$MySubmissionsReport>>
      query$MySubmissionsReport(
              [Options$Query$MySubmissionsReport? options]) async =>
          await this.query(options ?? Options$Query$MySubmissionsReport());
  graphql.ObservableQuery<Query$MySubmissionsReport>
      watchQuery$MySubmissionsReport(
              [WatchOptions$Query$MySubmissionsReport? options]) =>
          this.watchQuery(options ?? WatchOptions$Query$MySubmissionsReport());
  void writeQuery$MySubmissionsReport({
    required Query$MySubmissionsReport data,
    Variables$Query$MySubmissionsReport? variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryMySubmissionsReport),
          variables: variables?.toJson() ?? const {},
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$MySubmissionsReport? readQuery$MySubmissionsReport({
    Variables$Query$MySubmissionsReport? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryMySubmissionsReport),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$MySubmissionsReport.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$MySubmissionsReport>
    useQuery$MySubmissionsReport(
            [Options$Query$MySubmissionsReport? options]) =>
        graphql_flutter
            .useQuery(options ?? Options$Query$MySubmissionsReport());
graphql.ObservableQuery<Query$MySubmissionsReport>
    useWatchQuery$MySubmissionsReport(
            [WatchOptions$Query$MySubmissionsReport? options]) =>
        graphql_flutter
            .useWatchQuery(options ?? WatchOptions$Query$MySubmissionsReport());

class Query$MySubmissionsReport$Widget
    extends graphql_flutter.Query<Query$MySubmissionsReport> {
  Query$MySubmissionsReport$Widget({
    widgets.Key? key,
    Options$Query$MySubmissionsReport? options,
    required graphql_flutter.QueryBuilder<Query$MySubmissionsReport> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$MySubmissionsReport(),
          builder: builder,
        );
}

class Query$MySubmissionsReport$mySubmissions {
  Query$MySubmissionsReport$mySubmissions({
    required this.edges,
    required this.pageInfo,
    this.$__typename = 'SubmissionNodeConnection',
  });

  factory Query$MySubmissionsReport$mySubmissions.fromJson(
      Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$pageInfo = json['pageInfo'];
    final l$$__typename = json['__typename'];
    return Query$MySubmissionsReport$mySubmissions(
      edges: (l$edges as List<dynamic>)
          .map((e) => e == null
              ? null
              : Query$MySubmissionsReport$mySubmissions$edges.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      pageInfo: Query$MySubmissionsReport$mySubmissions$pageInfo.fromJson(
          (l$pageInfo as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$MySubmissionsReport$mySubmissions$edges?> edges;

  final Query$MySubmissionsReport$mySubmissions$pageInfo pageInfo;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$edges = edges;
    _resultData['edges'] = l$edges.map((e) => e?.toJson()).toList();
    final l$pageInfo = pageInfo;
    _resultData['pageInfo'] = l$pageInfo.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$edges = edges;
    final l$pageInfo = pageInfo;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$edges.map((v) => v)),
      l$pageInfo,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$MySubmissionsReport$mySubmissions ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$edges = edges;
    final lOther$edges = other.edges;
    if (l$edges.length != lOther$edges.length) {
      return false;
    }
    for (int i = 0; i < l$edges.length; i++) {
      final l$edges$entry = l$edges[i];
      final lOther$edges$entry = lOther$edges[i];
      if (l$edges$entry != lOther$edges$entry) {
        return false;
      }
    }
    final l$pageInfo = pageInfo;
    final lOther$pageInfo = other.pageInfo;
    if (l$pageInfo != lOther$pageInfo) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$MySubmissionsReport$mySubmissions
    on Query$MySubmissionsReport$mySubmissions {
  CopyWith$Query$MySubmissionsReport$mySubmissions<
          Query$MySubmissionsReport$mySubmissions>
      get copyWith => CopyWith$Query$MySubmissionsReport$mySubmissions(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$MySubmissionsReport$mySubmissions<TRes> {
  factory CopyWith$Query$MySubmissionsReport$mySubmissions(
    Query$MySubmissionsReport$mySubmissions instance,
    TRes Function(Query$MySubmissionsReport$mySubmissions) then,
  ) = _CopyWithImpl$Query$MySubmissionsReport$mySubmissions;

  factory CopyWith$Query$MySubmissionsReport$mySubmissions.stub(TRes res) =
      _CopyWithStubImpl$Query$MySubmissionsReport$mySubmissions;

  TRes call({
    List<Query$MySubmissionsReport$mySubmissions$edges?>? edges,
    Query$MySubmissionsReport$mySubmissions$pageInfo? pageInfo,
    String? $__typename,
  });
  TRes edges(
      Iterable<Query$MySubmissionsReport$mySubmissions$edges?> Function(
              Iterable<
                  CopyWith$Query$MySubmissionsReport$mySubmissions$edges<
                      Query$MySubmissionsReport$mySubmissions$edges>?>)
          _fn);
  CopyWith$Query$MySubmissionsReport$mySubmissions$pageInfo<TRes> get pageInfo;
}

class _CopyWithImpl$Query$MySubmissionsReport$mySubmissions<TRes>
    implements CopyWith$Query$MySubmissionsReport$mySubmissions<TRes> {
  _CopyWithImpl$Query$MySubmissionsReport$mySubmissions(
    this._instance,
    this._then,
  );

  final Query$MySubmissionsReport$mySubmissions _instance;

  final TRes Function(Query$MySubmissionsReport$mySubmissions) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? pageInfo = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$MySubmissionsReport$mySubmissions(
        edges: edges == _undefined || edges == null
            ? _instance.edges
            : (edges as List<Query$MySubmissionsReport$mySubmissions$edges?>),
        pageInfo: pageInfo == _undefined || pageInfo == null
            ? _instance.pageInfo
            : (pageInfo as Query$MySubmissionsReport$mySubmissions$pageInfo),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes edges(
          Iterable<Query$MySubmissionsReport$mySubmissions$edges?> Function(
                  Iterable<
                      CopyWith$Query$MySubmissionsReport$mySubmissions$edges<
                          Query$MySubmissionsReport$mySubmissions$edges>?>)
              _fn) =>
      call(
          edges: _fn(_instance.edges.map((e) => e == null
              ? null
              : CopyWith$Query$MySubmissionsReport$mySubmissions$edges(
                  e,
                  (i) => i,
                ))).toList());

  CopyWith$Query$MySubmissionsReport$mySubmissions$pageInfo<TRes> get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return CopyWith$Query$MySubmissionsReport$mySubmissions$pageInfo(
        local$pageInfo, (e) => call(pageInfo: e));
  }
}

class _CopyWithStubImpl$Query$MySubmissionsReport$mySubmissions<TRes>
    implements CopyWith$Query$MySubmissionsReport$mySubmissions<TRes> {
  _CopyWithStubImpl$Query$MySubmissionsReport$mySubmissions(this._res);

  TRes _res;

  call({
    List<Query$MySubmissionsReport$mySubmissions$edges?>? edges,
    Query$MySubmissionsReport$mySubmissions$pageInfo? pageInfo,
    String? $__typename,
  }) =>
      _res;

  edges(_fn) => _res;

  CopyWith$Query$MySubmissionsReport$mySubmissions$pageInfo<TRes>
      get pageInfo =>
          CopyWith$Query$MySubmissionsReport$mySubmissions$pageInfo.stub(_res);
}

class Query$MySubmissionsReport$mySubmissions$edges {
  Query$MySubmissionsReport$mySubmissions$edges({
    this.node,
    this.$__typename = 'SubmissionNodeEdge',
  });

  factory Query$MySubmissionsReport$mySubmissions$edges.fromJson(
      Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$MySubmissionsReport$mySubmissions$edges(
      node: l$node == null
          ? null
          : Query$MySubmissionsReport$mySubmissions$edges$node.fromJson(
              (l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$MySubmissionsReport$mySubmissions$edges$node? node;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$node = node;
    _resultData['node'] = l$node?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$node = node;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$node,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$MySubmissionsReport$mySubmissions$edges ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$node = node;
    final lOther$node = other.node;
    if (l$node != lOther$node) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$MySubmissionsReport$mySubmissions$edges
    on Query$MySubmissionsReport$mySubmissions$edges {
  CopyWith$Query$MySubmissionsReport$mySubmissions$edges<
          Query$MySubmissionsReport$mySubmissions$edges>
      get copyWith => CopyWith$Query$MySubmissionsReport$mySubmissions$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$MySubmissionsReport$mySubmissions$edges<TRes> {
  factory CopyWith$Query$MySubmissionsReport$mySubmissions$edges(
    Query$MySubmissionsReport$mySubmissions$edges instance,
    TRes Function(Query$MySubmissionsReport$mySubmissions$edges) then,
  ) = _CopyWithImpl$Query$MySubmissionsReport$mySubmissions$edges;

  factory CopyWith$Query$MySubmissionsReport$mySubmissions$edges.stub(
          TRes res) =
      _CopyWithStubImpl$Query$MySubmissionsReport$mySubmissions$edges;

  TRes call({
    Query$MySubmissionsReport$mySubmissions$edges$node? node,
    String? $__typename,
  });
  CopyWith$Query$MySubmissionsReport$mySubmissions$edges$node<TRes> get node;
}

class _CopyWithImpl$Query$MySubmissionsReport$mySubmissions$edges<TRes>
    implements CopyWith$Query$MySubmissionsReport$mySubmissions$edges<TRes> {
  _CopyWithImpl$Query$MySubmissionsReport$mySubmissions$edges(
    this._instance,
    this._then,
  );

  final Query$MySubmissionsReport$mySubmissions$edges _instance;

  final TRes Function(Query$MySubmissionsReport$mySubmissions$edges) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$MySubmissionsReport$mySubmissions$edges(
        node: node == _undefined
            ? _instance.node
            : (node as Query$MySubmissionsReport$mySubmissions$edges$node?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$MySubmissionsReport$mySubmissions$edges$node<TRes> get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Query$MySubmissionsReport$mySubmissions$edges$node.stub(
            _then(_instance))
        : CopyWith$Query$MySubmissionsReport$mySubmissions$edges$node(
            local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Query$MySubmissionsReport$mySubmissions$edges<TRes>
    implements CopyWith$Query$MySubmissionsReport$mySubmissions$edges<TRes> {
  _CopyWithStubImpl$Query$MySubmissionsReport$mySubmissions$edges(this._res);

  TRes _res;

  call({
    Query$MySubmissionsReport$mySubmissions$edges$node? node,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$MySubmissionsReport$mySubmissions$edges$node<TRes> get node =>
      CopyWith$Query$MySubmissionsReport$mySubmissions$edges$node.stub(_res);
}

class Query$MySubmissionsReport$mySubmissions$edges$node {
  Query$MySubmissionsReport$mySubmissions$edges$node({
    required this.id,
    required this.submittedAt,
    required this.status,
    required this.survey,
    this.$__typename = 'SubmissionNode',
  });

  factory Query$MySubmissionsReport$mySubmissions$edges$node.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$submittedAt = json['submittedAt'];
    final l$status = json['status'];
    final l$survey = json['survey'];
    final l$$__typename = json['__typename'];
    return Query$MySubmissionsReport$mySubmissions$edges$node(
      id: (l$id as String),
      submittedAt: DateTime.parse((l$submittedAt as String)),
      status: fromJson$Enum$SurveySubmissionStatusChoices((l$status as String)),
      survey:
          Query$MySubmissionsReport$mySubmissions$edges$node$survey.fromJson(
              (l$survey as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final DateTime submittedAt;

  final Enum$SurveySubmissionStatusChoices status;

  final Query$MySubmissionsReport$mySubmissions$edges$node$survey survey;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$submittedAt = submittedAt;
    _resultData['submittedAt'] = l$submittedAt.toIso8601String();
    final l$status = status;
    _resultData['status'] = toJson$Enum$SurveySubmissionStatusChoices(l$status);
    final l$survey = survey;
    _resultData['survey'] = l$survey.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$submittedAt = submittedAt;
    final l$status = status;
    final l$survey = survey;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$submittedAt,
      l$status,
      l$survey,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$MySubmissionsReport$mySubmissions$edges$node ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$submittedAt = submittedAt;
    final lOther$submittedAt = other.submittedAt;
    if (l$submittedAt != lOther$submittedAt) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$survey = survey;
    final lOther$survey = other.survey;
    if (l$survey != lOther$survey) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$MySubmissionsReport$mySubmissions$edges$node
    on Query$MySubmissionsReport$mySubmissions$edges$node {
  CopyWith$Query$MySubmissionsReport$mySubmissions$edges$node<
          Query$MySubmissionsReport$mySubmissions$edges$node>
      get copyWith =>
          CopyWith$Query$MySubmissionsReport$mySubmissions$edges$node(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$MySubmissionsReport$mySubmissions$edges$node<
    TRes> {
  factory CopyWith$Query$MySubmissionsReport$mySubmissions$edges$node(
    Query$MySubmissionsReport$mySubmissions$edges$node instance,
    TRes Function(Query$MySubmissionsReport$mySubmissions$edges$node) then,
  ) = _CopyWithImpl$Query$MySubmissionsReport$mySubmissions$edges$node;

  factory CopyWith$Query$MySubmissionsReport$mySubmissions$edges$node.stub(
          TRes res) =
      _CopyWithStubImpl$Query$MySubmissionsReport$mySubmissions$edges$node;

  TRes call({
    String? id,
    DateTime? submittedAt,
    Enum$SurveySubmissionStatusChoices? status,
    Query$MySubmissionsReport$mySubmissions$edges$node$survey? survey,
    String? $__typename,
  });
  CopyWith$Query$MySubmissionsReport$mySubmissions$edges$node$survey<TRes>
      get survey;
}

class _CopyWithImpl$Query$MySubmissionsReport$mySubmissions$edges$node<TRes>
    implements
        CopyWith$Query$MySubmissionsReport$mySubmissions$edges$node<TRes> {
  _CopyWithImpl$Query$MySubmissionsReport$mySubmissions$edges$node(
    this._instance,
    this._then,
  );

  final Query$MySubmissionsReport$mySubmissions$edges$node _instance;

  final TRes Function(Query$MySubmissionsReport$mySubmissions$edges$node) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? submittedAt = _undefined,
    Object? status = _undefined,
    Object? survey = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$MySubmissionsReport$mySubmissions$edges$node(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        submittedAt: submittedAt == _undefined || submittedAt == null
            ? _instance.submittedAt
            : (submittedAt as DateTime),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as Enum$SurveySubmissionStatusChoices),
        survey: survey == _undefined || survey == null
            ? _instance.survey
            : (survey
                as Query$MySubmissionsReport$mySubmissions$edges$node$survey),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$MySubmissionsReport$mySubmissions$edges$node$survey<TRes>
      get survey {
    final local$survey = _instance.survey;
    return CopyWith$Query$MySubmissionsReport$mySubmissions$edges$node$survey(
        local$survey, (e) => call(survey: e));
  }
}

class _CopyWithStubImpl$Query$MySubmissionsReport$mySubmissions$edges$node<TRes>
    implements
        CopyWith$Query$MySubmissionsReport$mySubmissions$edges$node<TRes> {
  _CopyWithStubImpl$Query$MySubmissionsReport$mySubmissions$edges$node(
      this._res);

  TRes _res;

  call({
    String? id,
    DateTime? submittedAt,
    Enum$SurveySubmissionStatusChoices? status,
    Query$MySubmissionsReport$mySubmissions$edges$node$survey? survey,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$MySubmissionsReport$mySubmissions$edges$node$survey<TRes>
      get survey =>
          CopyWith$Query$MySubmissionsReport$mySubmissions$edges$node$survey
              .stub(_res);
}

class Query$MySubmissionsReport$mySubmissions$edges$node$survey {
  Query$MySubmissionsReport$mySubmissions$edges$node$survey({
    required this.id,
    required this.title,
    this.$__typename = 'SurveyNode',
  });

  factory Query$MySubmissionsReport$mySubmissions$edges$node$survey.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$$__typename = json['__typename'];
    return Query$MySubmissionsReport$mySubmissions$edges$node$survey(
      id: (l$id as String),
      title: (l$title as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$MySubmissionsReport$mySubmissions$edges$node$survey ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$MySubmissionsReport$mySubmissions$edges$node$survey
    on Query$MySubmissionsReport$mySubmissions$edges$node$survey {
  CopyWith$Query$MySubmissionsReport$mySubmissions$edges$node$survey<
          Query$MySubmissionsReport$mySubmissions$edges$node$survey>
      get copyWith =>
          CopyWith$Query$MySubmissionsReport$mySubmissions$edges$node$survey(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$MySubmissionsReport$mySubmissions$edges$node$survey<
    TRes> {
  factory CopyWith$Query$MySubmissionsReport$mySubmissions$edges$node$survey(
    Query$MySubmissionsReport$mySubmissions$edges$node$survey instance,
    TRes Function(Query$MySubmissionsReport$mySubmissions$edges$node$survey)
        then,
  ) = _CopyWithImpl$Query$MySubmissionsReport$mySubmissions$edges$node$survey;

  factory CopyWith$Query$MySubmissionsReport$mySubmissions$edges$node$survey.stub(
          TRes res) =
      _CopyWithStubImpl$Query$MySubmissionsReport$mySubmissions$edges$node$survey;

  TRes call({
    String? id,
    String? title,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$MySubmissionsReport$mySubmissions$edges$node$survey<
        TRes>
    implements
        CopyWith$Query$MySubmissionsReport$mySubmissions$edges$node$survey<
            TRes> {
  _CopyWithImpl$Query$MySubmissionsReport$mySubmissions$edges$node$survey(
    this._instance,
    this._then,
  );

  final Query$MySubmissionsReport$mySubmissions$edges$node$survey _instance;

  final TRes Function(Query$MySubmissionsReport$mySubmissions$edges$node$survey)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$MySubmissionsReport$mySubmissions$edges$node$survey(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$MySubmissionsReport$mySubmissions$edges$node$survey<
        TRes>
    implements
        CopyWith$Query$MySubmissionsReport$mySubmissions$edges$node$survey<
            TRes> {
  _CopyWithStubImpl$Query$MySubmissionsReport$mySubmissions$edges$node$survey(
      this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? $__typename,
  }) =>
      _res;
}

class Query$MySubmissionsReport$mySubmissions$pageInfo {
  Query$MySubmissionsReport$mySubmissions$pageInfo({
    required this.hasNextPage,
    this.endCursor,
    this.$__typename = 'PageInfo',
  });

  factory Query$MySubmissionsReport$mySubmissions$pageInfo.fromJson(
      Map<String, dynamic> json) {
    final l$hasNextPage = json['hasNextPage'];
    final l$endCursor = json['endCursor'];
    final l$$__typename = json['__typename'];
    return Query$MySubmissionsReport$mySubmissions$pageInfo(
      hasNextPage: (l$hasNextPage as bool),
      endCursor: (l$endCursor as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool hasNextPage;

  final String? endCursor;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$hasNextPage = hasNextPage;
    _resultData['hasNextPage'] = l$hasNextPage;
    final l$endCursor = endCursor;
    _resultData['endCursor'] = l$endCursor;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$hasNextPage = hasNextPage;
    final l$endCursor = endCursor;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$hasNextPage,
      l$endCursor,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$MySubmissionsReport$mySubmissions$pageInfo ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$hasNextPage = hasNextPage;
    final lOther$hasNextPage = other.hasNextPage;
    if (l$hasNextPage != lOther$hasNextPage) {
      return false;
    }
    final l$endCursor = endCursor;
    final lOther$endCursor = other.endCursor;
    if (l$endCursor != lOther$endCursor) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$MySubmissionsReport$mySubmissions$pageInfo
    on Query$MySubmissionsReport$mySubmissions$pageInfo {
  CopyWith$Query$MySubmissionsReport$mySubmissions$pageInfo<
          Query$MySubmissionsReport$mySubmissions$pageInfo>
      get copyWith => CopyWith$Query$MySubmissionsReport$mySubmissions$pageInfo(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$MySubmissionsReport$mySubmissions$pageInfo<TRes> {
  factory CopyWith$Query$MySubmissionsReport$mySubmissions$pageInfo(
    Query$MySubmissionsReport$mySubmissions$pageInfo instance,
    TRes Function(Query$MySubmissionsReport$mySubmissions$pageInfo) then,
  ) = _CopyWithImpl$Query$MySubmissionsReport$mySubmissions$pageInfo;

  factory CopyWith$Query$MySubmissionsReport$mySubmissions$pageInfo.stub(
          TRes res) =
      _CopyWithStubImpl$Query$MySubmissionsReport$mySubmissions$pageInfo;

  TRes call({
    bool? hasNextPage,
    String? endCursor,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$MySubmissionsReport$mySubmissions$pageInfo<TRes>
    implements CopyWith$Query$MySubmissionsReport$mySubmissions$pageInfo<TRes> {
  _CopyWithImpl$Query$MySubmissionsReport$mySubmissions$pageInfo(
    this._instance,
    this._then,
  );

  final Query$MySubmissionsReport$mySubmissions$pageInfo _instance;

  final TRes Function(Query$MySubmissionsReport$mySubmissions$pageInfo) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? hasNextPage = _undefined,
    Object? endCursor = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$MySubmissionsReport$mySubmissions$pageInfo(
        hasNextPage: hasNextPage == _undefined || hasNextPage == null
            ? _instance.hasNextPage
            : (hasNextPage as bool),
        endCursor: endCursor == _undefined
            ? _instance.endCursor
            : (endCursor as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$MySubmissionsReport$mySubmissions$pageInfo<TRes>
    implements CopyWith$Query$MySubmissionsReport$mySubmissions$pageInfo<TRes> {
  _CopyWithStubImpl$Query$MySubmissionsReport$mySubmissions$pageInfo(this._res);

  TRes _res;

  call({
    bool? hasNextPage,
    String? endCursor,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$AllUsersReport {
  factory Variables$Query$AllUsersReport({
    int? first,
    String? after,
    bool? isActive,
  }) =>
      Variables$Query$AllUsersReport._({
        if (first != null) r'first': first,
        if (after != null) r'after': after,
        if (isActive != null) r'isActive': isActive,
      });

  Variables$Query$AllUsersReport._(this._$data);

  factory Variables$Query$AllUsersReport.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('first')) {
      final l$first = data['first'];
      result$data['first'] = (l$first as int?);
    }
    if (data.containsKey('after')) {
      final l$after = data['after'];
      result$data['after'] = (l$after as String?);
    }
    if (data.containsKey('isActive')) {
      final l$isActive = data['isActive'];
      result$data['isActive'] = (l$isActive as bool?);
    }
    return Variables$Query$AllUsersReport._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get first => (_$data['first'] as int?);

  String? get after => (_$data['after'] as String?);

  bool? get isActive => (_$data['isActive'] as bool?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('first')) {
      final l$first = first;
      result$data['first'] = l$first;
    }
    if (_$data.containsKey('after')) {
      final l$after = after;
      result$data['after'] = l$after;
    }
    if (_$data.containsKey('isActive')) {
      final l$isActive = isActive;
      result$data['isActive'] = l$isActive;
    }
    return result$data;
  }

  CopyWith$Variables$Query$AllUsersReport<Variables$Query$AllUsersReport>
      get copyWith => CopyWith$Variables$Query$AllUsersReport(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$AllUsersReport ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$first = first;
    final lOther$first = other.first;
    if (_$data.containsKey('first') != other._$data.containsKey('first')) {
      return false;
    }
    if (l$first != lOther$first) {
      return false;
    }
    final l$after = after;
    final lOther$after = other.after;
    if (_$data.containsKey('after') != other._$data.containsKey('after')) {
      return false;
    }
    if (l$after != lOther$after) {
      return false;
    }
    final l$isActive = isActive;
    final lOther$isActive = other.isActive;
    if (_$data.containsKey('isActive') !=
        other._$data.containsKey('isActive')) {
      return false;
    }
    if (l$isActive != lOther$isActive) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$first = first;
    final l$after = after;
    final l$isActive = isActive;
    return Object.hashAll([
      _$data.containsKey('first') ? l$first : const {},
      _$data.containsKey('after') ? l$after : const {},
      _$data.containsKey('isActive') ? l$isActive : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$AllUsersReport<TRes> {
  factory CopyWith$Variables$Query$AllUsersReport(
    Variables$Query$AllUsersReport instance,
    TRes Function(Variables$Query$AllUsersReport) then,
  ) = _CopyWithImpl$Variables$Query$AllUsersReport;

  factory CopyWith$Variables$Query$AllUsersReport.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$AllUsersReport;

  TRes call({
    int? first,
    String? after,
    bool? isActive,
  });
}

class _CopyWithImpl$Variables$Query$AllUsersReport<TRes>
    implements CopyWith$Variables$Query$AllUsersReport<TRes> {
  _CopyWithImpl$Variables$Query$AllUsersReport(
    this._instance,
    this._then,
  );

  final Variables$Query$AllUsersReport _instance;

  final TRes Function(Variables$Query$AllUsersReport) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? first = _undefined,
    Object? after = _undefined,
    Object? isActive = _undefined,
  }) =>
      _then(Variables$Query$AllUsersReport._({
        ..._instance._$data,
        if (first != _undefined) 'first': (first as int?),
        if (after != _undefined) 'after': (after as String?),
        if (isActive != _undefined) 'isActive': (isActive as bool?),
      }));
}

class _CopyWithStubImpl$Variables$Query$AllUsersReport<TRes>
    implements CopyWith$Variables$Query$AllUsersReport<TRes> {
  _CopyWithStubImpl$Variables$Query$AllUsersReport(this._res);

  TRes _res;

  call({
    int? first,
    String? after,
    bool? isActive,
  }) =>
      _res;
}

class Query$AllUsersReport {
  Query$AllUsersReport({
    this.allUsers,
    this.$__typename = 'Query',
  });

  factory Query$AllUsersReport.fromJson(Map<String, dynamic> json) {
    final l$allUsers = json['allUsers'];
    final l$$__typename = json['__typename'];
    return Query$AllUsersReport(
      allUsers: l$allUsers == null
          ? null
          : Query$AllUsersReport$allUsers.fromJson(
              (l$allUsers as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$AllUsersReport$allUsers? allUsers;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$allUsers = allUsers;
    _resultData['allUsers'] = l$allUsers?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$allUsers = allUsers;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$allUsers,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$AllUsersReport || runtimeType != other.runtimeType) {
      return false;
    }
    final l$allUsers = allUsers;
    final lOther$allUsers = other.allUsers;
    if (l$allUsers != lOther$allUsers) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$AllUsersReport on Query$AllUsersReport {
  CopyWith$Query$AllUsersReport<Query$AllUsersReport> get copyWith =>
      CopyWith$Query$AllUsersReport(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$AllUsersReport<TRes> {
  factory CopyWith$Query$AllUsersReport(
    Query$AllUsersReport instance,
    TRes Function(Query$AllUsersReport) then,
  ) = _CopyWithImpl$Query$AllUsersReport;

  factory CopyWith$Query$AllUsersReport.stub(TRes res) =
      _CopyWithStubImpl$Query$AllUsersReport;

  TRes call({
    Query$AllUsersReport$allUsers? allUsers,
    String? $__typename,
  });
  CopyWith$Query$AllUsersReport$allUsers<TRes> get allUsers;
}

class _CopyWithImpl$Query$AllUsersReport<TRes>
    implements CopyWith$Query$AllUsersReport<TRes> {
  _CopyWithImpl$Query$AllUsersReport(
    this._instance,
    this._then,
  );

  final Query$AllUsersReport _instance;

  final TRes Function(Query$AllUsersReport) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? allUsers = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$AllUsersReport(
        allUsers: allUsers == _undefined
            ? _instance.allUsers
            : (allUsers as Query$AllUsersReport$allUsers?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$AllUsersReport$allUsers<TRes> get allUsers {
    final local$allUsers = _instance.allUsers;
    return local$allUsers == null
        ? CopyWith$Query$AllUsersReport$allUsers.stub(_then(_instance))
        : CopyWith$Query$AllUsersReport$allUsers(
            local$allUsers, (e) => call(allUsers: e));
  }
}

class _CopyWithStubImpl$Query$AllUsersReport<TRes>
    implements CopyWith$Query$AllUsersReport<TRes> {
  _CopyWithStubImpl$Query$AllUsersReport(this._res);

  TRes _res;

  call({
    Query$AllUsersReport$allUsers? allUsers,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$AllUsersReport$allUsers<TRes> get allUsers =>
      CopyWith$Query$AllUsersReport$allUsers.stub(_res);
}

const documentNodeQueryAllUsersReport = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'AllUsersReport'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'first')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'after')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'isActive')),
        type: NamedTypeNode(
          name: NameNode(value: 'Boolean'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'allUsers'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'first'),
            value: VariableNode(name: NameNode(value: 'first')),
          ),
          ArgumentNode(
            name: NameNode(value: 'after'),
            value: VariableNode(name: NameNode(value: 'after')),
          ),
          ArgumentNode(
            name: NameNode(value: 'isActive'),
            value: VariableNode(name: NameNode(value: 'isActive')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'edges'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'node'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'username'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'email'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'firstName'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'lastName'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'isActive'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'isStaff'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'dateJoined'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'lastLogin'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'surveySubmissions'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                        name: NameNode(value: 'edges'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(selections: [
                          FieldNode(
                            name: NameNode(value: 'node'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: SelectionSetNode(selections: [
                              FieldNode(
                                name: NameNode(value: 'id'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null,
                              ),
                              FieldNode(
                                name: NameNode(value: 'submittedAt'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null,
                              ),
                              FieldNode(
                                name: NameNode(value: 'status'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null,
                              ),
                              FieldNode(
                                name: NameNode(value: 'survey'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FieldNode(
                                    name: NameNode(value: 'title'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null,
                                  ),
                                  FieldNode(
                                    name: NameNode(value: '__typename'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null,
                                  ),
                                ]),
                              ),
                              FieldNode(
                                name: NameNode(value: '__typename'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null,
                              ),
                            ]),
                          ),
                          FieldNode(
                            name: NameNode(value: '__typename'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                        ]),
                      ),
                      FieldNode(
                        name: NameNode(value: '__typename'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                    ]),
                  ),
                  FieldNode(
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'pageInfo'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'hasNextPage'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'hasPreviousPage'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'startCursor'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'endCursor'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Query$AllUsersReport _parserFn$Query$AllUsersReport(
        Map<String, dynamic> data) =>
    Query$AllUsersReport.fromJson(data);
typedef OnQueryComplete$Query$AllUsersReport = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$AllUsersReport?,
);

class Options$Query$AllUsersReport
    extends graphql.QueryOptions<Query$AllUsersReport> {
  Options$Query$AllUsersReport({
    String? operationName,
    Variables$Query$AllUsersReport? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$AllUsersReport? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$AllUsersReport? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null ? null : _parserFn$Query$AllUsersReport(data),
                  ),
          onError: onError,
          document: documentNodeQueryAllUsersReport,
          parserFn: _parserFn$Query$AllUsersReport,
        );

  final OnQueryComplete$Query$AllUsersReport? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$AllUsersReport
    extends graphql.WatchQueryOptions<Query$AllUsersReport> {
  WatchOptions$Query$AllUsersReport({
    String? operationName,
    Variables$Query$AllUsersReport? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$AllUsersReport? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryAllUsersReport,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$AllUsersReport,
        );
}

class FetchMoreOptions$Query$AllUsersReport extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$AllUsersReport({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$AllUsersReport? variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables?.toJson() ?? {},
          document: documentNodeQueryAllUsersReport,
        );
}

extension ClientExtension$Query$AllUsersReport on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$AllUsersReport>> query$AllUsersReport(
          [Options$Query$AllUsersReport? options]) async =>
      await this.query(options ?? Options$Query$AllUsersReport());
  graphql.ObservableQuery<Query$AllUsersReport> watchQuery$AllUsersReport(
          [WatchOptions$Query$AllUsersReport? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$AllUsersReport());
  void writeQuery$AllUsersReport({
    required Query$AllUsersReport data,
    Variables$Query$AllUsersReport? variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryAllUsersReport),
          variables: variables?.toJson() ?? const {},
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$AllUsersReport? readQuery$AllUsersReport({
    Variables$Query$AllUsersReport? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryAllUsersReport),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$AllUsersReport.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$AllUsersReport> useQuery$AllUsersReport(
        [Options$Query$AllUsersReport? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$AllUsersReport());
graphql.ObservableQuery<Query$AllUsersReport> useWatchQuery$AllUsersReport(
        [WatchOptions$Query$AllUsersReport? options]) =>
    graphql_flutter
        .useWatchQuery(options ?? WatchOptions$Query$AllUsersReport());

class Query$AllUsersReport$Widget
    extends graphql_flutter.Query<Query$AllUsersReport> {
  Query$AllUsersReport$Widget({
    widgets.Key? key,
    Options$Query$AllUsersReport? options,
    required graphql_flutter.QueryBuilder<Query$AllUsersReport> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$AllUsersReport(),
          builder: builder,
        );
}

class Query$AllUsersReport$allUsers {
  Query$AllUsersReport$allUsers({
    required this.edges,
    required this.pageInfo,
    this.$__typename = 'UserNodeConnection',
  });

  factory Query$AllUsersReport$allUsers.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$pageInfo = json['pageInfo'];
    final l$$__typename = json['__typename'];
    return Query$AllUsersReport$allUsers(
      edges: (l$edges as List<dynamic>)
          .map((e) => e == null
              ? null
              : Query$AllUsersReport$allUsers$edges.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      pageInfo: Query$AllUsersReport$allUsers$pageInfo.fromJson(
          (l$pageInfo as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$AllUsersReport$allUsers$edges?> edges;

  final Query$AllUsersReport$allUsers$pageInfo pageInfo;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$edges = edges;
    _resultData['edges'] = l$edges.map((e) => e?.toJson()).toList();
    final l$pageInfo = pageInfo;
    _resultData['pageInfo'] = l$pageInfo.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$edges = edges;
    final l$pageInfo = pageInfo;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$edges.map((v) => v)),
      l$pageInfo,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$AllUsersReport$allUsers ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$edges = edges;
    final lOther$edges = other.edges;
    if (l$edges.length != lOther$edges.length) {
      return false;
    }
    for (int i = 0; i < l$edges.length; i++) {
      final l$edges$entry = l$edges[i];
      final lOther$edges$entry = lOther$edges[i];
      if (l$edges$entry != lOther$edges$entry) {
        return false;
      }
    }
    final l$pageInfo = pageInfo;
    final lOther$pageInfo = other.pageInfo;
    if (l$pageInfo != lOther$pageInfo) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$AllUsersReport$allUsers
    on Query$AllUsersReport$allUsers {
  CopyWith$Query$AllUsersReport$allUsers<Query$AllUsersReport$allUsers>
      get copyWith => CopyWith$Query$AllUsersReport$allUsers(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$AllUsersReport$allUsers<TRes> {
  factory CopyWith$Query$AllUsersReport$allUsers(
    Query$AllUsersReport$allUsers instance,
    TRes Function(Query$AllUsersReport$allUsers) then,
  ) = _CopyWithImpl$Query$AllUsersReport$allUsers;

  factory CopyWith$Query$AllUsersReport$allUsers.stub(TRes res) =
      _CopyWithStubImpl$Query$AllUsersReport$allUsers;

  TRes call({
    List<Query$AllUsersReport$allUsers$edges?>? edges,
    Query$AllUsersReport$allUsers$pageInfo? pageInfo,
    String? $__typename,
  });
  TRes edges(
      Iterable<Query$AllUsersReport$allUsers$edges?> Function(
              Iterable<
                  CopyWith$Query$AllUsersReport$allUsers$edges<
                      Query$AllUsersReport$allUsers$edges>?>)
          _fn);
  CopyWith$Query$AllUsersReport$allUsers$pageInfo<TRes> get pageInfo;
}

class _CopyWithImpl$Query$AllUsersReport$allUsers<TRes>
    implements CopyWith$Query$AllUsersReport$allUsers<TRes> {
  _CopyWithImpl$Query$AllUsersReport$allUsers(
    this._instance,
    this._then,
  );

  final Query$AllUsersReport$allUsers _instance;

  final TRes Function(Query$AllUsersReport$allUsers) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? pageInfo = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$AllUsersReport$allUsers(
        edges: edges == _undefined || edges == null
            ? _instance.edges
            : (edges as List<Query$AllUsersReport$allUsers$edges?>),
        pageInfo: pageInfo == _undefined || pageInfo == null
            ? _instance.pageInfo
            : (pageInfo as Query$AllUsersReport$allUsers$pageInfo),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes edges(
          Iterable<Query$AllUsersReport$allUsers$edges?> Function(
                  Iterable<
                      CopyWith$Query$AllUsersReport$allUsers$edges<
                          Query$AllUsersReport$allUsers$edges>?>)
              _fn) =>
      call(
          edges: _fn(_instance.edges.map((e) => e == null
              ? null
              : CopyWith$Query$AllUsersReport$allUsers$edges(
                  e,
                  (i) => i,
                ))).toList());

  CopyWith$Query$AllUsersReport$allUsers$pageInfo<TRes> get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return CopyWith$Query$AllUsersReport$allUsers$pageInfo(
        local$pageInfo, (e) => call(pageInfo: e));
  }
}

class _CopyWithStubImpl$Query$AllUsersReport$allUsers<TRes>
    implements CopyWith$Query$AllUsersReport$allUsers<TRes> {
  _CopyWithStubImpl$Query$AllUsersReport$allUsers(this._res);

  TRes _res;

  call({
    List<Query$AllUsersReport$allUsers$edges?>? edges,
    Query$AllUsersReport$allUsers$pageInfo? pageInfo,
    String? $__typename,
  }) =>
      _res;

  edges(_fn) => _res;

  CopyWith$Query$AllUsersReport$allUsers$pageInfo<TRes> get pageInfo =>
      CopyWith$Query$AllUsersReport$allUsers$pageInfo.stub(_res);
}

class Query$AllUsersReport$allUsers$edges {
  Query$AllUsersReport$allUsers$edges({
    this.node,
    this.$__typename = 'UserNodeEdge',
  });

  factory Query$AllUsersReport$allUsers$edges.fromJson(
      Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$AllUsersReport$allUsers$edges(
      node: l$node == null
          ? null
          : Query$AllUsersReport$allUsers$edges$node.fromJson(
              (l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$AllUsersReport$allUsers$edges$node? node;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$node = node;
    _resultData['node'] = l$node?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$node = node;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$node,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$AllUsersReport$allUsers$edges ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$node = node;
    final lOther$node = other.node;
    if (l$node != lOther$node) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$AllUsersReport$allUsers$edges
    on Query$AllUsersReport$allUsers$edges {
  CopyWith$Query$AllUsersReport$allUsers$edges<
          Query$AllUsersReport$allUsers$edges>
      get copyWith => CopyWith$Query$AllUsersReport$allUsers$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$AllUsersReport$allUsers$edges<TRes> {
  factory CopyWith$Query$AllUsersReport$allUsers$edges(
    Query$AllUsersReport$allUsers$edges instance,
    TRes Function(Query$AllUsersReport$allUsers$edges) then,
  ) = _CopyWithImpl$Query$AllUsersReport$allUsers$edges;

  factory CopyWith$Query$AllUsersReport$allUsers$edges.stub(TRes res) =
      _CopyWithStubImpl$Query$AllUsersReport$allUsers$edges;

  TRes call({
    Query$AllUsersReport$allUsers$edges$node? node,
    String? $__typename,
  });
  CopyWith$Query$AllUsersReport$allUsers$edges$node<TRes> get node;
}

class _CopyWithImpl$Query$AllUsersReport$allUsers$edges<TRes>
    implements CopyWith$Query$AllUsersReport$allUsers$edges<TRes> {
  _CopyWithImpl$Query$AllUsersReport$allUsers$edges(
    this._instance,
    this._then,
  );

  final Query$AllUsersReport$allUsers$edges _instance;

  final TRes Function(Query$AllUsersReport$allUsers$edges) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$AllUsersReport$allUsers$edges(
        node: node == _undefined
            ? _instance.node
            : (node as Query$AllUsersReport$allUsers$edges$node?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$AllUsersReport$allUsers$edges$node<TRes> get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Query$AllUsersReport$allUsers$edges$node.stub(
            _then(_instance))
        : CopyWith$Query$AllUsersReport$allUsers$edges$node(
            local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Query$AllUsersReport$allUsers$edges<TRes>
    implements CopyWith$Query$AllUsersReport$allUsers$edges<TRes> {
  _CopyWithStubImpl$Query$AllUsersReport$allUsers$edges(this._res);

  TRes _res;

  call({
    Query$AllUsersReport$allUsers$edges$node? node,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$AllUsersReport$allUsers$edges$node<TRes> get node =>
      CopyWith$Query$AllUsersReport$allUsers$edges$node.stub(_res);
}

class Query$AllUsersReport$allUsers$edges$node {
  Query$AllUsersReport$allUsers$edges$node({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.isActive,
    required this.isStaff,
    required this.dateJoined,
    this.lastLogin,
    required this.surveySubmissions,
    this.$__typename = 'UserNode',
  });

  factory Query$AllUsersReport$allUsers$edges$node.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$username = json['username'];
    final l$email = json['email'];
    final l$firstName = json['firstName'];
    final l$lastName = json['lastName'];
    final l$isActive = json['isActive'];
    final l$isStaff = json['isStaff'];
    final l$dateJoined = json['dateJoined'];
    final l$lastLogin = json['lastLogin'];
    final l$surveySubmissions = json['surveySubmissions'];
    final l$$__typename = json['__typename'];
    return Query$AllUsersReport$allUsers$edges$node(
      id: (l$id as String),
      username: (l$username as String),
      email: (l$email as String),
      firstName: (l$firstName as String),
      lastName: (l$lastName as String),
      isActive: (l$isActive as bool),
      isStaff: (l$isStaff as bool),
      dateJoined: DateTime.parse((l$dateJoined as String)),
      lastLogin:
          l$lastLogin == null ? null : DateTime.parse((l$lastLogin as String)),
      surveySubmissions:
          Query$AllUsersReport$allUsers$edges$node$surveySubmissions.fromJson(
              (l$surveySubmissions as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String username;

  final String email;

  final String firstName;

  final String lastName;

  final bool isActive;

  final bool isStaff;

  final DateTime dateJoined;

  final DateTime? lastLogin;

  final Query$AllUsersReport$allUsers$edges$node$surveySubmissions
      surveySubmissions;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$username = username;
    _resultData['username'] = l$username;
    final l$email = email;
    _resultData['email'] = l$email;
    final l$firstName = firstName;
    _resultData['firstName'] = l$firstName;
    final l$lastName = lastName;
    _resultData['lastName'] = l$lastName;
    final l$isActive = isActive;
    _resultData['isActive'] = l$isActive;
    final l$isStaff = isStaff;
    _resultData['isStaff'] = l$isStaff;
    final l$dateJoined = dateJoined;
    _resultData['dateJoined'] = l$dateJoined.toIso8601String();
    final l$lastLogin = lastLogin;
    _resultData['lastLogin'] = l$lastLogin?.toIso8601String();
    final l$surveySubmissions = surveySubmissions;
    _resultData['surveySubmissions'] = l$surveySubmissions.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$username = username;
    final l$email = email;
    final l$firstName = firstName;
    final l$lastName = lastName;
    final l$isActive = isActive;
    final l$isStaff = isStaff;
    final l$dateJoined = dateJoined;
    final l$lastLogin = lastLogin;
    final l$surveySubmissions = surveySubmissions;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$username,
      l$email,
      l$firstName,
      l$lastName,
      l$isActive,
      l$isStaff,
      l$dateJoined,
      l$lastLogin,
      l$surveySubmissions,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$AllUsersReport$allUsers$edges$node ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$username = username;
    final lOther$username = other.username;
    if (l$username != lOther$username) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$firstName = firstName;
    final lOther$firstName = other.firstName;
    if (l$firstName != lOther$firstName) {
      return false;
    }
    final l$lastName = lastName;
    final lOther$lastName = other.lastName;
    if (l$lastName != lOther$lastName) {
      return false;
    }
    final l$isActive = isActive;
    final lOther$isActive = other.isActive;
    if (l$isActive != lOther$isActive) {
      return false;
    }
    final l$isStaff = isStaff;
    final lOther$isStaff = other.isStaff;
    if (l$isStaff != lOther$isStaff) {
      return false;
    }
    final l$dateJoined = dateJoined;
    final lOther$dateJoined = other.dateJoined;
    if (l$dateJoined != lOther$dateJoined) {
      return false;
    }
    final l$lastLogin = lastLogin;
    final lOther$lastLogin = other.lastLogin;
    if (l$lastLogin != lOther$lastLogin) {
      return false;
    }
    final l$surveySubmissions = surveySubmissions;
    final lOther$surveySubmissions = other.surveySubmissions;
    if (l$surveySubmissions != lOther$surveySubmissions) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$AllUsersReport$allUsers$edges$node
    on Query$AllUsersReport$allUsers$edges$node {
  CopyWith$Query$AllUsersReport$allUsers$edges$node<
          Query$AllUsersReport$allUsers$edges$node>
      get copyWith => CopyWith$Query$AllUsersReport$allUsers$edges$node(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$AllUsersReport$allUsers$edges$node<TRes> {
  factory CopyWith$Query$AllUsersReport$allUsers$edges$node(
    Query$AllUsersReport$allUsers$edges$node instance,
    TRes Function(Query$AllUsersReport$allUsers$edges$node) then,
  ) = _CopyWithImpl$Query$AllUsersReport$allUsers$edges$node;

  factory CopyWith$Query$AllUsersReport$allUsers$edges$node.stub(TRes res) =
      _CopyWithStubImpl$Query$AllUsersReport$allUsers$edges$node;

  TRes call({
    String? id,
    String? username,
    String? email,
    String? firstName,
    String? lastName,
    bool? isActive,
    bool? isStaff,
    DateTime? dateJoined,
    DateTime? lastLogin,
    Query$AllUsersReport$allUsers$edges$node$surveySubmissions?
        surveySubmissions,
    String? $__typename,
  });
  CopyWith$Query$AllUsersReport$allUsers$edges$node$surveySubmissions<TRes>
      get surveySubmissions;
}

class _CopyWithImpl$Query$AllUsersReport$allUsers$edges$node<TRes>
    implements CopyWith$Query$AllUsersReport$allUsers$edges$node<TRes> {
  _CopyWithImpl$Query$AllUsersReport$allUsers$edges$node(
    this._instance,
    this._then,
  );

  final Query$AllUsersReport$allUsers$edges$node _instance;

  final TRes Function(Query$AllUsersReport$allUsers$edges$node) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? username = _undefined,
    Object? email = _undefined,
    Object? firstName = _undefined,
    Object? lastName = _undefined,
    Object? isActive = _undefined,
    Object? isStaff = _undefined,
    Object? dateJoined = _undefined,
    Object? lastLogin = _undefined,
    Object? surveySubmissions = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$AllUsersReport$allUsers$edges$node(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        username: username == _undefined || username == null
            ? _instance.username
            : (username as String),
        email: email == _undefined || email == null
            ? _instance.email
            : (email as String),
        firstName: firstName == _undefined || firstName == null
            ? _instance.firstName
            : (firstName as String),
        lastName: lastName == _undefined || lastName == null
            ? _instance.lastName
            : (lastName as String),
        isActive: isActive == _undefined || isActive == null
            ? _instance.isActive
            : (isActive as bool),
        isStaff: isStaff == _undefined || isStaff == null
            ? _instance.isStaff
            : (isStaff as bool),
        dateJoined: dateJoined == _undefined || dateJoined == null
            ? _instance.dateJoined
            : (dateJoined as DateTime),
        lastLogin: lastLogin == _undefined
            ? _instance.lastLogin
            : (lastLogin as DateTime?),
        surveySubmissions: surveySubmissions == _undefined ||
                surveySubmissions == null
            ? _instance.surveySubmissions
            : (surveySubmissions
                as Query$AllUsersReport$allUsers$edges$node$surveySubmissions),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$AllUsersReport$allUsers$edges$node$surveySubmissions<TRes>
      get surveySubmissions {
    final local$surveySubmissions = _instance.surveySubmissions;
    return CopyWith$Query$AllUsersReport$allUsers$edges$node$surveySubmissions(
        local$surveySubmissions, (e) => call(surveySubmissions: e));
  }
}

class _CopyWithStubImpl$Query$AllUsersReport$allUsers$edges$node<TRes>
    implements CopyWith$Query$AllUsersReport$allUsers$edges$node<TRes> {
  _CopyWithStubImpl$Query$AllUsersReport$allUsers$edges$node(this._res);

  TRes _res;

  call({
    String? id,
    String? username,
    String? email,
    String? firstName,
    String? lastName,
    bool? isActive,
    bool? isStaff,
    DateTime? dateJoined,
    DateTime? lastLogin,
    Query$AllUsersReport$allUsers$edges$node$surveySubmissions?
        surveySubmissions,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$AllUsersReport$allUsers$edges$node$surveySubmissions<TRes>
      get surveySubmissions =>
          CopyWith$Query$AllUsersReport$allUsers$edges$node$surveySubmissions
              .stub(_res);
}

class Query$AllUsersReport$allUsers$edges$node$surveySubmissions {
  Query$AllUsersReport$allUsers$edges$node$surveySubmissions({
    required this.edges,
    this.$__typename = 'SubmissionNodeConnection',
  });

  factory Query$AllUsersReport$allUsers$edges$node$surveySubmissions.fromJson(
      Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Query$AllUsersReport$allUsers$edges$node$surveySubmissions(
      edges: (l$edges as List<dynamic>)
          .map((e) => e == null
              ? null
              : Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges?>
      edges;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$edges = edges;
    _resultData['edges'] = l$edges.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$edges = edges;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$edges.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$AllUsersReport$allUsers$edges$node$surveySubmissions ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$edges = edges;
    final lOther$edges = other.edges;
    if (l$edges.length != lOther$edges.length) {
      return false;
    }
    for (int i = 0; i < l$edges.length; i++) {
      final l$edges$entry = l$edges[i];
      final lOther$edges$entry = lOther$edges[i];
      if (l$edges$entry != lOther$edges$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$AllUsersReport$allUsers$edges$node$surveySubmissions
    on Query$AllUsersReport$allUsers$edges$node$surveySubmissions {
  CopyWith$Query$AllUsersReport$allUsers$edges$node$surveySubmissions<
          Query$AllUsersReport$allUsers$edges$node$surveySubmissions>
      get copyWith =>
          CopyWith$Query$AllUsersReport$allUsers$edges$node$surveySubmissions(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$AllUsersReport$allUsers$edges$node$surveySubmissions<
    TRes> {
  factory CopyWith$Query$AllUsersReport$allUsers$edges$node$surveySubmissions(
    Query$AllUsersReport$allUsers$edges$node$surveySubmissions instance,
    TRes Function(Query$AllUsersReport$allUsers$edges$node$surveySubmissions)
        then,
  ) = _CopyWithImpl$Query$AllUsersReport$allUsers$edges$node$surveySubmissions;

  factory CopyWith$Query$AllUsersReport$allUsers$edges$node$surveySubmissions.stub(
          TRes res) =
      _CopyWithStubImpl$Query$AllUsersReport$allUsers$edges$node$surveySubmissions;

  TRes call({
    List<Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges?>?
        edges,
    String? $__typename,
  });
  TRes edges(
      Iterable<Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges?> Function(
              Iterable<
                  CopyWith$Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges<
                      Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges>?>)
          _fn);
}

class _CopyWithImpl$Query$AllUsersReport$allUsers$edges$node$surveySubmissions<
        TRes>
    implements
        CopyWith$Query$AllUsersReport$allUsers$edges$node$surveySubmissions<
            TRes> {
  _CopyWithImpl$Query$AllUsersReport$allUsers$edges$node$surveySubmissions(
    this._instance,
    this._then,
  );

  final Query$AllUsersReport$allUsers$edges$node$surveySubmissions _instance;

  final TRes Function(
      Query$AllUsersReport$allUsers$edges$node$surveySubmissions) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$AllUsersReport$allUsers$edges$node$surveySubmissions(
        edges: edges == _undefined || edges == null
            ? _instance.edges
            : (edges as List<
                Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges?>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes edges(
          Iterable<Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges?> Function(
                  Iterable<
                      CopyWith$Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges<
                          Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges>?>)
              _fn) =>
      call(
          edges: _fn(_instance.edges.map((e) => e == null
              ? null
              : CopyWith$Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges(
                  e,
                  (i) => i,
                ))).toList());
}

class _CopyWithStubImpl$Query$AllUsersReport$allUsers$edges$node$surveySubmissions<
        TRes>
    implements
        CopyWith$Query$AllUsersReport$allUsers$edges$node$surveySubmissions<
            TRes> {
  _CopyWithStubImpl$Query$AllUsersReport$allUsers$edges$node$surveySubmissions(
      this._res);

  TRes _res;

  call({
    List<Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges?>?
        edges,
    String? $__typename,
  }) =>
      _res;

  edges(_fn) => _res;
}

class Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges {
  Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges({
    this.node,
    this.$__typename = 'SubmissionNodeEdge',
  });

  factory Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges.fromJson(
      Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges(
      node: l$node == null
          ? null
          : Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node
              .fromJson((l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node?
      node;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$node = node;
    _resultData['node'] = l$node?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$node = node;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$node,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other
            is! Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$node = node;
    final lOther$node = other.node;
    if (l$node != lOther$node) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges
    on Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges {
  CopyWith$Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges<
          Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges>
      get copyWith =>
          CopyWith$Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges<
    TRes> {
  factory CopyWith$Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges(
    Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges instance,
    TRes Function(
            Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges)
        then,
  ) = _CopyWithImpl$Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges;

  factory CopyWith$Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges.stub(
          TRes res) =
      _CopyWithStubImpl$Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges;

  TRes call({
    Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node? node,
    String? $__typename,
  });
  CopyWith$Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node<
      TRes> get node;
}

class _CopyWithImpl$Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges<
        TRes>
    implements
        CopyWith$Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges<
            TRes> {
  _CopyWithImpl$Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges(
    this._instance,
    this._then,
  );

  final Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges
      _instance;

  final TRes Function(
      Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges(
        node: node == _undefined
            ? _instance.node
            : (node
                as Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node<
      TRes> get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node
            .stub(_then(_instance))
        : CopyWith$Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node(
            local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges<
        TRes>
    implements
        CopyWith$Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges<
            TRes> {
  _CopyWithStubImpl$Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges(
      this._res);

  TRes _res;

  call({
    Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node? node,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node<
          TRes>
      get node =>
          CopyWith$Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node
              .stub(_res);
}

class Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node {
  Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node({
    required this.id,
    required this.submittedAt,
    required this.status,
    required this.survey,
    this.$__typename = 'SubmissionNode',
  });

  factory Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$submittedAt = json['submittedAt'];
    final l$status = json['status'];
    final l$survey = json['survey'];
    final l$$__typename = json['__typename'];
    return Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node(
      id: (l$id as String),
      submittedAt: DateTime.parse((l$submittedAt as String)),
      status: fromJson$Enum$SurveySubmissionStatusChoices((l$status as String)),
      survey:
          Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node$survey
              .fromJson((l$survey as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final DateTime submittedAt;

  final Enum$SurveySubmissionStatusChoices status;

  final Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node$survey
      survey;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$submittedAt = submittedAt;
    _resultData['submittedAt'] = l$submittedAt.toIso8601String();
    final l$status = status;
    _resultData['status'] = toJson$Enum$SurveySubmissionStatusChoices(l$status);
    final l$survey = survey;
    _resultData['survey'] = l$survey.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$submittedAt = submittedAt;
    final l$status = status;
    final l$survey = survey;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$submittedAt,
      l$status,
      l$survey,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other
            is! Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$submittedAt = submittedAt;
    final lOther$submittedAt = other.submittedAt;
    if (l$submittedAt != lOther$submittedAt) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$survey = survey;
    final lOther$survey = other.survey;
    if (l$survey != lOther$survey) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node
    on Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node {
  CopyWith$Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node<
          Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node>
      get copyWith =>
          CopyWith$Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node<
    TRes> {
  factory CopyWith$Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node(
    Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node
        instance,
    TRes Function(
            Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node)
        then,
  ) = _CopyWithImpl$Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node;

  factory CopyWith$Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node.stub(
          TRes res) =
      _CopyWithStubImpl$Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node;

  TRes call({
    String? id,
    DateTime? submittedAt,
    Enum$SurveySubmissionStatusChoices? status,
    Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node$survey?
        survey,
    String? $__typename,
  });
  CopyWith$Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node$survey<
      TRes> get survey;
}

class _CopyWithImpl$Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node<
        TRes>
    implements
        CopyWith$Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node<
            TRes> {
  _CopyWithImpl$Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node(
    this._instance,
    this._then,
  );

  final Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node
      _instance;

  final TRes Function(
          Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? submittedAt = _undefined,
    Object? status = _undefined,
    Object? survey = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        submittedAt: submittedAt == _undefined || submittedAt == null
            ? _instance.submittedAt
            : (submittedAt as DateTime),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as Enum$SurveySubmissionStatusChoices),
        survey: survey == _undefined || survey == null
            ? _instance.survey
            : (survey
                as Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node$survey),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node$survey<
      TRes> get survey {
    final local$survey = _instance.survey;
    return CopyWith$Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node$survey(
        local$survey, (e) => call(survey: e));
  }
}

class _CopyWithStubImpl$Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node<
        TRes>
    implements
        CopyWith$Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node<
            TRes> {
  _CopyWithStubImpl$Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node(
      this._res);

  TRes _res;

  call({
    String? id,
    DateTime? submittedAt,
    Enum$SurveySubmissionStatusChoices? status,
    Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node$survey?
        survey,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node$survey<
          TRes>
      get survey =>
          CopyWith$Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node$survey
              .stub(_res);
}

class Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node$survey {
  Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node$survey({
    required this.title,
    this.$__typename = 'SurveyNode',
  });

  factory Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node$survey.fromJson(
      Map<String, dynamic> json) {
    final l$title = json['title'];
    final l$$__typename = json['__typename'];
    return Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node$survey(
      title: (l$title as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String title;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$title = title;
    _resultData['title'] = l$title;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$title = title;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$title,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other
            is! Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node$survey ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node$survey
    on Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node$survey {
  CopyWith$Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node$survey<
          Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node$survey>
      get copyWith =>
          CopyWith$Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node$survey(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node$survey<
    TRes> {
  factory CopyWith$Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node$survey(
    Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node$survey
        instance,
    TRes Function(
            Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node$survey)
        then,
  ) = _CopyWithImpl$Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node$survey;

  factory CopyWith$Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node$survey.stub(
          TRes res) =
      _CopyWithStubImpl$Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node$survey;

  TRes call({
    String? title,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node$survey<
        TRes>
    implements
        CopyWith$Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node$survey<
            TRes> {
  _CopyWithImpl$Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node$survey(
    this._instance,
    this._then,
  );

  final Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node$survey
      _instance;

  final TRes Function(
          Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node$survey)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? title = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node$survey(
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node$survey<
        TRes>
    implements
        CopyWith$Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node$survey<
            TRes> {
  _CopyWithStubImpl$Query$AllUsersReport$allUsers$edges$node$surveySubmissions$edges$node$survey(
      this._res);

  TRes _res;

  call({
    String? title,
    String? $__typename,
  }) =>
      _res;
}

class Query$AllUsersReport$allUsers$pageInfo {
  Query$AllUsersReport$allUsers$pageInfo({
    required this.hasNextPage,
    required this.hasPreviousPage,
    this.startCursor,
    this.endCursor,
    this.$__typename = 'PageInfo',
  });

  factory Query$AllUsersReport$allUsers$pageInfo.fromJson(
      Map<String, dynamic> json) {
    final l$hasNextPage = json['hasNextPage'];
    final l$hasPreviousPage = json['hasPreviousPage'];
    final l$startCursor = json['startCursor'];
    final l$endCursor = json['endCursor'];
    final l$$__typename = json['__typename'];
    return Query$AllUsersReport$allUsers$pageInfo(
      hasNextPage: (l$hasNextPage as bool),
      hasPreviousPage: (l$hasPreviousPage as bool),
      startCursor: (l$startCursor as String?),
      endCursor: (l$endCursor as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool hasNextPage;

  final bool hasPreviousPage;

  final String? startCursor;

  final String? endCursor;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$hasNextPage = hasNextPage;
    _resultData['hasNextPage'] = l$hasNextPage;
    final l$hasPreviousPage = hasPreviousPage;
    _resultData['hasPreviousPage'] = l$hasPreviousPage;
    final l$startCursor = startCursor;
    _resultData['startCursor'] = l$startCursor;
    final l$endCursor = endCursor;
    _resultData['endCursor'] = l$endCursor;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$hasNextPage = hasNextPage;
    final l$hasPreviousPage = hasPreviousPage;
    final l$startCursor = startCursor;
    final l$endCursor = endCursor;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$hasNextPage,
      l$hasPreviousPage,
      l$startCursor,
      l$endCursor,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$AllUsersReport$allUsers$pageInfo ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$hasNextPage = hasNextPage;
    final lOther$hasNextPage = other.hasNextPage;
    if (l$hasNextPage != lOther$hasNextPage) {
      return false;
    }
    final l$hasPreviousPage = hasPreviousPage;
    final lOther$hasPreviousPage = other.hasPreviousPage;
    if (l$hasPreviousPage != lOther$hasPreviousPage) {
      return false;
    }
    final l$startCursor = startCursor;
    final lOther$startCursor = other.startCursor;
    if (l$startCursor != lOther$startCursor) {
      return false;
    }
    final l$endCursor = endCursor;
    final lOther$endCursor = other.endCursor;
    if (l$endCursor != lOther$endCursor) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$AllUsersReport$allUsers$pageInfo
    on Query$AllUsersReport$allUsers$pageInfo {
  CopyWith$Query$AllUsersReport$allUsers$pageInfo<
          Query$AllUsersReport$allUsers$pageInfo>
      get copyWith => CopyWith$Query$AllUsersReport$allUsers$pageInfo(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$AllUsersReport$allUsers$pageInfo<TRes> {
  factory CopyWith$Query$AllUsersReport$allUsers$pageInfo(
    Query$AllUsersReport$allUsers$pageInfo instance,
    TRes Function(Query$AllUsersReport$allUsers$pageInfo) then,
  ) = _CopyWithImpl$Query$AllUsersReport$allUsers$pageInfo;

  factory CopyWith$Query$AllUsersReport$allUsers$pageInfo.stub(TRes res) =
      _CopyWithStubImpl$Query$AllUsersReport$allUsers$pageInfo;

  TRes call({
    bool? hasNextPage,
    bool? hasPreviousPage,
    String? startCursor,
    String? endCursor,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$AllUsersReport$allUsers$pageInfo<TRes>
    implements CopyWith$Query$AllUsersReport$allUsers$pageInfo<TRes> {
  _CopyWithImpl$Query$AllUsersReport$allUsers$pageInfo(
    this._instance,
    this._then,
  );

  final Query$AllUsersReport$allUsers$pageInfo _instance;

  final TRes Function(Query$AllUsersReport$allUsers$pageInfo) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? hasNextPage = _undefined,
    Object? hasPreviousPage = _undefined,
    Object? startCursor = _undefined,
    Object? endCursor = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$AllUsersReport$allUsers$pageInfo(
        hasNextPage: hasNextPage == _undefined || hasNextPage == null
            ? _instance.hasNextPage
            : (hasNextPage as bool),
        hasPreviousPage:
            hasPreviousPage == _undefined || hasPreviousPage == null
                ? _instance.hasPreviousPage
                : (hasPreviousPage as bool),
        startCursor: startCursor == _undefined
            ? _instance.startCursor
            : (startCursor as String?),
        endCursor: endCursor == _undefined
            ? _instance.endCursor
            : (endCursor as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$AllUsersReport$allUsers$pageInfo<TRes>
    implements CopyWith$Query$AllUsersReport$allUsers$pageInfo<TRes> {
  _CopyWithStubImpl$Query$AllUsersReport$allUsers$pageInfo(this._res);

  TRes _res;

  call({
    bool? hasNextPage,
    bool? hasPreviousPage,
    String? startCursor,
    String? endCursor,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$SurveyAnalytics {
  factory Variables$Query$SurveyAnalytics({required String surveyId}) =>
      Variables$Query$SurveyAnalytics._({
        r'surveyId': surveyId,
      });

  Variables$Query$SurveyAnalytics._(this._$data);

  factory Variables$Query$SurveyAnalytics.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$surveyId = data['surveyId'];
    result$data['surveyId'] = (l$surveyId as String);
    return Variables$Query$SurveyAnalytics._(result$data);
  }

  Map<String, dynamic> _$data;

  String get surveyId => (_$data['surveyId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$surveyId = surveyId;
    result$data['surveyId'] = l$surveyId;
    return result$data;
  }

  CopyWith$Variables$Query$SurveyAnalytics<Variables$Query$SurveyAnalytics>
      get copyWith => CopyWith$Variables$Query$SurveyAnalytics(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$SurveyAnalytics ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$surveyId = surveyId;
    final lOther$surveyId = other.surveyId;
    if (l$surveyId != lOther$surveyId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$surveyId = surveyId;
    return Object.hashAll([l$surveyId]);
  }
}

abstract class CopyWith$Variables$Query$SurveyAnalytics<TRes> {
  factory CopyWith$Variables$Query$SurveyAnalytics(
    Variables$Query$SurveyAnalytics instance,
    TRes Function(Variables$Query$SurveyAnalytics) then,
  ) = _CopyWithImpl$Variables$Query$SurveyAnalytics;

  factory CopyWith$Variables$Query$SurveyAnalytics.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$SurveyAnalytics;

  TRes call({String? surveyId});
}

class _CopyWithImpl$Variables$Query$SurveyAnalytics<TRes>
    implements CopyWith$Variables$Query$SurveyAnalytics<TRes> {
  _CopyWithImpl$Variables$Query$SurveyAnalytics(
    this._instance,
    this._then,
  );

  final Variables$Query$SurveyAnalytics _instance;

  final TRes Function(Variables$Query$SurveyAnalytics) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? surveyId = _undefined}) =>
      _then(Variables$Query$SurveyAnalytics._({
        ..._instance._$data,
        if (surveyId != _undefined && surveyId != null)
          'surveyId': (surveyId as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$SurveyAnalytics<TRes>
    implements CopyWith$Variables$Query$SurveyAnalytics<TRes> {
  _CopyWithStubImpl$Variables$Query$SurveyAnalytics(this._res);

  TRes _res;

  call({String? surveyId}) => _res;
}

class Query$SurveyAnalytics {
  Query$SurveyAnalytics({
    this.survey,
    this.$__typename = 'Query',
  });

  factory Query$SurveyAnalytics.fromJson(Map<String, dynamic> json) {
    final l$survey = json['survey'];
    final l$$__typename = json['__typename'];
    return Query$SurveyAnalytics(
      survey: l$survey == null
          ? null
          : Query$SurveyAnalytics$survey.fromJson(
              (l$survey as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$SurveyAnalytics$survey? survey;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$survey = survey;
    _resultData['survey'] = l$survey?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$survey = survey;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$survey,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$SurveyAnalytics || runtimeType != other.runtimeType) {
      return false;
    }
    final l$survey = survey;
    final lOther$survey = other.survey;
    if (l$survey != lOther$survey) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$SurveyAnalytics on Query$SurveyAnalytics {
  CopyWith$Query$SurveyAnalytics<Query$SurveyAnalytics> get copyWith =>
      CopyWith$Query$SurveyAnalytics(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$SurveyAnalytics<TRes> {
  factory CopyWith$Query$SurveyAnalytics(
    Query$SurveyAnalytics instance,
    TRes Function(Query$SurveyAnalytics) then,
  ) = _CopyWithImpl$Query$SurveyAnalytics;

  factory CopyWith$Query$SurveyAnalytics.stub(TRes res) =
      _CopyWithStubImpl$Query$SurveyAnalytics;

  TRes call({
    Query$SurveyAnalytics$survey? survey,
    String? $__typename,
  });
  CopyWith$Query$SurveyAnalytics$survey<TRes> get survey;
}

class _CopyWithImpl$Query$SurveyAnalytics<TRes>
    implements CopyWith$Query$SurveyAnalytics<TRes> {
  _CopyWithImpl$Query$SurveyAnalytics(
    this._instance,
    this._then,
  );

  final Query$SurveyAnalytics _instance;

  final TRes Function(Query$SurveyAnalytics) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? survey = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$SurveyAnalytics(
        survey: survey == _undefined
            ? _instance.survey
            : (survey as Query$SurveyAnalytics$survey?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$SurveyAnalytics$survey<TRes> get survey {
    final local$survey = _instance.survey;
    return local$survey == null
        ? CopyWith$Query$SurveyAnalytics$survey.stub(_then(_instance))
        : CopyWith$Query$SurveyAnalytics$survey(
            local$survey, (e) => call(survey: e));
  }
}

class _CopyWithStubImpl$Query$SurveyAnalytics<TRes>
    implements CopyWith$Query$SurveyAnalytics<TRes> {
  _CopyWithStubImpl$Query$SurveyAnalytics(this._res);

  TRes _res;

  call({
    Query$SurveyAnalytics$survey? survey,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$SurveyAnalytics$survey<TRes> get survey =>
      CopyWith$Query$SurveyAnalytics$survey.stub(_res);
}

const documentNodeQuerySurveyAnalytics = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'SurveyAnalytics'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'surveyId')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'survey'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'surveyId')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'title'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'description'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'submissionCount'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'questions'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'edges'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'node'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                        name: NameNode(value: 'id'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'text'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'questionType'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'isRequired'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'answers'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(selections: [
                          FieldNode(
                            name: NameNode(value: 'edges'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: SelectionSetNode(selections: [
                              FieldNode(
                                name: NameNode(value: 'node'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FieldNode(
                                    name: NameNode(value: 'id'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null,
                                  ),
                                  FieldNode(
                                    name: NameNode(value: 'textAnswer'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null,
                                  ),
                                  FieldNode(
                                    name: NameNode(value: 'selectedOptions'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: SelectionSetNode(selections: [
                                      FieldNode(
                                        name: NameNode(value: 'edges'),
                                        alias: null,
                                        arguments: [],
                                        directives: [],
                                        selectionSet:
                                            SelectionSetNode(selections: [
                                          FieldNode(
                                            name: NameNode(value: 'node'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet:
                                                SelectionSetNode(selections: [
                                              FieldNode(
                                                name: NameNode(value: 'id'),
                                                alias: null,
                                                arguments: [],
                                                directives: [],
                                                selectionSet: null,
                                              ),
                                              FieldNode(
                                                name: NameNode(value: 'text'),
                                                alias: null,
                                                arguments: [],
                                                directives: [],
                                                selectionSet: null,
                                              ),
                                              FieldNode(
                                                name: NameNode(
                                                    value: '__typename'),
                                                alias: null,
                                                arguments: [],
                                                directives: [],
                                                selectionSet: null,
                                              ),
                                            ]),
                                          ),
                                          FieldNode(
                                            name: NameNode(value: '__typename'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet: null,
                                          ),
                                        ]),
                                      ),
                                      FieldNode(
                                        name: NameNode(value: '__typename'),
                                        alias: null,
                                        arguments: [],
                                        directives: [],
                                        selectionSet: null,
                                      ),
                                    ]),
                                  ),
                                  FieldNode(
                                    name: NameNode(value: '__typename'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null,
                                  ),
                                ]),
                              ),
                              FieldNode(
                                name: NameNode(value: '__typename'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null,
                              ),
                            ]),
                          ),
                          FieldNode(
                            name: NameNode(value: '__typename'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                        ]),
                      ),
                      FieldNode(
                        name: NameNode(value: '__typename'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                    ]),
                  ),
                  FieldNode(
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'submissions'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'edges'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'node'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                        name: NameNode(value: 'id'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'submittedAt'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'status'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'user'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(selections: [
                          FieldNode(
                            name: NameNode(value: 'username'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                          FieldNode(
                            name: NameNode(value: '__typename'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                        ]),
                      ),
                      FieldNode(
                        name: NameNode(value: 'answers'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(selections: [
                          FieldNode(
                            name: NameNode(value: 'edges'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: SelectionSetNode(selections: [
                              FieldNode(
                                name: NameNode(value: 'node'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FieldNode(
                                    name: NameNode(value: 'id'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null,
                                  ),
                                  FieldNode(
                                    name: NameNode(value: 'question'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: SelectionSetNode(selections: [
                                      FieldNode(
                                        name: NameNode(value: 'id'),
                                        alias: null,
                                        arguments: [],
                                        directives: [],
                                        selectionSet: null,
                                      ),
                                      FieldNode(
                                        name: NameNode(value: 'text'),
                                        alias: null,
                                        arguments: [],
                                        directives: [],
                                        selectionSet: null,
                                      ),
                                      FieldNode(
                                        name: NameNode(value: 'questionType'),
                                        alias: null,
                                        arguments: [],
                                        directives: [],
                                        selectionSet: null,
                                      ),
                                      FieldNode(
                                        name: NameNode(value: '__typename'),
                                        alias: null,
                                        arguments: [],
                                        directives: [],
                                        selectionSet: null,
                                      ),
                                    ]),
                                  ),
                                  FieldNode(
                                    name: NameNode(value: 'textAnswer'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null,
                                  ),
                                  FieldNode(
                                    name: NameNode(value: 'selectedOptions'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: SelectionSetNode(selections: [
                                      FieldNode(
                                        name: NameNode(value: 'edges'),
                                        alias: null,
                                        arguments: [],
                                        directives: [],
                                        selectionSet:
                                            SelectionSetNode(selections: [
                                          FieldNode(
                                            name: NameNode(value: 'node'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet:
                                                SelectionSetNode(selections: [
                                              FieldNode(
                                                name: NameNode(value: 'id'),
                                                alias: null,
                                                arguments: [],
                                                directives: [],
                                                selectionSet: null,
                                              ),
                                              FieldNode(
                                                name: NameNode(value: 'text'),
                                                alias: null,
                                                arguments: [],
                                                directives: [],
                                                selectionSet: null,
                                              ),
                                              FieldNode(
                                                name: NameNode(
                                                    value: '__typename'),
                                                alias: null,
                                                arguments: [],
                                                directives: [],
                                                selectionSet: null,
                                              ),
                                            ]),
                                          ),
                                          FieldNode(
                                            name: NameNode(value: '__typename'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet: null,
                                          ),
                                        ]),
                                      ),
                                      FieldNode(
                                        name: NameNode(value: '__typename'),
                                        alias: null,
                                        arguments: [],
                                        directives: [],
                                        selectionSet: null,
                                      ),
                                    ]),
                                  ),
                                  FieldNode(
                                    name: NameNode(value: '__typename'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null,
                                  ),
                                ]),
                              ),
                              FieldNode(
                                name: NameNode(value: '__typename'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null,
                              ),
                            ]),
                          ),
                          FieldNode(
                            name: NameNode(value: '__typename'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                        ]),
                      ),
                      FieldNode(
                        name: NameNode(value: '__typename'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                    ]),
                  ),
                  FieldNode(
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Query$SurveyAnalytics _parserFn$Query$SurveyAnalytics(
        Map<String, dynamic> data) =>
    Query$SurveyAnalytics.fromJson(data);
typedef OnQueryComplete$Query$SurveyAnalytics = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$SurveyAnalytics?,
);

class Options$Query$SurveyAnalytics
    extends graphql.QueryOptions<Query$SurveyAnalytics> {
  Options$Query$SurveyAnalytics({
    String? operationName,
    required Variables$Query$SurveyAnalytics variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$SurveyAnalytics? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$SurveyAnalytics? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null ? null : _parserFn$Query$SurveyAnalytics(data),
                  ),
          onError: onError,
          document: documentNodeQuerySurveyAnalytics,
          parserFn: _parserFn$Query$SurveyAnalytics,
        );

  final OnQueryComplete$Query$SurveyAnalytics? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$SurveyAnalytics
    extends graphql.WatchQueryOptions<Query$SurveyAnalytics> {
  WatchOptions$Query$SurveyAnalytics({
    String? operationName,
    required Variables$Query$SurveyAnalytics variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$SurveyAnalytics? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQuerySurveyAnalytics,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$SurveyAnalytics,
        );
}

class FetchMoreOptions$Query$SurveyAnalytics extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$SurveyAnalytics({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$SurveyAnalytics variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerySurveyAnalytics,
        );
}

extension ClientExtension$Query$SurveyAnalytics on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$SurveyAnalytics>> query$SurveyAnalytics(
          Options$Query$SurveyAnalytics options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$SurveyAnalytics> watchQuery$SurveyAnalytics(
          WatchOptions$Query$SurveyAnalytics options) =>
      this.watchQuery(options);
  void writeQuery$SurveyAnalytics({
    required Query$SurveyAnalytics data,
    required Variables$Query$SurveyAnalytics variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQuerySurveyAnalytics),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$SurveyAnalytics? readQuery$SurveyAnalytics({
    required Variables$Query$SurveyAnalytics variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQuerySurveyAnalytics),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$SurveyAnalytics.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$SurveyAnalytics> useQuery$SurveyAnalytics(
        Options$Query$SurveyAnalytics options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$SurveyAnalytics> useWatchQuery$SurveyAnalytics(
        WatchOptions$Query$SurveyAnalytics options) =>
    graphql_flutter.useWatchQuery(options);

class Query$SurveyAnalytics$Widget
    extends graphql_flutter.Query<Query$SurveyAnalytics> {
  Query$SurveyAnalytics$Widget({
    widgets.Key? key,
    required Options$Query$SurveyAnalytics options,
    required graphql_flutter.QueryBuilder<Query$SurveyAnalytics> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$SurveyAnalytics$survey {
  Query$SurveyAnalytics$survey({
    required this.id,
    required this.title,
    this.description,
    required this.createdAt,
    this.submissionCount,
    required this.questions,
    required this.submissions,
    this.$__typename = 'SurveyNode',
  });

  factory Query$SurveyAnalytics$survey.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$description = json['description'];
    final l$createdAt = json['createdAt'];
    final l$submissionCount = json['submissionCount'];
    final l$questions = json['questions'];
    final l$submissions = json['submissions'];
    final l$$__typename = json['__typename'];
    return Query$SurveyAnalytics$survey(
      id: (l$id as String),
      title: (l$title as String),
      description: (l$description as String?),
      createdAt: DateTime.parse((l$createdAt as String)),
      submissionCount: (l$submissionCount as int?),
      questions: Query$SurveyAnalytics$survey$questions.fromJson(
          (l$questions as Map<String, dynamic>)),
      submissions: Query$SurveyAnalytics$survey$submissions.fromJson(
          (l$submissions as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final String? description;

  final DateTime createdAt;

  final int? submissionCount;

  final Query$SurveyAnalytics$survey$questions questions;

  final Query$SurveyAnalytics$survey$submissions submissions;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt.toIso8601String();
    final l$submissionCount = submissionCount;
    _resultData['submissionCount'] = l$submissionCount;
    final l$questions = questions;
    _resultData['questions'] = l$questions.toJson();
    final l$submissions = submissions;
    _resultData['submissions'] = l$submissions.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$description = description;
    final l$createdAt = createdAt;
    final l$submissionCount = submissionCount;
    final l$questions = questions;
    final l$submissions = submissions;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$description,
      l$createdAt,
      l$submissionCount,
      l$questions,
      l$submissions,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$SurveyAnalytics$survey ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
      return false;
    }
    final l$submissionCount = submissionCount;
    final lOther$submissionCount = other.submissionCount;
    if (l$submissionCount != lOther$submissionCount) {
      return false;
    }
    final l$questions = questions;
    final lOther$questions = other.questions;
    if (l$questions != lOther$questions) {
      return false;
    }
    final l$submissions = submissions;
    final lOther$submissions = other.submissions;
    if (l$submissions != lOther$submissions) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$SurveyAnalytics$survey
    on Query$SurveyAnalytics$survey {
  CopyWith$Query$SurveyAnalytics$survey<Query$SurveyAnalytics$survey>
      get copyWith => CopyWith$Query$SurveyAnalytics$survey(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$SurveyAnalytics$survey<TRes> {
  factory CopyWith$Query$SurveyAnalytics$survey(
    Query$SurveyAnalytics$survey instance,
    TRes Function(Query$SurveyAnalytics$survey) then,
  ) = _CopyWithImpl$Query$SurveyAnalytics$survey;

  factory CopyWith$Query$SurveyAnalytics$survey.stub(TRes res) =
      _CopyWithStubImpl$Query$SurveyAnalytics$survey;

  TRes call({
    String? id,
    String? title,
    String? description,
    DateTime? createdAt,
    int? submissionCount,
    Query$SurveyAnalytics$survey$questions? questions,
    Query$SurveyAnalytics$survey$submissions? submissions,
    String? $__typename,
  });
  CopyWith$Query$SurveyAnalytics$survey$questions<TRes> get questions;
  CopyWith$Query$SurveyAnalytics$survey$submissions<TRes> get submissions;
}

class _CopyWithImpl$Query$SurveyAnalytics$survey<TRes>
    implements CopyWith$Query$SurveyAnalytics$survey<TRes> {
  _CopyWithImpl$Query$SurveyAnalytics$survey(
    this._instance,
    this._then,
  );

  final Query$SurveyAnalytics$survey _instance;

  final TRes Function(Query$SurveyAnalytics$survey) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? description = _undefined,
    Object? createdAt = _undefined,
    Object? submissionCount = _undefined,
    Object? questions = _undefined,
    Object? submissions = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$SurveyAnalytics$survey(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        description: description == _undefined
            ? _instance.description
            : (description as String?),
        createdAt: createdAt == _undefined || createdAt == null
            ? _instance.createdAt
            : (createdAt as DateTime),
        submissionCount: submissionCount == _undefined
            ? _instance.submissionCount
            : (submissionCount as int?),
        questions: questions == _undefined || questions == null
            ? _instance.questions
            : (questions as Query$SurveyAnalytics$survey$questions),
        submissions: submissions == _undefined || submissions == null
            ? _instance.submissions
            : (submissions as Query$SurveyAnalytics$survey$submissions),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$SurveyAnalytics$survey$questions<TRes> get questions {
    final local$questions = _instance.questions;
    return CopyWith$Query$SurveyAnalytics$survey$questions(
        local$questions, (e) => call(questions: e));
  }

  CopyWith$Query$SurveyAnalytics$survey$submissions<TRes> get submissions {
    final local$submissions = _instance.submissions;
    return CopyWith$Query$SurveyAnalytics$survey$submissions(
        local$submissions, (e) => call(submissions: e));
  }
}

class _CopyWithStubImpl$Query$SurveyAnalytics$survey<TRes>
    implements CopyWith$Query$SurveyAnalytics$survey<TRes> {
  _CopyWithStubImpl$Query$SurveyAnalytics$survey(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? description,
    DateTime? createdAt,
    int? submissionCount,
    Query$SurveyAnalytics$survey$questions? questions,
    Query$SurveyAnalytics$survey$submissions? submissions,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$SurveyAnalytics$survey$questions<TRes> get questions =>
      CopyWith$Query$SurveyAnalytics$survey$questions.stub(_res);

  CopyWith$Query$SurveyAnalytics$survey$submissions<TRes> get submissions =>
      CopyWith$Query$SurveyAnalytics$survey$submissions.stub(_res);
}

class Query$SurveyAnalytics$survey$questions {
  Query$SurveyAnalytics$survey$questions({
    required this.edges,
    this.$__typename = 'QuestionNodeConnection',
  });

  factory Query$SurveyAnalytics$survey$questions.fromJson(
      Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Query$SurveyAnalytics$survey$questions(
      edges: (l$edges as List<dynamic>)
          .map((e) => e == null
              ? null
              : Query$SurveyAnalytics$survey$questions$edges.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$SurveyAnalytics$survey$questions$edges?> edges;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$edges = edges;
    _resultData['edges'] = l$edges.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$edges = edges;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$edges.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$SurveyAnalytics$survey$questions ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$edges = edges;
    final lOther$edges = other.edges;
    if (l$edges.length != lOther$edges.length) {
      return false;
    }
    for (int i = 0; i < l$edges.length; i++) {
      final l$edges$entry = l$edges[i];
      final lOther$edges$entry = lOther$edges[i];
      if (l$edges$entry != lOther$edges$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$SurveyAnalytics$survey$questions
    on Query$SurveyAnalytics$survey$questions {
  CopyWith$Query$SurveyAnalytics$survey$questions<
          Query$SurveyAnalytics$survey$questions>
      get copyWith => CopyWith$Query$SurveyAnalytics$survey$questions(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$SurveyAnalytics$survey$questions<TRes> {
  factory CopyWith$Query$SurveyAnalytics$survey$questions(
    Query$SurveyAnalytics$survey$questions instance,
    TRes Function(Query$SurveyAnalytics$survey$questions) then,
  ) = _CopyWithImpl$Query$SurveyAnalytics$survey$questions;

  factory CopyWith$Query$SurveyAnalytics$survey$questions.stub(TRes res) =
      _CopyWithStubImpl$Query$SurveyAnalytics$survey$questions;

  TRes call({
    List<Query$SurveyAnalytics$survey$questions$edges?>? edges,
    String? $__typename,
  });
  TRes edges(
      Iterable<Query$SurveyAnalytics$survey$questions$edges?> Function(
              Iterable<
                  CopyWith$Query$SurveyAnalytics$survey$questions$edges<
                      Query$SurveyAnalytics$survey$questions$edges>?>)
          _fn);
}

class _CopyWithImpl$Query$SurveyAnalytics$survey$questions<TRes>
    implements CopyWith$Query$SurveyAnalytics$survey$questions<TRes> {
  _CopyWithImpl$Query$SurveyAnalytics$survey$questions(
    this._instance,
    this._then,
  );

  final Query$SurveyAnalytics$survey$questions _instance;

  final TRes Function(Query$SurveyAnalytics$survey$questions) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$SurveyAnalytics$survey$questions(
        edges: edges == _undefined || edges == null
            ? _instance.edges
            : (edges as List<Query$SurveyAnalytics$survey$questions$edges?>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes edges(
          Iterable<Query$SurveyAnalytics$survey$questions$edges?> Function(
                  Iterable<
                      CopyWith$Query$SurveyAnalytics$survey$questions$edges<
                          Query$SurveyAnalytics$survey$questions$edges>?>)
              _fn) =>
      call(
          edges: _fn(_instance.edges.map((e) => e == null
              ? null
              : CopyWith$Query$SurveyAnalytics$survey$questions$edges(
                  e,
                  (i) => i,
                ))).toList());
}

class _CopyWithStubImpl$Query$SurveyAnalytics$survey$questions<TRes>
    implements CopyWith$Query$SurveyAnalytics$survey$questions<TRes> {
  _CopyWithStubImpl$Query$SurveyAnalytics$survey$questions(this._res);

  TRes _res;

  call({
    List<Query$SurveyAnalytics$survey$questions$edges?>? edges,
    String? $__typename,
  }) =>
      _res;

  edges(_fn) => _res;
}

class Query$SurveyAnalytics$survey$questions$edges {
  Query$SurveyAnalytics$survey$questions$edges({
    this.node,
    this.$__typename = 'QuestionNodeEdge',
  });

  factory Query$SurveyAnalytics$survey$questions$edges.fromJson(
      Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$SurveyAnalytics$survey$questions$edges(
      node: l$node == null
          ? null
          : Query$SurveyAnalytics$survey$questions$edges$node.fromJson(
              (l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$SurveyAnalytics$survey$questions$edges$node? node;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$node = node;
    _resultData['node'] = l$node?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$node = node;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$node,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$SurveyAnalytics$survey$questions$edges ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$node = node;
    final lOther$node = other.node;
    if (l$node != lOther$node) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$SurveyAnalytics$survey$questions$edges
    on Query$SurveyAnalytics$survey$questions$edges {
  CopyWith$Query$SurveyAnalytics$survey$questions$edges<
          Query$SurveyAnalytics$survey$questions$edges>
      get copyWith => CopyWith$Query$SurveyAnalytics$survey$questions$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$SurveyAnalytics$survey$questions$edges<TRes> {
  factory CopyWith$Query$SurveyAnalytics$survey$questions$edges(
    Query$SurveyAnalytics$survey$questions$edges instance,
    TRes Function(Query$SurveyAnalytics$survey$questions$edges) then,
  ) = _CopyWithImpl$Query$SurveyAnalytics$survey$questions$edges;

  factory CopyWith$Query$SurveyAnalytics$survey$questions$edges.stub(TRes res) =
      _CopyWithStubImpl$Query$SurveyAnalytics$survey$questions$edges;

  TRes call({
    Query$SurveyAnalytics$survey$questions$edges$node? node,
    String? $__typename,
  });
  CopyWith$Query$SurveyAnalytics$survey$questions$edges$node<TRes> get node;
}

class _CopyWithImpl$Query$SurveyAnalytics$survey$questions$edges<TRes>
    implements CopyWith$Query$SurveyAnalytics$survey$questions$edges<TRes> {
  _CopyWithImpl$Query$SurveyAnalytics$survey$questions$edges(
    this._instance,
    this._then,
  );

  final Query$SurveyAnalytics$survey$questions$edges _instance;

  final TRes Function(Query$SurveyAnalytics$survey$questions$edges) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$SurveyAnalytics$survey$questions$edges(
        node: node == _undefined
            ? _instance.node
            : (node as Query$SurveyAnalytics$survey$questions$edges$node?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$SurveyAnalytics$survey$questions$edges$node<TRes> get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Query$SurveyAnalytics$survey$questions$edges$node.stub(
            _then(_instance))
        : CopyWith$Query$SurveyAnalytics$survey$questions$edges$node(
            local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Query$SurveyAnalytics$survey$questions$edges<TRes>
    implements CopyWith$Query$SurveyAnalytics$survey$questions$edges<TRes> {
  _CopyWithStubImpl$Query$SurveyAnalytics$survey$questions$edges(this._res);

  TRes _res;

  call({
    Query$SurveyAnalytics$survey$questions$edges$node? node,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$SurveyAnalytics$survey$questions$edges$node<TRes> get node =>
      CopyWith$Query$SurveyAnalytics$survey$questions$edges$node.stub(_res);
}

class Query$SurveyAnalytics$survey$questions$edges$node {
  Query$SurveyAnalytics$survey$questions$edges$node({
    required this.id,
    required this.text,
    required this.questionType,
    required this.isRequired,
    required this.answers,
    this.$__typename = 'QuestionNode',
  });

  factory Query$SurveyAnalytics$survey$questions$edges$node.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$text = json['text'];
    final l$questionType = json['questionType'];
    final l$isRequired = json['isRequired'];
    final l$answers = json['answers'];
    final l$$__typename = json['__typename'];
    return Query$SurveyAnalytics$survey$questions$edges$node(
      id: (l$id as String),
      text: (l$text as String),
      questionType: fromJson$Enum$SurveyQuestionQuestionTypeChoices(
          (l$questionType as String)),
      isRequired: (l$isRequired as bool),
      answers:
          Query$SurveyAnalytics$survey$questions$edges$node$answers.fromJson(
              (l$answers as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String text;

  final Enum$SurveyQuestionQuestionTypeChoices questionType;

  final bool isRequired;

  final Query$SurveyAnalytics$survey$questions$edges$node$answers answers;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$text = text;
    _resultData['text'] = l$text;
    final l$questionType = questionType;
    _resultData['questionType'] =
        toJson$Enum$SurveyQuestionQuestionTypeChoices(l$questionType);
    final l$isRequired = isRequired;
    _resultData['isRequired'] = l$isRequired;
    final l$answers = answers;
    _resultData['answers'] = l$answers.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$text = text;
    final l$questionType = questionType;
    final l$isRequired = isRequired;
    final l$answers = answers;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$text,
      l$questionType,
      l$isRequired,
      l$answers,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$SurveyAnalytics$survey$questions$edges$node ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$text = text;
    final lOther$text = other.text;
    if (l$text != lOther$text) {
      return false;
    }
    final l$questionType = questionType;
    final lOther$questionType = other.questionType;
    if (l$questionType != lOther$questionType) {
      return false;
    }
    final l$isRequired = isRequired;
    final lOther$isRequired = other.isRequired;
    if (l$isRequired != lOther$isRequired) {
      return false;
    }
    final l$answers = answers;
    final lOther$answers = other.answers;
    if (l$answers != lOther$answers) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$SurveyAnalytics$survey$questions$edges$node
    on Query$SurveyAnalytics$survey$questions$edges$node {
  CopyWith$Query$SurveyAnalytics$survey$questions$edges$node<
          Query$SurveyAnalytics$survey$questions$edges$node>
      get copyWith =>
          CopyWith$Query$SurveyAnalytics$survey$questions$edges$node(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$SurveyAnalytics$survey$questions$edges$node<
    TRes> {
  factory CopyWith$Query$SurveyAnalytics$survey$questions$edges$node(
    Query$SurveyAnalytics$survey$questions$edges$node instance,
    TRes Function(Query$SurveyAnalytics$survey$questions$edges$node) then,
  ) = _CopyWithImpl$Query$SurveyAnalytics$survey$questions$edges$node;

  factory CopyWith$Query$SurveyAnalytics$survey$questions$edges$node.stub(
          TRes res) =
      _CopyWithStubImpl$Query$SurveyAnalytics$survey$questions$edges$node;

  TRes call({
    String? id,
    String? text,
    Enum$SurveyQuestionQuestionTypeChoices? questionType,
    bool? isRequired,
    Query$SurveyAnalytics$survey$questions$edges$node$answers? answers,
    String? $__typename,
  });
  CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers<TRes>
      get answers;
}

class _CopyWithImpl$Query$SurveyAnalytics$survey$questions$edges$node<TRes>
    implements
        CopyWith$Query$SurveyAnalytics$survey$questions$edges$node<TRes> {
  _CopyWithImpl$Query$SurveyAnalytics$survey$questions$edges$node(
    this._instance,
    this._then,
  );

  final Query$SurveyAnalytics$survey$questions$edges$node _instance;

  final TRes Function(Query$SurveyAnalytics$survey$questions$edges$node) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? text = _undefined,
    Object? questionType = _undefined,
    Object? isRequired = _undefined,
    Object? answers = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$SurveyAnalytics$survey$questions$edges$node(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        text: text == _undefined || text == null
            ? _instance.text
            : (text as String),
        questionType: questionType == _undefined || questionType == null
            ? _instance.questionType
            : (questionType as Enum$SurveyQuestionQuestionTypeChoices),
        isRequired: isRequired == _undefined || isRequired == null
            ? _instance.isRequired
            : (isRequired as bool),
        answers: answers == _undefined || answers == null
            ? _instance.answers
            : (answers
                as Query$SurveyAnalytics$survey$questions$edges$node$answers),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers<TRes>
      get answers {
    final local$answers = _instance.answers;
    return CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers(
        local$answers, (e) => call(answers: e));
  }
}

class _CopyWithStubImpl$Query$SurveyAnalytics$survey$questions$edges$node<TRes>
    implements
        CopyWith$Query$SurveyAnalytics$survey$questions$edges$node<TRes> {
  _CopyWithStubImpl$Query$SurveyAnalytics$survey$questions$edges$node(
      this._res);

  TRes _res;

  call({
    String? id,
    String? text,
    Enum$SurveyQuestionQuestionTypeChoices? questionType,
    bool? isRequired,
    Query$SurveyAnalytics$survey$questions$edges$node$answers? answers,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers<TRes>
      get answers =>
          CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers
              .stub(_res);
}

class Query$SurveyAnalytics$survey$questions$edges$node$answers {
  Query$SurveyAnalytics$survey$questions$edges$node$answers({
    required this.edges,
    this.$__typename = 'SubmissionAnswerNodeConnection',
  });

  factory Query$SurveyAnalytics$survey$questions$edges$node$answers.fromJson(
      Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Query$SurveyAnalytics$survey$questions$edges$node$answers(
      edges: (l$edges as List<dynamic>)
          .map((e) => e == null
              ? null
              : Query$SurveyAnalytics$survey$questions$edges$node$answers$edges
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$SurveyAnalytics$survey$questions$edges$node$answers$edges?>
      edges;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$edges = edges;
    _resultData['edges'] = l$edges.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$edges = edges;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$edges.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$SurveyAnalytics$survey$questions$edges$node$answers ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$edges = edges;
    final lOther$edges = other.edges;
    if (l$edges.length != lOther$edges.length) {
      return false;
    }
    for (int i = 0; i < l$edges.length; i++) {
      final l$edges$entry = l$edges[i];
      final lOther$edges$entry = lOther$edges[i];
      if (l$edges$entry != lOther$edges$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$SurveyAnalytics$survey$questions$edges$node$answers
    on Query$SurveyAnalytics$survey$questions$edges$node$answers {
  CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers<
          Query$SurveyAnalytics$survey$questions$edges$node$answers>
      get copyWith =>
          CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers<
    TRes> {
  factory CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers(
    Query$SurveyAnalytics$survey$questions$edges$node$answers instance,
    TRes Function(Query$SurveyAnalytics$survey$questions$edges$node$answers)
        then,
  ) = _CopyWithImpl$Query$SurveyAnalytics$survey$questions$edges$node$answers;

  factory CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers.stub(
          TRes res) =
      _CopyWithStubImpl$Query$SurveyAnalytics$survey$questions$edges$node$answers;

  TRes call({
    List<Query$SurveyAnalytics$survey$questions$edges$node$answers$edges?>?
        edges,
    String? $__typename,
  });
  TRes edges(
      Iterable<Query$SurveyAnalytics$survey$questions$edges$node$answers$edges?> Function(
              Iterable<
                  CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges<
                      Query$SurveyAnalytics$survey$questions$edges$node$answers$edges>?>)
          _fn);
}

class _CopyWithImpl$Query$SurveyAnalytics$survey$questions$edges$node$answers<
        TRes>
    implements
        CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers<
            TRes> {
  _CopyWithImpl$Query$SurveyAnalytics$survey$questions$edges$node$answers(
    this._instance,
    this._then,
  );

  final Query$SurveyAnalytics$survey$questions$edges$node$answers _instance;

  final TRes Function(Query$SurveyAnalytics$survey$questions$edges$node$answers)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$SurveyAnalytics$survey$questions$edges$node$answers(
        edges: edges == _undefined || edges == null
            ? _instance.edges
            : (edges as List<
                Query$SurveyAnalytics$survey$questions$edges$node$answers$edges?>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes edges(
          Iterable<Query$SurveyAnalytics$survey$questions$edges$node$answers$edges?> Function(
                  Iterable<
                      CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges<
                          Query$SurveyAnalytics$survey$questions$edges$node$answers$edges>?>)
              _fn) =>
      call(
          edges: _fn(_instance.edges.map((e) => e == null
              ? null
              : CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges(
                  e,
                  (i) => i,
                ))).toList());
}

class _CopyWithStubImpl$Query$SurveyAnalytics$survey$questions$edges$node$answers<
        TRes>
    implements
        CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers<
            TRes> {
  _CopyWithStubImpl$Query$SurveyAnalytics$survey$questions$edges$node$answers(
      this._res);

  TRes _res;

  call({
    List<Query$SurveyAnalytics$survey$questions$edges$node$answers$edges?>?
        edges,
    String? $__typename,
  }) =>
      _res;

  edges(_fn) => _res;
}

class Query$SurveyAnalytics$survey$questions$edges$node$answers$edges {
  Query$SurveyAnalytics$survey$questions$edges$node$answers$edges({
    this.node,
    this.$__typename = 'SubmissionAnswerNodeEdge',
  });

  factory Query$SurveyAnalytics$survey$questions$edges$node$answers$edges.fromJson(
      Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$SurveyAnalytics$survey$questions$edges$node$answers$edges(
      node: l$node == null
          ? null
          : Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node
              .fromJson((l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node?
      node;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$node = node;
    _resultData['node'] = l$node?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$node = node;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$node,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other
            is! Query$SurveyAnalytics$survey$questions$edges$node$answers$edges ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$node = node;
    final lOther$node = other.node;
    if (l$node != lOther$node) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges
    on Query$SurveyAnalytics$survey$questions$edges$node$answers$edges {
  CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges<
          Query$SurveyAnalytics$survey$questions$edges$node$answers$edges>
      get copyWith =>
          CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges<
    TRes> {
  factory CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges(
    Query$SurveyAnalytics$survey$questions$edges$node$answers$edges instance,
    TRes Function(
            Query$SurveyAnalytics$survey$questions$edges$node$answers$edges)
        then,
  ) = _CopyWithImpl$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges;

  factory CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges.stub(
          TRes res) =
      _CopyWithStubImpl$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges;

  TRes call({
    Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node? node,
    String? $__typename,
  });
  CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node<
      TRes> get node;
}

class _CopyWithImpl$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges<
        TRes>
    implements
        CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges<
            TRes> {
  _CopyWithImpl$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges(
    this._instance,
    this._then,
  );

  final Query$SurveyAnalytics$survey$questions$edges$node$answers$edges
      _instance;

  final TRes Function(
      Query$SurveyAnalytics$survey$questions$edges$node$answers$edges) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$SurveyAnalytics$survey$questions$edges$node$answers$edges(
        node: node == _undefined
            ? _instance.node
            : (node
                as Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node<
      TRes> get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node
            .stub(_then(_instance))
        : CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node(
            local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges<
        TRes>
    implements
        CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges<
            TRes> {
  _CopyWithStubImpl$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges(
      this._res);

  TRes _res;

  call({
    Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node? node,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node<
          TRes>
      get node =>
          CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node
              .stub(_res);
}

class Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node {
  Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node({
    required this.id,
    this.textAnswer,
    required this.selectedOptions,
    this.$__typename = 'SubmissionAnswerNode',
  });

  factory Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$textAnswer = json['textAnswer'];
    final l$selectedOptions = json['selectedOptions'];
    final l$$__typename = json['__typename'];
    return Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node(
      id: (l$id as String),
      textAnswer: (l$textAnswer as String?),
      selectedOptions:
          Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions
              .fromJson((l$selectedOptions as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String? textAnswer;

  final Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions
      selectedOptions;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$textAnswer = textAnswer;
    _resultData['textAnswer'] = l$textAnswer;
    final l$selectedOptions = selectedOptions;
    _resultData['selectedOptions'] = l$selectedOptions.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$textAnswer = textAnswer;
    final l$selectedOptions = selectedOptions;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$textAnswer,
      l$selectedOptions,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other
            is! Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$textAnswer = textAnswer;
    final lOther$textAnswer = other.textAnswer;
    if (l$textAnswer != lOther$textAnswer) {
      return false;
    }
    final l$selectedOptions = selectedOptions;
    final lOther$selectedOptions = other.selectedOptions;
    if (l$selectedOptions != lOther$selectedOptions) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node
    on Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node {
  CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node<
          Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node>
      get copyWith =>
          CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node<
    TRes> {
  factory CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node(
    Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node
        instance,
    TRes Function(
            Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node)
        then,
  ) = _CopyWithImpl$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node;

  factory CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node.stub(
          TRes res) =
      _CopyWithStubImpl$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node;

  TRes call({
    String? id,
    String? textAnswer,
    Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions?
        selectedOptions,
    String? $__typename,
  });
  CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions<
      TRes> get selectedOptions;
}

class _CopyWithImpl$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node<
        TRes>
    implements
        CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node<
            TRes> {
  _CopyWithImpl$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node(
    this._instance,
    this._then,
  );

  final Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node
      _instance;

  final TRes Function(
          Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? textAnswer = _undefined,
    Object? selectedOptions = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        textAnswer: textAnswer == _undefined
            ? _instance.textAnswer
            : (textAnswer as String?),
        selectedOptions: selectedOptions == _undefined ||
                selectedOptions == null
            ? _instance.selectedOptions
            : (selectedOptions
                as Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions<
      TRes> get selectedOptions {
    final local$selectedOptions = _instance.selectedOptions;
    return CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions(
        local$selectedOptions, (e) => call(selectedOptions: e));
  }
}

class _CopyWithStubImpl$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node<
        TRes>
    implements
        CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node<
            TRes> {
  _CopyWithStubImpl$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node(
      this._res);

  TRes _res;

  call({
    String? id,
    String? textAnswer,
    Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions?
        selectedOptions,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions<
          TRes>
      get selectedOptions =>
          CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions
              .stub(_res);
}

class Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions {
  Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions({
    required this.edges,
    this.$__typename = 'QuestionOptionNodeConnection',
  });

  factory Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions.fromJson(
      Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions(
      edges: (l$edges as List<dynamic>)
          .map((e) => e == null
              ? null
              : Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<
          Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges?>
      edges;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$edges = edges;
    _resultData['edges'] = l$edges.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$edges = edges;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$edges.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other
            is! Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$edges = edges;
    final lOther$edges = other.edges;
    if (l$edges.length != lOther$edges.length) {
      return false;
    }
    for (int i = 0; i < l$edges.length; i++) {
      final l$edges$entry = l$edges[i];
      final lOther$edges$entry = lOther$edges[i];
      if (l$edges$entry != lOther$edges$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions
    on Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions {
  CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions<
          Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions>
      get copyWith =>
          CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions<
    TRes> {
  factory CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions(
    Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions
        instance,
    TRes Function(
            Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions)
        then,
  ) = _CopyWithImpl$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions;

  factory CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions.stub(
          TRes res) =
      _CopyWithStubImpl$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions;

  TRes call({
    List<Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges?>?
        edges,
    String? $__typename,
  });
  TRes edges(
      Iterable<Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges?> Function(
              Iterable<
                  CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges<
                      Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges>?>)
          _fn);
}

class _CopyWithImpl$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions<
        TRes>
    implements
        CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions<
            TRes> {
  _CopyWithImpl$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions(
    this._instance,
    this._then,
  );

  final Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions
      _instance;

  final TRes Function(
          Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions(
        edges: edges == _undefined || edges == null
            ? _instance.edges
            : (edges as List<
                Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges?>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes edges(
          Iterable<Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges?> Function(
                  Iterable<
                      CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges<
                          Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges>?>)
              _fn) =>
      call(
          edges: _fn(_instance.edges.map((e) => e == null
              ? null
              : CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges(
                  e,
                  (i) => i,
                ))).toList());
}

class _CopyWithStubImpl$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions<
        TRes>
    implements
        CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions<
            TRes> {
  _CopyWithStubImpl$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions(
      this._res);

  TRes _res;

  call({
    List<Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges?>?
        edges,
    String? $__typename,
  }) =>
      _res;

  edges(_fn) => _res;
}

class Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges {
  Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges({
    this.node,
    this.$__typename = 'QuestionOptionNodeEdge',
  });

  factory Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges.fromJson(
      Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges(
      node: l$node == null
          ? null
          : Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges$node
              .fromJson((l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges$node?
      node;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$node = node;
    _resultData['node'] = l$node?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$node = node;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$node,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other
            is! Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$node = node;
    final lOther$node = other.node;
    if (l$node != lOther$node) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges
    on Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges {
  CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges<
          Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges>
      get copyWith =>
          CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges<
    TRes> {
  factory CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges(
    Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges
        instance,
    TRes Function(
            Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges)
        then,
  ) = _CopyWithImpl$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges;

  factory CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges.stub(
          TRes res) =
      _CopyWithStubImpl$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges;

  TRes call({
    Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges$node?
        node,
    String? $__typename,
  });
  CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges$node<
      TRes> get node;
}

class _CopyWithImpl$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges<
        TRes>
    implements
        CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges<
            TRes> {
  _CopyWithImpl$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges(
    this._instance,
    this._then,
  );

  final Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges
      _instance;

  final TRes Function(
          Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges(
        node: node == _undefined
            ? _instance.node
            : (node
                as Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges$node?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges$node<
      TRes> get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges$node
            .stub(_then(_instance))
        : CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges$node(
            local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges<
        TRes>
    implements
        CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges<
            TRes> {
  _CopyWithStubImpl$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges(
      this._res);

  TRes _res;

  call({
    Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges$node?
        node,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges$node<
          TRes>
      get node =>
          CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges$node
              .stub(_res);
}

class Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges$node {
  Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges$node({
    required this.id,
    required this.text,
    this.$__typename = 'QuestionOptionNode',
  });

  factory Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges$node.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$text = json['text'];
    final l$$__typename = json['__typename'];
    return Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges$node(
      id: (l$id as String),
      text: (l$text as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String text;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$text = text;
    _resultData['text'] = l$text;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$text = text;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$text,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other
            is! Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges$node ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$text = text;
    final lOther$text = other.text;
    if (l$text != lOther$text) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges$node
    on Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges$node {
  CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges$node<
          Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges$node>
      get copyWith =>
          CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges$node(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges$node<
    TRes> {
  factory CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges$node(
    Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges$node
        instance,
    TRes Function(
            Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges$node)
        then,
  ) = _CopyWithImpl$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges$node;

  factory CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges$node.stub(
          TRes res) =
      _CopyWithStubImpl$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges$node;

  TRes call({
    String? id,
    String? text,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges$node<
        TRes>
    implements
        CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges$node<
            TRes> {
  _CopyWithImpl$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges$node(
    this._instance,
    this._then,
  );

  final Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges$node
      _instance;

  final TRes Function(
          Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges$node)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? text = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges$node(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        text: text == _undefined || text == null
            ? _instance.text
            : (text as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges$node<
        TRes>
    implements
        CopyWith$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges$node<
            TRes> {
  _CopyWithStubImpl$Query$SurveyAnalytics$survey$questions$edges$node$answers$edges$node$selectedOptions$edges$node(
      this._res);

  TRes _res;

  call({
    String? id,
    String? text,
    String? $__typename,
  }) =>
      _res;
}

class Query$SurveyAnalytics$survey$submissions {
  Query$SurveyAnalytics$survey$submissions({
    required this.edges,
    this.$__typename = 'SubmissionNodeConnection',
  });

  factory Query$SurveyAnalytics$survey$submissions.fromJson(
      Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Query$SurveyAnalytics$survey$submissions(
      edges: (l$edges as List<dynamic>)
          .map((e) => e == null
              ? null
              : Query$SurveyAnalytics$survey$submissions$edges.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$SurveyAnalytics$survey$submissions$edges?> edges;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$edges = edges;
    _resultData['edges'] = l$edges.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$edges = edges;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$edges.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$SurveyAnalytics$survey$submissions ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$edges = edges;
    final lOther$edges = other.edges;
    if (l$edges.length != lOther$edges.length) {
      return false;
    }
    for (int i = 0; i < l$edges.length; i++) {
      final l$edges$entry = l$edges[i];
      final lOther$edges$entry = lOther$edges[i];
      if (l$edges$entry != lOther$edges$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$SurveyAnalytics$survey$submissions
    on Query$SurveyAnalytics$survey$submissions {
  CopyWith$Query$SurveyAnalytics$survey$submissions<
          Query$SurveyAnalytics$survey$submissions>
      get copyWith => CopyWith$Query$SurveyAnalytics$survey$submissions(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$SurveyAnalytics$survey$submissions<TRes> {
  factory CopyWith$Query$SurveyAnalytics$survey$submissions(
    Query$SurveyAnalytics$survey$submissions instance,
    TRes Function(Query$SurveyAnalytics$survey$submissions) then,
  ) = _CopyWithImpl$Query$SurveyAnalytics$survey$submissions;

  factory CopyWith$Query$SurveyAnalytics$survey$submissions.stub(TRes res) =
      _CopyWithStubImpl$Query$SurveyAnalytics$survey$submissions;

  TRes call({
    List<Query$SurveyAnalytics$survey$submissions$edges?>? edges,
    String? $__typename,
  });
  TRes edges(
      Iterable<Query$SurveyAnalytics$survey$submissions$edges?> Function(
              Iterable<
                  CopyWith$Query$SurveyAnalytics$survey$submissions$edges<
                      Query$SurveyAnalytics$survey$submissions$edges>?>)
          _fn);
}

class _CopyWithImpl$Query$SurveyAnalytics$survey$submissions<TRes>
    implements CopyWith$Query$SurveyAnalytics$survey$submissions<TRes> {
  _CopyWithImpl$Query$SurveyAnalytics$survey$submissions(
    this._instance,
    this._then,
  );

  final Query$SurveyAnalytics$survey$submissions _instance;

  final TRes Function(Query$SurveyAnalytics$survey$submissions) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$SurveyAnalytics$survey$submissions(
        edges: edges == _undefined || edges == null
            ? _instance.edges
            : (edges as List<Query$SurveyAnalytics$survey$submissions$edges?>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes edges(
          Iterable<Query$SurveyAnalytics$survey$submissions$edges?> Function(
                  Iterable<
                      CopyWith$Query$SurveyAnalytics$survey$submissions$edges<
                          Query$SurveyAnalytics$survey$submissions$edges>?>)
              _fn) =>
      call(
          edges: _fn(_instance.edges.map((e) => e == null
              ? null
              : CopyWith$Query$SurveyAnalytics$survey$submissions$edges(
                  e,
                  (i) => i,
                ))).toList());
}

class _CopyWithStubImpl$Query$SurveyAnalytics$survey$submissions<TRes>
    implements CopyWith$Query$SurveyAnalytics$survey$submissions<TRes> {
  _CopyWithStubImpl$Query$SurveyAnalytics$survey$submissions(this._res);

  TRes _res;

  call({
    List<Query$SurveyAnalytics$survey$submissions$edges?>? edges,
    String? $__typename,
  }) =>
      _res;

  edges(_fn) => _res;
}

class Query$SurveyAnalytics$survey$submissions$edges {
  Query$SurveyAnalytics$survey$submissions$edges({
    this.node,
    this.$__typename = 'SubmissionNodeEdge',
  });

  factory Query$SurveyAnalytics$survey$submissions$edges.fromJson(
      Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$SurveyAnalytics$survey$submissions$edges(
      node: l$node == null
          ? null
          : Query$SurveyAnalytics$survey$submissions$edges$node.fromJson(
              (l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$SurveyAnalytics$survey$submissions$edges$node? node;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$node = node;
    _resultData['node'] = l$node?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$node = node;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$node,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$SurveyAnalytics$survey$submissions$edges ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$node = node;
    final lOther$node = other.node;
    if (l$node != lOther$node) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$SurveyAnalytics$survey$submissions$edges
    on Query$SurveyAnalytics$survey$submissions$edges {
  CopyWith$Query$SurveyAnalytics$survey$submissions$edges<
          Query$SurveyAnalytics$survey$submissions$edges>
      get copyWith => CopyWith$Query$SurveyAnalytics$survey$submissions$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$SurveyAnalytics$survey$submissions$edges<TRes> {
  factory CopyWith$Query$SurveyAnalytics$survey$submissions$edges(
    Query$SurveyAnalytics$survey$submissions$edges instance,
    TRes Function(Query$SurveyAnalytics$survey$submissions$edges) then,
  ) = _CopyWithImpl$Query$SurveyAnalytics$survey$submissions$edges;

  factory CopyWith$Query$SurveyAnalytics$survey$submissions$edges.stub(
          TRes res) =
      _CopyWithStubImpl$Query$SurveyAnalytics$survey$submissions$edges;

  TRes call({
    Query$SurveyAnalytics$survey$submissions$edges$node? node,
    String? $__typename,
  });
  CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node<TRes> get node;
}

class _CopyWithImpl$Query$SurveyAnalytics$survey$submissions$edges<TRes>
    implements CopyWith$Query$SurveyAnalytics$survey$submissions$edges<TRes> {
  _CopyWithImpl$Query$SurveyAnalytics$survey$submissions$edges(
    this._instance,
    this._then,
  );

  final Query$SurveyAnalytics$survey$submissions$edges _instance;

  final TRes Function(Query$SurveyAnalytics$survey$submissions$edges) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$SurveyAnalytics$survey$submissions$edges(
        node: node == _undefined
            ? _instance.node
            : (node as Query$SurveyAnalytics$survey$submissions$edges$node?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node<TRes> get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node.stub(
            _then(_instance))
        : CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node(
            local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Query$SurveyAnalytics$survey$submissions$edges<TRes>
    implements CopyWith$Query$SurveyAnalytics$survey$submissions$edges<TRes> {
  _CopyWithStubImpl$Query$SurveyAnalytics$survey$submissions$edges(this._res);

  TRes _res;

  call({
    Query$SurveyAnalytics$survey$submissions$edges$node? node,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node<TRes> get node =>
      CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node.stub(_res);
}

class Query$SurveyAnalytics$survey$submissions$edges$node {
  Query$SurveyAnalytics$survey$submissions$edges$node({
    required this.id,
    required this.submittedAt,
    required this.status,
    this.user,
    required this.answers,
    this.$__typename = 'SubmissionNode',
  });

  factory Query$SurveyAnalytics$survey$submissions$edges$node.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$submittedAt = json['submittedAt'];
    final l$status = json['status'];
    final l$user = json['user'];
    final l$answers = json['answers'];
    final l$$__typename = json['__typename'];
    return Query$SurveyAnalytics$survey$submissions$edges$node(
      id: (l$id as String),
      submittedAt: DateTime.parse((l$submittedAt as String)),
      status: fromJson$Enum$SurveySubmissionStatusChoices((l$status as String)),
      user: l$user == null
          ? null
          : Query$SurveyAnalytics$survey$submissions$edges$node$user.fromJson(
              (l$user as Map<String, dynamic>)),
      answers:
          Query$SurveyAnalytics$survey$submissions$edges$node$answers.fromJson(
              (l$answers as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final DateTime submittedAt;

  final Enum$SurveySubmissionStatusChoices status;

  final Query$SurveyAnalytics$survey$submissions$edges$node$user? user;

  final Query$SurveyAnalytics$survey$submissions$edges$node$answers answers;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$submittedAt = submittedAt;
    _resultData['submittedAt'] = l$submittedAt.toIso8601String();
    final l$status = status;
    _resultData['status'] = toJson$Enum$SurveySubmissionStatusChoices(l$status);
    final l$user = user;
    _resultData['user'] = l$user?.toJson();
    final l$answers = answers;
    _resultData['answers'] = l$answers.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$submittedAt = submittedAt;
    final l$status = status;
    final l$user = user;
    final l$answers = answers;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$submittedAt,
      l$status,
      l$user,
      l$answers,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$SurveyAnalytics$survey$submissions$edges$node ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$submittedAt = submittedAt;
    final lOther$submittedAt = other.submittedAt;
    if (l$submittedAt != lOther$submittedAt) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$user = user;
    final lOther$user = other.user;
    if (l$user != lOther$user) {
      return false;
    }
    final l$answers = answers;
    final lOther$answers = other.answers;
    if (l$answers != lOther$answers) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$SurveyAnalytics$survey$submissions$edges$node
    on Query$SurveyAnalytics$survey$submissions$edges$node {
  CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node<
          Query$SurveyAnalytics$survey$submissions$edges$node>
      get copyWith =>
          CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node<
    TRes> {
  factory CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node(
    Query$SurveyAnalytics$survey$submissions$edges$node instance,
    TRes Function(Query$SurveyAnalytics$survey$submissions$edges$node) then,
  ) = _CopyWithImpl$Query$SurveyAnalytics$survey$submissions$edges$node;

  factory CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node.stub(
          TRes res) =
      _CopyWithStubImpl$Query$SurveyAnalytics$survey$submissions$edges$node;

  TRes call({
    String? id,
    DateTime? submittedAt,
    Enum$SurveySubmissionStatusChoices? status,
    Query$SurveyAnalytics$survey$submissions$edges$node$user? user,
    Query$SurveyAnalytics$survey$submissions$edges$node$answers? answers,
    String? $__typename,
  });
  CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$user<TRes>
      get user;
  CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers<TRes>
      get answers;
}

class _CopyWithImpl$Query$SurveyAnalytics$survey$submissions$edges$node<TRes>
    implements
        CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node<TRes> {
  _CopyWithImpl$Query$SurveyAnalytics$survey$submissions$edges$node(
    this._instance,
    this._then,
  );

  final Query$SurveyAnalytics$survey$submissions$edges$node _instance;

  final TRes Function(Query$SurveyAnalytics$survey$submissions$edges$node)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? submittedAt = _undefined,
    Object? status = _undefined,
    Object? user = _undefined,
    Object? answers = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$SurveyAnalytics$survey$submissions$edges$node(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        submittedAt: submittedAt == _undefined || submittedAt == null
            ? _instance.submittedAt
            : (submittedAt as DateTime),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as Enum$SurveySubmissionStatusChoices),
        user: user == _undefined
            ? _instance.user
            : (user
                as Query$SurveyAnalytics$survey$submissions$edges$node$user?),
        answers: answers == _undefined || answers == null
            ? _instance.answers
            : (answers
                as Query$SurveyAnalytics$survey$submissions$edges$node$answers),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$user<TRes>
      get user {
    final local$user = _instance.user;
    return local$user == null
        ? CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$user
            .stub(_then(_instance))
        : CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$user(
            local$user, (e) => call(user: e));
  }

  CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers<TRes>
      get answers {
    final local$answers = _instance.answers;
    return CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers(
        local$answers, (e) => call(answers: e));
  }
}

class _CopyWithStubImpl$Query$SurveyAnalytics$survey$submissions$edges$node<
        TRes>
    implements
        CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node<TRes> {
  _CopyWithStubImpl$Query$SurveyAnalytics$survey$submissions$edges$node(
      this._res);

  TRes _res;

  call({
    String? id,
    DateTime? submittedAt,
    Enum$SurveySubmissionStatusChoices? status,
    Query$SurveyAnalytics$survey$submissions$edges$node$user? user,
    Query$SurveyAnalytics$survey$submissions$edges$node$answers? answers,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$user<TRes>
      get user =>
          CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$user
              .stub(_res);

  CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers<TRes>
      get answers =>
          CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers
              .stub(_res);
}

class Query$SurveyAnalytics$survey$submissions$edges$node$user {
  Query$SurveyAnalytics$survey$submissions$edges$node$user({
    required this.username,
    this.$__typename = 'UserNode',
  });

  factory Query$SurveyAnalytics$survey$submissions$edges$node$user.fromJson(
      Map<String, dynamic> json) {
    final l$username = json['username'];
    final l$$__typename = json['__typename'];
    return Query$SurveyAnalytics$survey$submissions$edges$node$user(
      username: (l$username as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String username;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$username = username;
    _resultData['username'] = l$username;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$username = username;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$username,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$SurveyAnalytics$survey$submissions$edges$node$user ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$username = username;
    final lOther$username = other.username;
    if (l$username != lOther$username) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$SurveyAnalytics$survey$submissions$edges$node$user
    on Query$SurveyAnalytics$survey$submissions$edges$node$user {
  CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$user<
          Query$SurveyAnalytics$survey$submissions$edges$node$user>
      get copyWith =>
          CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$user<
    TRes> {
  factory CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$user(
    Query$SurveyAnalytics$survey$submissions$edges$node$user instance,
    TRes Function(Query$SurveyAnalytics$survey$submissions$edges$node$user)
        then,
  ) = _CopyWithImpl$Query$SurveyAnalytics$survey$submissions$edges$node$user;

  factory CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$user.stub(
          TRes res) =
      _CopyWithStubImpl$Query$SurveyAnalytics$survey$submissions$edges$node$user;

  TRes call({
    String? username,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$SurveyAnalytics$survey$submissions$edges$node$user<
        TRes>
    implements
        CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$user<
            TRes> {
  _CopyWithImpl$Query$SurveyAnalytics$survey$submissions$edges$node$user(
    this._instance,
    this._then,
  );

  final Query$SurveyAnalytics$survey$submissions$edges$node$user _instance;

  final TRes Function(Query$SurveyAnalytics$survey$submissions$edges$node$user)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? username = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$SurveyAnalytics$survey$submissions$edges$node$user(
        username: username == _undefined || username == null
            ? _instance.username
            : (username as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$SurveyAnalytics$survey$submissions$edges$node$user<
        TRes>
    implements
        CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$user<
            TRes> {
  _CopyWithStubImpl$Query$SurveyAnalytics$survey$submissions$edges$node$user(
      this._res);

  TRes _res;

  call({
    String? username,
    String? $__typename,
  }) =>
      _res;
}

class Query$SurveyAnalytics$survey$submissions$edges$node$answers {
  Query$SurveyAnalytics$survey$submissions$edges$node$answers({
    required this.edges,
    this.$__typename = 'SubmissionAnswerNodeConnection',
  });

  factory Query$SurveyAnalytics$survey$submissions$edges$node$answers.fromJson(
      Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Query$SurveyAnalytics$survey$submissions$edges$node$answers(
      edges: (l$edges as List<dynamic>)
          .map((e) => e == null
              ? null
              : Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges?>
      edges;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$edges = edges;
    _resultData['edges'] = l$edges.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$edges = edges;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$edges.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$SurveyAnalytics$survey$submissions$edges$node$answers ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$edges = edges;
    final lOther$edges = other.edges;
    if (l$edges.length != lOther$edges.length) {
      return false;
    }
    for (int i = 0; i < l$edges.length; i++) {
      final l$edges$entry = l$edges[i];
      final lOther$edges$entry = lOther$edges[i];
      if (l$edges$entry != lOther$edges$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$SurveyAnalytics$survey$submissions$edges$node$answers
    on Query$SurveyAnalytics$survey$submissions$edges$node$answers {
  CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers<
          Query$SurveyAnalytics$survey$submissions$edges$node$answers>
      get copyWith =>
          CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers<
    TRes> {
  factory CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers(
    Query$SurveyAnalytics$survey$submissions$edges$node$answers instance,
    TRes Function(Query$SurveyAnalytics$survey$submissions$edges$node$answers)
        then,
  ) = _CopyWithImpl$Query$SurveyAnalytics$survey$submissions$edges$node$answers;

  factory CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers.stub(
          TRes res) =
      _CopyWithStubImpl$Query$SurveyAnalytics$survey$submissions$edges$node$answers;

  TRes call({
    List<Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges?>?
        edges,
    String? $__typename,
  });
  TRes edges(
      Iterable<Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges?> Function(
              Iterable<
                  CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges<
                      Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges>?>)
          _fn);
}

class _CopyWithImpl$Query$SurveyAnalytics$survey$submissions$edges$node$answers<
        TRes>
    implements
        CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers<
            TRes> {
  _CopyWithImpl$Query$SurveyAnalytics$survey$submissions$edges$node$answers(
    this._instance,
    this._then,
  );

  final Query$SurveyAnalytics$survey$submissions$edges$node$answers _instance;

  final TRes Function(
      Query$SurveyAnalytics$survey$submissions$edges$node$answers) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$SurveyAnalytics$survey$submissions$edges$node$answers(
        edges: edges == _undefined || edges == null
            ? _instance.edges
            : (edges as List<
                Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges?>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes edges(
          Iterable<Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges?> Function(
                  Iterable<
                      CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges<
                          Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges>?>)
              _fn) =>
      call(
          edges: _fn(_instance.edges.map((e) => e == null
              ? null
              : CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges(
                  e,
                  (i) => i,
                ))).toList());
}

class _CopyWithStubImpl$Query$SurveyAnalytics$survey$submissions$edges$node$answers<
        TRes>
    implements
        CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers<
            TRes> {
  _CopyWithStubImpl$Query$SurveyAnalytics$survey$submissions$edges$node$answers(
      this._res);

  TRes _res;

  call({
    List<Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges?>?
        edges,
    String? $__typename,
  }) =>
      _res;

  edges(_fn) => _res;
}

class Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges {
  Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges({
    this.node,
    this.$__typename = 'SubmissionAnswerNodeEdge',
  });

  factory Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges.fromJson(
      Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges(
      node: l$node == null
          ? null
          : Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node
              .fromJson((l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node?
      node;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$node = node;
    _resultData['node'] = l$node?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$node = node;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$node,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other
            is! Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$node = node;
    final lOther$node = other.node;
    if (l$node != lOther$node) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges
    on Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges {
  CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges<
          Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges>
      get copyWith =>
          CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges<
    TRes> {
  factory CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges(
    Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges instance,
    TRes Function(
            Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges)
        then,
  ) = _CopyWithImpl$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges;

  factory CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges.stub(
          TRes res) =
      _CopyWithStubImpl$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges;

  TRes call({
    Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node?
        node,
    String? $__typename,
  });
  CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node<
      TRes> get node;
}

class _CopyWithImpl$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges<
        TRes>
    implements
        CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges<
            TRes> {
  _CopyWithImpl$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges(
    this._instance,
    this._then,
  );

  final Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges
      _instance;

  final TRes Function(
      Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges(
        node: node == _undefined
            ? _instance.node
            : (node
                as Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node<
      TRes> get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node
            .stub(_then(_instance))
        : CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node(
            local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges<
        TRes>
    implements
        CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges<
            TRes> {
  _CopyWithStubImpl$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges(
      this._res);

  TRes _res;

  call({
    Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node?
        node,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node<
          TRes>
      get node =>
          CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node
              .stub(_res);
}

class Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node {
  Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node({
    required this.id,
    required this.question,
    this.textAnswer,
    required this.selectedOptions,
    this.$__typename = 'SubmissionAnswerNode',
  });

  factory Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$question = json['question'];
    final l$textAnswer = json['textAnswer'];
    final l$selectedOptions = json['selectedOptions'];
    final l$$__typename = json['__typename'];
    return Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node(
      id: (l$id as String),
      question:
          Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$question
              .fromJson((l$question as Map<String, dynamic>)),
      textAnswer: (l$textAnswer as String?),
      selectedOptions:
          Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions
              .fromJson((l$selectedOptions as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$question
      question;

  final String? textAnswer;

  final Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions
      selectedOptions;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$question = question;
    _resultData['question'] = l$question.toJson();
    final l$textAnswer = textAnswer;
    _resultData['textAnswer'] = l$textAnswer;
    final l$selectedOptions = selectedOptions;
    _resultData['selectedOptions'] = l$selectedOptions.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$question = question;
    final l$textAnswer = textAnswer;
    final l$selectedOptions = selectedOptions;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$question,
      l$textAnswer,
      l$selectedOptions,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other
            is! Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$question = question;
    final lOther$question = other.question;
    if (l$question != lOther$question) {
      return false;
    }
    final l$textAnswer = textAnswer;
    final lOther$textAnswer = other.textAnswer;
    if (l$textAnswer != lOther$textAnswer) {
      return false;
    }
    final l$selectedOptions = selectedOptions;
    final lOther$selectedOptions = other.selectedOptions;
    if (l$selectedOptions != lOther$selectedOptions) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node
    on Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node {
  CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node<
          Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node>
      get copyWith =>
          CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node<
    TRes> {
  factory CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node(
    Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node
        instance,
    TRes Function(
            Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node)
        then,
  ) = _CopyWithImpl$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node;

  factory CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node.stub(
          TRes res) =
      _CopyWithStubImpl$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node;

  TRes call({
    String? id,
    Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$question?
        question,
    String? textAnswer,
    Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions?
        selectedOptions,
    String? $__typename,
  });
  CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$question<
      TRes> get question;
  CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions<
      TRes> get selectedOptions;
}

class _CopyWithImpl$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node<
        TRes>
    implements
        CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node<
            TRes> {
  _CopyWithImpl$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node(
    this._instance,
    this._then,
  );

  final Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node
      _instance;

  final TRes Function(
          Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? question = _undefined,
    Object? textAnswer = _undefined,
    Object? selectedOptions = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        question: question == _undefined || question == null
            ? _instance.question
            : (question
                as Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$question),
        textAnswer: textAnswer == _undefined
            ? _instance.textAnswer
            : (textAnswer as String?),
        selectedOptions: selectedOptions == _undefined ||
                selectedOptions == null
            ? _instance.selectedOptions
            : (selectedOptions
                as Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$question<
      TRes> get question {
    final local$question = _instance.question;
    return CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$question(
        local$question, (e) => call(question: e));
  }

  CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions<
      TRes> get selectedOptions {
    final local$selectedOptions = _instance.selectedOptions;
    return CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions(
        local$selectedOptions, (e) => call(selectedOptions: e));
  }
}

class _CopyWithStubImpl$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node<
        TRes>
    implements
        CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node<
            TRes> {
  _CopyWithStubImpl$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node(
      this._res);

  TRes _res;

  call({
    String? id,
    Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$question?
        question,
    String? textAnswer,
    Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions?
        selectedOptions,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$question<
          TRes>
      get question =>
          CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$question
              .stub(_res);

  CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions<
          TRes>
      get selectedOptions =>
          CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions
              .stub(_res);
}

class Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$question {
  Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$question({
    required this.id,
    required this.text,
    required this.questionType,
    this.$__typename = 'QuestionNode',
  });

  factory Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$question.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$text = json['text'];
    final l$questionType = json['questionType'];
    final l$$__typename = json['__typename'];
    return Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$question(
      id: (l$id as String),
      text: (l$text as String),
      questionType: fromJson$Enum$SurveyQuestionQuestionTypeChoices(
          (l$questionType as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String text;

  final Enum$SurveyQuestionQuestionTypeChoices questionType;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$text = text;
    _resultData['text'] = l$text;
    final l$questionType = questionType;
    _resultData['questionType'] =
        toJson$Enum$SurveyQuestionQuestionTypeChoices(l$questionType);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$text = text;
    final l$questionType = questionType;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$text,
      l$questionType,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other
            is! Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$question ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$text = text;
    final lOther$text = other.text;
    if (l$text != lOther$text) {
      return false;
    }
    final l$questionType = questionType;
    final lOther$questionType = other.questionType;
    if (l$questionType != lOther$questionType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$question
    on Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$question {
  CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$question<
          Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$question>
      get copyWith =>
          CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$question(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$question<
    TRes> {
  factory CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$question(
    Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$question
        instance,
    TRes Function(
            Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$question)
        then,
  ) = _CopyWithImpl$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$question;

  factory CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$question.stub(
          TRes res) =
      _CopyWithStubImpl$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$question;

  TRes call({
    String? id,
    String? text,
    Enum$SurveyQuestionQuestionTypeChoices? questionType,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$question<
        TRes>
    implements
        CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$question<
            TRes> {
  _CopyWithImpl$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$question(
    this._instance,
    this._then,
  );

  final Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$question
      _instance;

  final TRes Function(
          Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$question)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? text = _undefined,
    Object? questionType = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$question(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        text: text == _undefined || text == null
            ? _instance.text
            : (text as String),
        questionType: questionType == _undefined || questionType == null
            ? _instance.questionType
            : (questionType as Enum$SurveyQuestionQuestionTypeChoices),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$question<
        TRes>
    implements
        CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$question<
            TRes> {
  _CopyWithStubImpl$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$question(
      this._res);

  TRes _res;

  call({
    String? id,
    String? text,
    Enum$SurveyQuestionQuestionTypeChoices? questionType,
    String? $__typename,
  }) =>
      _res;
}

class Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions {
  Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions({
    required this.edges,
    this.$__typename = 'QuestionOptionNodeConnection',
  });

  factory Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions.fromJson(
      Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions(
      edges: (l$edges as List<dynamic>)
          .map((e) => e == null
              ? null
              : Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<
          Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges?>
      edges;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$edges = edges;
    _resultData['edges'] = l$edges.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$edges = edges;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$edges.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other
            is! Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$edges = edges;
    final lOther$edges = other.edges;
    if (l$edges.length != lOther$edges.length) {
      return false;
    }
    for (int i = 0; i < l$edges.length; i++) {
      final l$edges$entry = l$edges[i];
      final lOther$edges$entry = lOther$edges[i];
      if (l$edges$entry != lOther$edges$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions
    on Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions {
  CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions<
          Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions>
      get copyWith =>
          CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions<
    TRes> {
  factory CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions(
    Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions
        instance,
    TRes Function(
            Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions)
        then,
  ) = _CopyWithImpl$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions;

  factory CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions.stub(
          TRes res) =
      _CopyWithStubImpl$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions;

  TRes call({
    List<Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges?>?
        edges,
    String? $__typename,
  });
  TRes edges(
      Iterable<Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges?> Function(
              Iterable<
                  CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges<
                      Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges>?>)
          _fn);
}

class _CopyWithImpl$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions<
        TRes>
    implements
        CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions<
            TRes> {
  _CopyWithImpl$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions(
    this._instance,
    this._then,
  );

  final Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions
      _instance;

  final TRes Function(
          Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions(
        edges: edges == _undefined || edges == null
            ? _instance.edges
            : (edges as List<
                Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges?>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes edges(
          Iterable<Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges?> Function(
                  Iterable<
                      CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges<
                          Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges>?>)
              _fn) =>
      call(
          edges: _fn(_instance.edges.map((e) => e == null
              ? null
              : CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges(
                  e,
                  (i) => i,
                ))).toList());
}

class _CopyWithStubImpl$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions<
        TRes>
    implements
        CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions<
            TRes> {
  _CopyWithStubImpl$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions(
      this._res);

  TRes _res;

  call({
    List<Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges?>?
        edges,
    String? $__typename,
  }) =>
      _res;

  edges(_fn) => _res;
}

class Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges {
  Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges({
    this.node,
    this.$__typename = 'QuestionOptionNodeEdge',
  });

  factory Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges.fromJson(
      Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges(
      node: l$node == null
          ? null
          : Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges$node
              .fromJson((l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges$node?
      node;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$node = node;
    _resultData['node'] = l$node?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$node = node;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$node,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other
            is! Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$node = node;
    final lOther$node = other.node;
    if (l$node != lOther$node) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges
    on Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges {
  CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges<
          Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges>
      get copyWith =>
          CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges<
    TRes> {
  factory CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges(
    Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges
        instance,
    TRes Function(
            Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges)
        then,
  ) = _CopyWithImpl$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges;

  factory CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges.stub(
          TRes res) =
      _CopyWithStubImpl$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges;

  TRes call({
    Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges$node?
        node,
    String? $__typename,
  });
  CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges$node<
      TRes> get node;
}

class _CopyWithImpl$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges<
        TRes>
    implements
        CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges<
            TRes> {
  _CopyWithImpl$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges(
    this._instance,
    this._then,
  );

  final Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges
      _instance;

  final TRes Function(
          Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges(
        node: node == _undefined
            ? _instance.node
            : (node
                as Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges$node?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges$node<
      TRes> get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges$node
            .stub(_then(_instance))
        : CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges$node(
            local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges<
        TRes>
    implements
        CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges<
            TRes> {
  _CopyWithStubImpl$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges(
      this._res);

  TRes _res;

  call({
    Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges$node?
        node,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges$node<
          TRes>
      get node =>
          CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges$node
              .stub(_res);
}

class Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges$node {
  Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges$node({
    required this.id,
    required this.text,
    this.$__typename = 'QuestionOptionNode',
  });

  factory Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges$node.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$text = json['text'];
    final l$$__typename = json['__typename'];
    return Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges$node(
      id: (l$id as String),
      text: (l$text as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String text;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$text = text;
    _resultData['text'] = l$text;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$text = text;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$text,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other
            is! Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges$node ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$text = text;
    final lOther$text = other.text;
    if (l$text != lOther$text) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges$node
    on Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges$node {
  CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges$node<
          Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges$node>
      get copyWith =>
          CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges$node(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges$node<
    TRes> {
  factory CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges$node(
    Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges$node
        instance,
    TRes Function(
            Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges$node)
        then,
  ) = _CopyWithImpl$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges$node;

  factory CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges$node.stub(
          TRes res) =
      _CopyWithStubImpl$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges$node;

  TRes call({
    String? id,
    String? text,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges$node<
        TRes>
    implements
        CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges$node<
            TRes> {
  _CopyWithImpl$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges$node(
    this._instance,
    this._then,
  );

  final Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges$node
      _instance;

  final TRes Function(
          Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges$node)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? text = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges$node(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        text: text == _undefined || text == null
            ? _instance.text
            : (text as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges$node<
        TRes>
    implements
        CopyWith$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges$node<
            TRes> {
  _CopyWithStubImpl$Query$SurveyAnalytics$survey$submissions$edges$node$answers$edges$node$selectedOptions$edges$node(
      this._res);

  TRes _res;

  call({
    String? id,
    String? text,
    String? $__typename,
  }) =>
      _res;
}
