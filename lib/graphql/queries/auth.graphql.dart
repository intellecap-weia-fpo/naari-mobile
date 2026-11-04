import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Mutation$SignIn {
  factory Variables$Mutation$SignIn({
    required String username,
    required String password,
  }) =>
      Variables$Mutation$SignIn._({
        r'username': username,
        r'password': password,
      });

  Variables$Mutation$SignIn._(this._$data);

  factory Variables$Mutation$SignIn.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$username = data['username'];
    result$data['username'] = (l$username as String);
    final l$password = data['password'];
    result$data['password'] = (l$password as String);
    return Variables$Mutation$SignIn._(result$data);
  }

  Map<String, dynamic> _$data;

  String get username => (_$data['username'] as String);

  String get password => (_$data['password'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$username = username;
    result$data['username'] = l$username;
    final l$password = password;
    result$data['password'] = l$password;
    return result$data;
  }

  CopyWith$Variables$Mutation$SignIn<Variables$Mutation$SignIn> get copyWith =>
      CopyWith$Variables$Mutation$SignIn(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$SignIn ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$username = username;
    final lOther$username = other.username;
    if (l$username != lOther$username) {
      return false;
    }
    final l$password = password;
    final lOther$password = other.password;
    if (l$password != lOther$password) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$username = username;
    final l$password = password;
    return Object.hashAll([
      l$username,
      l$password,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$SignIn<TRes> {
  factory CopyWith$Variables$Mutation$SignIn(
    Variables$Mutation$SignIn instance,
    TRes Function(Variables$Mutation$SignIn) then,
  ) = _CopyWithImpl$Variables$Mutation$SignIn;

  factory CopyWith$Variables$Mutation$SignIn.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$SignIn;

  TRes call({
    String? username,
    String? password,
  });
}

class _CopyWithImpl$Variables$Mutation$SignIn<TRes>
    implements CopyWith$Variables$Mutation$SignIn<TRes> {
  _CopyWithImpl$Variables$Mutation$SignIn(
    this._instance,
    this._then,
  );

  final Variables$Mutation$SignIn _instance;

  final TRes Function(Variables$Mutation$SignIn) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? username = _undefined,
    Object? password = _undefined,
  }) =>
      _then(Variables$Mutation$SignIn._({
        ..._instance._$data,
        if (username != _undefined && username != null)
          'username': (username as String),
        if (password != _undefined && password != null)
          'password': (password as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$SignIn<TRes>
    implements CopyWith$Variables$Mutation$SignIn<TRes> {
  _CopyWithStubImpl$Variables$Mutation$SignIn(this._res);

  TRes _res;

  call({
    String? username,
    String? password,
  }) =>
      _res;
}

class Mutation$SignIn {
  Mutation$SignIn({
    this.signIn,
    this.$__typename = 'Mutation',
  });

  factory Mutation$SignIn.fromJson(Map<String, dynamic> json) {
    final l$signIn = json['signIn'];
    final l$$__typename = json['__typename'];
    return Mutation$SignIn(
      signIn: l$signIn == null
          ? null
          : Mutation$SignIn$signIn.fromJson((l$signIn as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$SignIn$signIn? signIn;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$signIn = signIn;
    _resultData['signIn'] = l$signIn?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$signIn = signIn;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$signIn,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$SignIn || runtimeType != other.runtimeType) {
      return false;
    }
    final l$signIn = signIn;
    final lOther$signIn = other.signIn;
    if (l$signIn != lOther$signIn) {
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

extension UtilityExtension$Mutation$SignIn on Mutation$SignIn {
  CopyWith$Mutation$SignIn<Mutation$SignIn> get copyWith =>
      CopyWith$Mutation$SignIn(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$SignIn<TRes> {
  factory CopyWith$Mutation$SignIn(
    Mutation$SignIn instance,
    TRes Function(Mutation$SignIn) then,
  ) = _CopyWithImpl$Mutation$SignIn;

  factory CopyWith$Mutation$SignIn.stub(TRes res) =
      _CopyWithStubImpl$Mutation$SignIn;

  TRes call({
    Mutation$SignIn$signIn? signIn,
    String? $__typename,
  });
  CopyWith$Mutation$SignIn$signIn<TRes> get signIn;
}

class _CopyWithImpl$Mutation$SignIn<TRes>
    implements CopyWith$Mutation$SignIn<TRes> {
  _CopyWithImpl$Mutation$SignIn(
    this._instance,
    this._then,
  );

  final Mutation$SignIn _instance;

  final TRes Function(Mutation$SignIn) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? signIn = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$SignIn(
        signIn: signIn == _undefined
            ? _instance.signIn
            : (signIn as Mutation$SignIn$signIn?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$SignIn$signIn<TRes> get signIn {
    final local$signIn = _instance.signIn;
    return local$signIn == null
        ? CopyWith$Mutation$SignIn$signIn.stub(_then(_instance))
        : CopyWith$Mutation$SignIn$signIn(local$signIn, (e) => call(signIn: e));
  }
}

class _CopyWithStubImpl$Mutation$SignIn<TRes>
    implements CopyWith$Mutation$SignIn<TRes> {
  _CopyWithStubImpl$Mutation$SignIn(this._res);

  TRes _res;

  call({
    Mutation$SignIn$signIn? signIn,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$SignIn$signIn<TRes> get signIn =>
      CopyWith$Mutation$SignIn$signIn.stub(_res);
}

const documentNodeMutationSignIn = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'SignIn'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'username')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'password')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'signIn'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'username'),
            value: VariableNode(name: NameNode(value: 'username')),
          ),
          ArgumentNode(
            name: NameNode(value: 'password'),
            value: VariableNode(name: NameNode(value: 'password')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'token'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'refreshToken'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'payload'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'refreshExpiresIn'),
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
Mutation$SignIn _parserFn$Mutation$SignIn(Map<String, dynamic> data) =>
    Mutation$SignIn.fromJson(data);
typedef OnMutationCompleted$Mutation$SignIn = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$SignIn?,
);

class Options$Mutation$SignIn extends graphql.MutationOptions<Mutation$SignIn> {
  Options$Mutation$SignIn({
    String? operationName,
    required Variables$Mutation$SignIn variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SignIn? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$SignIn? onCompleted,
    graphql.OnMutationUpdate<Mutation$SignIn>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFn$Mutation$SignIn(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationSignIn,
          parserFn: _parserFn$Mutation$SignIn,
        );

  final OnMutationCompleted$Mutation$SignIn? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$SignIn
    extends graphql.WatchQueryOptions<Mutation$SignIn> {
  WatchOptions$Mutation$SignIn({
    String? operationName,
    required Variables$Mutation$SignIn variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SignIn? typedOptimisticResult,
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
          document: documentNodeMutationSignIn,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$SignIn,
        );
}

extension ClientExtension$Mutation$SignIn on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$SignIn>> mutate$SignIn(
          Options$Mutation$SignIn options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$SignIn> watchMutation$SignIn(
          WatchOptions$Mutation$SignIn options) =>
      this.watchMutation(options);
}

class Mutation$SignIn$HookResult {
  Mutation$SignIn$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$SignIn runMutation;

  final graphql.QueryResult<Mutation$SignIn> result;
}

Mutation$SignIn$HookResult useMutation$SignIn(
    [WidgetOptions$Mutation$SignIn? options]) {
  final result =
      graphql_flutter.useMutation(options ?? WidgetOptions$Mutation$SignIn());
  return Mutation$SignIn$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$SignIn> useWatchMutation$SignIn(
        WatchOptions$Mutation$SignIn options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$SignIn
    extends graphql.MutationOptions<Mutation$SignIn> {
  WidgetOptions$Mutation$SignIn({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SignIn? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$SignIn? onCompleted,
    graphql.OnMutationUpdate<Mutation$SignIn>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFn$Mutation$SignIn(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationSignIn,
          parserFn: _parserFn$Mutation$SignIn,
        );

  final OnMutationCompleted$Mutation$SignIn? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$SignIn = graphql.MultiSourceResult<Mutation$SignIn>
    Function(
  Variables$Mutation$SignIn, {
  Object? optimisticResult,
  Mutation$SignIn? typedOptimisticResult,
});
typedef Builder$Mutation$SignIn = widgets.Widget Function(
  RunMutation$Mutation$SignIn,
  graphql.QueryResult<Mutation$SignIn>?,
);

class Mutation$SignIn$Widget extends graphql_flutter.Mutation<Mutation$SignIn> {
  Mutation$SignIn$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$SignIn? options,
    required Builder$Mutation$SignIn builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$SignIn(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$SignIn$signIn {
  Mutation$SignIn$signIn({
    required this.token,
    required this.refreshToken,
    required this.payload,
    required this.refreshExpiresIn,
    this.$__typename = 'CustomObtainJSONWebToken',
  });

  factory Mutation$SignIn$signIn.fromJson(Map<String, dynamic> json) {
    final l$token = json['token'];
    final l$refreshToken = json['refreshToken'];
    final l$payload = json['payload'];
    final l$refreshExpiresIn = json['refreshExpiresIn'];
    final l$$__typename = json['__typename'];
    return Mutation$SignIn$signIn(
      token: (l$token as String),
      refreshToken: (l$refreshToken as String),
      payload: (l$payload as dynamic),
      refreshExpiresIn: (l$refreshExpiresIn as int),
      $__typename: (l$$__typename as String),
    );
  }

  final String token;

  final String refreshToken;

  final dynamic payload;

  final int refreshExpiresIn;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$token = token;
    _resultData['token'] = l$token;
    final l$refreshToken = refreshToken;
    _resultData['refreshToken'] = l$refreshToken;
    final l$payload = payload;
    _resultData['payload'] = l$payload;
    final l$refreshExpiresIn = refreshExpiresIn;
    _resultData['refreshExpiresIn'] = l$refreshExpiresIn;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$token = token;
    final l$refreshToken = refreshToken;
    final l$payload = payload;
    final l$refreshExpiresIn = refreshExpiresIn;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$token,
      l$refreshToken,
      l$payload,
      l$refreshExpiresIn,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$SignIn$signIn || runtimeType != other.runtimeType) {
      return false;
    }
    final l$token = token;
    final lOther$token = other.token;
    if (l$token != lOther$token) {
      return false;
    }
    final l$refreshToken = refreshToken;
    final lOther$refreshToken = other.refreshToken;
    if (l$refreshToken != lOther$refreshToken) {
      return false;
    }
    final l$payload = payload;
    final lOther$payload = other.payload;
    if (l$payload != lOther$payload) {
      return false;
    }
    final l$refreshExpiresIn = refreshExpiresIn;
    final lOther$refreshExpiresIn = other.refreshExpiresIn;
    if (l$refreshExpiresIn != lOther$refreshExpiresIn) {
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

extension UtilityExtension$Mutation$SignIn$signIn on Mutation$SignIn$signIn {
  CopyWith$Mutation$SignIn$signIn<Mutation$SignIn$signIn> get copyWith =>
      CopyWith$Mutation$SignIn$signIn(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$SignIn$signIn<TRes> {
  factory CopyWith$Mutation$SignIn$signIn(
    Mutation$SignIn$signIn instance,
    TRes Function(Mutation$SignIn$signIn) then,
  ) = _CopyWithImpl$Mutation$SignIn$signIn;

  factory CopyWith$Mutation$SignIn$signIn.stub(TRes res) =
      _CopyWithStubImpl$Mutation$SignIn$signIn;

  TRes call({
    String? token,
    String? refreshToken,
    dynamic? payload,
    int? refreshExpiresIn,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$SignIn$signIn<TRes>
    implements CopyWith$Mutation$SignIn$signIn<TRes> {
  _CopyWithImpl$Mutation$SignIn$signIn(
    this._instance,
    this._then,
  );

  final Mutation$SignIn$signIn _instance;

  final TRes Function(Mutation$SignIn$signIn) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? token = _undefined,
    Object? refreshToken = _undefined,
    Object? payload = _undefined,
    Object? refreshExpiresIn = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$SignIn$signIn(
        token: token == _undefined || token == null
            ? _instance.token
            : (token as String),
        refreshToken: refreshToken == _undefined || refreshToken == null
            ? _instance.refreshToken
            : (refreshToken as String),
        payload: payload == _undefined || payload == null
            ? _instance.payload
            : (payload as dynamic),
        refreshExpiresIn:
            refreshExpiresIn == _undefined || refreshExpiresIn == null
                ? _instance.refreshExpiresIn
                : (refreshExpiresIn as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$SignIn$signIn<TRes>
    implements CopyWith$Mutation$SignIn$signIn<TRes> {
  _CopyWithStubImpl$Mutation$SignIn$signIn(this._res);

  TRes _res;

  call({
    String? token,
    String? refreshToken,
    dynamic? payload,
    int? refreshExpiresIn,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$RefreshToken {
  factory Variables$Mutation$RefreshToken({required String refreshToken}) =>
      Variables$Mutation$RefreshToken._({
        r'refreshToken': refreshToken,
      });

  Variables$Mutation$RefreshToken._(this._$data);

  factory Variables$Mutation$RefreshToken.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$refreshToken = data['refreshToken'];
    result$data['refreshToken'] = (l$refreshToken as String);
    return Variables$Mutation$RefreshToken._(result$data);
  }

  Map<String, dynamic> _$data;

  String get refreshToken => (_$data['refreshToken'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$refreshToken = refreshToken;
    result$data['refreshToken'] = l$refreshToken;
    return result$data;
  }

  CopyWith$Variables$Mutation$RefreshToken<Variables$Mutation$RefreshToken>
      get copyWith => CopyWith$Variables$Mutation$RefreshToken(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$RefreshToken ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$refreshToken = refreshToken;
    final lOther$refreshToken = other.refreshToken;
    if (l$refreshToken != lOther$refreshToken) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$refreshToken = refreshToken;
    return Object.hashAll([l$refreshToken]);
  }
}

abstract class CopyWith$Variables$Mutation$RefreshToken<TRes> {
  factory CopyWith$Variables$Mutation$RefreshToken(
    Variables$Mutation$RefreshToken instance,
    TRes Function(Variables$Mutation$RefreshToken) then,
  ) = _CopyWithImpl$Variables$Mutation$RefreshToken;

  factory CopyWith$Variables$Mutation$RefreshToken.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$RefreshToken;

  TRes call({String? refreshToken});
}

class _CopyWithImpl$Variables$Mutation$RefreshToken<TRes>
    implements CopyWith$Variables$Mutation$RefreshToken<TRes> {
  _CopyWithImpl$Variables$Mutation$RefreshToken(
    this._instance,
    this._then,
  );

  final Variables$Mutation$RefreshToken _instance;

  final TRes Function(Variables$Mutation$RefreshToken) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? refreshToken = _undefined}) =>
      _then(Variables$Mutation$RefreshToken._({
        ..._instance._$data,
        if (refreshToken != _undefined && refreshToken != null)
          'refreshToken': (refreshToken as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$RefreshToken<TRes>
    implements CopyWith$Variables$Mutation$RefreshToken<TRes> {
  _CopyWithStubImpl$Variables$Mutation$RefreshToken(this._res);

  TRes _res;

  call({String? refreshToken}) => _res;
}

class Mutation$RefreshToken {
  Mutation$RefreshToken({
    this.refreshToken,
    this.$__typename = 'Mutation',
  });

  factory Mutation$RefreshToken.fromJson(Map<String, dynamic> json) {
    final l$refreshToken = json['refreshToken'];
    final l$$__typename = json['__typename'];
    return Mutation$RefreshToken(
      refreshToken: l$refreshToken == null
          ? null
          : Mutation$RefreshToken$refreshToken.fromJson(
              (l$refreshToken as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$RefreshToken$refreshToken? refreshToken;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$refreshToken = refreshToken;
    _resultData['refreshToken'] = l$refreshToken?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$refreshToken = refreshToken;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$refreshToken,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$RefreshToken || runtimeType != other.runtimeType) {
      return false;
    }
    final l$refreshToken = refreshToken;
    final lOther$refreshToken = other.refreshToken;
    if (l$refreshToken != lOther$refreshToken) {
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

extension UtilityExtension$Mutation$RefreshToken on Mutation$RefreshToken {
  CopyWith$Mutation$RefreshToken<Mutation$RefreshToken> get copyWith =>
      CopyWith$Mutation$RefreshToken(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$RefreshToken<TRes> {
  factory CopyWith$Mutation$RefreshToken(
    Mutation$RefreshToken instance,
    TRes Function(Mutation$RefreshToken) then,
  ) = _CopyWithImpl$Mutation$RefreshToken;

  factory CopyWith$Mutation$RefreshToken.stub(TRes res) =
      _CopyWithStubImpl$Mutation$RefreshToken;

  TRes call({
    Mutation$RefreshToken$refreshToken? refreshToken,
    String? $__typename,
  });
  CopyWith$Mutation$RefreshToken$refreshToken<TRes> get refreshToken;
}

class _CopyWithImpl$Mutation$RefreshToken<TRes>
    implements CopyWith$Mutation$RefreshToken<TRes> {
  _CopyWithImpl$Mutation$RefreshToken(
    this._instance,
    this._then,
  );

  final Mutation$RefreshToken _instance;

  final TRes Function(Mutation$RefreshToken) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? refreshToken = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$RefreshToken(
        refreshToken: refreshToken == _undefined
            ? _instance.refreshToken
            : (refreshToken as Mutation$RefreshToken$refreshToken?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$RefreshToken$refreshToken<TRes> get refreshToken {
    final local$refreshToken = _instance.refreshToken;
    return local$refreshToken == null
        ? CopyWith$Mutation$RefreshToken$refreshToken.stub(_then(_instance))
        : CopyWith$Mutation$RefreshToken$refreshToken(
            local$refreshToken, (e) => call(refreshToken: e));
  }
}

class _CopyWithStubImpl$Mutation$RefreshToken<TRes>
    implements CopyWith$Mutation$RefreshToken<TRes> {
  _CopyWithStubImpl$Mutation$RefreshToken(this._res);

  TRes _res;

  call({
    Mutation$RefreshToken$refreshToken? refreshToken,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$RefreshToken$refreshToken<TRes> get refreshToken =>
      CopyWith$Mutation$RefreshToken$refreshToken.stub(_res);
}

const documentNodeMutationRefreshToken = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'RefreshToken'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'refreshToken')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'refreshToken'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'refreshToken'),
            value: VariableNode(name: NameNode(value: 'refreshToken')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'token'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'refreshToken'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'payload'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'refreshExpiresIn'),
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
Mutation$RefreshToken _parserFn$Mutation$RefreshToken(
        Map<String, dynamic> data) =>
    Mutation$RefreshToken.fromJson(data);
typedef OnMutationCompleted$Mutation$RefreshToken = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$RefreshToken?,
);

class Options$Mutation$RefreshToken
    extends graphql.MutationOptions<Mutation$RefreshToken> {
  Options$Mutation$RefreshToken({
    String? operationName,
    required Variables$Mutation$RefreshToken variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$RefreshToken? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$RefreshToken? onCompleted,
    graphql.OnMutationUpdate<Mutation$RefreshToken>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFn$Mutation$RefreshToken(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationRefreshToken,
          parserFn: _parserFn$Mutation$RefreshToken,
        );

  final OnMutationCompleted$Mutation$RefreshToken? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$RefreshToken
    extends graphql.WatchQueryOptions<Mutation$RefreshToken> {
  WatchOptions$Mutation$RefreshToken({
    String? operationName,
    required Variables$Mutation$RefreshToken variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$RefreshToken? typedOptimisticResult,
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
          document: documentNodeMutationRefreshToken,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$RefreshToken,
        );
}

extension ClientExtension$Mutation$RefreshToken on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$RefreshToken>> mutate$RefreshToken(
          Options$Mutation$RefreshToken options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$RefreshToken> watchMutation$RefreshToken(
          WatchOptions$Mutation$RefreshToken options) =>
      this.watchMutation(options);
}

class Mutation$RefreshToken$HookResult {
  Mutation$RefreshToken$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$RefreshToken runMutation;

  final graphql.QueryResult<Mutation$RefreshToken> result;
}

Mutation$RefreshToken$HookResult useMutation$RefreshToken(
    [WidgetOptions$Mutation$RefreshToken? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$RefreshToken());
  return Mutation$RefreshToken$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$RefreshToken> useWatchMutation$RefreshToken(
        WatchOptions$Mutation$RefreshToken options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$RefreshToken
    extends graphql.MutationOptions<Mutation$RefreshToken> {
  WidgetOptions$Mutation$RefreshToken({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$RefreshToken? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$RefreshToken? onCompleted,
    graphql.OnMutationUpdate<Mutation$RefreshToken>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFn$Mutation$RefreshToken(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationRefreshToken,
          parserFn: _parserFn$Mutation$RefreshToken,
        );

  final OnMutationCompleted$Mutation$RefreshToken? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$RefreshToken
    = graphql.MultiSourceResult<Mutation$RefreshToken> Function(
  Variables$Mutation$RefreshToken, {
  Object? optimisticResult,
  Mutation$RefreshToken? typedOptimisticResult,
});
typedef Builder$Mutation$RefreshToken = widgets.Widget Function(
  RunMutation$Mutation$RefreshToken,
  graphql.QueryResult<Mutation$RefreshToken>?,
);

class Mutation$RefreshToken$Widget
    extends graphql_flutter.Mutation<Mutation$RefreshToken> {
  Mutation$RefreshToken$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$RefreshToken? options,
    required Builder$Mutation$RefreshToken builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$RefreshToken(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$RefreshToken$refreshToken {
  Mutation$RefreshToken$refreshToken({
    required this.token,
    required this.refreshToken,
    required this.payload,
    required this.refreshExpiresIn,
    this.$__typename = 'Refresh',
  });

  factory Mutation$RefreshToken$refreshToken.fromJson(
      Map<String, dynamic> json) {
    final l$token = json['token'];
    final l$refreshToken = json['refreshToken'];
    final l$payload = json['payload'];
    final l$refreshExpiresIn = json['refreshExpiresIn'];
    final l$$__typename = json['__typename'];
    return Mutation$RefreshToken$refreshToken(
      token: (l$token as String),
      refreshToken: (l$refreshToken as String),
      payload: (l$payload as dynamic),
      refreshExpiresIn: (l$refreshExpiresIn as int),
      $__typename: (l$$__typename as String),
    );
  }

  final String token;

  final String refreshToken;

  final dynamic payload;

  final int refreshExpiresIn;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$token = token;
    _resultData['token'] = l$token;
    final l$refreshToken = refreshToken;
    _resultData['refreshToken'] = l$refreshToken;
    final l$payload = payload;
    _resultData['payload'] = l$payload;
    final l$refreshExpiresIn = refreshExpiresIn;
    _resultData['refreshExpiresIn'] = l$refreshExpiresIn;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$token = token;
    final l$refreshToken = refreshToken;
    final l$payload = payload;
    final l$refreshExpiresIn = refreshExpiresIn;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$token,
      l$refreshToken,
      l$payload,
      l$refreshExpiresIn,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$RefreshToken$refreshToken ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$token = token;
    final lOther$token = other.token;
    if (l$token != lOther$token) {
      return false;
    }
    final l$refreshToken = refreshToken;
    final lOther$refreshToken = other.refreshToken;
    if (l$refreshToken != lOther$refreshToken) {
      return false;
    }
    final l$payload = payload;
    final lOther$payload = other.payload;
    if (l$payload != lOther$payload) {
      return false;
    }
    final l$refreshExpiresIn = refreshExpiresIn;
    final lOther$refreshExpiresIn = other.refreshExpiresIn;
    if (l$refreshExpiresIn != lOther$refreshExpiresIn) {
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

extension UtilityExtension$Mutation$RefreshToken$refreshToken
    on Mutation$RefreshToken$refreshToken {
  CopyWith$Mutation$RefreshToken$refreshToken<
          Mutation$RefreshToken$refreshToken>
      get copyWith => CopyWith$Mutation$RefreshToken$refreshToken(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$RefreshToken$refreshToken<TRes> {
  factory CopyWith$Mutation$RefreshToken$refreshToken(
    Mutation$RefreshToken$refreshToken instance,
    TRes Function(Mutation$RefreshToken$refreshToken) then,
  ) = _CopyWithImpl$Mutation$RefreshToken$refreshToken;

  factory CopyWith$Mutation$RefreshToken$refreshToken.stub(TRes res) =
      _CopyWithStubImpl$Mutation$RefreshToken$refreshToken;

  TRes call({
    String? token,
    String? refreshToken,
    dynamic? payload,
    int? refreshExpiresIn,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$RefreshToken$refreshToken<TRes>
    implements CopyWith$Mutation$RefreshToken$refreshToken<TRes> {
  _CopyWithImpl$Mutation$RefreshToken$refreshToken(
    this._instance,
    this._then,
  );

  final Mutation$RefreshToken$refreshToken _instance;

  final TRes Function(Mutation$RefreshToken$refreshToken) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? token = _undefined,
    Object? refreshToken = _undefined,
    Object? payload = _undefined,
    Object? refreshExpiresIn = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$RefreshToken$refreshToken(
        token: token == _undefined || token == null
            ? _instance.token
            : (token as String),
        refreshToken: refreshToken == _undefined || refreshToken == null
            ? _instance.refreshToken
            : (refreshToken as String),
        payload: payload == _undefined || payload == null
            ? _instance.payload
            : (payload as dynamic),
        refreshExpiresIn:
            refreshExpiresIn == _undefined || refreshExpiresIn == null
                ? _instance.refreshExpiresIn
                : (refreshExpiresIn as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$RefreshToken$refreshToken<TRes>
    implements CopyWith$Mutation$RefreshToken$refreshToken<TRes> {
  _CopyWithStubImpl$Mutation$RefreshToken$refreshToken(this._res);

  TRes _res;

  call({
    String? token,
    String? refreshToken,
    dynamic? payload,
    int? refreshExpiresIn,
    String? $__typename,
  }) =>
      _res;
}

class Mutation$Logout {
  Mutation$Logout({
    this.logout,
    this.$__typename = 'Mutation',
  });

  factory Mutation$Logout.fromJson(Map<String, dynamic> json) {
    final l$logout = json['logout'];
    final l$$__typename = json['__typename'];
    return Mutation$Logout(
      logout: l$logout == null
          ? null
          : Mutation$Logout$logout.fromJson((l$logout as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$Logout$logout? logout;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$logout = logout;
    _resultData['logout'] = l$logout?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$logout = logout;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$logout,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$Logout || runtimeType != other.runtimeType) {
      return false;
    }
    final l$logout = logout;
    final lOther$logout = other.logout;
    if (l$logout != lOther$logout) {
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

extension UtilityExtension$Mutation$Logout on Mutation$Logout {
  CopyWith$Mutation$Logout<Mutation$Logout> get copyWith =>
      CopyWith$Mutation$Logout(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$Logout<TRes> {
  factory CopyWith$Mutation$Logout(
    Mutation$Logout instance,
    TRes Function(Mutation$Logout) then,
  ) = _CopyWithImpl$Mutation$Logout;

  factory CopyWith$Mutation$Logout.stub(TRes res) =
      _CopyWithStubImpl$Mutation$Logout;

  TRes call({
    Mutation$Logout$logout? logout,
    String? $__typename,
  });
  CopyWith$Mutation$Logout$logout<TRes> get logout;
}

class _CopyWithImpl$Mutation$Logout<TRes>
    implements CopyWith$Mutation$Logout<TRes> {
  _CopyWithImpl$Mutation$Logout(
    this._instance,
    this._then,
  );

  final Mutation$Logout _instance;

  final TRes Function(Mutation$Logout) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? logout = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$Logout(
        logout: logout == _undefined
            ? _instance.logout
            : (logout as Mutation$Logout$logout?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$Logout$logout<TRes> get logout {
    final local$logout = _instance.logout;
    return local$logout == null
        ? CopyWith$Mutation$Logout$logout.stub(_then(_instance))
        : CopyWith$Mutation$Logout$logout(local$logout, (e) => call(logout: e));
  }
}

class _CopyWithStubImpl$Mutation$Logout<TRes>
    implements CopyWith$Mutation$Logout<TRes> {
  _CopyWithStubImpl$Mutation$Logout(this._res);

  TRes _res;

  call({
    Mutation$Logout$logout? logout,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$Logout$logout<TRes> get logout =>
      CopyWith$Mutation$Logout$logout.stub(_res);
}

const documentNodeMutationLogout = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'Logout'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'logout'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'deleted'),
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
Mutation$Logout _parserFn$Mutation$Logout(Map<String, dynamic> data) =>
    Mutation$Logout.fromJson(data);
typedef OnMutationCompleted$Mutation$Logout = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$Logout?,
);

class Options$Mutation$Logout extends graphql.MutationOptions<Mutation$Logout> {
  Options$Mutation$Logout({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$Logout? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$Logout? onCompleted,
    graphql.OnMutationUpdate<Mutation$Logout>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFn$Mutation$Logout(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationLogout,
          parserFn: _parserFn$Mutation$Logout,
        );

  final OnMutationCompleted$Mutation$Logout? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$Logout
    extends graphql.WatchQueryOptions<Mutation$Logout> {
  WatchOptions$Mutation$Logout({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$Logout? typedOptimisticResult,
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
          document: documentNodeMutationLogout,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$Logout,
        );
}

extension ClientExtension$Mutation$Logout on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$Logout>> mutate$Logout(
          [Options$Mutation$Logout? options]) async =>
      await this.mutate(options ?? Options$Mutation$Logout());
  graphql.ObservableQuery<Mutation$Logout> watchMutation$Logout(
          [WatchOptions$Mutation$Logout? options]) =>
      this.watchMutation(options ?? WatchOptions$Mutation$Logout());
}

class Mutation$Logout$HookResult {
  Mutation$Logout$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$Logout runMutation;

  final graphql.QueryResult<Mutation$Logout> result;
}

Mutation$Logout$HookResult useMutation$Logout(
    [WidgetOptions$Mutation$Logout? options]) {
  final result =
      graphql_flutter.useMutation(options ?? WidgetOptions$Mutation$Logout());
  return Mutation$Logout$HookResult(
    ({optimisticResult, typedOptimisticResult}) => result.runMutation(
      const {},
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$Logout> useWatchMutation$Logout(
        [WatchOptions$Mutation$Logout? options]) =>
    graphql_flutter.useWatchMutation(options ?? WatchOptions$Mutation$Logout());

class WidgetOptions$Mutation$Logout
    extends graphql.MutationOptions<Mutation$Logout> {
  WidgetOptions$Mutation$Logout({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$Logout? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$Logout? onCompleted,
    graphql.OnMutationUpdate<Mutation$Logout>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFn$Mutation$Logout(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationLogout,
          parserFn: _parserFn$Mutation$Logout,
        );

  final OnMutationCompleted$Mutation$Logout? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$Logout = graphql.MultiSourceResult<Mutation$Logout>
    Function({
  Object? optimisticResult,
  Mutation$Logout? typedOptimisticResult,
});
typedef Builder$Mutation$Logout = widgets.Widget Function(
  RunMutation$Mutation$Logout,
  graphql.QueryResult<Mutation$Logout>?,
);

class Mutation$Logout$Widget extends graphql_flutter.Mutation<Mutation$Logout> {
  Mutation$Logout$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$Logout? options,
    required Builder$Mutation$Logout builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$Logout(),
          builder: (
            run,
            result,
          ) =>
              builder(
            ({
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              const {},
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$Logout$logout {
  Mutation$Logout$logout({
    required this.deleted,
    this.$__typename = 'DeleteJSONWebTokenCookie',
  });

  factory Mutation$Logout$logout.fromJson(Map<String, dynamic> json) {
    final l$deleted = json['deleted'];
    final l$$__typename = json['__typename'];
    return Mutation$Logout$logout(
      deleted: (l$deleted as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool deleted;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deleted = deleted;
    _resultData['deleted'] = l$deleted;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deleted = deleted;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$deleted,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$Logout$logout || runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleted = deleted;
    final lOther$deleted = other.deleted;
    if (l$deleted != lOther$deleted) {
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

extension UtilityExtension$Mutation$Logout$logout on Mutation$Logout$logout {
  CopyWith$Mutation$Logout$logout<Mutation$Logout$logout> get copyWith =>
      CopyWith$Mutation$Logout$logout(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$Logout$logout<TRes> {
  factory CopyWith$Mutation$Logout$logout(
    Mutation$Logout$logout instance,
    TRes Function(Mutation$Logout$logout) then,
  ) = _CopyWithImpl$Mutation$Logout$logout;

  factory CopyWith$Mutation$Logout$logout.stub(TRes res) =
      _CopyWithStubImpl$Mutation$Logout$logout;

  TRes call({
    bool? deleted,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$Logout$logout<TRes>
    implements CopyWith$Mutation$Logout$logout<TRes> {
  _CopyWithImpl$Mutation$Logout$logout(
    this._instance,
    this._then,
  );

  final Mutation$Logout$logout _instance;

  final TRes Function(Mutation$Logout$logout) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? deleted = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$Logout$logout(
        deleted: deleted == _undefined || deleted == null
            ? _instance.deleted
            : (deleted as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$Logout$logout<TRes>
    implements CopyWith$Mutation$Logout$logout<TRes> {
  _CopyWithStubImpl$Mutation$Logout$logout(this._res);

  TRes _res;

  call({
    bool? deleted,
    String? $__typename,
  }) =>
      _res;
}

class Query$Me {
  Query$Me({
    this.me,
    this.$__typename = 'Query',
  });

  factory Query$Me.fromJson(Map<String, dynamic> json) {
    final l$me = json['me'];
    final l$$__typename = json['__typename'];
    return Query$Me(
      me: l$me == null
          ? null
          : Query$Me$me.fromJson((l$me as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$Me$me? me;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$me = me;
    _resultData['me'] = l$me?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$me = me;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$me,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Me || runtimeType != other.runtimeType) {
      return false;
    }
    final l$me = me;
    final lOther$me = other.me;
    if (l$me != lOther$me) {
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

extension UtilityExtension$Query$Me on Query$Me {
  CopyWith$Query$Me<Query$Me> get copyWith => CopyWith$Query$Me(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$Me<TRes> {
  factory CopyWith$Query$Me(
    Query$Me instance,
    TRes Function(Query$Me) then,
  ) = _CopyWithImpl$Query$Me;

  factory CopyWith$Query$Me.stub(TRes res) = _CopyWithStubImpl$Query$Me;

  TRes call({
    Query$Me$me? me,
    String? $__typename,
  });
  CopyWith$Query$Me$me<TRes> get me;
}

class _CopyWithImpl$Query$Me<TRes> implements CopyWith$Query$Me<TRes> {
  _CopyWithImpl$Query$Me(
    this._instance,
    this._then,
  );

  final Query$Me _instance;

  final TRes Function(Query$Me) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? me = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Me(
        me: me == _undefined ? _instance.me : (me as Query$Me$me?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$Me$me<TRes> get me {
    final local$me = _instance.me;
    return local$me == null
        ? CopyWith$Query$Me$me.stub(_then(_instance))
        : CopyWith$Query$Me$me(local$me, (e) => call(me: e));
  }
}

class _CopyWithStubImpl$Query$Me<TRes> implements CopyWith$Query$Me<TRes> {
  _CopyWithStubImpl$Query$Me(this._res);

  TRes _res;

  call({
    Query$Me$me? me,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$Me$me<TRes> get me => CopyWith$Query$Me$me.stub(_res);
}

const documentNodeQueryMe = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'Me'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'me'),
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
Query$Me _parserFn$Query$Me(Map<String, dynamic> data) =>
    Query$Me.fromJson(data);
typedef OnQueryComplete$Query$Me = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$Me?,
);

class Options$Query$Me extends graphql.QueryOptions<Query$Me> {
  Options$Query$Me({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$Me? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$Me? onComplete,
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
                    data == null ? null : _parserFn$Query$Me(data),
                  ),
          onError: onError,
          document: documentNodeQueryMe,
          parserFn: _parserFn$Query$Me,
        );

  final OnQueryComplete$Query$Me? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$Me extends graphql.WatchQueryOptions<Query$Me> {
  WatchOptions$Query$Me({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$Me? typedOptimisticResult,
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
          document: documentNodeQueryMe,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$Me,
        );
}

class FetchMoreOptions$Query$Me extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$Me({required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQueryMe,
        );
}

extension ClientExtension$Query$Me on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$Me>> query$Me(
          [Options$Query$Me? options]) async =>
      await this.query(options ?? Options$Query$Me());
  graphql.ObservableQuery<Query$Me> watchQuery$Me(
          [WatchOptions$Query$Me? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$Me());
  void writeQuery$Me({
    required Query$Me data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation: graphql.Operation(document: documentNodeQueryMe)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$Me? readQuery$Me({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryMe)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$Me.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$Me> useQuery$Me(
        [Options$Query$Me? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$Me());
graphql.ObservableQuery<Query$Me> useWatchQuery$Me(
        [WatchOptions$Query$Me? options]) =>
    graphql_flutter.useWatchQuery(options ?? WatchOptions$Query$Me());

class Query$Me$Widget extends graphql_flutter.Query<Query$Me> {
  Query$Me$Widget({
    widgets.Key? key,
    Options$Query$Me? options,
    required graphql_flutter.QueryBuilder<Query$Me> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$Me(),
          builder: builder,
        );
}

class Query$Me$me {
  Query$Me$me({
    this.id,
    this.username,
    this.email,
    this.firstName,
    this.lastName,
    this.isActive,
    this.isStaff,
    this.$__typename = 'UserType',
  });

  factory Query$Me$me.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$username = json['username'];
    final l$email = json['email'];
    final l$firstName = json['firstName'];
    final l$lastName = json['lastName'];
    final l$isActive = json['isActive'];
    final l$isStaff = json['isStaff'];
    final l$$__typename = json['__typename'];
    return Query$Me$me(
      id: (l$id as String?),
      username: (l$username as String?),
      email: (l$email as String?),
      firstName: (l$firstName as String?),
      lastName: (l$lastName as String?),
      isActive: (l$isActive as bool?),
      isStaff: (l$isStaff as bool?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? id;

  final String? username;

  final String? email;

  final String? firstName;

  final String? lastName;

  final bool? isActive;

  final bool? isStaff;

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
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$username,
      l$email,
      l$firstName,
      l$lastName,
      l$isActive,
      l$isStaff,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Me$me || runtimeType != other.runtimeType) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$Me$me on Query$Me$me {
  CopyWith$Query$Me$me<Query$Me$me> get copyWith => CopyWith$Query$Me$me(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$Me$me<TRes> {
  factory CopyWith$Query$Me$me(
    Query$Me$me instance,
    TRes Function(Query$Me$me) then,
  ) = _CopyWithImpl$Query$Me$me;

  factory CopyWith$Query$Me$me.stub(TRes res) = _CopyWithStubImpl$Query$Me$me;

  TRes call({
    String? id,
    String? username,
    String? email,
    String? firstName,
    String? lastName,
    bool? isActive,
    bool? isStaff,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$Me$me<TRes> implements CopyWith$Query$Me$me<TRes> {
  _CopyWithImpl$Query$Me$me(
    this._instance,
    this._then,
  );

  final Query$Me$me _instance;

  final TRes Function(Query$Me$me) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? username = _undefined,
    Object? email = _undefined,
    Object? firstName = _undefined,
    Object? lastName = _undefined,
    Object? isActive = _undefined,
    Object? isStaff = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Me$me(
        id: id == _undefined ? _instance.id : (id as String?),
        username:
            username == _undefined ? _instance.username : (username as String?),
        email: email == _undefined ? _instance.email : (email as String?),
        firstName: firstName == _undefined
            ? _instance.firstName
            : (firstName as String?),
        lastName:
            lastName == _undefined ? _instance.lastName : (lastName as String?),
        isActive:
            isActive == _undefined ? _instance.isActive : (isActive as bool?),
        isStaff: isStaff == _undefined ? _instance.isStaff : (isStaff as bool?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$Me$me<TRes>
    implements CopyWith$Query$Me$me<TRes> {
  _CopyWithStubImpl$Query$Me$me(this._res);

  TRes _res;

  call({
    String? id,
    String? username,
    String? email,
    String? firstName,
    String? lastName,
    bool? isActive,
    bool? isStaff,
    String? $__typename,
  }) =>
      _res;
}
