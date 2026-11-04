import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Query$SubmissionStatistics {
  Query$SubmissionStatistics({
    this.submissionStatistics,
    this.$__typename = 'Query',
  });

  factory Query$SubmissionStatistics.fromJson(Map<String, dynamic> json) {
    final l$submissionStatistics = json['submissionStatistics'];
    final l$$__typename = json['__typename'];
    return Query$SubmissionStatistics(
      submissionStatistics: l$submissionStatistics == null
          ? null
          : Query$SubmissionStatistics$submissionStatistics.fromJson(
              (l$submissionStatistics as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$SubmissionStatistics$submissionStatistics? submissionStatistics;

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
    if (other is! Query$SubmissionStatistics ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$SubmissionStatistics
    on Query$SubmissionStatistics {
  CopyWith$Query$SubmissionStatistics<Query$SubmissionStatistics>
      get copyWith => CopyWith$Query$SubmissionStatistics(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$SubmissionStatistics<TRes> {
  factory CopyWith$Query$SubmissionStatistics(
    Query$SubmissionStatistics instance,
    TRes Function(Query$SubmissionStatistics) then,
  ) = _CopyWithImpl$Query$SubmissionStatistics;

  factory CopyWith$Query$SubmissionStatistics.stub(TRes res) =
      _CopyWithStubImpl$Query$SubmissionStatistics;

  TRes call({
    Query$SubmissionStatistics$submissionStatistics? submissionStatistics,
    String? $__typename,
  });
  CopyWith$Query$SubmissionStatistics$submissionStatistics<TRes>
      get submissionStatistics;
}

class _CopyWithImpl$Query$SubmissionStatistics<TRes>
    implements CopyWith$Query$SubmissionStatistics<TRes> {
  _CopyWithImpl$Query$SubmissionStatistics(
    this._instance,
    this._then,
  );

  final Query$SubmissionStatistics _instance;

  final TRes Function(Query$SubmissionStatistics) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? submissionStatistics = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$SubmissionStatistics(
        submissionStatistics: submissionStatistics == _undefined
            ? _instance.submissionStatistics
            : (submissionStatistics
                as Query$SubmissionStatistics$submissionStatistics?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$SubmissionStatistics$submissionStatistics<TRes>
      get submissionStatistics {
    final local$submissionStatistics = _instance.submissionStatistics;
    return local$submissionStatistics == null
        ? CopyWith$Query$SubmissionStatistics$submissionStatistics.stub(
            _then(_instance))
        : CopyWith$Query$SubmissionStatistics$submissionStatistics(
            local$submissionStatistics, (e) => call(submissionStatistics: e));
  }
}

class _CopyWithStubImpl$Query$SubmissionStatistics<TRes>
    implements CopyWith$Query$SubmissionStatistics<TRes> {
  _CopyWithStubImpl$Query$SubmissionStatistics(this._res);

  TRes _res;

  call({
    Query$SubmissionStatistics$submissionStatistics? submissionStatistics,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$SubmissionStatistics$submissionStatistics<TRes>
      get submissionStatistics =>
          CopyWith$Query$SubmissionStatistics$submissionStatistics.stub(_res);
}

const documentNodeQuerySubmissionStatistics = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'SubmissionStatistics'),
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
Query$SubmissionStatistics _parserFn$Query$SubmissionStatistics(
        Map<String, dynamic> data) =>
    Query$SubmissionStatistics.fromJson(data);
typedef OnQueryComplete$Query$SubmissionStatistics = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$SubmissionStatistics?,
);

class Options$Query$SubmissionStatistics
    extends graphql.QueryOptions<Query$SubmissionStatistics> {
  Options$Query$SubmissionStatistics({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$SubmissionStatistics? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$SubmissionStatistics? onComplete,
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
                        : _parserFn$Query$SubmissionStatistics(data),
                  ),
          onError: onError,
          document: documentNodeQuerySubmissionStatistics,
          parserFn: _parserFn$Query$SubmissionStatistics,
        );

  final OnQueryComplete$Query$SubmissionStatistics? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$SubmissionStatistics
    extends graphql.WatchQueryOptions<Query$SubmissionStatistics> {
  WatchOptions$Query$SubmissionStatistics({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$SubmissionStatistics? typedOptimisticResult,
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
          document: documentNodeQuerySubmissionStatistics,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$SubmissionStatistics,
        );
}

class FetchMoreOptions$Query$SubmissionStatistics
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$SubmissionStatistics(
      {required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQuerySubmissionStatistics,
        );
}

extension ClientExtension$Query$SubmissionStatistics on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$SubmissionStatistics>>
      query$SubmissionStatistics(
              [Options$Query$SubmissionStatistics? options]) async =>
          await this.query(options ?? Options$Query$SubmissionStatistics());
  graphql.ObservableQuery<Query$SubmissionStatistics>
      watchQuery$SubmissionStatistics(
              [WatchOptions$Query$SubmissionStatistics? options]) =>
          this.watchQuery(options ?? WatchOptions$Query$SubmissionStatistics());
  void writeQuery$SubmissionStatistics({
    required Query$SubmissionStatistics data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation: graphql.Operation(
                document: documentNodeQuerySubmissionStatistics)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$SubmissionStatistics? readQuery$SubmissionStatistics(
      {bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerySubmissionStatistics)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$SubmissionStatistics.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$SubmissionStatistics>
    useQuery$SubmissionStatistics(
            [Options$Query$SubmissionStatistics? options]) =>
        graphql_flutter
            .useQuery(options ?? Options$Query$SubmissionStatistics());
graphql.ObservableQuery<Query$SubmissionStatistics>
    useWatchQuery$SubmissionStatistics(
            [WatchOptions$Query$SubmissionStatistics? options]) =>
        graphql_flutter.useWatchQuery(
            options ?? WatchOptions$Query$SubmissionStatistics());

class Query$SubmissionStatistics$Widget
    extends graphql_flutter.Query<Query$SubmissionStatistics> {
  Query$SubmissionStatistics$Widget({
    widgets.Key? key,
    Options$Query$SubmissionStatistics? options,
    required graphql_flutter.QueryBuilder<Query$SubmissionStatistics> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$SubmissionStatistics(),
          builder: builder,
        );
}

class Query$SubmissionStatistics$submissionStatistics {
  Query$SubmissionStatistics$submissionStatistics({
    this.totalCount,
    this.completedCount,
    this.pendingCount,
    this.draftCount,
    this.$__typename = 'SubmissionStatsType',
  });

  factory Query$SubmissionStatistics$submissionStatistics.fromJson(
      Map<String, dynamic> json) {
    final l$totalCount = json['totalCount'];
    final l$completedCount = json['completedCount'];
    final l$pendingCount = json['pendingCount'];
    final l$draftCount = json['draftCount'];
    final l$$__typename = json['__typename'];
    return Query$SubmissionStatistics$submissionStatistics(
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
    if (other is! Query$SubmissionStatistics$submissionStatistics ||
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

extension UtilityExtension$Query$SubmissionStatistics$submissionStatistics
    on Query$SubmissionStatistics$submissionStatistics {
  CopyWith$Query$SubmissionStatistics$submissionStatistics<
          Query$SubmissionStatistics$submissionStatistics>
      get copyWith => CopyWith$Query$SubmissionStatistics$submissionStatistics(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$SubmissionStatistics$submissionStatistics<TRes> {
  factory CopyWith$Query$SubmissionStatistics$submissionStatistics(
    Query$SubmissionStatistics$submissionStatistics instance,
    TRes Function(Query$SubmissionStatistics$submissionStatistics) then,
  ) = _CopyWithImpl$Query$SubmissionStatistics$submissionStatistics;

  factory CopyWith$Query$SubmissionStatistics$submissionStatistics.stub(
          TRes res) =
      _CopyWithStubImpl$Query$SubmissionStatistics$submissionStatistics;

  TRes call({
    int? totalCount,
    int? completedCount,
    int? pendingCount,
    int? draftCount,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$SubmissionStatistics$submissionStatistics<TRes>
    implements CopyWith$Query$SubmissionStatistics$submissionStatistics<TRes> {
  _CopyWithImpl$Query$SubmissionStatistics$submissionStatistics(
    this._instance,
    this._then,
  );

  final Query$SubmissionStatistics$submissionStatistics _instance;

  final TRes Function(Query$SubmissionStatistics$submissionStatistics) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? totalCount = _undefined,
    Object? completedCount = _undefined,
    Object? pendingCount = _undefined,
    Object? draftCount = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$SubmissionStatistics$submissionStatistics(
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

class _CopyWithStubImpl$Query$SubmissionStatistics$submissionStatistics<TRes>
    implements CopyWith$Query$SubmissionStatistics$submissionStatistics<TRes> {
  _CopyWithStubImpl$Query$SubmissionStatistics$submissionStatistics(this._res);

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
