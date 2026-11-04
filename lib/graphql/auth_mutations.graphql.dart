import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Mutation$CreateAccount {
  factory Variables$Mutation$CreateAccount({
    required String email,
    required String username,
    required String password,
    String? firstName,
    String? lastName,
  }) =>
      Variables$Mutation$CreateAccount._({
        r'email': email,
        r'username': username,
        r'password': password,
        if (firstName != null) r'firstName': firstName,
        if (lastName != null) r'lastName': lastName,
      });

  Variables$Mutation$CreateAccount._(this._$data);

  factory Variables$Mutation$CreateAccount.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$email = data['email'];
    result$data['email'] = (l$email as String);
    final l$username = data['username'];
    result$data['username'] = (l$username as String);
    final l$password = data['password'];
    result$data['password'] = (l$password as String);
    if (data.containsKey('firstName')) {
      final l$firstName = data['firstName'];
      result$data['firstName'] = (l$firstName as String?);
    }
    if (data.containsKey('lastName')) {
      final l$lastName = data['lastName'];
      result$data['lastName'] = (l$lastName as String?);
    }
    return Variables$Mutation$CreateAccount._(result$data);
  }

  Map<String, dynamic> _$data;

  String get email => (_$data['email'] as String);

  String get username => (_$data['username'] as String);

  String get password => (_$data['password'] as String);

  String? get firstName => (_$data['firstName'] as String?);

  String? get lastName => (_$data['lastName'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$email = email;
    result$data['email'] = l$email;
    final l$username = username;
    result$data['username'] = l$username;
    final l$password = password;
    result$data['password'] = l$password;
    if (_$data.containsKey('firstName')) {
      final l$firstName = firstName;
      result$data['firstName'] = l$firstName;
    }
    if (_$data.containsKey('lastName')) {
      final l$lastName = lastName;
      result$data['lastName'] = l$lastName;
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$CreateAccount<Variables$Mutation$CreateAccount>
      get copyWith => CopyWith$Variables$Mutation$CreateAccount(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$CreateAccount ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
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
    final l$firstName = firstName;
    final lOther$firstName = other.firstName;
    if (_$data.containsKey('firstName') !=
        other._$data.containsKey('firstName')) {
      return false;
    }
    if (l$firstName != lOther$firstName) {
      return false;
    }
    final l$lastName = lastName;
    final lOther$lastName = other.lastName;
    if (_$data.containsKey('lastName') !=
        other._$data.containsKey('lastName')) {
      return false;
    }
    if (l$lastName != lOther$lastName) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$email = email;
    final l$username = username;
    final l$password = password;
    final l$firstName = firstName;
    final l$lastName = lastName;
    return Object.hashAll([
      l$email,
      l$username,
      l$password,
      _$data.containsKey('firstName') ? l$firstName : const {},
      _$data.containsKey('lastName') ? l$lastName : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$CreateAccount<TRes> {
  factory CopyWith$Variables$Mutation$CreateAccount(
    Variables$Mutation$CreateAccount instance,
    TRes Function(Variables$Mutation$CreateAccount) then,
  ) = _CopyWithImpl$Variables$Mutation$CreateAccount;

  factory CopyWith$Variables$Mutation$CreateAccount.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$CreateAccount;

  TRes call({
    String? email,
    String? username,
    String? password,
    String? firstName,
    String? lastName,
  });
}

class _CopyWithImpl$Variables$Mutation$CreateAccount<TRes>
    implements CopyWith$Variables$Mutation$CreateAccount<TRes> {
  _CopyWithImpl$Variables$Mutation$CreateAccount(
    this._instance,
    this._then,
  );

  final Variables$Mutation$CreateAccount _instance;

  final TRes Function(Variables$Mutation$CreateAccount) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? email = _undefined,
    Object? username = _undefined,
    Object? password = _undefined,
    Object? firstName = _undefined,
    Object? lastName = _undefined,
  }) =>
      _then(Variables$Mutation$CreateAccount._({
        ..._instance._$data,
        if (email != _undefined && email != null) 'email': (email as String),
        if (username != _undefined && username != null)
          'username': (username as String),
        if (password != _undefined && password != null)
          'password': (password as String),
        if (firstName != _undefined) 'firstName': (firstName as String?),
        if (lastName != _undefined) 'lastName': (lastName as String?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$CreateAccount<TRes>
    implements CopyWith$Variables$Mutation$CreateAccount<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CreateAccount(this._res);

  TRes _res;

  call({
    String? email,
    String? username,
    String? password,
    String? firstName,
    String? lastName,
  }) =>
      _res;
}

class Mutation$CreateAccount {
  Mutation$CreateAccount({
    this.createAccount,
    this.$__typename = 'Mutation',
  });

  factory Mutation$CreateAccount.fromJson(Map<String, dynamic> json) {
    final l$createAccount = json['createAccount'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateAccount(
      createAccount: l$createAccount == null
          ? null
          : Mutation$CreateAccount$createAccount.fromJson(
              (l$createAccount as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CreateAccount$createAccount? createAccount;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$createAccount = createAccount;
    _resultData['createAccount'] = l$createAccount?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$createAccount = createAccount;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$createAccount,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateAccount || runtimeType != other.runtimeType) {
      return false;
    }
    final l$createAccount = createAccount;
    final lOther$createAccount = other.createAccount;
    if (l$createAccount != lOther$createAccount) {
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

extension UtilityExtension$Mutation$CreateAccount on Mutation$CreateAccount {
  CopyWith$Mutation$CreateAccount<Mutation$CreateAccount> get copyWith =>
      CopyWith$Mutation$CreateAccount(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$CreateAccount<TRes> {
  factory CopyWith$Mutation$CreateAccount(
    Mutation$CreateAccount instance,
    TRes Function(Mutation$CreateAccount) then,
  ) = _CopyWithImpl$Mutation$CreateAccount;

  factory CopyWith$Mutation$CreateAccount.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateAccount;

  TRes call({
    Mutation$CreateAccount$createAccount? createAccount,
    String? $__typename,
  });
  CopyWith$Mutation$CreateAccount$createAccount<TRes> get createAccount;
}

class _CopyWithImpl$Mutation$CreateAccount<TRes>
    implements CopyWith$Mutation$CreateAccount<TRes> {
  _CopyWithImpl$Mutation$CreateAccount(
    this._instance,
    this._then,
  );

  final Mutation$CreateAccount _instance;

  final TRes Function(Mutation$CreateAccount) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? createAccount = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$CreateAccount(
        createAccount: createAccount == _undefined
            ? _instance.createAccount
            : (createAccount as Mutation$CreateAccount$createAccount?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$CreateAccount$createAccount<TRes> get createAccount {
    final local$createAccount = _instance.createAccount;
    return local$createAccount == null
        ? CopyWith$Mutation$CreateAccount$createAccount.stub(_then(_instance))
        : CopyWith$Mutation$CreateAccount$createAccount(
            local$createAccount, (e) => call(createAccount: e));
  }
}

class _CopyWithStubImpl$Mutation$CreateAccount<TRes>
    implements CopyWith$Mutation$CreateAccount<TRes> {
  _CopyWithStubImpl$Mutation$CreateAccount(this._res);

  TRes _res;

  call({
    Mutation$CreateAccount$createAccount? createAccount,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$CreateAccount$createAccount<TRes> get createAccount =>
      CopyWith$Mutation$CreateAccount$createAccount.stub(_res);
}

const documentNodeMutationCreateAccount = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'CreateAccount'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'email')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
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
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'firstName')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'lastName')),
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
        name: NameNode(value: 'createAccount'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'email'),
            value: VariableNode(name: NameNode(value: 'email')),
          ),
          ArgumentNode(
            name: NameNode(value: 'username'),
            value: VariableNode(name: NameNode(value: 'username')),
          ),
          ArgumentNode(
            name: NameNode(value: 'password'),
            value: VariableNode(name: NameNode(value: 'password')),
          ),
          ArgumentNode(
            name: NameNode(value: 'firstName'),
            value: VariableNode(name: NameNode(value: 'firstName')),
          ),
          ArgumentNode(
            name: NameNode(value: 'lastName'),
            value: VariableNode(name: NameNode(value: 'lastName')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'success'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'message'),
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
Mutation$CreateAccount _parserFn$Mutation$CreateAccount(
        Map<String, dynamic> data) =>
    Mutation$CreateAccount.fromJson(data);
typedef OnMutationCompleted$Mutation$CreateAccount = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$CreateAccount?,
);

class Options$Mutation$CreateAccount
    extends graphql.MutationOptions<Mutation$CreateAccount> {
  Options$Mutation$CreateAccount({
    String? operationName,
    required Variables$Mutation$CreateAccount variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateAccount? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateAccount? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateAccount>? update,
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
                    data == null
                        ? null
                        : _parserFn$Mutation$CreateAccount(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationCreateAccount,
          parserFn: _parserFn$Mutation$CreateAccount,
        );

  final OnMutationCompleted$Mutation$CreateAccount? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$CreateAccount
    extends graphql.WatchQueryOptions<Mutation$CreateAccount> {
  WatchOptions$Mutation$CreateAccount({
    String? operationName,
    required Variables$Mutation$CreateAccount variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateAccount? typedOptimisticResult,
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
          document: documentNodeMutationCreateAccount,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$CreateAccount,
        );
}

extension ClientExtension$Mutation$CreateAccount on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$CreateAccount>> mutate$CreateAccount(
          Options$Mutation$CreateAccount options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$CreateAccount> watchMutation$CreateAccount(
          WatchOptions$Mutation$CreateAccount options) =>
      this.watchMutation(options);
}

class Mutation$CreateAccount$HookResult {
  Mutation$CreateAccount$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$CreateAccount runMutation;

  final graphql.QueryResult<Mutation$CreateAccount> result;
}

Mutation$CreateAccount$HookResult useMutation$CreateAccount(
    [WidgetOptions$Mutation$CreateAccount? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$CreateAccount());
  return Mutation$CreateAccount$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$CreateAccount> useWatchMutation$CreateAccount(
        WatchOptions$Mutation$CreateAccount options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$CreateAccount
    extends graphql.MutationOptions<Mutation$CreateAccount> {
  WidgetOptions$Mutation$CreateAccount({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateAccount? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateAccount? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateAccount>? update,
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
                    data == null
                        ? null
                        : _parserFn$Mutation$CreateAccount(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationCreateAccount,
          parserFn: _parserFn$Mutation$CreateAccount,
        );

  final OnMutationCompleted$Mutation$CreateAccount? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$CreateAccount
    = graphql.MultiSourceResult<Mutation$CreateAccount> Function(
  Variables$Mutation$CreateAccount, {
  Object? optimisticResult,
  Mutation$CreateAccount? typedOptimisticResult,
});
typedef Builder$Mutation$CreateAccount = widgets.Widget Function(
  RunMutation$Mutation$CreateAccount,
  graphql.QueryResult<Mutation$CreateAccount>?,
);

class Mutation$CreateAccount$Widget
    extends graphql_flutter.Mutation<Mutation$CreateAccount> {
  Mutation$CreateAccount$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$CreateAccount? options,
    required Builder$Mutation$CreateAccount builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$CreateAccount(),
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

class Mutation$CreateAccount$createAccount {
  Mutation$CreateAccount$createAccount({
    this.success,
    this.message,
    this.user,
    this.$__typename = 'CreateAccount',
  });

  factory Mutation$CreateAccount$createAccount.fromJson(
      Map<String, dynamic> json) {
    final l$success = json['success'];
    final l$message = json['message'];
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateAccount$createAccount(
      success: (l$success as bool?),
      message: (l$message as String?),
      user: l$user == null
          ? null
          : Mutation$CreateAccount$createAccount$user.fromJson(
              (l$user as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? success;

  final String? message;

  final Mutation$CreateAccount$createAccount$user? user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$success = success;
    _resultData['success'] = l$success;
    final l$message = message;
    _resultData['message'] = l$message;
    final l$user = user;
    _resultData['user'] = l$user?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$success = success;
    final l$message = message;
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$success,
      l$message,
      l$user,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateAccount$createAccount ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$success = success;
    final lOther$success = other.success;
    if (l$success != lOther$success) {
      return false;
    }
    final l$message = message;
    final lOther$message = other.message;
    if (l$message != lOther$message) {
      return false;
    }
    final l$user = user;
    final lOther$user = other.user;
    if (l$user != lOther$user) {
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

extension UtilityExtension$Mutation$CreateAccount$createAccount
    on Mutation$CreateAccount$createAccount {
  CopyWith$Mutation$CreateAccount$createAccount<
          Mutation$CreateAccount$createAccount>
      get copyWith => CopyWith$Mutation$CreateAccount$createAccount(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$CreateAccount$createAccount<TRes> {
  factory CopyWith$Mutation$CreateAccount$createAccount(
    Mutation$CreateAccount$createAccount instance,
    TRes Function(Mutation$CreateAccount$createAccount) then,
  ) = _CopyWithImpl$Mutation$CreateAccount$createAccount;

  factory CopyWith$Mutation$CreateAccount$createAccount.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateAccount$createAccount;

  TRes call({
    bool? success,
    String? message,
    Mutation$CreateAccount$createAccount$user? user,
    String? $__typename,
  });
  CopyWith$Mutation$CreateAccount$createAccount$user<TRes> get user;
}

class _CopyWithImpl$Mutation$CreateAccount$createAccount<TRes>
    implements CopyWith$Mutation$CreateAccount$createAccount<TRes> {
  _CopyWithImpl$Mutation$CreateAccount$createAccount(
    this._instance,
    this._then,
  );

  final Mutation$CreateAccount$createAccount _instance;

  final TRes Function(Mutation$CreateAccount$createAccount) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? success = _undefined,
    Object? message = _undefined,
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$CreateAccount$createAccount(
        success: success == _undefined ? _instance.success : (success as bool?),
        message:
            message == _undefined ? _instance.message : (message as String?),
        user: user == _undefined
            ? _instance.user
            : (user as Mutation$CreateAccount$createAccount$user?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$CreateAccount$createAccount$user<TRes> get user {
    final local$user = _instance.user;
    return local$user == null
        ? CopyWith$Mutation$CreateAccount$createAccount$user.stub(
            _then(_instance))
        : CopyWith$Mutation$CreateAccount$createAccount$user(
            local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Mutation$CreateAccount$createAccount<TRes>
    implements CopyWith$Mutation$CreateAccount$createAccount<TRes> {
  _CopyWithStubImpl$Mutation$CreateAccount$createAccount(this._res);

  TRes _res;

  call({
    bool? success,
    String? message,
    Mutation$CreateAccount$createAccount$user? user,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$CreateAccount$createAccount$user<TRes> get user =>
      CopyWith$Mutation$CreateAccount$createAccount$user.stub(_res);
}

class Mutation$CreateAccount$createAccount$user {
  Mutation$CreateAccount$createAccount$user({
    this.id,
    this.username,
    this.email,
    this.firstName,
    this.lastName,
    this.$__typename = 'UserType',
  });

  factory Mutation$CreateAccount$createAccount$user.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$username = json['username'];
    final l$email = json['email'];
    final l$firstName = json['firstName'];
    final l$lastName = json['lastName'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateAccount$createAccount$user(
      id: (l$id as String?),
      username: (l$username as String?),
      email: (l$email as String?),
      firstName: (l$firstName as String?),
      lastName: (l$lastName as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? id;

  final String? username;

  final String? email;

  final String? firstName;

  final String? lastName;

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
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$username,
      l$email,
      l$firstName,
      l$lastName,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateAccount$createAccount$user ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$CreateAccount$createAccount$user
    on Mutation$CreateAccount$createAccount$user {
  CopyWith$Mutation$CreateAccount$createAccount$user<
          Mutation$CreateAccount$createAccount$user>
      get copyWith => CopyWith$Mutation$CreateAccount$createAccount$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$CreateAccount$createAccount$user<TRes> {
  factory CopyWith$Mutation$CreateAccount$createAccount$user(
    Mutation$CreateAccount$createAccount$user instance,
    TRes Function(Mutation$CreateAccount$createAccount$user) then,
  ) = _CopyWithImpl$Mutation$CreateAccount$createAccount$user;

  factory CopyWith$Mutation$CreateAccount$createAccount$user.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateAccount$createAccount$user;

  TRes call({
    String? id,
    String? username,
    String? email,
    String? firstName,
    String? lastName,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$CreateAccount$createAccount$user<TRes>
    implements CopyWith$Mutation$CreateAccount$createAccount$user<TRes> {
  _CopyWithImpl$Mutation$CreateAccount$createAccount$user(
    this._instance,
    this._then,
  );

  final Mutation$CreateAccount$createAccount$user _instance;

  final TRes Function(Mutation$CreateAccount$createAccount$user) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? username = _undefined,
    Object? email = _undefined,
    Object? firstName = _undefined,
    Object? lastName = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$CreateAccount$createAccount$user(
        id: id == _undefined ? _instance.id : (id as String?),
        username:
            username == _undefined ? _instance.username : (username as String?),
        email: email == _undefined ? _instance.email : (email as String?),
        firstName: firstName == _undefined
            ? _instance.firstName
            : (firstName as String?),
        lastName:
            lastName == _undefined ? _instance.lastName : (lastName as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$CreateAccount$createAccount$user<TRes>
    implements CopyWith$Mutation$CreateAccount$createAccount$user<TRes> {
  _CopyWithStubImpl$Mutation$CreateAccount$createAccount$user(this._res);

  TRes _res;

  call({
    String? id,
    String? username,
    String? email,
    String? firstName,
    String? lastName,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$ForgotPassword {
  factory Variables$Mutation$ForgotPassword({required String email}) =>
      Variables$Mutation$ForgotPassword._({
        r'email': email,
      });

  Variables$Mutation$ForgotPassword._(this._$data);

  factory Variables$Mutation$ForgotPassword.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$email = data['email'];
    result$data['email'] = (l$email as String);
    return Variables$Mutation$ForgotPassword._(result$data);
  }

  Map<String, dynamic> _$data;

  String get email => (_$data['email'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$email = email;
    result$data['email'] = l$email;
    return result$data;
  }

  CopyWith$Variables$Mutation$ForgotPassword<Variables$Mutation$ForgotPassword>
      get copyWith => CopyWith$Variables$Mutation$ForgotPassword(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$ForgotPassword ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$email = email;
    return Object.hashAll([l$email]);
  }
}

abstract class CopyWith$Variables$Mutation$ForgotPassword<TRes> {
  factory CopyWith$Variables$Mutation$ForgotPassword(
    Variables$Mutation$ForgotPassword instance,
    TRes Function(Variables$Mutation$ForgotPassword) then,
  ) = _CopyWithImpl$Variables$Mutation$ForgotPassword;

  factory CopyWith$Variables$Mutation$ForgotPassword.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$ForgotPassword;

  TRes call({String? email});
}

class _CopyWithImpl$Variables$Mutation$ForgotPassword<TRes>
    implements CopyWith$Variables$Mutation$ForgotPassword<TRes> {
  _CopyWithImpl$Variables$Mutation$ForgotPassword(
    this._instance,
    this._then,
  );

  final Variables$Mutation$ForgotPassword _instance;

  final TRes Function(Variables$Mutation$ForgotPassword) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? email = _undefined}) =>
      _then(Variables$Mutation$ForgotPassword._({
        ..._instance._$data,
        if (email != _undefined && email != null) 'email': (email as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$ForgotPassword<TRes>
    implements CopyWith$Variables$Mutation$ForgotPassword<TRes> {
  _CopyWithStubImpl$Variables$Mutation$ForgotPassword(this._res);

  TRes _res;

  call({String? email}) => _res;
}

class Mutation$ForgotPassword {
  Mutation$ForgotPassword({
    this.forgotPassword,
    this.$__typename = 'Mutation',
  });

  factory Mutation$ForgotPassword.fromJson(Map<String, dynamic> json) {
    final l$forgotPassword = json['forgotPassword'];
    final l$$__typename = json['__typename'];
    return Mutation$ForgotPassword(
      forgotPassword: l$forgotPassword == null
          ? null
          : Mutation$ForgotPassword$forgotPassword.fromJson(
              (l$forgotPassword as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$ForgotPassword$forgotPassword? forgotPassword;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$forgotPassword = forgotPassword;
    _resultData['forgotPassword'] = l$forgotPassword?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$forgotPassword = forgotPassword;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$forgotPassword,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$ForgotPassword || runtimeType != other.runtimeType) {
      return false;
    }
    final l$forgotPassword = forgotPassword;
    final lOther$forgotPassword = other.forgotPassword;
    if (l$forgotPassword != lOther$forgotPassword) {
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

extension UtilityExtension$Mutation$ForgotPassword on Mutation$ForgotPassword {
  CopyWith$Mutation$ForgotPassword<Mutation$ForgotPassword> get copyWith =>
      CopyWith$Mutation$ForgotPassword(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$ForgotPassword<TRes> {
  factory CopyWith$Mutation$ForgotPassword(
    Mutation$ForgotPassword instance,
    TRes Function(Mutation$ForgotPassword) then,
  ) = _CopyWithImpl$Mutation$ForgotPassword;

  factory CopyWith$Mutation$ForgotPassword.stub(TRes res) =
      _CopyWithStubImpl$Mutation$ForgotPassword;

  TRes call({
    Mutation$ForgotPassword$forgotPassword? forgotPassword,
    String? $__typename,
  });
  CopyWith$Mutation$ForgotPassword$forgotPassword<TRes> get forgotPassword;
}

class _CopyWithImpl$Mutation$ForgotPassword<TRes>
    implements CopyWith$Mutation$ForgotPassword<TRes> {
  _CopyWithImpl$Mutation$ForgotPassword(
    this._instance,
    this._then,
  );

  final Mutation$ForgotPassword _instance;

  final TRes Function(Mutation$ForgotPassword) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? forgotPassword = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$ForgotPassword(
        forgotPassword: forgotPassword == _undefined
            ? _instance.forgotPassword
            : (forgotPassword as Mutation$ForgotPassword$forgotPassword?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$ForgotPassword$forgotPassword<TRes> get forgotPassword {
    final local$forgotPassword = _instance.forgotPassword;
    return local$forgotPassword == null
        ? CopyWith$Mutation$ForgotPassword$forgotPassword.stub(_then(_instance))
        : CopyWith$Mutation$ForgotPassword$forgotPassword(
            local$forgotPassword, (e) => call(forgotPassword: e));
  }
}

class _CopyWithStubImpl$Mutation$ForgotPassword<TRes>
    implements CopyWith$Mutation$ForgotPassword<TRes> {
  _CopyWithStubImpl$Mutation$ForgotPassword(this._res);

  TRes _res;

  call({
    Mutation$ForgotPassword$forgotPassword? forgotPassword,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$ForgotPassword$forgotPassword<TRes> get forgotPassword =>
      CopyWith$Mutation$ForgotPassword$forgotPassword.stub(_res);
}

const documentNodeMutationForgotPassword = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'ForgotPassword'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'email')),
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
        name: NameNode(value: 'forgotPassword'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'email'),
            value: VariableNode(name: NameNode(value: 'email')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'success'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'message'),
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
Mutation$ForgotPassword _parserFn$Mutation$ForgotPassword(
        Map<String, dynamic> data) =>
    Mutation$ForgotPassword.fromJson(data);
typedef OnMutationCompleted$Mutation$ForgotPassword = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$ForgotPassword?,
);

class Options$Mutation$ForgotPassword
    extends graphql.MutationOptions<Mutation$ForgotPassword> {
  Options$Mutation$ForgotPassword({
    String? operationName,
    required Variables$Mutation$ForgotPassword variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$ForgotPassword? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$ForgotPassword? onCompleted,
    graphql.OnMutationUpdate<Mutation$ForgotPassword>? update,
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
                    data == null
                        ? null
                        : _parserFn$Mutation$ForgotPassword(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationForgotPassword,
          parserFn: _parserFn$Mutation$ForgotPassword,
        );

  final OnMutationCompleted$Mutation$ForgotPassword? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$ForgotPassword
    extends graphql.WatchQueryOptions<Mutation$ForgotPassword> {
  WatchOptions$Mutation$ForgotPassword({
    String? operationName,
    required Variables$Mutation$ForgotPassword variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$ForgotPassword? typedOptimisticResult,
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
          document: documentNodeMutationForgotPassword,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$ForgotPassword,
        );
}

extension ClientExtension$Mutation$ForgotPassword on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$ForgotPassword>> mutate$ForgotPassword(
          Options$Mutation$ForgotPassword options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$ForgotPassword> watchMutation$ForgotPassword(
          WatchOptions$Mutation$ForgotPassword options) =>
      this.watchMutation(options);
}

class Mutation$ForgotPassword$HookResult {
  Mutation$ForgotPassword$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$ForgotPassword runMutation;

  final graphql.QueryResult<Mutation$ForgotPassword> result;
}

Mutation$ForgotPassword$HookResult useMutation$ForgotPassword(
    [WidgetOptions$Mutation$ForgotPassword? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$ForgotPassword());
  return Mutation$ForgotPassword$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$ForgotPassword>
    useWatchMutation$ForgotPassword(
            WatchOptions$Mutation$ForgotPassword options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$ForgotPassword
    extends graphql.MutationOptions<Mutation$ForgotPassword> {
  WidgetOptions$Mutation$ForgotPassword({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$ForgotPassword? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$ForgotPassword? onCompleted,
    graphql.OnMutationUpdate<Mutation$ForgotPassword>? update,
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
                    data == null
                        ? null
                        : _parserFn$Mutation$ForgotPassword(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationForgotPassword,
          parserFn: _parserFn$Mutation$ForgotPassword,
        );

  final OnMutationCompleted$Mutation$ForgotPassword? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$ForgotPassword
    = graphql.MultiSourceResult<Mutation$ForgotPassword> Function(
  Variables$Mutation$ForgotPassword, {
  Object? optimisticResult,
  Mutation$ForgotPassword? typedOptimisticResult,
});
typedef Builder$Mutation$ForgotPassword = widgets.Widget Function(
  RunMutation$Mutation$ForgotPassword,
  graphql.QueryResult<Mutation$ForgotPassword>?,
);

class Mutation$ForgotPassword$Widget
    extends graphql_flutter.Mutation<Mutation$ForgotPassword> {
  Mutation$ForgotPassword$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$ForgotPassword? options,
    required Builder$Mutation$ForgotPassword builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$ForgotPassword(),
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

class Mutation$ForgotPassword$forgotPassword {
  Mutation$ForgotPassword$forgotPassword({
    this.success,
    this.message,
    this.$__typename = 'ForgotPassword',
  });

  factory Mutation$ForgotPassword$forgotPassword.fromJson(
      Map<String, dynamic> json) {
    final l$success = json['success'];
    final l$message = json['message'];
    final l$$__typename = json['__typename'];
    return Mutation$ForgotPassword$forgotPassword(
      success: (l$success as bool?),
      message: (l$message as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? success;

  final String? message;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$success = success;
    _resultData['success'] = l$success;
    final l$message = message;
    _resultData['message'] = l$message;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$success = success;
    final l$message = message;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$success,
      l$message,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$ForgotPassword$forgotPassword ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$success = success;
    final lOther$success = other.success;
    if (l$success != lOther$success) {
      return false;
    }
    final l$message = message;
    final lOther$message = other.message;
    if (l$message != lOther$message) {
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

extension UtilityExtension$Mutation$ForgotPassword$forgotPassword
    on Mutation$ForgotPassword$forgotPassword {
  CopyWith$Mutation$ForgotPassword$forgotPassword<
          Mutation$ForgotPassword$forgotPassword>
      get copyWith => CopyWith$Mutation$ForgotPassword$forgotPassword(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$ForgotPassword$forgotPassword<TRes> {
  factory CopyWith$Mutation$ForgotPassword$forgotPassword(
    Mutation$ForgotPassword$forgotPassword instance,
    TRes Function(Mutation$ForgotPassword$forgotPassword) then,
  ) = _CopyWithImpl$Mutation$ForgotPassword$forgotPassword;

  factory CopyWith$Mutation$ForgotPassword$forgotPassword.stub(TRes res) =
      _CopyWithStubImpl$Mutation$ForgotPassword$forgotPassword;

  TRes call({
    bool? success,
    String? message,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$ForgotPassword$forgotPassword<TRes>
    implements CopyWith$Mutation$ForgotPassword$forgotPassword<TRes> {
  _CopyWithImpl$Mutation$ForgotPassword$forgotPassword(
    this._instance,
    this._then,
  );

  final Mutation$ForgotPassword$forgotPassword _instance;

  final TRes Function(Mutation$ForgotPassword$forgotPassword) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? success = _undefined,
    Object? message = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$ForgotPassword$forgotPassword(
        success: success == _undefined ? _instance.success : (success as bool?),
        message:
            message == _undefined ? _instance.message : (message as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$ForgotPassword$forgotPassword<TRes>
    implements CopyWith$Mutation$ForgotPassword$forgotPassword<TRes> {
  _CopyWithStubImpl$Mutation$ForgotPassword$forgotPassword(this._res);

  TRes _res;

  call({
    bool? success,
    String? message,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$ResetPassword {
  factory Variables$Mutation$ResetPassword({
    required String uid,
    required String token,
    required String newPassword,
  }) =>
      Variables$Mutation$ResetPassword._({
        r'uid': uid,
        r'token': token,
        r'newPassword': newPassword,
      });

  Variables$Mutation$ResetPassword._(this._$data);

  factory Variables$Mutation$ResetPassword.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$uid = data['uid'];
    result$data['uid'] = (l$uid as String);
    final l$token = data['token'];
    result$data['token'] = (l$token as String);
    final l$newPassword = data['newPassword'];
    result$data['newPassword'] = (l$newPassword as String);
    return Variables$Mutation$ResetPassword._(result$data);
  }

  Map<String, dynamic> _$data;

  String get uid => (_$data['uid'] as String);

  String get token => (_$data['token'] as String);

  String get newPassword => (_$data['newPassword'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$uid = uid;
    result$data['uid'] = l$uid;
    final l$token = token;
    result$data['token'] = l$token;
    final l$newPassword = newPassword;
    result$data['newPassword'] = l$newPassword;
    return result$data;
  }

  CopyWith$Variables$Mutation$ResetPassword<Variables$Mutation$ResetPassword>
      get copyWith => CopyWith$Variables$Mutation$ResetPassword(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$ResetPassword ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$uid = uid;
    final lOther$uid = other.uid;
    if (l$uid != lOther$uid) {
      return false;
    }
    final l$token = token;
    final lOther$token = other.token;
    if (l$token != lOther$token) {
      return false;
    }
    final l$newPassword = newPassword;
    final lOther$newPassword = other.newPassword;
    if (l$newPassword != lOther$newPassword) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$uid = uid;
    final l$token = token;
    final l$newPassword = newPassword;
    return Object.hashAll([
      l$uid,
      l$token,
      l$newPassword,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$ResetPassword<TRes> {
  factory CopyWith$Variables$Mutation$ResetPassword(
    Variables$Mutation$ResetPassword instance,
    TRes Function(Variables$Mutation$ResetPassword) then,
  ) = _CopyWithImpl$Variables$Mutation$ResetPassword;

  factory CopyWith$Variables$Mutation$ResetPassword.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$ResetPassword;

  TRes call({
    String? uid,
    String? token,
    String? newPassword,
  });
}

class _CopyWithImpl$Variables$Mutation$ResetPassword<TRes>
    implements CopyWith$Variables$Mutation$ResetPassword<TRes> {
  _CopyWithImpl$Variables$Mutation$ResetPassword(
    this._instance,
    this._then,
  );

  final Variables$Mutation$ResetPassword _instance;

  final TRes Function(Variables$Mutation$ResetPassword) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? uid = _undefined,
    Object? token = _undefined,
    Object? newPassword = _undefined,
  }) =>
      _then(Variables$Mutation$ResetPassword._({
        ..._instance._$data,
        if (uid != _undefined && uid != null) 'uid': (uid as String),
        if (token != _undefined && token != null) 'token': (token as String),
        if (newPassword != _undefined && newPassword != null)
          'newPassword': (newPassword as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$ResetPassword<TRes>
    implements CopyWith$Variables$Mutation$ResetPassword<TRes> {
  _CopyWithStubImpl$Variables$Mutation$ResetPassword(this._res);

  TRes _res;

  call({
    String? uid,
    String? token,
    String? newPassword,
  }) =>
      _res;
}

class Mutation$ResetPassword {
  Mutation$ResetPassword({
    this.resetPassword,
    this.$__typename = 'Mutation',
  });

  factory Mutation$ResetPassword.fromJson(Map<String, dynamic> json) {
    final l$resetPassword = json['resetPassword'];
    final l$$__typename = json['__typename'];
    return Mutation$ResetPassword(
      resetPassword: l$resetPassword == null
          ? null
          : Mutation$ResetPassword$resetPassword.fromJson(
              (l$resetPassword as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$ResetPassword$resetPassword? resetPassword;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$resetPassword = resetPassword;
    _resultData['resetPassword'] = l$resetPassword?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$resetPassword = resetPassword;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$resetPassword,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$ResetPassword || runtimeType != other.runtimeType) {
      return false;
    }
    final l$resetPassword = resetPassword;
    final lOther$resetPassword = other.resetPassword;
    if (l$resetPassword != lOther$resetPassword) {
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

extension UtilityExtension$Mutation$ResetPassword on Mutation$ResetPassword {
  CopyWith$Mutation$ResetPassword<Mutation$ResetPassword> get copyWith =>
      CopyWith$Mutation$ResetPassword(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$ResetPassword<TRes> {
  factory CopyWith$Mutation$ResetPassword(
    Mutation$ResetPassword instance,
    TRes Function(Mutation$ResetPassword) then,
  ) = _CopyWithImpl$Mutation$ResetPassword;

  factory CopyWith$Mutation$ResetPassword.stub(TRes res) =
      _CopyWithStubImpl$Mutation$ResetPassword;

  TRes call({
    Mutation$ResetPassword$resetPassword? resetPassword,
    String? $__typename,
  });
  CopyWith$Mutation$ResetPassword$resetPassword<TRes> get resetPassword;
}

class _CopyWithImpl$Mutation$ResetPassword<TRes>
    implements CopyWith$Mutation$ResetPassword<TRes> {
  _CopyWithImpl$Mutation$ResetPassword(
    this._instance,
    this._then,
  );

  final Mutation$ResetPassword _instance;

  final TRes Function(Mutation$ResetPassword) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? resetPassword = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$ResetPassword(
        resetPassword: resetPassword == _undefined
            ? _instance.resetPassword
            : (resetPassword as Mutation$ResetPassword$resetPassword?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$ResetPassword$resetPassword<TRes> get resetPassword {
    final local$resetPassword = _instance.resetPassword;
    return local$resetPassword == null
        ? CopyWith$Mutation$ResetPassword$resetPassword.stub(_then(_instance))
        : CopyWith$Mutation$ResetPassword$resetPassword(
            local$resetPassword, (e) => call(resetPassword: e));
  }
}

class _CopyWithStubImpl$Mutation$ResetPassword<TRes>
    implements CopyWith$Mutation$ResetPassword<TRes> {
  _CopyWithStubImpl$Mutation$ResetPassword(this._res);

  TRes _res;

  call({
    Mutation$ResetPassword$resetPassword? resetPassword,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$ResetPassword$resetPassword<TRes> get resetPassword =>
      CopyWith$Mutation$ResetPassword$resetPassword.stub(_res);
}

const documentNodeMutationResetPassword = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'ResetPassword'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'uid')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'token')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'newPassword')),
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
        name: NameNode(value: 'resetPassword'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'uid'),
            value: VariableNode(name: NameNode(value: 'uid')),
          ),
          ArgumentNode(
            name: NameNode(value: 'token'),
            value: VariableNode(name: NameNode(value: 'token')),
          ),
          ArgumentNode(
            name: NameNode(value: 'newPassword'),
            value: VariableNode(name: NameNode(value: 'newPassword')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'success'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'message'),
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
Mutation$ResetPassword _parserFn$Mutation$ResetPassword(
        Map<String, dynamic> data) =>
    Mutation$ResetPassword.fromJson(data);
typedef OnMutationCompleted$Mutation$ResetPassword = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$ResetPassword?,
);

class Options$Mutation$ResetPassword
    extends graphql.MutationOptions<Mutation$ResetPassword> {
  Options$Mutation$ResetPassword({
    String? operationName,
    required Variables$Mutation$ResetPassword variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$ResetPassword? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$ResetPassword? onCompleted,
    graphql.OnMutationUpdate<Mutation$ResetPassword>? update,
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
                    data == null
                        ? null
                        : _parserFn$Mutation$ResetPassword(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationResetPassword,
          parserFn: _parserFn$Mutation$ResetPassword,
        );

  final OnMutationCompleted$Mutation$ResetPassword? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$ResetPassword
    extends graphql.WatchQueryOptions<Mutation$ResetPassword> {
  WatchOptions$Mutation$ResetPassword({
    String? operationName,
    required Variables$Mutation$ResetPassword variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$ResetPassword? typedOptimisticResult,
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
          document: documentNodeMutationResetPassword,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$ResetPassword,
        );
}

extension ClientExtension$Mutation$ResetPassword on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$ResetPassword>> mutate$ResetPassword(
          Options$Mutation$ResetPassword options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$ResetPassword> watchMutation$ResetPassword(
          WatchOptions$Mutation$ResetPassword options) =>
      this.watchMutation(options);
}

class Mutation$ResetPassword$HookResult {
  Mutation$ResetPassword$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$ResetPassword runMutation;

  final graphql.QueryResult<Mutation$ResetPassword> result;
}

Mutation$ResetPassword$HookResult useMutation$ResetPassword(
    [WidgetOptions$Mutation$ResetPassword? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$ResetPassword());
  return Mutation$ResetPassword$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$ResetPassword> useWatchMutation$ResetPassword(
        WatchOptions$Mutation$ResetPassword options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$ResetPassword
    extends graphql.MutationOptions<Mutation$ResetPassword> {
  WidgetOptions$Mutation$ResetPassword({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$ResetPassword? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$ResetPassword? onCompleted,
    graphql.OnMutationUpdate<Mutation$ResetPassword>? update,
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
                    data == null
                        ? null
                        : _parserFn$Mutation$ResetPassword(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationResetPassword,
          parserFn: _parserFn$Mutation$ResetPassword,
        );

  final OnMutationCompleted$Mutation$ResetPassword? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$ResetPassword
    = graphql.MultiSourceResult<Mutation$ResetPassword> Function(
  Variables$Mutation$ResetPassword, {
  Object? optimisticResult,
  Mutation$ResetPassword? typedOptimisticResult,
});
typedef Builder$Mutation$ResetPassword = widgets.Widget Function(
  RunMutation$Mutation$ResetPassword,
  graphql.QueryResult<Mutation$ResetPassword>?,
);

class Mutation$ResetPassword$Widget
    extends graphql_flutter.Mutation<Mutation$ResetPassword> {
  Mutation$ResetPassword$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$ResetPassword? options,
    required Builder$Mutation$ResetPassword builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$ResetPassword(),
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

class Mutation$ResetPassword$resetPassword {
  Mutation$ResetPassword$resetPassword({
    this.success,
    this.message,
    this.$__typename = 'ResetPassword',
  });

  factory Mutation$ResetPassword$resetPassword.fromJson(
      Map<String, dynamic> json) {
    final l$success = json['success'];
    final l$message = json['message'];
    final l$$__typename = json['__typename'];
    return Mutation$ResetPassword$resetPassword(
      success: (l$success as bool?),
      message: (l$message as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? success;

  final String? message;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$success = success;
    _resultData['success'] = l$success;
    final l$message = message;
    _resultData['message'] = l$message;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$success = success;
    final l$message = message;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$success,
      l$message,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$ResetPassword$resetPassword ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$success = success;
    final lOther$success = other.success;
    if (l$success != lOther$success) {
      return false;
    }
    final l$message = message;
    final lOther$message = other.message;
    if (l$message != lOther$message) {
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

extension UtilityExtension$Mutation$ResetPassword$resetPassword
    on Mutation$ResetPassword$resetPassword {
  CopyWith$Mutation$ResetPassword$resetPassword<
          Mutation$ResetPassword$resetPassword>
      get copyWith => CopyWith$Mutation$ResetPassword$resetPassword(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$ResetPassword$resetPassword<TRes> {
  factory CopyWith$Mutation$ResetPassword$resetPassword(
    Mutation$ResetPassword$resetPassword instance,
    TRes Function(Mutation$ResetPassword$resetPassword) then,
  ) = _CopyWithImpl$Mutation$ResetPassword$resetPassword;

  factory CopyWith$Mutation$ResetPassword$resetPassword.stub(TRes res) =
      _CopyWithStubImpl$Mutation$ResetPassword$resetPassword;

  TRes call({
    bool? success,
    String? message,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$ResetPassword$resetPassword<TRes>
    implements CopyWith$Mutation$ResetPassword$resetPassword<TRes> {
  _CopyWithImpl$Mutation$ResetPassword$resetPassword(
    this._instance,
    this._then,
  );

  final Mutation$ResetPassword$resetPassword _instance;

  final TRes Function(Mutation$ResetPassword$resetPassword) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? success = _undefined,
    Object? message = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$ResetPassword$resetPassword(
        success: success == _undefined ? _instance.success : (success as bool?),
        message:
            message == _undefined ? _instance.message : (message as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$ResetPassword$resetPassword<TRes>
    implements CopyWith$Mutation$ResetPassword$resetPassword<TRes> {
  _CopyWithStubImpl$Mutation$ResetPassword$resetPassword(this._res);

  TRes _res;

  call({
    bool? success,
    String? message,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$ChangePassword {
  factory Variables$Mutation$ChangePassword({
    required String oldPassword,
    required String newPassword,
  }) =>
      Variables$Mutation$ChangePassword._({
        r'oldPassword': oldPassword,
        r'newPassword': newPassword,
      });

  Variables$Mutation$ChangePassword._(this._$data);

  factory Variables$Mutation$ChangePassword.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$oldPassword = data['oldPassword'];
    result$data['oldPassword'] = (l$oldPassword as String);
    final l$newPassword = data['newPassword'];
    result$data['newPassword'] = (l$newPassword as String);
    return Variables$Mutation$ChangePassword._(result$data);
  }

  Map<String, dynamic> _$data;

  String get oldPassword => (_$data['oldPassword'] as String);

  String get newPassword => (_$data['newPassword'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$oldPassword = oldPassword;
    result$data['oldPassword'] = l$oldPassword;
    final l$newPassword = newPassword;
    result$data['newPassword'] = l$newPassword;
    return result$data;
  }

  CopyWith$Variables$Mutation$ChangePassword<Variables$Mutation$ChangePassword>
      get copyWith => CopyWith$Variables$Mutation$ChangePassword(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$ChangePassword ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$oldPassword = oldPassword;
    final lOther$oldPassword = other.oldPassword;
    if (l$oldPassword != lOther$oldPassword) {
      return false;
    }
    final l$newPassword = newPassword;
    final lOther$newPassword = other.newPassword;
    if (l$newPassword != lOther$newPassword) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$oldPassword = oldPassword;
    final l$newPassword = newPassword;
    return Object.hashAll([
      l$oldPassword,
      l$newPassword,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$ChangePassword<TRes> {
  factory CopyWith$Variables$Mutation$ChangePassword(
    Variables$Mutation$ChangePassword instance,
    TRes Function(Variables$Mutation$ChangePassword) then,
  ) = _CopyWithImpl$Variables$Mutation$ChangePassword;

  factory CopyWith$Variables$Mutation$ChangePassword.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$ChangePassword;

  TRes call({
    String? oldPassword,
    String? newPassword,
  });
}

class _CopyWithImpl$Variables$Mutation$ChangePassword<TRes>
    implements CopyWith$Variables$Mutation$ChangePassword<TRes> {
  _CopyWithImpl$Variables$Mutation$ChangePassword(
    this._instance,
    this._then,
  );

  final Variables$Mutation$ChangePassword _instance;

  final TRes Function(Variables$Mutation$ChangePassword) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? oldPassword = _undefined,
    Object? newPassword = _undefined,
  }) =>
      _then(Variables$Mutation$ChangePassword._({
        ..._instance._$data,
        if (oldPassword != _undefined && oldPassword != null)
          'oldPassword': (oldPassword as String),
        if (newPassword != _undefined && newPassword != null)
          'newPassword': (newPassword as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$ChangePassword<TRes>
    implements CopyWith$Variables$Mutation$ChangePassword<TRes> {
  _CopyWithStubImpl$Variables$Mutation$ChangePassword(this._res);

  TRes _res;

  call({
    String? oldPassword,
    String? newPassword,
  }) =>
      _res;
}

class Mutation$ChangePassword {
  Mutation$ChangePassword({
    this.changePassword,
    this.$__typename = 'Mutation',
  });

  factory Mutation$ChangePassword.fromJson(Map<String, dynamic> json) {
    final l$changePassword = json['changePassword'];
    final l$$__typename = json['__typename'];
    return Mutation$ChangePassword(
      changePassword: l$changePassword == null
          ? null
          : Mutation$ChangePassword$changePassword.fromJson(
              (l$changePassword as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$ChangePassword$changePassword? changePassword;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$changePassword = changePassword;
    _resultData['changePassword'] = l$changePassword?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$changePassword = changePassword;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$changePassword,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$ChangePassword || runtimeType != other.runtimeType) {
      return false;
    }
    final l$changePassword = changePassword;
    final lOther$changePassword = other.changePassword;
    if (l$changePassword != lOther$changePassword) {
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

extension UtilityExtension$Mutation$ChangePassword on Mutation$ChangePassword {
  CopyWith$Mutation$ChangePassword<Mutation$ChangePassword> get copyWith =>
      CopyWith$Mutation$ChangePassword(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$ChangePassword<TRes> {
  factory CopyWith$Mutation$ChangePassword(
    Mutation$ChangePassword instance,
    TRes Function(Mutation$ChangePassword) then,
  ) = _CopyWithImpl$Mutation$ChangePassword;

  factory CopyWith$Mutation$ChangePassword.stub(TRes res) =
      _CopyWithStubImpl$Mutation$ChangePassword;

  TRes call({
    Mutation$ChangePassword$changePassword? changePassword,
    String? $__typename,
  });
  CopyWith$Mutation$ChangePassword$changePassword<TRes> get changePassword;
}

class _CopyWithImpl$Mutation$ChangePassword<TRes>
    implements CopyWith$Mutation$ChangePassword<TRes> {
  _CopyWithImpl$Mutation$ChangePassword(
    this._instance,
    this._then,
  );

  final Mutation$ChangePassword _instance;

  final TRes Function(Mutation$ChangePassword) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? changePassword = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$ChangePassword(
        changePassword: changePassword == _undefined
            ? _instance.changePassword
            : (changePassword as Mutation$ChangePassword$changePassword?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$ChangePassword$changePassword<TRes> get changePassword {
    final local$changePassword = _instance.changePassword;
    return local$changePassword == null
        ? CopyWith$Mutation$ChangePassword$changePassword.stub(_then(_instance))
        : CopyWith$Mutation$ChangePassword$changePassword(
            local$changePassword, (e) => call(changePassword: e));
  }
}

class _CopyWithStubImpl$Mutation$ChangePassword<TRes>
    implements CopyWith$Mutation$ChangePassword<TRes> {
  _CopyWithStubImpl$Mutation$ChangePassword(this._res);

  TRes _res;

  call({
    Mutation$ChangePassword$changePassword? changePassword,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$ChangePassword$changePassword<TRes> get changePassword =>
      CopyWith$Mutation$ChangePassword$changePassword.stub(_res);
}

const documentNodeMutationChangePassword = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'ChangePassword'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'oldPassword')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'newPassword')),
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
        name: NameNode(value: 'changePassword'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'oldPassword'),
            value: VariableNode(name: NameNode(value: 'oldPassword')),
          ),
          ArgumentNode(
            name: NameNode(value: 'newPassword'),
            value: VariableNode(name: NameNode(value: 'newPassword')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'success'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'message'),
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
Mutation$ChangePassword _parserFn$Mutation$ChangePassword(
        Map<String, dynamic> data) =>
    Mutation$ChangePassword.fromJson(data);
typedef OnMutationCompleted$Mutation$ChangePassword = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$ChangePassword?,
);

class Options$Mutation$ChangePassword
    extends graphql.MutationOptions<Mutation$ChangePassword> {
  Options$Mutation$ChangePassword({
    String? operationName,
    required Variables$Mutation$ChangePassword variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$ChangePassword? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$ChangePassword? onCompleted,
    graphql.OnMutationUpdate<Mutation$ChangePassword>? update,
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
                    data == null
                        ? null
                        : _parserFn$Mutation$ChangePassword(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationChangePassword,
          parserFn: _parserFn$Mutation$ChangePassword,
        );

  final OnMutationCompleted$Mutation$ChangePassword? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$ChangePassword
    extends graphql.WatchQueryOptions<Mutation$ChangePassword> {
  WatchOptions$Mutation$ChangePassword({
    String? operationName,
    required Variables$Mutation$ChangePassword variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$ChangePassword? typedOptimisticResult,
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
          document: documentNodeMutationChangePassword,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$ChangePassword,
        );
}

extension ClientExtension$Mutation$ChangePassword on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$ChangePassword>> mutate$ChangePassword(
          Options$Mutation$ChangePassword options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$ChangePassword> watchMutation$ChangePassword(
          WatchOptions$Mutation$ChangePassword options) =>
      this.watchMutation(options);
}

class Mutation$ChangePassword$HookResult {
  Mutation$ChangePassword$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$ChangePassword runMutation;

  final graphql.QueryResult<Mutation$ChangePassword> result;
}

Mutation$ChangePassword$HookResult useMutation$ChangePassword(
    [WidgetOptions$Mutation$ChangePassword? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$ChangePassword());
  return Mutation$ChangePassword$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$ChangePassword>
    useWatchMutation$ChangePassword(
            WatchOptions$Mutation$ChangePassword options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$ChangePassword
    extends graphql.MutationOptions<Mutation$ChangePassword> {
  WidgetOptions$Mutation$ChangePassword({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$ChangePassword? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$ChangePassword? onCompleted,
    graphql.OnMutationUpdate<Mutation$ChangePassword>? update,
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
                    data == null
                        ? null
                        : _parserFn$Mutation$ChangePassword(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationChangePassword,
          parserFn: _parserFn$Mutation$ChangePassword,
        );

  final OnMutationCompleted$Mutation$ChangePassword? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$ChangePassword
    = graphql.MultiSourceResult<Mutation$ChangePassword> Function(
  Variables$Mutation$ChangePassword, {
  Object? optimisticResult,
  Mutation$ChangePassword? typedOptimisticResult,
});
typedef Builder$Mutation$ChangePassword = widgets.Widget Function(
  RunMutation$Mutation$ChangePassword,
  graphql.QueryResult<Mutation$ChangePassword>?,
);

class Mutation$ChangePassword$Widget
    extends graphql_flutter.Mutation<Mutation$ChangePassword> {
  Mutation$ChangePassword$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$ChangePassword? options,
    required Builder$Mutation$ChangePassword builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$ChangePassword(),
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

class Mutation$ChangePassword$changePassword {
  Mutation$ChangePassword$changePassword({
    this.success,
    this.message,
    this.$__typename = 'ChangePassword',
  });

  factory Mutation$ChangePassword$changePassword.fromJson(
      Map<String, dynamic> json) {
    final l$success = json['success'];
    final l$message = json['message'];
    final l$$__typename = json['__typename'];
    return Mutation$ChangePassword$changePassword(
      success: (l$success as bool?),
      message: (l$message as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? success;

  final String? message;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$success = success;
    _resultData['success'] = l$success;
    final l$message = message;
    _resultData['message'] = l$message;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$success = success;
    final l$message = message;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$success,
      l$message,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$ChangePassword$changePassword ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$success = success;
    final lOther$success = other.success;
    if (l$success != lOther$success) {
      return false;
    }
    final l$message = message;
    final lOther$message = other.message;
    if (l$message != lOther$message) {
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

extension UtilityExtension$Mutation$ChangePassword$changePassword
    on Mutation$ChangePassword$changePassword {
  CopyWith$Mutation$ChangePassword$changePassword<
          Mutation$ChangePassword$changePassword>
      get copyWith => CopyWith$Mutation$ChangePassword$changePassword(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$ChangePassword$changePassword<TRes> {
  factory CopyWith$Mutation$ChangePassword$changePassword(
    Mutation$ChangePassword$changePassword instance,
    TRes Function(Mutation$ChangePassword$changePassword) then,
  ) = _CopyWithImpl$Mutation$ChangePassword$changePassword;

  factory CopyWith$Mutation$ChangePassword$changePassword.stub(TRes res) =
      _CopyWithStubImpl$Mutation$ChangePassword$changePassword;

  TRes call({
    bool? success,
    String? message,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$ChangePassword$changePassword<TRes>
    implements CopyWith$Mutation$ChangePassword$changePassword<TRes> {
  _CopyWithImpl$Mutation$ChangePassword$changePassword(
    this._instance,
    this._then,
  );

  final Mutation$ChangePassword$changePassword _instance;

  final TRes Function(Mutation$ChangePassword$changePassword) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? success = _undefined,
    Object? message = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$ChangePassword$changePassword(
        success: success == _undefined ? _instance.success : (success as bool?),
        message:
            message == _undefined ? _instance.message : (message as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$ChangePassword$changePassword<TRes>
    implements CopyWith$Mutation$ChangePassword$changePassword<TRes> {
  _CopyWithStubImpl$Mutation$ChangePassword$changePassword(this._res);

  TRes _res;

  call({
    bool? success,
    String? message,
    String? $__typename,
  }) =>
      _res;
}
