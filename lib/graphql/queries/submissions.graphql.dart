import '../../schema.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Fragment$SubmissionListItem {
  Fragment$SubmissionListItem({
    required this.id,
    this.localId,
    this.title,
    required this.submittedAt,
    required this.status,
    required this.answers,
    this.$__typename = 'SubmissionNode',
  });

  factory Fragment$SubmissionListItem.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$localId = json['localId'];
    final l$title = json['title'];
    final l$submittedAt = json['submittedAt'];
    final l$status = json['status'];
    final l$answers = json['answers'];
    final l$$__typename = json['__typename'];
    return Fragment$SubmissionListItem(
      id: (l$id as String),
      localId: (l$localId as String?),
      title: (l$title as String?),
      submittedAt: DateTime.parse((l$submittedAt as String)),
      status: fromJson$Enum$SurveySubmissionStatusChoices((l$status as String)),
      answers: Fragment$SubmissionListItem$answers.fromJson(
          (l$answers as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String? localId;

  final String? title;

  final DateTime submittedAt;

  final Enum$SurveySubmissionStatusChoices status;

  final Fragment$SubmissionListItem$answers answers;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$localId = localId;
    _resultData['localId'] = l$localId;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$submittedAt = submittedAt;
    _resultData['submittedAt'] = l$submittedAt.toIso8601String();
    final l$status = status;
    _resultData['status'] = toJson$Enum$SurveySubmissionStatusChoices(l$status);
    final l$answers = answers;
    _resultData['answers'] = l$answers.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$localId = localId;
    final l$title = title;
    final l$submittedAt = submittedAt;
    final l$status = status;
    final l$answers = answers;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$localId,
      l$title,
      l$submittedAt,
      l$status,
      l$answers,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$SubmissionListItem ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$localId = localId;
    final lOther$localId = other.localId;
    if (l$localId != lOther$localId) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
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

extension UtilityExtension$Fragment$SubmissionListItem
    on Fragment$SubmissionListItem {
  CopyWith$Fragment$SubmissionListItem<Fragment$SubmissionListItem>
      get copyWith => CopyWith$Fragment$SubmissionListItem(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$SubmissionListItem<TRes> {
  factory CopyWith$Fragment$SubmissionListItem(
    Fragment$SubmissionListItem instance,
    TRes Function(Fragment$SubmissionListItem) then,
  ) = _CopyWithImpl$Fragment$SubmissionListItem;

  factory CopyWith$Fragment$SubmissionListItem.stub(TRes res) =
      _CopyWithStubImpl$Fragment$SubmissionListItem;

  TRes call({
    String? id,
    String? localId,
    String? title,
    DateTime? submittedAt,
    Enum$SurveySubmissionStatusChoices? status,
    Fragment$SubmissionListItem$answers? answers,
    String? $__typename,
  });
  CopyWith$Fragment$SubmissionListItem$answers<TRes> get answers;
}

class _CopyWithImpl$Fragment$SubmissionListItem<TRes>
    implements CopyWith$Fragment$SubmissionListItem<TRes> {
  _CopyWithImpl$Fragment$SubmissionListItem(
    this._instance,
    this._then,
  );

  final Fragment$SubmissionListItem _instance;

  final TRes Function(Fragment$SubmissionListItem) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? localId = _undefined,
    Object? title = _undefined,
    Object? submittedAt = _undefined,
    Object? status = _undefined,
    Object? answers = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$SubmissionListItem(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        localId:
            localId == _undefined ? _instance.localId : (localId as String?),
        title: title == _undefined ? _instance.title : (title as String?),
        submittedAt: submittedAt == _undefined || submittedAt == null
            ? _instance.submittedAt
            : (submittedAt as DateTime),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as Enum$SurveySubmissionStatusChoices),
        answers: answers == _undefined || answers == null
            ? _instance.answers
            : (answers as Fragment$SubmissionListItem$answers),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$SubmissionListItem$answers<TRes> get answers {
    final local$answers = _instance.answers;
    return CopyWith$Fragment$SubmissionListItem$answers(
        local$answers, (e) => call(answers: e));
  }
}

class _CopyWithStubImpl$Fragment$SubmissionListItem<TRes>
    implements CopyWith$Fragment$SubmissionListItem<TRes> {
  _CopyWithStubImpl$Fragment$SubmissionListItem(this._res);

  TRes _res;

  call({
    String? id,
    String? localId,
    String? title,
    DateTime? submittedAt,
    Enum$SurveySubmissionStatusChoices? status,
    Fragment$SubmissionListItem$answers? answers,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$SubmissionListItem$answers<TRes> get answers =>
      CopyWith$Fragment$SubmissionListItem$answers.stub(_res);
}

const fragmentDefinitionSubmissionListItem = FragmentDefinitionNode(
  name: NameNode(value: 'SubmissionListItem'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'SubmissionNode'),
    isNonNull: false,
  )),
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
      name: NameNode(value: 'localId'),
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
);
const documentNodeFragmentSubmissionListItem = DocumentNode(definitions: [
  fragmentDefinitionSubmissionListItem,
]);

extension ClientExtension$Fragment$SubmissionListItem on graphql.GraphQLClient {
  void writeFragment$SubmissionListItem({
    required Fragment$SubmissionListItem data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'SubmissionListItem',
            document: documentNodeFragmentSubmissionListItem,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$SubmissionListItem? readFragment$SubmissionListItem({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'SubmissionListItem',
          document: documentNodeFragmentSubmissionListItem,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$SubmissionListItem.fromJson(result);
  }
}

class Fragment$SubmissionListItem$answers {
  Fragment$SubmissionListItem$answers({
    required this.edges,
    this.$__typename = 'SubmissionAnswerNodeConnection',
  });

  factory Fragment$SubmissionListItem$answers.fromJson(
      Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Fragment$SubmissionListItem$answers(
      edges: (l$edges as List<dynamic>)
          .map((e) => e == null
              ? null
              : Fragment$SubmissionListItem$answers$edges.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$SubmissionListItem$answers$edges?> edges;

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
    if (other is! Fragment$SubmissionListItem$answers ||
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

extension UtilityExtension$Fragment$SubmissionListItem$answers
    on Fragment$SubmissionListItem$answers {
  CopyWith$Fragment$SubmissionListItem$answers<
          Fragment$SubmissionListItem$answers>
      get copyWith => CopyWith$Fragment$SubmissionListItem$answers(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$SubmissionListItem$answers<TRes> {
  factory CopyWith$Fragment$SubmissionListItem$answers(
    Fragment$SubmissionListItem$answers instance,
    TRes Function(Fragment$SubmissionListItem$answers) then,
  ) = _CopyWithImpl$Fragment$SubmissionListItem$answers;

  factory CopyWith$Fragment$SubmissionListItem$answers.stub(TRes res) =
      _CopyWithStubImpl$Fragment$SubmissionListItem$answers;

  TRes call({
    List<Fragment$SubmissionListItem$answers$edges?>? edges,
    String? $__typename,
  });
  TRes edges(
      Iterable<Fragment$SubmissionListItem$answers$edges?> Function(
              Iterable<
                  CopyWith$Fragment$SubmissionListItem$answers$edges<
                      Fragment$SubmissionListItem$answers$edges>?>)
          _fn);
}

class _CopyWithImpl$Fragment$SubmissionListItem$answers<TRes>
    implements CopyWith$Fragment$SubmissionListItem$answers<TRes> {
  _CopyWithImpl$Fragment$SubmissionListItem$answers(
    this._instance,
    this._then,
  );

  final Fragment$SubmissionListItem$answers _instance;

  final TRes Function(Fragment$SubmissionListItem$answers) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$SubmissionListItem$answers(
        edges: edges == _undefined || edges == null
            ? _instance.edges
            : (edges as List<Fragment$SubmissionListItem$answers$edges?>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes edges(
          Iterable<Fragment$SubmissionListItem$answers$edges?> Function(
                  Iterable<
                      CopyWith$Fragment$SubmissionListItem$answers$edges<
                          Fragment$SubmissionListItem$answers$edges>?>)
              _fn) =>
      call(
          edges: _fn(_instance.edges.map((e) => e == null
              ? null
              : CopyWith$Fragment$SubmissionListItem$answers$edges(
                  e,
                  (i) => i,
                ))).toList());
}

class _CopyWithStubImpl$Fragment$SubmissionListItem$answers<TRes>
    implements CopyWith$Fragment$SubmissionListItem$answers<TRes> {
  _CopyWithStubImpl$Fragment$SubmissionListItem$answers(this._res);

  TRes _res;

  call({
    List<Fragment$SubmissionListItem$answers$edges?>? edges,
    String? $__typename,
  }) =>
      _res;

  edges(_fn) => _res;
}

class Fragment$SubmissionListItem$answers$edges {
  Fragment$SubmissionListItem$answers$edges({
    this.node,
    this.$__typename = 'SubmissionAnswerNodeEdge',
  });

  factory Fragment$SubmissionListItem$answers$edges.fromJson(
      Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Fragment$SubmissionListItem$answers$edges(
      node: l$node == null
          ? null
          : Fragment$SubmissionListItem$answers$edges$node.fromJson(
              (l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$SubmissionListItem$answers$edges$node? node;

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
    if (other is! Fragment$SubmissionListItem$answers$edges ||
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

extension UtilityExtension$Fragment$SubmissionListItem$answers$edges
    on Fragment$SubmissionListItem$answers$edges {
  CopyWith$Fragment$SubmissionListItem$answers$edges<
          Fragment$SubmissionListItem$answers$edges>
      get copyWith => CopyWith$Fragment$SubmissionListItem$answers$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$SubmissionListItem$answers$edges<TRes> {
  factory CopyWith$Fragment$SubmissionListItem$answers$edges(
    Fragment$SubmissionListItem$answers$edges instance,
    TRes Function(Fragment$SubmissionListItem$answers$edges) then,
  ) = _CopyWithImpl$Fragment$SubmissionListItem$answers$edges;

  factory CopyWith$Fragment$SubmissionListItem$answers$edges.stub(TRes res) =
      _CopyWithStubImpl$Fragment$SubmissionListItem$answers$edges;

  TRes call({
    Fragment$SubmissionListItem$answers$edges$node? node,
    String? $__typename,
  });
  CopyWith$Fragment$SubmissionListItem$answers$edges$node<TRes> get node;
}

class _CopyWithImpl$Fragment$SubmissionListItem$answers$edges<TRes>
    implements CopyWith$Fragment$SubmissionListItem$answers$edges<TRes> {
  _CopyWithImpl$Fragment$SubmissionListItem$answers$edges(
    this._instance,
    this._then,
  );

  final Fragment$SubmissionListItem$answers$edges _instance;

  final TRes Function(Fragment$SubmissionListItem$answers$edges) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$SubmissionListItem$answers$edges(
        node: node == _undefined
            ? _instance.node
            : (node as Fragment$SubmissionListItem$answers$edges$node?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$SubmissionListItem$answers$edges$node<TRes> get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Fragment$SubmissionListItem$answers$edges$node.stub(
            _then(_instance))
        : CopyWith$Fragment$SubmissionListItem$answers$edges$node(
            local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Fragment$SubmissionListItem$answers$edges<TRes>
    implements CopyWith$Fragment$SubmissionListItem$answers$edges<TRes> {
  _CopyWithStubImpl$Fragment$SubmissionListItem$answers$edges(this._res);

  TRes _res;

  call({
    Fragment$SubmissionListItem$answers$edges$node? node,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$SubmissionListItem$answers$edges$node<TRes> get node =>
      CopyWith$Fragment$SubmissionListItem$answers$edges$node.stub(_res);
}

class Fragment$SubmissionListItem$answers$edges$node {
  Fragment$SubmissionListItem$answers$edges$node({
    required this.id,
    this.$__typename = 'SubmissionAnswerNode',
  });

  factory Fragment$SubmissionListItem$answers$edges$node.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Fragment$SubmissionListItem$answers$edges$node(
      id: (l$id as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$SubmissionListItem$answers$edges$node ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Fragment$SubmissionListItem$answers$edges$node
    on Fragment$SubmissionListItem$answers$edges$node {
  CopyWith$Fragment$SubmissionListItem$answers$edges$node<
          Fragment$SubmissionListItem$answers$edges$node>
      get copyWith => CopyWith$Fragment$SubmissionListItem$answers$edges$node(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$SubmissionListItem$answers$edges$node<TRes> {
  factory CopyWith$Fragment$SubmissionListItem$answers$edges$node(
    Fragment$SubmissionListItem$answers$edges$node instance,
    TRes Function(Fragment$SubmissionListItem$answers$edges$node) then,
  ) = _CopyWithImpl$Fragment$SubmissionListItem$answers$edges$node;

  factory CopyWith$Fragment$SubmissionListItem$answers$edges$node.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$SubmissionListItem$answers$edges$node;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$SubmissionListItem$answers$edges$node<TRes>
    implements CopyWith$Fragment$SubmissionListItem$answers$edges$node<TRes> {
  _CopyWithImpl$Fragment$SubmissionListItem$answers$edges$node(
    this._instance,
    this._then,
  );

  final Fragment$SubmissionListItem$answers$edges$node _instance;

  final TRes Function(Fragment$SubmissionListItem$answers$edges$node) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$SubmissionListItem$answers$edges$node(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$SubmissionListItem$answers$edges$node<TRes>
    implements CopyWith$Fragment$SubmissionListItem$answers$edges$node<TRes> {
  _CopyWithStubImpl$Fragment$SubmissionListItem$answers$edges$node(this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$SubmissionFields {
  Fragment$SubmissionFields({
    required this.id,
    this.localId,
    this.title,
    required this.submittedAt,
    required this.survey,
    required this.status,
    required this.answers,
    this.$__typename = 'SubmissionNode',
  });

  factory Fragment$SubmissionFields.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$localId = json['localId'];
    final l$title = json['title'];
    final l$submittedAt = json['submittedAt'];
    final l$survey = json['survey'];
    final l$status = json['status'];
    final l$answers = json['answers'];
    final l$$__typename = json['__typename'];
    return Fragment$SubmissionFields(
      id: (l$id as String),
      localId: (l$localId as String?),
      title: (l$title as String?),
      submittedAt: DateTime.parse((l$submittedAt as String)),
      survey: Fragment$SubmissionFields$survey.fromJson(
          (l$survey as Map<String, dynamic>)),
      status: fromJson$Enum$SurveySubmissionStatusChoices((l$status as String)),
      answers: Fragment$SubmissionFields$answers.fromJson(
          (l$answers as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String? localId;

  final String? title;

  final DateTime submittedAt;

  final Fragment$SubmissionFields$survey survey;

  final Enum$SurveySubmissionStatusChoices status;

  final Fragment$SubmissionFields$answers answers;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$localId = localId;
    _resultData['localId'] = l$localId;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$submittedAt = submittedAt;
    _resultData['submittedAt'] = l$submittedAt.toIso8601String();
    final l$survey = survey;
    _resultData['survey'] = l$survey.toJson();
    final l$status = status;
    _resultData['status'] = toJson$Enum$SurveySubmissionStatusChoices(l$status);
    final l$answers = answers;
    _resultData['answers'] = l$answers.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$localId = localId;
    final l$title = title;
    final l$submittedAt = submittedAt;
    final l$survey = survey;
    final l$status = status;
    final l$answers = answers;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$localId,
      l$title,
      l$submittedAt,
      l$survey,
      l$status,
      l$answers,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$SubmissionFields ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$localId = localId;
    final lOther$localId = other.localId;
    if (l$localId != lOther$localId) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$submittedAt = submittedAt;
    final lOther$submittedAt = other.submittedAt;
    if (l$submittedAt != lOther$submittedAt) {
      return false;
    }
    final l$survey = survey;
    final lOther$survey = other.survey;
    if (l$survey != lOther$survey) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
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

extension UtilityExtension$Fragment$SubmissionFields
    on Fragment$SubmissionFields {
  CopyWith$Fragment$SubmissionFields<Fragment$SubmissionFields> get copyWith =>
      CopyWith$Fragment$SubmissionFields(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$SubmissionFields<TRes> {
  factory CopyWith$Fragment$SubmissionFields(
    Fragment$SubmissionFields instance,
    TRes Function(Fragment$SubmissionFields) then,
  ) = _CopyWithImpl$Fragment$SubmissionFields;

  factory CopyWith$Fragment$SubmissionFields.stub(TRes res) =
      _CopyWithStubImpl$Fragment$SubmissionFields;

  TRes call({
    String? id,
    String? localId,
    String? title,
    DateTime? submittedAt,
    Fragment$SubmissionFields$survey? survey,
    Enum$SurveySubmissionStatusChoices? status,
    Fragment$SubmissionFields$answers? answers,
    String? $__typename,
  });
  CopyWith$Fragment$SubmissionFields$survey<TRes> get survey;
  CopyWith$Fragment$SubmissionFields$answers<TRes> get answers;
}

class _CopyWithImpl$Fragment$SubmissionFields<TRes>
    implements CopyWith$Fragment$SubmissionFields<TRes> {
  _CopyWithImpl$Fragment$SubmissionFields(
    this._instance,
    this._then,
  );

  final Fragment$SubmissionFields _instance;

  final TRes Function(Fragment$SubmissionFields) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? localId = _undefined,
    Object? title = _undefined,
    Object? submittedAt = _undefined,
    Object? survey = _undefined,
    Object? status = _undefined,
    Object? answers = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$SubmissionFields(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        localId:
            localId == _undefined ? _instance.localId : (localId as String?),
        title: title == _undefined ? _instance.title : (title as String?),
        submittedAt: submittedAt == _undefined || submittedAt == null
            ? _instance.submittedAt
            : (submittedAt as DateTime),
        survey: survey == _undefined || survey == null
            ? _instance.survey
            : (survey as Fragment$SubmissionFields$survey),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as Enum$SurveySubmissionStatusChoices),
        answers: answers == _undefined || answers == null
            ? _instance.answers
            : (answers as Fragment$SubmissionFields$answers),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$SubmissionFields$survey<TRes> get survey {
    final local$survey = _instance.survey;
    return CopyWith$Fragment$SubmissionFields$survey(
        local$survey, (e) => call(survey: e));
  }

  CopyWith$Fragment$SubmissionFields$answers<TRes> get answers {
    final local$answers = _instance.answers;
    return CopyWith$Fragment$SubmissionFields$answers(
        local$answers, (e) => call(answers: e));
  }
}

class _CopyWithStubImpl$Fragment$SubmissionFields<TRes>
    implements CopyWith$Fragment$SubmissionFields<TRes> {
  _CopyWithStubImpl$Fragment$SubmissionFields(this._res);

  TRes _res;

  call({
    String? id,
    String? localId,
    String? title,
    DateTime? submittedAt,
    Fragment$SubmissionFields$survey? survey,
    Enum$SurveySubmissionStatusChoices? status,
    Fragment$SubmissionFields$answers? answers,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$SubmissionFields$survey<TRes> get survey =>
      CopyWith$Fragment$SubmissionFields$survey.stub(_res);

  CopyWith$Fragment$SubmissionFields$answers<TRes> get answers =>
      CopyWith$Fragment$SubmissionFields$answers.stub(_res);
}

const fragmentDefinitionSubmissionFields = FragmentDefinitionNode(
  name: NameNode(value: 'SubmissionFields'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'SubmissionNode'),
    isNonNull: false,
  )),
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
      name: NameNode(value: 'localId'),
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
      name: NameNode(value: 'submittedAt'),
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
          name: NameNode(value: 'description'),
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
      name: NameNode(value: 'status'),
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
                      name: NameNode(value: 'order'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: null,
                    ),
                    FieldNode(
                      name: NameNode(value: 'page'),
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
                          name: NameNode(value: 'order'),
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
                          name: NameNode(value: 'localizedTitle'),
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
                  name: NameNode(value: 'textAnswer'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'otherText'),
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
);
const documentNodeFragmentSubmissionFields = DocumentNode(definitions: [
  fragmentDefinitionSubmissionFields,
]);

extension ClientExtension$Fragment$SubmissionFields on graphql.GraphQLClient {
  void writeFragment$SubmissionFields({
    required Fragment$SubmissionFields data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'SubmissionFields',
            document: documentNodeFragmentSubmissionFields,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$SubmissionFields? readFragment$SubmissionFields({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'SubmissionFields',
          document: documentNodeFragmentSubmissionFields,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$SubmissionFields.fromJson(result);
  }
}

class Fragment$SubmissionFields$survey {
  Fragment$SubmissionFields$survey({
    required this.id,
    required this.title,
    this.description,
    this.$__typename = 'SurveyNode',
  });

  factory Fragment$SubmissionFields$survey.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$description = json['description'];
    final l$$__typename = json['__typename'];
    return Fragment$SubmissionFields$survey(
      id: (l$id as String),
      title: (l$title as String),
      description: (l$description as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final String? description;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$description = description;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$description,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$SubmissionFields$survey ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$SubmissionFields$survey
    on Fragment$SubmissionFields$survey {
  CopyWith$Fragment$SubmissionFields$survey<Fragment$SubmissionFields$survey>
      get copyWith => CopyWith$Fragment$SubmissionFields$survey(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$SubmissionFields$survey<TRes> {
  factory CopyWith$Fragment$SubmissionFields$survey(
    Fragment$SubmissionFields$survey instance,
    TRes Function(Fragment$SubmissionFields$survey) then,
  ) = _CopyWithImpl$Fragment$SubmissionFields$survey;

  factory CopyWith$Fragment$SubmissionFields$survey.stub(TRes res) =
      _CopyWithStubImpl$Fragment$SubmissionFields$survey;

  TRes call({
    String? id,
    String? title,
    String? description,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$SubmissionFields$survey<TRes>
    implements CopyWith$Fragment$SubmissionFields$survey<TRes> {
  _CopyWithImpl$Fragment$SubmissionFields$survey(
    this._instance,
    this._then,
  );

  final Fragment$SubmissionFields$survey _instance;

  final TRes Function(Fragment$SubmissionFields$survey) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? description = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$SubmissionFields$survey(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        description: description == _undefined
            ? _instance.description
            : (description as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$SubmissionFields$survey<TRes>
    implements CopyWith$Fragment$SubmissionFields$survey<TRes> {
  _CopyWithStubImpl$Fragment$SubmissionFields$survey(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? description,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$SubmissionFields$answers {
  Fragment$SubmissionFields$answers({
    required this.edges,
    this.$__typename = 'SubmissionAnswerNodeConnection',
  });

  factory Fragment$SubmissionFields$answers.fromJson(
      Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Fragment$SubmissionFields$answers(
      edges: (l$edges as List<dynamic>)
          .map((e) => e == null
              ? null
              : Fragment$SubmissionFields$answers$edges.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$SubmissionFields$answers$edges?> edges;

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
    if (other is! Fragment$SubmissionFields$answers ||
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

extension UtilityExtension$Fragment$SubmissionFields$answers
    on Fragment$SubmissionFields$answers {
  CopyWith$Fragment$SubmissionFields$answers<Fragment$SubmissionFields$answers>
      get copyWith => CopyWith$Fragment$SubmissionFields$answers(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$SubmissionFields$answers<TRes> {
  factory CopyWith$Fragment$SubmissionFields$answers(
    Fragment$SubmissionFields$answers instance,
    TRes Function(Fragment$SubmissionFields$answers) then,
  ) = _CopyWithImpl$Fragment$SubmissionFields$answers;

  factory CopyWith$Fragment$SubmissionFields$answers.stub(TRes res) =
      _CopyWithStubImpl$Fragment$SubmissionFields$answers;

  TRes call({
    List<Fragment$SubmissionFields$answers$edges?>? edges,
    String? $__typename,
  });
  TRes edges(
      Iterable<Fragment$SubmissionFields$answers$edges?> Function(
              Iterable<
                  CopyWith$Fragment$SubmissionFields$answers$edges<
                      Fragment$SubmissionFields$answers$edges>?>)
          _fn);
}

class _CopyWithImpl$Fragment$SubmissionFields$answers<TRes>
    implements CopyWith$Fragment$SubmissionFields$answers<TRes> {
  _CopyWithImpl$Fragment$SubmissionFields$answers(
    this._instance,
    this._then,
  );

  final Fragment$SubmissionFields$answers _instance;

  final TRes Function(Fragment$SubmissionFields$answers) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$SubmissionFields$answers(
        edges: edges == _undefined || edges == null
            ? _instance.edges
            : (edges as List<Fragment$SubmissionFields$answers$edges?>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes edges(
          Iterable<Fragment$SubmissionFields$answers$edges?> Function(
                  Iterable<
                      CopyWith$Fragment$SubmissionFields$answers$edges<
                          Fragment$SubmissionFields$answers$edges>?>)
              _fn) =>
      call(
          edges: _fn(_instance.edges.map((e) => e == null
              ? null
              : CopyWith$Fragment$SubmissionFields$answers$edges(
                  e,
                  (i) => i,
                ))).toList());
}

class _CopyWithStubImpl$Fragment$SubmissionFields$answers<TRes>
    implements CopyWith$Fragment$SubmissionFields$answers<TRes> {
  _CopyWithStubImpl$Fragment$SubmissionFields$answers(this._res);

  TRes _res;

  call({
    List<Fragment$SubmissionFields$answers$edges?>? edges,
    String? $__typename,
  }) =>
      _res;

  edges(_fn) => _res;
}

class Fragment$SubmissionFields$answers$edges {
  Fragment$SubmissionFields$answers$edges({
    this.node,
    this.$__typename = 'SubmissionAnswerNodeEdge',
  });

  factory Fragment$SubmissionFields$answers$edges.fromJson(
      Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Fragment$SubmissionFields$answers$edges(
      node: l$node == null
          ? null
          : Fragment$SubmissionFields$answers$edges$node.fromJson(
              (l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$SubmissionFields$answers$edges$node? node;

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
    if (other is! Fragment$SubmissionFields$answers$edges ||
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

extension UtilityExtension$Fragment$SubmissionFields$answers$edges
    on Fragment$SubmissionFields$answers$edges {
  CopyWith$Fragment$SubmissionFields$answers$edges<
          Fragment$SubmissionFields$answers$edges>
      get copyWith => CopyWith$Fragment$SubmissionFields$answers$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$SubmissionFields$answers$edges<TRes> {
  factory CopyWith$Fragment$SubmissionFields$answers$edges(
    Fragment$SubmissionFields$answers$edges instance,
    TRes Function(Fragment$SubmissionFields$answers$edges) then,
  ) = _CopyWithImpl$Fragment$SubmissionFields$answers$edges;

  factory CopyWith$Fragment$SubmissionFields$answers$edges.stub(TRes res) =
      _CopyWithStubImpl$Fragment$SubmissionFields$answers$edges;

  TRes call({
    Fragment$SubmissionFields$answers$edges$node? node,
    String? $__typename,
  });
  CopyWith$Fragment$SubmissionFields$answers$edges$node<TRes> get node;
}

class _CopyWithImpl$Fragment$SubmissionFields$answers$edges<TRes>
    implements CopyWith$Fragment$SubmissionFields$answers$edges<TRes> {
  _CopyWithImpl$Fragment$SubmissionFields$answers$edges(
    this._instance,
    this._then,
  );

  final Fragment$SubmissionFields$answers$edges _instance;

  final TRes Function(Fragment$SubmissionFields$answers$edges) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$SubmissionFields$answers$edges(
        node: node == _undefined
            ? _instance.node
            : (node as Fragment$SubmissionFields$answers$edges$node?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$SubmissionFields$answers$edges$node<TRes> get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Fragment$SubmissionFields$answers$edges$node.stub(
            _then(_instance))
        : CopyWith$Fragment$SubmissionFields$answers$edges$node(
            local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Fragment$SubmissionFields$answers$edges<TRes>
    implements CopyWith$Fragment$SubmissionFields$answers$edges<TRes> {
  _CopyWithStubImpl$Fragment$SubmissionFields$answers$edges(this._res);

  TRes _res;

  call({
    Fragment$SubmissionFields$answers$edges$node? node,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$SubmissionFields$answers$edges$node<TRes> get node =>
      CopyWith$Fragment$SubmissionFields$answers$edges$node.stub(_res);
}

class Fragment$SubmissionFields$answers$edges$node {
  Fragment$SubmissionFields$answers$edges$node({
    required this.id,
    required this.question,
    this.textAnswer,
    this.otherText,
    required this.selectedOptions,
    this.$__typename = 'SubmissionAnswerNode',
  });

  factory Fragment$SubmissionFields$answers$edges$node.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$question = json['question'];
    final l$textAnswer = json['textAnswer'];
    final l$otherText = json['otherText'];
    final l$selectedOptions = json['selectedOptions'];
    final l$$__typename = json['__typename'];
    return Fragment$SubmissionFields$answers$edges$node(
      id: (l$id as String),
      question: Fragment$SubmissionFields$answers$edges$node$question.fromJson(
          (l$question as Map<String, dynamic>)),
      textAnswer: (l$textAnswer as String?),
      otherText: (l$otherText as String?),
      selectedOptions:
          Fragment$SubmissionFields$answers$edges$node$selectedOptions.fromJson(
              (l$selectedOptions as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Fragment$SubmissionFields$answers$edges$node$question question;

  final String? textAnswer;

  final String? otherText;

  final Fragment$SubmissionFields$answers$edges$node$selectedOptions
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
    final l$otherText = otherText;
    _resultData['otherText'] = l$otherText;
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
    final l$otherText = otherText;
    final l$selectedOptions = selectedOptions;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$question,
      l$textAnswer,
      l$otherText,
      l$selectedOptions,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$SubmissionFields$answers$edges$node ||
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
    final l$otherText = otherText;
    final lOther$otherText = other.otherText;
    if (l$otherText != lOther$otherText) {
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

extension UtilityExtension$Fragment$SubmissionFields$answers$edges$node
    on Fragment$SubmissionFields$answers$edges$node {
  CopyWith$Fragment$SubmissionFields$answers$edges$node<
          Fragment$SubmissionFields$answers$edges$node>
      get copyWith => CopyWith$Fragment$SubmissionFields$answers$edges$node(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$SubmissionFields$answers$edges$node<TRes> {
  factory CopyWith$Fragment$SubmissionFields$answers$edges$node(
    Fragment$SubmissionFields$answers$edges$node instance,
    TRes Function(Fragment$SubmissionFields$answers$edges$node) then,
  ) = _CopyWithImpl$Fragment$SubmissionFields$answers$edges$node;

  factory CopyWith$Fragment$SubmissionFields$answers$edges$node.stub(TRes res) =
      _CopyWithStubImpl$Fragment$SubmissionFields$answers$edges$node;

  TRes call({
    String? id,
    Fragment$SubmissionFields$answers$edges$node$question? question,
    String? textAnswer,
    String? otherText,
    Fragment$SubmissionFields$answers$edges$node$selectedOptions?
        selectedOptions,
    String? $__typename,
  });
  CopyWith$Fragment$SubmissionFields$answers$edges$node$question<TRes>
      get question;
  CopyWith$Fragment$SubmissionFields$answers$edges$node$selectedOptions<TRes>
      get selectedOptions;
}

class _CopyWithImpl$Fragment$SubmissionFields$answers$edges$node<TRes>
    implements CopyWith$Fragment$SubmissionFields$answers$edges$node<TRes> {
  _CopyWithImpl$Fragment$SubmissionFields$answers$edges$node(
    this._instance,
    this._then,
  );

  final Fragment$SubmissionFields$answers$edges$node _instance;

  final TRes Function(Fragment$SubmissionFields$answers$edges$node) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? question = _undefined,
    Object? textAnswer = _undefined,
    Object? otherText = _undefined,
    Object? selectedOptions = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$SubmissionFields$answers$edges$node(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        question: question == _undefined || question == null
            ? _instance.question
            : (question
                as Fragment$SubmissionFields$answers$edges$node$question),
        textAnswer: textAnswer == _undefined
            ? _instance.textAnswer
            : (textAnswer as String?),
        otherText: otherText == _undefined
            ? _instance.otherText
            : (otherText as String?),
        selectedOptions: selectedOptions == _undefined ||
                selectedOptions == null
            ? _instance.selectedOptions
            : (selectedOptions
                as Fragment$SubmissionFields$answers$edges$node$selectedOptions),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$SubmissionFields$answers$edges$node$question<TRes>
      get question {
    final local$question = _instance.question;
    return CopyWith$Fragment$SubmissionFields$answers$edges$node$question(
        local$question, (e) => call(question: e));
  }

  CopyWith$Fragment$SubmissionFields$answers$edges$node$selectedOptions<TRes>
      get selectedOptions {
    final local$selectedOptions = _instance.selectedOptions;
    return CopyWith$Fragment$SubmissionFields$answers$edges$node$selectedOptions(
        local$selectedOptions, (e) => call(selectedOptions: e));
  }
}

class _CopyWithStubImpl$Fragment$SubmissionFields$answers$edges$node<TRes>
    implements CopyWith$Fragment$SubmissionFields$answers$edges$node<TRes> {
  _CopyWithStubImpl$Fragment$SubmissionFields$answers$edges$node(this._res);

  TRes _res;

  call({
    String? id,
    Fragment$SubmissionFields$answers$edges$node$question? question,
    String? textAnswer,
    String? otherText,
    Fragment$SubmissionFields$answers$edges$node$selectedOptions?
        selectedOptions,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$SubmissionFields$answers$edges$node$question<TRes>
      get question =>
          CopyWith$Fragment$SubmissionFields$answers$edges$node$question.stub(
              _res);

  CopyWith$Fragment$SubmissionFields$answers$edges$node$selectedOptions<TRes>
      get selectedOptions =>
          CopyWith$Fragment$SubmissionFields$answers$edges$node$selectedOptions
              .stub(_res);
}

class Fragment$SubmissionFields$answers$edges$node$question {
  Fragment$SubmissionFields$answers$edges$node$question({
    required this.id,
    required this.text,
    required this.questionType,
    required this.order,
    this.page,
    this.$__typename = 'QuestionNode',
  });

  factory Fragment$SubmissionFields$answers$edges$node$question.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$text = json['text'];
    final l$questionType = json['questionType'];
    final l$order = json['order'];
    final l$page = json['page'];
    final l$$__typename = json['__typename'];
    return Fragment$SubmissionFields$answers$edges$node$question(
      id: (l$id as String),
      text: (l$text as String),
      questionType: fromJson$Enum$SurveyQuestionQuestionTypeChoices(
          (l$questionType as String)),
      order: (l$order as int),
      page: l$page == null
          ? null
          : Fragment$SubmissionFields$answers$edges$node$question$page.fromJson(
              (l$page as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String text;

  final Enum$SurveyQuestionQuestionTypeChoices questionType;

  final int order;

  final Fragment$SubmissionFields$answers$edges$node$question$page? page;

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
    final l$order = order;
    _resultData['order'] = l$order;
    final l$page = page;
    _resultData['page'] = l$page?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$text = text;
    final l$questionType = questionType;
    final l$order = order;
    final l$page = page;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$text,
      l$questionType,
      l$order,
      l$page,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$SubmissionFields$answers$edges$node$question ||
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
    final l$order = order;
    final lOther$order = other.order;
    if (l$order != lOther$order) {
      return false;
    }
    final l$page = page;
    final lOther$page = other.page;
    if (l$page != lOther$page) {
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

extension UtilityExtension$Fragment$SubmissionFields$answers$edges$node$question
    on Fragment$SubmissionFields$answers$edges$node$question {
  CopyWith$Fragment$SubmissionFields$answers$edges$node$question<
          Fragment$SubmissionFields$answers$edges$node$question>
      get copyWith =>
          CopyWith$Fragment$SubmissionFields$answers$edges$node$question(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$SubmissionFields$answers$edges$node$question<
    TRes> {
  factory CopyWith$Fragment$SubmissionFields$answers$edges$node$question(
    Fragment$SubmissionFields$answers$edges$node$question instance,
    TRes Function(Fragment$SubmissionFields$answers$edges$node$question) then,
  ) = _CopyWithImpl$Fragment$SubmissionFields$answers$edges$node$question;

  factory CopyWith$Fragment$SubmissionFields$answers$edges$node$question.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$SubmissionFields$answers$edges$node$question;

  TRes call({
    String? id,
    String? text,
    Enum$SurveyQuestionQuestionTypeChoices? questionType,
    int? order,
    Fragment$SubmissionFields$answers$edges$node$question$page? page,
    String? $__typename,
  });
  CopyWith$Fragment$SubmissionFields$answers$edges$node$question$page<TRes>
      get page;
}

class _CopyWithImpl$Fragment$SubmissionFields$answers$edges$node$question<TRes>
    implements
        CopyWith$Fragment$SubmissionFields$answers$edges$node$question<TRes> {
  _CopyWithImpl$Fragment$SubmissionFields$answers$edges$node$question(
    this._instance,
    this._then,
  );

  final Fragment$SubmissionFields$answers$edges$node$question _instance;

  final TRes Function(Fragment$SubmissionFields$answers$edges$node$question)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? text = _undefined,
    Object? questionType = _undefined,
    Object? order = _undefined,
    Object? page = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$SubmissionFields$answers$edges$node$question(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        text: text == _undefined || text == null
            ? _instance.text
            : (text as String),
        questionType: questionType == _undefined || questionType == null
            ? _instance.questionType
            : (questionType as Enum$SurveyQuestionQuestionTypeChoices),
        order: order == _undefined || order == null
            ? _instance.order
            : (order as int),
        page: page == _undefined
            ? _instance.page
            : (page
                as Fragment$SubmissionFields$answers$edges$node$question$page?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$SubmissionFields$answers$edges$node$question$page<TRes>
      get page {
    final local$page = _instance.page;
    return local$page == null
        ? CopyWith$Fragment$SubmissionFields$answers$edges$node$question$page
            .stub(_then(_instance))
        : CopyWith$Fragment$SubmissionFields$answers$edges$node$question$page(
            local$page, (e) => call(page: e));
  }
}

class _CopyWithStubImpl$Fragment$SubmissionFields$answers$edges$node$question<
        TRes>
    implements
        CopyWith$Fragment$SubmissionFields$answers$edges$node$question<TRes> {
  _CopyWithStubImpl$Fragment$SubmissionFields$answers$edges$node$question(
      this._res);

  TRes _res;

  call({
    String? id,
    String? text,
    Enum$SurveyQuestionQuestionTypeChoices? questionType,
    int? order,
    Fragment$SubmissionFields$answers$edges$node$question$page? page,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$SubmissionFields$answers$edges$node$question$page<TRes>
      get page =>
          CopyWith$Fragment$SubmissionFields$answers$edges$node$question$page
              .stub(_res);
}

class Fragment$SubmissionFields$answers$edges$node$question$page {
  Fragment$SubmissionFields$answers$edges$node$question$page({
    required this.id,
    required this.order,
    this.title,
    this.localizedTitle,
    this.$__typename = 'SurveyPageNode',
  });

  factory Fragment$SubmissionFields$answers$edges$node$question$page.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$order = json['order'];
    final l$title = json['title'];
    final l$localizedTitle = json['localizedTitle'];
    final l$$__typename = json['__typename'];
    return Fragment$SubmissionFields$answers$edges$node$question$page(
      id: (l$id as String),
      order: (l$order as int),
      title: (l$title as String?),
      localizedTitle: (l$localizedTitle as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final int order;

  final String? title;

  final String? localizedTitle;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$order = order;
    _resultData['order'] = l$order;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$localizedTitle = localizedTitle;
    _resultData['localizedTitle'] = l$localizedTitle;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$order = order;
    final l$title = title;
    final l$localizedTitle = localizedTitle;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$order,
      l$title,
      l$localizedTitle,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$SubmissionFields$answers$edges$node$question$page ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$order = order;
    final lOther$order = other.order;
    if (l$order != lOther$order) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$localizedTitle = localizedTitle;
    final lOther$localizedTitle = other.localizedTitle;
    if (l$localizedTitle != lOther$localizedTitle) {
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

extension UtilityExtension$Fragment$SubmissionFields$answers$edges$node$question$page
    on Fragment$SubmissionFields$answers$edges$node$question$page {
  CopyWith$Fragment$SubmissionFields$answers$edges$node$question$page<
          Fragment$SubmissionFields$answers$edges$node$question$page>
      get copyWith =>
          CopyWith$Fragment$SubmissionFields$answers$edges$node$question$page(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$SubmissionFields$answers$edges$node$question$page<
    TRes> {
  factory CopyWith$Fragment$SubmissionFields$answers$edges$node$question$page(
    Fragment$SubmissionFields$answers$edges$node$question$page instance,
    TRes Function(Fragment$SubmissionFields$answers$edges$node$question$page)
        then,
  ) = _CopyWithImpl$Fragment$SubmissionFields$answers$edges$node$question$page;

  factory CopyWith$Fragment$SubmissionFields$answers$edges$node$question$page.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$SubmissionFields$answers$edges$node$question$page;

  TRes call({
    String? id,
    int? order,
    String? title,
    String? localizedTitle,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$SubmissionFields$answers$edges$node$question$page<
        TRes>
    implements
        CopyWith$Fragment$SubmissionFields$answers$edges$node$question$page<
            TRes> {
  _CopyWithImpl$Fragment$SubmissionFields$answers$edges$node$question$page(
    this._instance,
    this._then,
  );

  final Fragment$SubmissionFields$answers$edges$node$question$page _instance;

  final TRes Function(
      Fragment$SubmissionFields$answers$edges$node$question$page) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? order = _undefined,
    Object? title = _undefined,
    Object? localizedTitle = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$SubmissionFields$answers$edges$node$question$page(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        order: order == _undefined || order == null
            ? _instance.order
            : (order as int),
        title: title == _undefined ? _instance.title : (title as String?),
        localizedTitle: localizedTitle == _undefined
            ? _instance.localizedTitle
            : (localizedTitle as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$SubmissionFields$answers$edges$node$question$page<
        TRes>
    implements
        CopyWith$Fragment$SubmissionFields$answers$edges$node$question$page<
            TRes> {
  _CopyWithStubImpl$Fragment$SubmissionFields$answers$edges$node$question$page(
      this._res);

  TRes _res;

  call({
    String? id,
    int? order,
    String? title,
    String? localizedTitle,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$SubmissionFields$answers$edges$node$selectedOptions {
  Fragment$SubmissionFields$answers$edges$node$selectedOptions({
    required this.edges,
    this.$__typename = 'QuestionOptionNodeConnection',
  });

  factory Fragment$SubmissionFields$answers$edges$node$selectedOptions.fromJson(
      Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Fragment$SubmissionFields$answers$edges$node$selectedOptions(
      edges: (l$edges as List<dynamic>)
          .map((e) => e == null
              ? null
              : Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<
          Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges?>
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
            is! Fragment$SubmissionFields$answers$edges$node$selectedOptions ||
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

extension UtilityExtension$Fragment$SubmissionFields$answers$edges$node$selectedOptions
    on Fragment$SubmissionFields$answers$edges$node$selectedOptions {
  CopyWith$Fragment$SubmissionFields$answers$edges$node$selectedOptions<
          Fragment$SubmissionFields$answers$edges$node$selectedOptions>
      get copyWith =>
          CopyWith$Fragment$SubmissionFields$answers$edges$node$selectedOptions(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$SubmissionFields$answers$edges$node$selectedOptions<
    TRes> {
  factory CopyWith$Fragment$SubmissionFields$answers$edges$node$selectedOptions(
    Fragment$SubmissionFields$answers$edges$node$selectedOptions instance,
    TRes Function(Fragment$SubmissionFields$answers$edges$node$selectedOptions)
        then,
  ) = _CopyWithImpl$Fragment$SubmissionFields$answers$edges$node$selectedOptions;

  factory CopyWith$Fragment$SubmissionFields$answers$edges$node$selectedOptions.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$SubmissionFields$answers$edges$node$selectedOptions;

  TRes call({
    List<Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges?>?
        edges,
    String? $__typename,
  });
  TRes edges(
      Iterable<Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges?> Function(
              Iterable<
                  CopyWith$Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges<
                      Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges>?>)
          _fn);
}

class _CopyWithImpl$Fragment$SubmissionFields$answers$edges$node$selectedOptions<
        TRes>
    implements
        CopyWith$Fragment$SubmissionFields$answers$edges$node$selectedOptions<
            TRes> {
  _CopyWithImpl$Fragment$SubmissionFields$answers$edges$node$selectedOptions(
    this._instance,
    this._then,
  );

  final Fragment$SubmissionFields$answers$edges$node$selectedOptions _instance;

  final TRes Function(
      Fragment$SubmissionFields$answers$edges$node$selectedOptions) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$SubmissionFields$answers$edges$node$selectedOptions(
        edges: edges == _undefined || edges == null
            ? _instance.edges
            : (edges as List<
                Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges?>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes edges(
          Iterable<Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges?> Function(
                  Iterable<
                      CopyWith$Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges<
                          Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges>?>)
              _fn) =>
      call(
          edges: _fn(_instance.edges.map((e) => e == null
              ? null
              : CopyWith$Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges(
                  e,
                  (i) => i,
                ))).toList());
}

class _CopyWithStubImpl$Fragment$SubmissionFields$answers$edges$node$selectedOptions<
        TRes>
    implements
        CopyWith$Fragment$SubmissionFields$answers$edges$node$selectedOptions<
            TRes> {
  _CopyWithStubImpl$Fragment$SubmissionFields$answers$edges$node$selectedOptions(
      this._res);

  TRes _res;

  call({
    List<Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges?>?
        edges,
    String? $__typename,
  }) =>
      _res;

  edges(_fn) => _res;
}

class Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges {
  Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges({
    this.node,
    this.$__typename = 'QuestionOptionNodeEdge',
  });

  factory Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges.fromJson(
      Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges(
      node: l$node == null
          ? null
          : Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges$node
              .fromJson((l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges$node?
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
            is! Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges ||
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

extension UtilityExtension$Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges
    on Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges {
  CopyWith$Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges<
          Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges>
      get copyWith =>
          CopyWith$Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges<
    TRes> {
  factory CopyWith$Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges(
    Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges instance,
    TRes Function(
            Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges)
        then,
  ) = _CopyWithImpl$Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges;

  factory CopyWith$Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges;

  TRes call({
    Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges$node?
        node,
    String? $__typename,
  });
  CopyWith$Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges$node<
      TRes> get node;
}

class _CopyWithImpl$Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges<
        TRes>
    implements
        CopyWith$Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges<
            TRes> {
  _CopyWithImpl$Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges(
    this._instance,
    this._then,
  );

  final Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges
      _instance;

  final TRes Function(
      Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges(
        node: node == _undefined
            ? _instance.node
            : (node
                as Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges$node?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges$node<
      TRes> get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges$node
            .stub(_then(_instance))
        : CopyWith$Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges$node(
            local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges<
        TRes>
    implements
        CopyWith$Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges<
            TRes> {
  _CopyWithStubImpl$Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges(
      this._res);

  TRes _res;

  call({
    Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges$node?
        node,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges$node<
          TRes>
      get node =>
          CopyWith$Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges$node
              .stub(_res);
}

class Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges$node {
  Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges$node({
    required this.id,
    required this.text,
    this.$__typename = 'QuestionOptionNode',
  });

  factory Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges$node.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$text = json['text'];
    final l$$__typename = json['__typename'];
    return Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges$node(
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
            is! Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges$node ||
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

extension UtilityExtension$Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges$node
    on Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges$node {
  CopyWith$Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges$node<
          Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges$node>
      get copyWith =>
          CopyWith$Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges$node(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges$node<
    TRes> {
  factory CopyWith$Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges$node(
    Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges$node
        instance,
    TRes Function(
            Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges$node)
        then,
  ) = _CopyWithImpl$Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges$node;

  factory CopyWith$Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges$node.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges$node;

  TRes call({
    String? id,
    String? text,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges$node<
        TRes>
    implements
        CopyWith$Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges$node<
            TRes> {
  _CopyWithImpl$Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges$node(
    this._instance,
    this._then,
  );

  final Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges$node
      _instance;

  final TRes Function(
          Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges$node)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? text = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges$node(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        text: text == _undefined || text == null
            ? _instance.text
            : (text as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges$node<
        TRes>
    implements
        CopyWith$Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges$node<
            TRes> {
  _CopyWithStubImpl$Fragment$SubmissionFields$answers$edges$node$selectedOptions$edges$node(
      this._res);

  TRes _res;

  call({
    String? id,
    String? text,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$MySubmissionsList {
  factory Variables$Query$MySubmissionsList({
    int? first,
    String? after,
    String? surveyId,
  }) =>
      Variables$Query$MySubmissionsList._({
        if (first != null) r'first': first,
        if (after != null) r'after': after,
        if (surveyId != null) r'surveyId': surveyId,
      });

  Variables$Query$MySubmissionsList._(this._$data);

  factory Variables$Query$MySubmissionsList.fromJson(
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
    if (data.containsKey('surveyId')) {
      final l$surveyId = data['surveyId'];
      result$data['surveyId'] = (l$surveyId as String?);
    }
    return Variables$Query$MySubmissionsList._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get first => (_$data['first'] as int?);

  String? get after => (_$data['after'] as String?);

  String? get surveyId => (_$data['surveyId'] as String?);

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
    if (_$data.containsKey('surveyId')) {
      final l$surveyId = surveyId;
      result$data['surveyId'] = l$surveyId;
    }
    return result$data;
  }

  CopyWith$Variables$Query$MySubmissionsList<Variables$Query$MySubmissionsList>
      get copyWith => CopyWith$Variables$Query$MySubmissionsList(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$MySubmissionsList ||
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
    final l$surveyId = surveyId;
    final lOther$surveyId = other.surveyId;
    if (_$data.containsKey('surveyId') !=
        other._$data.containsKey('surveyId')) {
      return false;
    }
    if (l$surveyId != lOther$surveyId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$first = first;
    final l$after = after;
    final l$surveyId = surveyId;
    return Object.hashAll([
      _$data.containsKey('first') ? l$first : const {},
      _$data.containsKey('after') ? l$after : const {},
      _$data.containsKey('surveyId') ? l$surveyId : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$MySubmissionsList<TRes> {
  factory CopyWith$Variables$Query$MySubmissionsList(
    Variables$Query$MySubmissionsList instance,
    TRes Function(Variables$Query$MySubmissionsList) then,
  ) = _CopyWithImpl$Variables$Query$MySubmissionsList;

  factory CopyWith$Variables$Query$MySubmissionsList.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$MySubmissionsList;

  TRes call({
    int? first,
    String? after,
    String? surveyId,
  });
}

class _CopyWithImpl$Variables$Query$MySubmissionsList<TRes>
    implements CopyWith$Variables$Query$MySubmissionsList<TRes> {
  _CopyWithImpl$Variables$Query$MySubmissionsList(
    this._instance,
    this._then,
  );

  final Variables$Query$MySubmissionsList _instance;

  final TRes Function(Variables$Query$MySubmissionsList) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? first = _undefined,
    Object? after = _undefined,
    Object? surveyId = _undefined,
  }) =>
      _then(Variables$Query$MySubmissionsList._({
        ..._instance._$data,
        if (first != _undefined) 'first': (first as int?),
        if (after != _undefined) 'after': (after as String?),
        if (surveyId != _undefined) 'surveyId': (surveyId as String?),
      }));
}

class _CopyWithStubImpl$Variables$Query$MySubmissionsList<TRes>
    implements CopyWith$Variables$Query$MySubmissionsList<TRes> {
  _CopyWithStubImpl$Variables$Query$MySubmissionsList(this._res);

  TRes _res;

  call({
    int? first,
    String? after,
    String? surveyId,
  }) =>
      _res;
}

class Query$MySubmissionsList {
  Query$MySubmissionsList({
    this.mySubmissions,
    this.$__typename = 'Query',
  });

  factory Query$MySubmissionsList.fromJson(Map<String, dynamic> json) {
    final l$mySubmissions = json['mySubmissions'];
    final l$$__typename = json['__typename'];
    return Query$MySubmissionsList(
      mySubmissions: l$mySubmissions == null
          ? null
          : Query$MySubmissionsList$mySubmissions.fromJson(
              (l$mySubmissions as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$MySubmissionsList$mySubmissions? mySubmissions;

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
    if (other is! Query$MySubmissionsList || runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$MySubmissionsList on Query$MySubmissionsList {
  CopyWith$Query$MySubmissionsList<Query$MySubmissionsList> get copyWith =>
      CopyWith$Query$MySubmissionsList(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$MySubmissionsList<TRes> {
  factory CopyWith$Query$MySubmissionsList(
    Query$MySubmissionsList instance,
    TRes Function(Query$MySubmissionsList) then,
  ) = _CopyWithImpl$Query$MySubmissionsList;

  factory CopyWith$Query$MySubmissionsList.stub(TRes res) =
      _CopyWithStubImpl$Query$MySubmissionsList;

  TRes call({
    Query$MySubmissionsList$mySubmissions? mySubmissions,
    String? $__typename,
  });
  CopyWith$Query$MySubmissionsList$mySubmissions<TRes> get mySubmissions;
}

class _CopyWithImpl$Query$MySubmissionsList<TRes>
    implements CopyWith$Query$MySubmissionsList<TRes> {
  _CopyWithImpl$Query$MySubmissionsList(
    this._instance,
    this._then,
  );

  final Query$MySubmissionsList _instance;

  final TRes Function(Query$MySubmissionsList) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? mySubmissions = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$MySubmissionsList(
        mySubmissions: mySubmissions == _undefined
            ? _instance.mySubmissions
            : (mySubmissions as Query$MySubmissionsList$mySubmissions?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$MySubmissionsList$mySubmissions<TRes> get mySubmissions {
    final local$mySubmissions = _instance.mySubmissions;
    return local$mySubmissions == null
        ? CopyWith$Query$MySubmissionsList$mySubmissions.stub(_then(_instance))
        : CopyWith$Query$MySubmissionsList$mySubmissions(
            local$mySubmissions, (e) => call(mySubmissions: e));
  }
}

class _CopyWithStubImpl$Query$MySubmissionsList<TRes>
    implements CopyWith$Query$MySubmissionsList<TRes> {
  _CopyWithStubImpl$Query$MySubmissionsList(this._res);

  TRes _res;

  call({
    Query$MySubmissionsList$mySubmissions? mySubmissions,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$MySubmissionsList$mySubmissions<TRes> get mySubmissions =>
      CopyWith$Query$MySubmissionsList$mySubmissions.stub(_res);
}

const documentNodeQueryMySubmissionsList = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'MySubmissionsList'),
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
        variable: VariableNode(name: NameNode(value: 'surveyId')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
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
            name: NameNode(value: 'surveyId'),
            value: VariableNode(name: NameNode(value: 'surveyId')),
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
                  FragmentSpreadNode(
                    name: NameNode(value: 'SubmissionListItem'),
                    directives: [],
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
  fragmentDefinitionSubmissionListItem,
]);
Query$MySubmissionsList _parserFn$Query$MySubmissionsList(
        Map<String, dynamic> data) =>
    Query$MySubmissionsList.fromJson(data);
typedef OnQueryComplete$Query$MySubmissionsList = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$MySubmissionsList?,
);

class Options$Query$MySubmissionsList
    extends graphql.QueryOptions<Query$MySubmissionsList> {
  Options$Query$MySubmissionsList({
    String? operationName,
    Variables$Query$MySubmissionsList? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$MySubmissionsList? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$MySubmissionsList? onComplete,
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
                        : _parserFn$Query$MySubmissionsList(data),
                  ),
          onError: onError,
          document: documentNodeQueryMySubmissionsList,
          parserFn: _parserFn$Query$MySubmissionsList,
        );

  final OnQueryComplete$Query$MySubmissionsList? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$MySubmissionsList
    extends graphql.WatchQueryOptions<Query$MySubmissionsList> {
  WatchOptions$Query$MySubmissionsList({
    String? operationName,
    Variables$Query$MySubmissionsList? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$MySubmissionsList? typedOptimisticResult,
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
          document: documentNodeQueryMySubmissionsList,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$MySubmissionsList,
        );
}

class FetchMoreOptions$Query$MySubmissionsList
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$MySubmissionsList({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$MySubmissionsList? variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables?.toJson() ?? {},
          document: documentNodeQueryMySubmissionsList,
        );
}

extension ClientExtension$Query$MySubmissionsList on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$MySubmissionsList>> query$MySubmissionsList(
          [Options$Query$MySubmissionsList? options]) async =>
      await this.query(options ?? Options$Query$MySubmissionsList());
  graphql.ObservableQuery<Query$MySubmissionsList> watchQuery$MySubmissionsList(
          [WatchOptions$Query$MySubmissionsList? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$MySubmissionsList());
  void writeQuery$MySubmissionsList({
    required Query$MySubmissionsList data,
    Variables$Query$MySubmissionsList? variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryMySubmissionsList),
          variables: variables?.toJson() ?? const {},
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$MySubmissionsList? readQuery$MySubmissionsList({
    Variables$Query$MySubmissionsList? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryMySubmissionsList),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$MySubmissionsList.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$MySubmissionsList>
    useQuery$MySubmissionsList([Options$Query$MySubmissionsList? options]) =>
        graphql_flutter.useQuery(options ?? Options$Query$MySubmissionsList());
graphql.ObservableQuery<Query$MySubmissionsList>
    useWatchQuery$MySubmissionsList(
            [WatchOptions$Query$MySubmissionsList? options]) =>
        graphql_flutter
            .useWatchQuery(options ?? WatchOptions$Query$MySubmissionsList());

class Query$MySubmissionsList$Widget
    extends graphql_flutter.Query<Query$MySubmissionsList> {
  Query$MySubmissionsList$Widget({
    widgets.Key? key,
    Options$Query$MySubmissionsList? options,
    required graphql_flutter.QueryBuilder<Query$MySubmissionsList> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$MySubmissionsList(),
          builder: builder,
        );
}

class Query$MySubmissionsList$mySubmissions {
  Query$MySubmissionsList$mySubmissions({
    required this.edges,
    required this.pageInfo,
    this.$__typename = 'SubmissionNodeConnection',
  });

  factory Query$MySubmissionsList$mySubmissions.fromJson(
      Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$pageInfo = json['pageInfo'];
    final l$$__typename = json['__typename'];
    return Query$MySubmissionsList$mySubmissions(
      edges: (l$edges as List<dynamic>)
          .map((e) => e == null
              ? null
              : Query$MySubmissionsList$mySubmissions$edges.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      pageInfo: Query$MySubmissionsList$mySubmissions$pageInfo.fromJson(
          (l$pageInfo as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$MySubmissionsList$mySubmissions$edges?> edges;

  final Query$MySubmissionsList$mySubmissions$pageInfo pageInfo;

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
    if (other is! Query$MySubmissionsList$mySubmissions ||
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

extension UtilityExtension$Query$MySubmissionsList$mySubmissions
    on Query$MySubmissionsList$mySubmissions {
  CopyWith$Query$MySubmissionsList$mySubmissions<
          Query$MySubmissionsList$mySubmissions>
      get copyWith => CopyWith$Query$MySubmissionsList$mySubmissions(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$MySubmissionsList$mySubmissions<TRes> {
  factory CopyWith$Query$MySubmissionsList$mySubmissions(
    Query$MySubmissionsList$mySubmissions instance,
    TRes Function(Query$MySubmissionsList$mySubmissions) then,
  ) = _CopyWithImpl$Query$MySubmissionsList$mySubmissions;

  factory CopyWith$Query$MySubmissionsList$mySubmissions.stub(TRes res) =
      _CopyWithStubImpl$Query$MySubmissionsList$mySubmissions;

  TRes call({
    List<Query$MySubmissionsList$mySubmissions$edges?>? edges,
    Query$MySubmissionsList$mySubmissions$pageInfo? pageInfo,
    String? $__typename,
  });
  TRes edges(
      Iterable<Query$MySubmissionsList$mySubmissions$edges?> Function(
              Iterable<
                  CopyWith$Query$MySubmissionsList$mySubmissions$edges<
                      Query$MySubmissionsList$mySubmissions$edges>?>)
          _fn);
  CopyWith$Query$MySubmissionsList$mySubmissions$pageInfo<TRes> get pageInfo;
}

class _CopyWithImpl$Query$MySubmissionsList$mySubmissions<TRes>
    implements CopyWith$Query$MySubmissionsList$mySubmissions<TRes> {
  _CopyWithImpl$Query$MySubmissionsList$mySubmissions(
    this._instance,
    this._then,
  );

  final Query$MySubmissionsList$mySubmissions _instance;

  final TRes Function(Query$MySubmissionsList$mySubmissions) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? pageInfo = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$MySubmissionsList$mySubmissions(
        edges: edges == _undefined || edges == null
            ? _instance.edges
            : (edges as List<Query$MySubmissionsList$mySubmissions$edges?>),
        pageInfo: pageInfo == _undefined || pageInfo == null
            ? _instance.pageInfo
            : (pageInfo as Query$MySubmissionsList$mySubmissions$pageInfo),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes edges(
          Iterable<Query$MySubmissionsList$mySubmissions$edges?> Function(
                  Iterable<
                      CopyWith$Query$MySubmissionsList$mySubmissions$edges<
                          Query$MySubmissionsList$mySubmissions$edges>?>)
              _fn) =>
      call(
          edges: _fn(_instance.edges.map((e) => e == null
              ? null
              : CopyWith$Query$MySubmissionsList$mySubmissions$edges(
                  e,
                  (i) => i,
                ))).toList());

  CopyWith$Query$MySubmissionsList$mySubmissions$pageInfo<TRes> get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return CopyWith$Query$MySubmissionsList$mySubmissions$pageInfo(
        local$pageInfo, (e) => call(pageInfo: e));
  }
}

class _CopyWithStubImpl$Query$MySubmissionsList$mySubmissions<TRes>
    implements CopyWith$Query$MySubmissionsList$mySubmissions<TRes> {
  _CopyWithStubImpl$Query$MySubmissionsList$mySubmissions(this._res);

  TRes _res;

  call({
    List<Query$MySubmissionsList$mySubmissions$edges?>? edges,
    Query$MySubmissionsList$mySubmissions$pageInfo? pageInfo,
    String? $__typename,
  }) =>
      _res;

  edges(_fn) => _res;

  CopyWith$Query$MySubmissionsList$mySubmissions$pageInfo<TRes> get pageInfo =>
      CopyWith$Query$MySubmissionsList$mySubmissions$pageInfo.stub(_res);
}

class Query$MySubmissionsList$mySubmissions$edges {
  Query$MySubmissionsList$mySubmissions$edges({
    this.node,
    this.$__typename = 'SubmissionNodeEdge',
  });

  factory Query$MySubmissionsList$mySubmissions$edges.fromJson(
      Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$MySubmissionsList$mySubmissions$edges(
      node: l$node == null
          ? null
          : Fragment$SubmissionListItem.fromJson(
              (l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$SubmissionListItem? node;

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
    if (other is! Query$MySubmissionsList$mySubmissions$edges ||
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

extension UtilityExtension$Query$MySubmissionsList$mySubmissions$edges
    on Query$MySubmissionsList$mySubmissions$edges {
  CopyWith$Query$MySubmissionsList$mySubmissions$edges<
          Query$MySubmissionsList$mySubmissions$edges>
      get copyWith => CopyWith$Query$MySubmissionsList$mySubmissions$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$MySubmissionsList$mySubmissions$edges<TRes> {
  factory CopyWith$Query$MySubmissionsList$mySubmissions$edges(
    Query$MySubmissionsList$mySubmissions$edges instance,
    TRes Function(Query$MySubmissionsList$mySubmissions$edges) then,
  ) = _CopyWithImpl$Query$MySubmissionsList$mySubmissions$edges;

  factory CopyWith$Query$MySubmissionsList$mySubmissions$edges.stub(TRes res) =
      _CopyWithStubImpl$Query$MySubmissionsList$mySubmissions$edges;

  TRes call({
    Fragment$SubmissionListItem? node,
    String? $__typename,
  });
  CopyWith$Fragment$SubmissionListItem<TRes> get node;
}

class _CopyWithImpl$Query$MySubmissionsList$mySubmissions$edges<TRes>
    implements CopyWith$Query$MySubmissionsList$mySubmissions$edges<TRes> {
  _CopyWithImpl$Query$MySubmissionsList$mySubmissions$edges(
    this._instance,
    this._then,
  );

  final Query$MySubmissionsList$mySubmissions$edges _instance;

  final TRes Function(Query$MySubmissionsList$mySubmissions$edges) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$MySubmissionsList$mySubmissions$edges(
        node: node == _undefined
            ? _instance.node
            : (node as Fragment$SubmissionListItem?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$SubmissionListItem<TRes> get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Fragment$SubmissionListItem.stub(_then(_instance))
        : CopyWith$Fragment$SubmissionListItem(
            local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Query$MySubmissionsList$mySubmissions$edges<TRes>
    implements CopyWith$Query$MySubmissionsList$mySubmissions$edges<TRes> {
  _CopyWithStubImpl$Query$MySubmissionsList$mySubmissions$edges(this._res);

  TRes _res;

  call({
    Fragment$SubmissionListItem? node,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$SubmissionListItem<TRes> get node =>
      CopyWith$Fragment$SubmissionListItem.stub(_res);
}

class Query$MySubmissionsList$mySubmissions$pageInfo {
  Query$MySubmissionsList$mySubmissions$pageInfo({
    required this.hasNextPage,
    this.endCursor,
    this.$__typename = 'PageInfo',
  });

  factory Query$MySubmissionsList$mySubmissions$pageInfo.fromJson(
      Map<String, dynamic> json) {
    final l$hasNextPage = json['hasNextPage'];
    final l$endCursor = json['endCursor'];
    final l$$__typename = json['__typename'];
    return Query$MySubmissionsList$mySubmissions$pageInfo(
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
    if (other is! Query$MySubmissionsList$mySubmissions$pageInfo ||
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

extension UtilityExtension$Query$MySubmissionsList$mySubmissions$pageInfo
    on Query$MySubmissionsList$mySubmissions$pageInfo {
  CopyWith$Query$MySubmissionsList$mySubmissions$pageInfo<
          Query$MySubmissionsList$mySubmissions$pageInfo>
      get copyWith => CopyWith$Query$MySubmissionsList$mySubmissions$pageInfo(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$MySubmissionsList$mySubmissions$pageInfo<TRes> {
  factory CopyWith$Query$MySubmissionsList$mySubmissions$pageInfo(
    Query$MySubmissionsList$mySubmissions$pageInfo instance,
    TRes Function(Query$MySubmissionsList$mySubmissions$pageInfo) then,
  ) = _CopyWithImpl$Query$MySubmissionsList$mySubmissions$pageInfo;

  factory CopyWith$Query$MySubmissionsList$mySubmissions$pageInfo.stub(
          TRes res) =
      _CopyWithStubImpl$Query$MySubmissionsList$mySubmissions$pageInfo;

  TRes call({
    bool? hasNextPage,
    String? endCursor,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$MySubmissionsList$mySubmissions$pageInfo<TRes>
    implements CopyWith$Query$MySubmissionsList$mySubmissions$pageInfo<TRes> {
  _CopyWithImpl$Query$MySubmissionsList$mySubmissions$pageInfo(
    this._instance,
    this._then,
  );

  final Query$MySubmissionsList$mySubmissions$pageInfo _instance;

  final TRes Function(Query$MySubmissionsList$mySubmissions$pageInfo) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? hasNextPage = _undefined,
    Object? endCursor = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$MySubmissionsList$mySubmissions$pageInfo(
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

class _CopyWithStubImpl$Query$MySubmissionsList$mySubmissions$pageInfo<TRes>
    implements CopyWith$Query$MySubmissionsList$mySubmissions$pageInfo<TRes> {
  _CopyWithStubImpl$Query$MySubmissionsList$mySubmissions$pageInfo(this._res);

  TRes _res;

  call({
    bool? hasNextPage,
    String? endCursor,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$MySubmissions {
  factory Variables$Query$MySubmissions({
    int? first,
    String? after,
    String? surveyId,
  }) =>
      Variables$Query$MySubmissions._({
        if (first != null) r'first': first,
        if (after != null) r'after': after,
        if (surveyId != null) r'surveyId': surveyId,
      });

  Variables$Query$MySubmissions._(this._$data);

  factory Variables$Query$MySubmissions.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('first')) {
      final l$first = data['first'];
      result$data['first'] = (l$first as int?);
    }
    if (data.containsKey('after')) {
      final l$after = data['after'];
      result$data['after'] = (l$after as String?);
    }
    if (data.containsKey('surveyId')) {
      final l$surveyId = data['surveyId'];
      result$data['surveyId'] = (l$surveyId as String?);
    }
    return Variables$Query$MySubmissions._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get first => (_$data['first'] as int?);

  String? get after => (_$data['after'] as String?);

  String? get surveyId => (_$data['surveyId'] as String?);

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
    if (_$data.containsKey('surveyId')) {
      final l$surveyId = surveyId;
      result$data['surveyId'] = l$surveyId;
    }
    return result$data;
  }

  CopyWith$Variables$Query$MySubmissions<Variables$Query$MySubmissions>
      get copyWith => CopyWith$Variables$Query$MySubmissions(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$MySubmissions ||
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
    final l$surveyId = surveyId;
    final lOther$surveyId = other.surveyId;
    if (_$data.containsKey('surveyId') !=
        other._$data.containsKey('surveyId')) {
      return false;
    }
    if (l$surveyId != lOther$surveyId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$first = first;
    final l$after = after;
    final l$surveyId = surveyId;
    return Object.hashAll([
      _$data.containsKey('first') ? l$first : const {},
      _$data.containsKey('after') ? l$after : const {},
      _$data.containsKey('surveyId') ? l$surveyId : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$MySubmissions<TRes> {
  factory CopyWith$Variables$Query$MySubmissions(
    Variables$Query$MySubmissions instance,
    TRes Function(Variables$Query$MySubmissions) then,
  ) = _CopyWithImpl$Variables$Query$MySubmissions;

  factory CopyWith$Variables$Query$MySubmissions.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$MySubmissions;

  TRes call({
    int? first,
    String? after,
    String? surveyId,
  });
}

class _CopyWithImpl$Variables$Query$MySubmissions<TRes>
    implements CopyWith$Variables$Query$MySubmissions<TRes> {
  _CopyWithImpl$Variables$Query$MySubmissions(
    this._instance,
    this._then,
  );

  final Variables$Query$MySubmissions _instance;

  final TRes Function(Variables$Query$MySubmissions) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? first = _undefined,
    Object? after = _undefined,
    Object? surveyId = _undefined,
  }) =>
      _then(Variables$Query$MySubmissions._({
        ..._instance._$data,
        if (first != _undefined) 'first': (first as int?),
        if (after != _undefined) 'after': (after as String?),
        if (surveyId != _undefined) 'surveyId': (surveyId as String?),
      }));
}

class _CopyWithStubImpl$Variables$Query$MySubmissions<TRes>
    implements CopyWith$Variables$Query$MySubmissions<TRes> {
  _CopyWithStubImpl$Variables$Query$MySubmissions(this._res);

  TRes _res;

  call({
    int? first,
    String? after,
    String? surveyId,
  }) =>
      _res;
}

class Query$MySubmissions {
  Query$MySubmissions({
    this.mySubmissions,
    this.$__typename = 'Query',
  });

  factory Query$MySubmissions.fromJson(Map<String, dynamic> json) {
    final l$mySubmissions = json['mySubmissions'];
    final l$$__typename = json['__typename'];
    return Query$MySubmissions(
      mySubmissions: l$mySubmissions == null
          ? null
          : Query$MySubmissions$mySubmissions.fromJson(
              (l$mySubmissions as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$MySubmissions$mySubmissions? mySubmissions;

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
    if (other is! Query$MySubmissions || runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$MySubmissions on Query$MySubmissions {
  CopyWith$Query$MySubmissions<Query$MySubmissions> get copyWith =>
      CopyWith$Query$MySubmissions(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$MySubmissions<TRes> {
  factory CopyWith$Query$MySubmissions(
    Query$MySubmissions instance,
    TRes Function(Query$MySubmissions) then,
  ) = _CopyWithImpl$Query$MySubmissions;

  factory CopyWith$Query$MySubmissions.stub(TRes res) =
      _CopyWithStubImpl$Query$MySubmissions;

  TRes call({
    Query$MySubmissions$mySubmissions? mySubmissions,
    String? $__typename,
  });
  CopyWith$Query$MySubmissions$mySubmissions<TRes> get mySubmissions;
}

class _CopyWithImpl$Query$MySubmissions<TRes>
    implements CopyWith$Query$MySubmissions<TRes> {
  _CopyWithImpl$Query$MySubmissions(
    this._instance,
    this._then,
  );

  final Query$MySubmissions _instance;

  final TRes Function(Query$MySubmissions) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? mySubmissions = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$MySubmissions(
        mySubmissions: mySubmissions == _undefined
            ? _instance.mySubmissions
            : (mySubmissions as Query$MySubmissions$mySubmissions?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$MySubmissions$mySubmissions<TRes> get mySubmissions {
    final local$mySubmissions = _instance.mySubmissions;
    return local$mySubmissions == null
        ? CopyWith$Query$MySubmissions$mySubmissions.stub(_then(_instance))
        : CopyWith$Query$MySubmissions$mySubmissions(
            local$mySubmissions, (e) => call(mySubmissions: e));
  }
}

class _CopyWithStubImpl$Query$MySubmissions<TRes>
    implements CopyWith$Query$MySubmissions<TRes> {
  _CopyWithStubImpl$Query$MySubmissions(this._res);

  TRes _res;

  call({
    Query$MySubmissions$mySubmissions? mySubmissions,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$MySubmissions$mySubmissions<TRes> get mySubmissions =>
      CopyWith$Query$MySubmissions$mySubmissions.stub(_res);
}

const documentNodeQueryMySubmissions = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'MySubmissions'),
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
        variable: VariableNode(name: NameNode(value: 'surveyId')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
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
            name: NameNode(value: 'surveyId'),
            value: VariableNode(name: NameNode(value: 'surveyId')),
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
                  FragmentSpreadNode(
                    name: NameNode(value: 'SubmissionFields'),
                    directives: [],
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
  fragmentDefinitionSubmissionFields,
]);
Query$MySubmissions _parserFn$Query$MySubmissions(Map<String, dynamic> data) =>
    Query$MySubmissions.fromJson(data);
typedef OnQueryComplete$Query$MySubmissions = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$MySubmissions?,
);

class Options$Query$MySubmissions
    extends graphql.QueryOptions<Query$MySubmissions> {
  Options$Query$MySubmissions({
    String? operationName,
    Variables$Query$MySubmissions? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$MySubmissions? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$MySubmissions? onComplete,
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
                    data == null ? null : _parserFn$Query$MySubmissions(data),
                  ),
          onError: onError,
          document: documentNodeQueryMySubmissions,
          parserFn: _parserFn$Query$MySubmissions,
        );

  final OnQueryComplete$Query$MySubmissions? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$MySubmissions
    extends graphql.WatchQueryOptions<Query$MySubmissions> {
  WatchOptions$Query$MySubmissions({
    String? operationName,
    Variables$Query$MySubmissions? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$MySubmissions? typedOptimisticResult,
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
          document: documentNodeQueryMySubmissions,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$MySubmissions,
        );
}

class FetchMoreOptions$Query$MySubmissions extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$MySubmissions({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$MySubmissions? variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables?.toJson() ?? {},
          document: documentNodeQueryMySubmissions,
        );
}

extension ClientExtension$Query$MySubmissions on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$MySubmissions>> query$MySubmissions(
          [Options$Query$MySubmissions? options]) async =>
      await this.query(options ?? Options$Query$MySubmissions());
  graphql.ObservableQuery<Query$MySubmissions> watchQuery$MySubmissions(
          [WatchOptions$Query$MySubmissions? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$MySubmissions());
  void writeQuery$MySubmissions({
    required Query$MySubmissions data,
    Variables$Query$MySubmissions? variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryMySubmissions),
          variables: variables?.toJson() ?? const {},
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$MySubmissions? readQuery$MySubmissions({
    Variables$Query$MySubmissions? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryMySubmissions),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$MySubmissions.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$MySubmissions> useQuery$MySubmissions(
        [Options$Query$MySubmissions? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$MySubmissions());
graphql.ObservableQuery<Query$MySubmissions> useWatchQuery$MySubmissions(
        [WatchOptions$Query$MySubmissions? options]) =>
    graphql_flutter
        .useWatchQuery(options ?? WatchOptions$Query$MySubmissions());

class Query$MySubmissions$Widget
    extends graphql_flutter.Query<Query$MySubmissions> {
  Query$MySubmissions$Widget({
    widgets.Key? key,
    Options$Query$MySubmissions? options,
    required graphql_flutter.QueryBuilder<Query$MySubmissions> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$MySubmissions(),
          builder: builder,
        );
}

class Query$MySubmissions$mySubmissions {
  Query$MySubmissions$mySubmissions({
    required this.edges,
    required this.pageInfo,
    this.$__typename = 'SubmissionNodeConnection',
  });

  factory Query$MySubmissions$mySubmissions.fromJson(
      Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$pageInfo = json['pageInfo'];
    final l$$__typename = json['__typename'];
    return Query$MySubmissions$mySubmissions(
      edges: (l$edges as List<dynamic>)
          .map((e) => e == null
              ? null
              : Query$MySubmissions$mySubmissions$edges.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      pageInfo: Query$MySubmissions$mySubmissions$pageInfo.fromJson(
          (l$pageInfo as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$MySubmissions$mySubmissions$edges?> edges;

  final Query$MySubmissions$mySubmissions$pageInfo pageInfo;

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
    if (other is! Query$MySubmissions$mySubmissions ||
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

extension UtilityExtension$Query$MySubmissions$mySubmissions
    on Query$MySubmissions$mySubmissions {
  CopyWith$Query$MySubmissions$mySubmissions<Query$MySubmissions$mySubmissions>
      get copyWith => CopyWith$Query$MySubmissions$mySubmissions(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$MySubmissions$mySubmissions<TRes> {
  factory CopyWith$Query$MySubmissions$mySubmissions(
    Query$MySubmissions$mySubmissions instance,
    TRes Function(Query$MySubmissions$mySubmissions) then,
  ) = _CopyWithImpl$Query$MySubmissions$mySubmissions;

  factory CopyWith$Query$MySubmissions$mySubmissions.stub(TRes res) =
      _CopyWithStubImpl$Query$MySubmissions$mySubmissions;

  TRes call({
    List<Query$MySubmissions$mySubmissions$edges?>? edges,
    Query$MySubmissions$mySubmissions$pageInfo? pageInfo,
    String? $__typename,
  });
  TRes edges(
      Iterable<Query$MySubmissions$mySubmissions$edges?> Function(
              Iterable<
                  CopyWith$Query$MySubmissions$mySubmissions$edges<
                      Query$MySubmissions$mySubmissions$edges>?>)
          _fn);
  CopyWith$Query$MySubmissions$mySubmissions$pageInfo<TRes> get pageInfo;
}

class _CopyWithImpl$Query$MySubmissions$mySubmissions<TRes>
    implements CopyWith$Query$MySubmissions$mySubmissions<TRes> {
  _CopyWithImpl$Query$MySubmissions$mySubmissions(
    this._instance,
    this._then,
  );

  final Query$MySubmissions$mySubmissions _instance;

  final TRes Function(Query$MySubmissions$mySubmissions) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? pageInfo = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$MySubmissions$mySubmissions(
        edges: edges == _undefined || edges == null
            ? _instance.edges
            : (edges as List<Query$MySubmissions$mySubmissions$edges?>),
        pageInfo: pageInfo == _undefined || pageInfo == null
            ? _instance.pageInfo
            : (pageInfo as Query$MySubmissions$mySubmissions$pageInfo),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes edges(
          Iterable<Query$MySubmissions$mySubmissions$edges?> Function(
                  Iterable<
                      CopyWith$Query$MySubmissions$mySubmissions$edges<
                          Query$MySubmissions$mySubmissions$edges>?>)
              _fn) =>
      call(
          edges: _fn(_instance.edges.map((e) => e == null
              ? null
              : CopyWith$Query$MySubmissions$mySubmissions$edges(
                  e,
                  (i) => i,
                ))).toList());

  CopyWith$Query$MySubmissions$mySubmissions$pageInfo<TRes> get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return CopyWith$Query$MySubmissions$mySubmissions$pageInfo(
        local$pageInfo, (e) => call(pageInfo: e));
  }
}

class _CopyWithStubImpl$Query$MySubmissions$mySubmissions<TRes>
    implements CopyWith$Query$MySubmissions$mySubmissions<TRes> {
  _CopyWithStubImpl$Query$MySubmissions$mySubmissions(this._res);

  TRes _res;

  call({
    List<Query$MySubmissions$mySubmissions$edges?>? edges,
    Query$MySubmissions$mySubmissions$pageInfo? pageInfo,
    String? $__typename,
  }) =>
      _res;

  edges(_fn) => _res;

  CopyWith$Query$MySubmissions$mySubmissions$pageInfo<TRes> get pageInfo =>
      CopyWith$Query$MySubmissions$mySubmissions$pageInfo.stub(_res);
}

class Query$MySubmissions$mySubmissions$edges {
  Query$MySubmissions$mySubmissions$edges({
    this.node,
    this.$__typename = 'SubmissionNodeEdge',
  });

  factory Query$MySubmissions$mySubmissions$edges.fromJson(
      Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$MySubmissions$mySubmissions$edges(
      node: l$node == null
          ? null
          : Fragment$SubmissionFields.fromJson(
              (l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$SubmissionFields? node;

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
    if (other is! Query$MySubmissions$mySubmissions$edges ||
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

extension UtilityExtension$Query$MySubmissions$mySubmissions$edges
    on Query$MySubmissions$mySubmissions$edges {
  CopyWith$Query$MySubmissions$mySubmissions$edges<
          Query$MySubmissions$mySubmissions$edges>
      get copyWith => CopyWith$Query$MySubmissions$mySubmissions$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$MySubmissions$mySubmissions$edges<TRes> {
  factory CopyWith$Query$MySubmissions$mySubmissions$edges(
    Query$MySubmissions$mySubmissions$edges instance,
    TRes Function(Query$MySubmissions$mySubmissions$edges) then,
  ) = _CopyWithImpl$Query$MySubmissions$mySubmissions$edges;

  factory CopyWith$Query$MySubmissions$mySubmissions$edges.stub(TRes res) =
      _CopyWithStubImpl$Query$MySubmissions$mySubmissions$edges;

  TRes call({
    Fragment$SubmissionFields? node,
    String? $__typename,
  });
  CopyWith$Fragment$SubmissionFields<TRes> get node;
}

class _CopyWithImpl$Query$MySubmissions$mySubmissions$edges<TRes>
    implements CopyWith$Query$MySubmissions$mySubmissions$edges<TRes> {
  _CopyWithImpl$Query$MySubmissions$mySubmissions$edges(
    this._instance,
    this._then,
  );

  final Query$MySubmissions$mySubmissions$edges _instance;

  final TRes Function(Query$MySubmissions$mySubmissions$edges) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$MySubmissions$mySubmissions$edges(
        node: node == _undefined
            ? _instance.node
            : (node as Fragment$SubmissionFields?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$SubmissionFields<TRes> get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Fragment$SubmissionFields.stub(_then(_instance))
        : CopyWith$Fragment$SubmissionFields(local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Query$MySubmissions$mySubmissions$edges<TRes>
    implements CopyWith$Query$MySubmissions$mySubmissions$edges<TRes> {
  _CopyWithStubImpl$Query$MySubmissions$mySubmissions$edges(this._res);

  TRes _res;

  call({
    Fragment$SubmissionFields? node,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$SubmissionFields<TRes> get node =>
      CopyWith$Fragment$SubmissionFields.stub(_res);
}

class Query$MySubmissions$mySubmissions$pageInfo {
  Query$MySubmissions$mySubmissions$pageInfo({
    required this.hasNextPage,
    required this.hasPreviousPage,
    this.startCursor,
    this.endCursor,
    this.$__typename = 'PageInfo',
  });

  factory Query$MySubmissions$mySubmissions$pageInfo.fromJson(
      Map<String, dynamic> json) {
    final l$hasNextPage = json['hasNextPage'];
    final l$hasPreviousPage = json['hasPreviousPage'];
    final l$startCursor = json['startCursor'];
    final l$endCursor = json['endCursor'];
    final l$$__typename = json['__typename'];
    return Query$MySubmissions$mySubmissions$pageInfo(
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
    if (other is! Query$MySubmissions$mySubmissions$pageInfo ||
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

extension UtilityExtension$Query$MySubmissions$mySubmissions$pageInfo
    on Query$MySubmissions$mySubmissions$pageInfo {
  CopyWith$Query$MySubmissions$mySubmissions$pageInfo<
          Query$MySubmissions$mySubmissions$pageInfo>
      get copyWith => CopyWith$Query$MySubmissions$mySubmissions$pageInfo(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$MySubmissions$mySubmissions$pageInfo<TRes> {
  factory CopyWith$Query$MySubmissions$mySubmissions$pageInfo(
    Query$MySubmissions$mySubmissions$pageInfo instance,
    TRes Function(Query$MySubmissions$mySubmissions$pageInfo) then,
  ) = _CopyWithImpl$Query$MySubmissions$mySubmissions$pageInfo;

  factory CopyWith$Query$MySubmissions$mySubmissions$pageInfo.stub(TRes res) =
      _CopyWithStubImpl$Query$MySubmissions$mySubmissions$pageInfo;

  TRes call({
    bool? hasNextPage,
    bool? hasPreviousPage,
    String? startCursor,
    String? endCursor,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$MySubmissions$mySubmissions$pageInfo<TRes>
    implements CopyWith$Query$MySubmissions$mySubmissions$pageInfo<TRes> {
  _CopyWithImpl$Query$MySubmissions$mySubmissions$pageInfo(
    this._instance,
    this._then,
  );

  final Query$MySubmissions$mySubmissions$pageInfo _instance;

  final TRes Function(Query$MySubmissions$mySubmissions$pageInfo) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? hasNextPage = _undefined,
    Object? hasPreviousPage = _undefined,
    Object? startCursor = _undefined,
    Object? endCursor = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$MySubmissions$mySubmissions$pageInfo(
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

class _CopyWithStubImpl$Query$MySubmissions$mySubmissions$pageInfo<TRes>
    implements CopyWith$Query$MySubmissions$mySubmissions$pageInfo<TRes> {
  _CopyWithStubImpl$Query$MySubmissions$mySubmissions$pageInfo(this._res);

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

class Variables$Query$GetSubmissionById {
  factory Variables$Query$GetSubmissionById({required String id}) =>
      Variables$Query$GetSubmissionById._({
        r'id': id,
      });

  Variables$Query$GetSubmissionById._(this._$data);

  factory Variables$Query$GetSubmissionById.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Query$GetSubmissionById._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$GetSubmissionById<Variables$Query$GetSubmissionById>
      get copyWith => CopyWith$Variables$Query$GetSubmissionById(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetSubmissionById ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    return Object.hashAll([l$id]);
  }
}

abstract class CopyWith$Variables$Query$GetSubmissionById<TRes> {
  factory CopyWith$Variables$Query$GetSubmissionById(
    Variables$Query$GetSubmissionById instance,
    TRes Function(Variables$Query$GetSubmissionById) then,
  ) = _CopyWithImpl$Variables$Query$GetSubmissionById;

  factory CopyWith$Variables$Query$GetSubmissionById.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetSubmissionById;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Query$GetSubmissionById<TRes>
    implements CopyWith$Variables$Query$GetSubmissionById<TRes> {
  _CopyWithImpl$Variables$Query$GetSubmissionById(
    this._instance,
    this._then,
  );

  final Variables$Query$GetSubmissionById _instance;

  final TRes Function(Variables$Query$GetSubmissionById) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Query$GetSubmissionById._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetSubmissionById<TRes>
    implements CopyWith$Variables$Query$GetSubmissionById<TRes> {
  _CopyWithStubImpl$Variables$Query$GetSubmissionById(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Query$GetSubmissionById {
  Query$GetSubmissionById({
    this.submission,
    this.$__typename = 'Query',
  });

  factory Query$GetSubmissionById.fromJson(Map<String, dynamic> json) {
    final l$submission = json['submission'];
    final l$$__typename = json['__typename'];
    return Query$GetSubmissionById(
      submission: l$submission == null
          ? null
          : Fragment$SubmissionFields.fromJson(
              (l$submission as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$SubmissionFields? submission;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$submission = submission;
    _resultData['submission'] = l$submission?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$submission = submission;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$submission,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetSubmissionById || runtimeType != other.runtimeType) {
      return false;
    }
    final l$submission = submission;
    final lOther$submission = other.submission;
    if (l$submission != lOther$submission) {
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

extension UtilityExtension$Query$GetSubmissionById on Query$GetSubmissionById {
  CopyWith$Query$GetSubmissionById<Query$GetSubmissionById> get copyWith =>
      CopyWith$Query$GetSubmissionById(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetSubmissionById<TRes> {
  factory CopyWith$Query$GetSubmissionById(
    Query$GetSubmissionById instance,
    TRes Function(Query$GetSubmissionById) then,
  ) = _CopyWithImpl$Query$GetSubmissionById;

  factory CopyWith$Query$GetSubmissionById.stub(TRes res) =
      _CopyWithStubImpl$Query$GetSubmissionById;

  TRes call({
    Fragment$SubmissionFields? submission,
    String? $__typename,
  });
  CopyWith$Fragment$SubmissionFields<TRes> get submission;
}

class _CopyWithImpl$Query$GetSubmissionById<TRes>
    implements CopyWith$Query$GetSubmissionById<TRes> {
  _CopyWithImpl$Query$GetSubmissionById(
    this._instance,
    this._then,
  );

  final Query$GetSubmissionById _instance;

  final TRes Function(Query$GetSubmissionById) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? submission = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetSubmissionById(
        submission: submission == _undefined
            ? _instance.submission
            : (submission as Fragment$SubmissionFields?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$SubmissionFields<TRes> get submission {
    final local$submission = _instance.submission;
    return local$submission == null
        ? CopyWith$Fragment$SubmissionFields.stub(_then(_instance))
        : CopyWith$Fragment$SubmissionFields(
            local$submission, (e) => call(submission: e));
  }
}

class _CopyWithStubImpl$Query$GetSubmissionById<TRes>
    implements CopyWith$Query$GetSubmissionById<TRes> {
  _CopyWithStubImpl$Query$GetSubmissionById(this._res);

  TRes _res;

  call({
    Fragment$SubmissionFields? submission,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$SubmissionFields<TRes> get submission =>
      CopyWith$Fragment$SubmissionFields.stub(_res);
}

const documentNodeQueryGetSubmissionById = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetSubmissionById'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
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
        name: NameNode(value: 'submission'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'id')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'SubmissionFields'),
            directives: [],
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
  fragmentDefinitionSubmissionFields,
]);
Query$GetSubmissionById _parserFn$Query$GetSubmissionById(
        Map<String, dynamic> data) =>
    Query$GetSubmissionById.fromJson(data);
typedef OnQueryComplete$Query$GetSubmissionById = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetSubmissionById?,
);

class Options$Query$GetSubmissionById
    extends graphql.QueryOptions<Query$GetSubmissionById> {
  Options$Query$GetSubmissionById({
    String? operationName,
    required Variables$Query$GetSubmissionById variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetSubmissionById? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetSubmissionById? onComplete,
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
                    data == null
                        ? null
                        : _parserFn$Query$GetSubmissionById(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetSubmissionById,
          parserFn: _parserFn$Query$GetSubmissionById,
        );

  final OnQueryComplete$Query$GetSubmissionById? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetSubmissionById
    extends graphql.WatchQueryOptions<Query$GetSubmissionById> {
  WatchOptions$Query$GetSubmissionById({
    String? operationName,
    required Variables$Query$GetSubmissionById variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetSubmissionById? typedOptimisticResult,
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
          document: documentNodeQueryGetSubmissionById,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetSubmissionById,
        );
}

class FetchMoreOptions$Query$GetSubmissionById
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetSubmissionById({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetSubmissionById variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryGetSubmissionById,
        );
}

extension ClientExtension$Query$GetSubmissionById on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetSubmissionById>> query$GetSubmissionById(
          Options$Query$GetSubmissionById options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$GetSubmissionById> watchQuery$GetSubmissionById(
          WatchOptions$Query$GetSubmissionById options) =>
      this.watchQuery(options);
  void writeQuery$GetSubmissionById({
    required Query$GetSubmissionById data,
    required Variables$Query$GetSubmissionById variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryGetSubmissionById),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetSubmissionById? readQuery$GetSubmissionById({
    required Variables$Query$GetSubmissionById variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryGetSubmissionById),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetSubmissionById.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetSubmissionById>
    useQuery$GetSubmissionById(Options$Query$GetSubmissionById options) =>
        graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$GetSubmissionById>
    useWatchQuery$GetSubmissionById(
            WatchOptions$Query$GetSubmissionById options) =>
        graphql_flutter.useWatchQuery(options);

class Query$GetSubmissionById$Widget
    extends graphql_flutter.Query<Query$GetSubmissionById> {
  Query$GetSubmissionById$Widget({
    widgets.Key? key,
    required Options$Query$GetSubmissionById options,
    required graphql_flutter.QueryBuilder<Query$GetSubmissionById> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Variables$Query$GetSubmissionByLocalId {
  factory Variables$Query$GetSubmissionByLocalId({required String localId}) =>
      Variables$Query$GetSubmissionByLocalId._({
        r'localId': localId,
      });

  Variables$Query$GetSubmissionByLocalId._(this._$data);

  factory Variables$Query$GetSubmissionByLocalId.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$localId = data['localId'];
    result$data['localId'] = (l$localId as String);
    return Variables$Query$GetSubmissionByLocalId._(result$data);
  }

  Map<String, dynamic> _$data;

  String get localId => (_$data['localId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$localId = localId;
    result$data['localId'] = l$localId;
    return result$data;
  }

  CopyWith$Variables$Query$GetSubmissionByLocalId<
          Variables$Query$GetSubmissionByLocalId>
      get copyWith => CopyWith$Variables$Query$GetSubmissionByLocalId(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetSubmissionByLocalId ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$localId = localId;
    final lOther$localId = other.localId;
    if (l$localId != lOther$localId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$localId = localId;
    return Object.hashAll([l$localId]);
  }
}

abstract class CopyWith$Variables$Query$GetSubmissionByLocalId<TRes> {
  factory CopyWith$Variables$Query$GetSubmissionByLocalId(
    Variables$Query$GetSubmissionByLocalId instance,
    TRes Function(Variables$Query$GetSubmissionByLocalId) then,
  ) = _CopyWithImpl$Variables$Query$GetSubmissionByLocalId;

  factory CopyWith$Variables$Query$GetSubmissionByLocalId.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetSubmissionByLocalId;

  TRes call({String? localId});
}

class _CopyWithImpl$Variables$Query$GetSubmissionByLocalId<TRes>
    implements CopyWith$Variables$Query$GetSubmissionByLocalId<TRes> {
  _CopyWithImpl$Variables$Query$GetSubmissionByLocalId(
    this._instance,
    this._then,
  );

  final Variables$Query$GetSubmissionByLocalId _instance;

  final TRes Function(Variables$Query$GetSubmissionByLocalId) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? localId = _undefined}) =>
      _then(Variables$Query$GetSubmissionByLocalId._({
        ..._instance._$data,
        if (localId != _undefined && localId != null)
          'localId': (localId as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetSubmissionByLocalId<TRes>
    implements CopyWith$Variables$Query$GetSubmissionByLocalId<TRes> {
  _CopyWithStubImpl$Variables$Query$GetSubmissionByLocalId(this._res);

  TRes _res;

  call({String? localId}) => _res;
}

class Query$GetSubmissionByLocalId {
  Query$GetSubmissionByLocalId({
    this.submissionByLocalId,
    this.$__typename = 'Query',
  });

  factory Query$GetSubmissionByLocalId.fromJson(Map<String, dynamic> json) {
    final l$submissionByLocalId = json['submissionByLocalId'];
    final l$$__typename = json['__typename'];
    return Query$GetSubmissionByLocalId(
      submissionByLocalId: l$submissionByLocalId == null
          ? null
          : Fragment$SubmissionFields.fromJson(
              (l$submissionByLocalId as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$SubmissionFields? submissionByLocalId;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$submissionByLocalId = submissionByLocalId;
    _resultData['submissionByLocalId'] = l$submissionByLocalId?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$submissionByLocalId = submissionByLocalId;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$submissionByLocalId,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetSubmissionByLocalId ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$submissionByLocalId = submissionByLocalId;
    final lOther$submissionByLocalId = other.submissionByLocalId;
    if (l$submissionByLocalId != lOther$submissionByLocalId) {
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

extension UtilityExtension$Query$GetSubmissionByLocalId
    on Query$GetSubmissionByLocalId {
  CopyWith$Query$GetSubmissionByLocalId<Query$GetSubmissionByLocalId>
      get copyWith => CopyWith$Query$GetSubmissionByLocalId(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetSubmissionByLocalId<TRes> {
  factory CopyWith$Query$GetSubmissionByLocalId(
    Query$GetSubmissionByLocalId instance,
    TRes Function(Query$GetSubmissionByLocalId) then,
  ) = _CopyWithImpl$Query$GetSubmissionByLocalId;

  factory CopyWith$Query$GetSubmissionByLocalId.stub(TRes res) =
      _CopyWithStubImpl$Query$GetSubmissionByLocalId;

  TRes call({
    Fragment$SubmissionFields? submissionByLocalId,
    String? $__typename,
  });
  CopyWith$Fragment$SubmissionFields<TRes> get submissionByLocalId;
}

class _CopyWithImpl$Query$GetSubmissionByLocalId<TRes>
    implements CopyWith$Query$GetSubmissionByLocalId<TRes> {
  _CopyWithImpl$Query$GetSubmissionByLocalId(
    this._instance,
    this._then,
  );

  final Query$GetSubmissionByLocalId _instance;

  final TRes Function(Query$GetSubmissionByLocalId) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? submissionByLocalId = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetSubmissionByLocalId(
        submissionByLocalId: submissionByLocalId == _undefined
            ? _instance.submissionByLocalId
            : (submissionByLocalId as Fragment$SubmissionFields?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$SubmissionFields<TRes> get submissionByLocalId {
    final local$submissionByLocalId = _instance.submissionByLocalId;
    return local$submissionByLocalId == null
        ? CopyWith$Fragment$SubmissionFields.stub(_then(_instance))
        : CopyWith$Fragment$SubmissionFields(
            local$submissionByLocalId, (e) => call(submissionByLocalId: e));
  }
}

class _CopyWithStubImpl$Query$GetSubmissionByLocalId<TRes>
    implements CopyWith$Query$GetSubmissionByLocalId<TRes> {
  _CopyWithStubImpl$Query$GetSubmissionByLocalId(this._res);

  TRes _res;

  call({
    Fragment$SubmissionFields? submissionByLocalId,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$SubmissionFields<TRes> get submissionByLocalId =>
      CopyWith$Fragment$SubmissionFields.stub(_res);
}

const documentNodeQueryGetSubmissionByLocalId = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetSubmissionByLocalId'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'localId')),
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
        name: NameNode(value: 'submissionByLocalId'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'localId'),
            value: VariableNode(name: NameNode(value: 'localId')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'SubmissionFields'),
            directives: [],
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
  fragmentDefinitionSubmissionFields,
]);
Query$GetSubmissionByLocalId _parserFn$Query$GetSubmissionByLocalId(
        Map<String, dynamic> data) =>
    Query$GetSubmissionByLocalId.fromJson(data);
typedef OnQueryComplete$Query$GetSubmissionByLocalId = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetSubmissionByLocalId?,
);

class Options$Query$GetSubmissionByLocalId
    extends graphql.QueryOptions<Query$GetSubmissionByLocalId> {
  Options$Query$GetSubmissionByLocalId({
    String? operationName,
    required Variables$Query$GetSubmissionByLocalId variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetSubmissionByLocalId? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetSubmissionByLocalId? onComplete,
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
                    data == null
                        ? null
                        : _parserFn$Query$GetSubmissionByLocalId(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetSubmissionByLocalId,
          parserFn: _parserFn$Query$GetSubmissionByLocalId,
        );

  final OnQueryComplete$Query$GetSubmissionByLocalId? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetSubmissionByLocalId
    extends graphql.WatchQueryOptions<Query$GetSubmissionByLocalId> {
  WatchOptions$Query$GetSubmissionByLocalId({
    String? operationName,
    required Variables$Query$GetSubmissionByLocalId variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetSubmissionByLocalId? typedOptimisticResult,
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
          document: documentNodeQueryGetSubmissionByLocalId,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetSubmissionByLocalId,
        );
}

class FetchMoreOptions$Query$GetSubmissionByLocalId
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetSubmissionByLocalId({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetSubmissionByLocalId variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryGetSubmissionByLocalId,
        );
}

extension ClientExtension$Query$GetSubmissionByLocalId
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetSubmissionByLocalId>>
      query$GetSubmissionByLocalId(
              Options$Query$GetSubmissionByLocalId options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$GetSubmissionByLocalId>
      watchQuery$GetSubmissionByLocalId(
              WatchOptions$Query$GetSubmissionByLocalId options) =>
          this.watchQuery(options);
  void writeQuery$GetSubmissionByLocalId({
    required Query$GetSubmissionByLocalId data,
    required Variables$Query$GetSubmissionByLocalId variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryGetSubmissionByLocalId),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetSubmissionByLocalId? readQuery$GetSubmissionByLocalId({
    required Variables$Query$GetSubmissionByLocalId variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQueryGetSubmissionByLocalId),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$GetSubmissionByLocalId.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetSubmissionByLocalId>
    useQuery$GetSubmissionByLocalId(
            Options$Query$GetSubmissionByLocalId options) =>
        graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$GetSubmissionByLocalId>
    useWatchQuery$GetSubmissionByLocalId(
            WatchOptions$Query$GetSubmissionByLocalId options) =>
        graphql_flutter.useWatchQuery(options);

class Query$GetSubmissionByLocalId$Widget
    extends graphql_flutter.Query<Query$GetSubmissionByLocalId> {
  Query$GetSubmissionByLocalId$Widget({
    widgets.Key? key,
    required Options$Query$GetSubmissionByLocalId options,
    required graphql_flutter.QueryBuilder<Query$GetSubmissionByLocalId> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}
