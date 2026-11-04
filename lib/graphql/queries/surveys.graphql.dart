import '../../schema.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Fragment$QuestionFetch {
  Fragment$QuestionFetch({
    required this.id,
    required this.text,
    this.localizedText,
    this.hint,
    required this.questionType,
    required this.isRequired,
    required this.order,
    this.evaluatorCondition,
    this.minLength,
    this.maxLength,
    this.minValue,
    this.maxValue,
    this.validationPattern,
    this.localizedHint,
    this.group,
    this.validationMessage,
    this.isConditional,
    this.key,
    this.filterOptionsQuestion,
    this.page,
    required this.options,
    this.conditions,
    this.$__typename = 'QuestionNode',
  });

  factory Fragment$QuestionFetch.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$text = json['text'];
    final l$localizedText = json['localizedText'];
    final l$hint = json['hint'];
    final l$questionType = json['questionType'];
    final l$isRequired = json['isRequired'];
    final l$order = json['order'];
    final l$evaluatorCondition = json['evaluatorCondition'];
    final l$minLength = json['minLength'];
    final l$maxLength = json['maxLength'];
    final l$minValue = json['minValue'];
    final l$maxValue = json['maxValue'];
    final l$validationPattern = json['validationPattern'];
    final l$localizedHint = json['localizedHint'];
    final l$group = json['group'];
    final l$validationMessage = json['validationMessage'];
    final l$isConditional = json['isConditional'];
    final l$key = json['key'];
    final l$filterOptionsQuestion = json['filterOptionsQuestion'];
    final l$page = json['page'];
    final l$options = json['options'];
    final l$conditions = json['conditions'];
    final l$$__typename = json['__typename'];
    return Fragment$QuestionFetch(
      id: (l$id as String),
      text: (l$text as String),
      localizedText: (l$localizedText as String?),
      hint: (l$hint as String?),
      questionType: fromJson$Enum$SurveyQuestionQuestionTypeChoices(
          (l$questionType as String)),
      isRequired: (l$isRequired as bool),
      order: (l$order as int),
      evaluatorCondition: (l$evaluatorCondition as String?),
      minLength: (l$minLength as int?),
      maxLength: (l$maxLength as int?),
      minValue: (l$minValue as String?),
      maxValue: (l$maxValue as String?),
      validationPattern: (l$validationPattern as String?),
      localizedHint: (l$localizedHint as String?),
      group: (l$group as String?),
      validationMessage: (l$validationMessage as String?),
      isConditional: (l$isConditional as bool?),
      key: (l$key as String?),
      filterOptionsQuestion: l$filterOptionsQuestion == null
          ? null
          : Fragment$QuestionFetch$filterOptionsQuestion.fromJson(
              (l$filterOptionsQuestion as Map<String, dynamic>)),
      page: l$page == null
          ? null
          : Fragment$QuestionFetch$page.fromJson(
              (l$page as Map<String, dynamic>)),
      options: Fragment$QuestionFetch$options.fromJson(
          (l$options as Map<String, dynamic>)),
      conditions: (l$conditions as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Fragment$QuestionFetch$conditions.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String text;

  final String? localizedText;

  final String? hint;

  final Enum$SurveyQuestionQuestionTypeChoices questionType;

  final bool isRequired;

  final int order;

  final String? evaluatorCondition;

  final int? minLength;

  final int? maxLength;

  final String? minValue;

  final String? maxValue;

  final String? validationPattern;

  final String? localizedHint;

  final String? group;

  final String? validationMessage;

  final bool? isConditional;

  final String? key;

  final Fragment$QuestionFetch$filterOptionsQuestion? filterOptionsQuestion;

  final Fragment$QuestionFetch$page? page;

  final Fragment$QuestionFetch$options options;

  final List<Fragment$QuestionFetch$conditions?>? conditions;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$text = text;
    _resultData['text'] = l$text;
    final l$localizedText = localizedText;
    _resultData['localizedText'] = l$localizedText;
    final l$hint = hint;
    _resultData['hint'] = l$hint;
    final l$questionType = questionType;
    _resultData['questionType'] =
        toJson$Enum$SurveyQuestionQuestionTypeChoices(l$questionType);
    final l$isRequired = isRequired;
    _resultData['isRequired'] = l$isRequired;
    final l$order = order;
    _resultData['order'] = l$order;
    final l$evaluatorCondition = evaluatorCondition;
    _resultData['evaluatorCondition'] = l$evaluatorCondition;
    final l$minLength = minLength;
    _resultData['minLength'] = l$minLength;
    final l$maxLength = maxLength;
    _resultData['maxLength'] = l$maxLength;
    final l$minValue = minValue;
    _resultData['minValue'] = l$minValue;
    final l$maxValue = maxValue;
    _resultData['maxValue'] = l$maxValue;
    final l$validationPattern = validationPattern;
    _resultData['validationPattern'] = l$validationPattern;
    final l$localizedHint = localizedHint;
    _resultData['localizedHint'] = l$localizedHint;
    final l$group = group;
    _resultData['group'] = l$group;
    final l$validationMessage = validationMessage;
    _resultData['validationMessage'] = l$validationMessage;
    final l$isConditional = isConditional;
    _resultData['isConditional'] = l$isConditional;
    final l$key = key;
    _resultData['key'] = l$key;
    final l$filterOptionsQuestion = filterOptionsQuestion;
    _resultData['filterOptionsQuestion'] = l$filterOptionsQuestion?.toJson();
    final l$page = page;
    _resultData['page'] = l$page?.toJson();
    final l$options = options;
    _resultData['options'] = l$options.toJson();
    final l$conditions = conditions;
    _resultData['conditions'] = l$conditions?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$text = text;
    final l$localizedText = localizedText;
    final l$hint = hint;
    final l$questionType = questionType;
    final l$isRequired = isRequired;
    final l$order = order;
    final l$evaluatorCondition = evaluatorCondition;
    final l$minLength = minLength;
    final l$maxLength = maxLength;
    final l$minValue = minValue;
    final l$maxValue = maxValue;
    final l$validationPattern = validationPattern;
    final l$localizedHint = localizedHint;
    final l$group = group;
    final l$validationMessage = validationMessage;
    final l$isConditional = isConditional;
    final l$key = key;
    final l$filterOptionsQuestion = filterOptionsQuestion;
    final l$page = page;
    final l$options = options;
    final l$conditions = conditions;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$text,
      l$localizedText,
      l$hint,
      l$questionType,
      l$isRequired,
      l$order,
      l$evaluatorCondition,
      l$minLength,
      l$maxLength,
      l$minValue,
      l$maxValue,
      l$validationPattern,
      l$localizedHint,
      l$group,
      l$validationMessage,
      l$isConditional,
      l$key,
      l$filterOptionsQuestion,
      l$page,
      l$options,
      l$conditions == null ? null : Object.hashAll(l$conditions.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$QuestionFetch || runtimeType != other.runtimeType) {
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
    final l$localizedText = localizedText;
    final lOther$localizedText = other.localizedText;
    if (l$localizedText != lOther$localizedText) {
      return false;
    }
    final l$hint = hint;
    final lOther$hint = other.hint;
    if (l$hint != lOther$hint) {
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
    final l$order = order;
    final lOther$order = other.order;
    if (l$order != lOther$order) {
      return false;
    }
    final l$evaluatorCondition = evaluatorCondition;
    final lOther$evaluatorCondition = other.evaluatorCondition;
    if (l$evaluatorCondition != lOther$evaluatorCondition) {
      return false;
    }
    final l$minLength = minLength;
    final lOther$minLength = other.minLength;
    if (l$minLength != lOther$minLength) {
      return false;
    }
    final l$maxLength = maxLength;
    final lOther$maxLength = other.maxLength;
    if (l$maxLength != lOther$maxLength) {
      return false;
    }
    final l$minValue = minValue;
    final lOther$minValue = other.minValue;
    if (l$minValue != lOther$minValue) {
      return false;
    }
    final l$maxValue = maxValue;
    final lOther$maxValue = other.maxValue;
    if (l$maxValue != lOther$maxValue) {
      return false;
    }
    final l$validationPattern = validationPattern;
    final lOther$validationPattern = other.validationPattern;
    if (l$validationPattern != lOther$validationPattern) {
      return false;
    }
    final l$localizedHint = localizedHint;
    final lOther$localizedHint = other.localizedHint;
    if (l$localizedHint != lOther$localizedHint) {
      return false;
    }
    final l$group = group;
    final lOther$group = other.group;
    if (l$group != lOther$group) {
      return false;
    }
    final l$validationMessage = validationMessage;
    final lOther$validationMessage = other.validationMessage;
    if (l$validationMessage != lOther$validationMessage) {
      return false;
    }
    final l$isConditional = isConditional;
    final lOther$isConditional = other.isConditional;
    if (l$isConditional != lOther$isConditional) {
      return false;
    }
    final l$key = key;
    final lOther$key = other.key;
    if (l$key != lOther$key) {
      return false;
    }
    final l$filterOptionsQuestion = filterOptionsQuestion;
    final lOther$filterOptionsQuestion = other.filterOptionsQuestion;
    if (l$filterOptionsQuestion != lOther$filterOptionsQuestion) {
      return false;
    }
    final l$page = page;
    final lOther$page = other.page;
    if (l$page != lOther$page) {
      return false;
    }
    final l$options = options;
    final lOther$options = other.options;
    if (l$options != lOther$options) {
      return false;
    }
    final l$conditions = conditions;
    final lOther$conditions = other.conditions;
    if (l$conditions != null && lOther$conditions != null) {
      if (l$conditions.length != lOther$conditions.length) {
        return false;
      }
      for (int i = 0; i < l$conditions.length; i++) {
        final l$conditions$entry = l$conditions[i];
        final lOther$conditions$entry = lOther$conditions[i];
        if (l$conditions$entry != lOther$conditions$entry) {
          return false;
        }
      }
    } else if (l$conditions != lOther$conditions) {
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

extension UtilityExtension$Fragment$QuestionFetch on Fragment$QuestionFetch {
  CopyWith$Fragment$QuestionFetch<Fragment$QuestionFetch> get copyWith =>
      CopyWith$Fragment$QuestionFetch(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$QuestionFetch<TRes> {
  factory CopyWith$Fragment$QuestionFetch(
    Fragment$QuestionFetch instance,
    TRes Function(Fragment$QuestionFetch) then,
  ) = _CopyWithImpl$Fragment$QuestionFetch;

  factory CopyWith$Fragment$QuestionFetch.stub(TRes res) =
      _CopyWithStubImpl$Fragment$QuestionFetch;

  TRes call({
    String? id,
    String? text,
    String? localizedText,
    String? hint,
    Enum$SurveyQuestionQuestionTypeChoices? questionType,
    bool? isRequired,
    int? order,
    String? evaluatorCondition,
    int? minLength,
    int? maxLength,
    String? minValue,
    String? maxValue,
    String? validationPattern,
    String? localizedHint,
    String? group,
    String? validationMessage,
    bool? isConditional,
    String? key,
    Fragment$QuestionFetch$filterOptionsQuestion? filterOptionsQuestion,
    Fragment$QuestionFetch$page? page,
    Fragment$QuestionFetch$options? options,
    List<Fragment$QuestionFetch$conditions?>? conditions,
    String? $__typename,
  });
  CopyWith$Fragment$QuestionFetch$filterOptionsQuestion<TRes>
      get filterOptionsQuestion;
  CopyWith$Fragment$QuestionFetch$page<TRes> get page;
  CopyWith$Fragment$QuestionFetch$options<TRes> get options;
  TRes conditions(
      Iterable<Fragment$QuestionFetch$conditions?>? Function(
              Iterable<
                  CopyWith$Fragment$QuestionFetch$conditions<
                      Fragment$QuestionFetch$conditions>?>?)
          _fn);
}

class _CopyWithImpl$Fragment$QuestionFetch<TRes>
    implements CopyWith$Fragment$QuestionFetch<TRes> {
  _CopyWithImpl$Fragment$QuestionFetch(
    this._instance,
    this._then,
  );

  final Fragment$QuestionFetch _instance;

  final TRes Function(Fragment$QuestionFetch) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? text = _undefined,
    Object? localizedText = _undefined,
    Object? hint = _undefined,
    Object? questionType = _undefined,
    Object? isRequired = _undefined,
    Object? order = _undefined,
    Object? evaluatorCondition = _undefined,
    Object? minLength = _undefined,
    Object? maxLength = _undefined,
    Object? minValue = _undefined,
    Object? maxValue = _undefined,
    Object? validationPattern = _undefined,
    Object? localizedHint = _undefined,
    Object? group = _undefined,
    Object? validationMessage = _undefined,
    Object? isConditional = _undefined,
    Object? key = _undefined,
    Object? filterOptionsQuestion = _undefined,
    Object? page = _undefined,
    Object? options = _undefined,
    Object? conditions = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$QuestionFetch(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        text: text == _undefined || text == null
            ? _instance.text
            : (text as String),
        localizedText: localizedText == _undefined
            ? _instance.localizedText
            : (localizedText as String?),
        hint: hint == _undefined ? _instance.hint : (hint as String?),
        questionType: questionType == _undefined || questionType == null
            ? _instance.questionType
            : (questionType as Enum$SurveyQuestionQuestionTypeChoices),
        isRequired: isRequired == _undefined || isRequired == null
            ? _instance.isRequired
            : (isRequired as bool),
        order: order == _undefined || order == null
            ? _instance.order
            : (order as int),
        evaluatorCondition: evaluatorCondition == _undefined
            ? _instance.evaluatorCondition
            : (evaluatorCondition as String?),
        minLength:
            minLength == _undefined ? _instance.minLength : (minLength as int?),
        maxLength:
            maxLength == _undefined ? _instance.maxLength : (maxLength as int?),
        minValue:
            minValue == _undefined ? _instance.minValue : (minValue as String?),
        maxValue:
            maxValue == _undefined ? _instance.maxValue : (maxValue as String?),
        validationPattern: validationPattern == _undefined
            ? _instance.validationPattern
            : (validationPattern as String?),
        localizedHint: localizedHint == _undefined
            ? _instance.localizedHint
            : (localizedHint as String?),
        group: group == _undefined ? _instance.group : (group as String?),
        validationMessage: validationMessage == _undefined
            ? _instance.validationMessage
            : (validationMessage as String?),
        isConditional: isConditional == _undefined
            ? _instance.isConditional
            : (isConditional as bool?),
        key: key == _undefined ? _instance.key : (key as String?),
        filterOptionsQuestion: filterOptionsQuestion == _undefined
            ? _instance.filterOptionsQuestion
            : (filterOptionsQuestion
                as Fragment$QuestionFetch$filterOptionsQuestion?),
        page: page == _undefined
            ? _instance.page
            : (page as Fragment$QuestionFetch$page?),
        options: options == _undefined || options == null
            ? _instance.options
            : (options as Fragment$QuestionFetch$options),
        conditions: conditions == _undefined
            ? _instance.conditions
            : (conditions as List<Fragment$QuestionFetch$conditions?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$QuestionFetch$filterOptionsQuestion<TRes>
      get filterOptionsQuestion {
    final local$filterOptionsQuestion = _instance.filterOptionsQuestion;
    return local$filterOptionsQuestion == null
        ? CopyWith$Fragment$QuestionFetch$filterOptionsQuestion.stub(
            _then(_instance))
        : CopyWith$Fragment$QuestionFetch$filterOptionsQuestion(
            local$filterOptionsQuestion, (e) => call(filterOptionsQuestion: e));
  }

  CopyWith$Fragment$QuestionFetch$page<TRes> get page {
    final local$page = _instance.page;
    return local$page == null
        ? CopyWith$Fragment$QuestionFetch$page.stub(_then(_instance))
        : CopyWith$Fragment$QuestionFetch$page(
            local$page, (e) => call(page: e));
  }

  CopyWith$Fragment$QuestionFetch$options<TRes> get options {
    final local$options = _instance.options;
    return CopyWith$Fragment$QuestionFetch$options(
        local$options, (e) => call(options: e));
  }

  TRes conditions(
          Iterable<Fragment$QuestionFetch$conditions?>? Function(
                  Iterable<
                      CopyWith$Fragment$QuestionFetch$conditions<
                          Fragment$QuestionFetch$conditions>?>?)
              _fn) =>
      call(
          conditions: _fn(_instance.conditions?.map((e) => e == null
              ? null
              : CopyWith$Fragment$QuestionFetch$conditions(
                  e,
                  (i) => i,
                )))?.toList());
}

class _CopyWithStubImpl$Fragment$QuestionFetch<TRes>
    implements CopyWith$Fragment$QuestionFetch<TRes> {
  _CopyWithStubImpl$Fragment$QuestionFetch(this._res);

  TRes _res;

  call({
    String? id,
    String? text,
    String? localizedText,
    String? hint,
    Enum$SurveyQuestionQuestionTypeChoices? questionType,
    bool? isRequired,
    int? order,
    String? evaluatorCondition,
    int? minLength,
    int? maxLength,
    String? minValue,
    String? maxValue,
    String? validationPattern,
    String? localizedHint,
    String? group,
    String? validationMessage,
    bool? isConditional,
    String? key,
    Fragment$QuestionFetch$filterOptionsQuestion? filterOptionsQuestion,
    Fragment$QuestionFetch$page? page,
    Fragment$QuestionFetch$options? options,
    List<Fragment$QuestionFetch$conditions?>? conditions,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$QuestionFetch$filterOptionsQuestion<TRes>
      get filterOptionsQuestion =>
          CopyWith$Fragment$QuestionFetch$filterOptionsQuestion.stub(_res);

  CopyWith$Fragment$QuestionFetch$page<TRes> get page =>
      CopyWith$Fragment$QuestionFetch$page.stub(_res);

  CopyWith$Fragment$QuestionFetch$options<TRes> get options =>
      CopyWith$Fragment$QuestionFetch$options.stub(_res);

  conditions(_fn) => _res;
}

const fragmentDefinitionQuestionFetch = FragmentDefinitionNode(
  name: NameNode(value: 'QuestionFetch'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'QuestionNode'),
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
      name: NameNode(value: 'text'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'localizedText'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'hint'),
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
      name: NameNode(value: 'order'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'evaluatorCondition'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'minLength'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'maxLength'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'minValue'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'maxValue'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'validationPattern'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'localizedHint'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'group'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'validationMessage'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'isConditional'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'key'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'filterOptionsQuestion'),
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
      name: NameNode(value: 'page'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
          name: NameNode(value: 'order'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
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
      name: NameNode(value: 'options'),
      alias: null,
      arguments: [
        ArgumentNode(
          name: NameNode(value: 'first'),
          value: IntValueNode(value: '50'),
        )
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
                  name: NameNode(value: 'text'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'localizedText'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'optionWarning'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'optionWarningText'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'localizedOptionWarning'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'localizedOptionWarningText'),
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
                  name: NameNode(value: 'conditions'),
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
                      name: NameNode(value: 'conditionType'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: null,
                    ),
                    FieldNode(
                      name: NameNode(value: 'logicOperator'),
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
                      name: NameNode(value: 'targetQuestion'),
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
                          name: NameNode(value: 'key'),
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
                      name: NameNode(value: 'value'),
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
                  name: NameNode(value: 'hasSubQuestion'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'subQuestions'),
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
                      name: NameNode(value: 'localizedText'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: null,
                    ),
                    FieldNode(
                      name: NameNode(value: 'hint'),
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
                      name: NameNode(value: 'order'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: null,
                    ),
                    FieldNode(
                      name: NameNode(value: 'minLength'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: null,
                    ),
                    FieldNode(
                      name: NameNode(value: 'maxLength'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: null,
                    ),
                    FieldNode(
                      name: NameNode(value: 'minValue'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: null,
                    ),
                    FieldNode(
                      name: NameNode(value: 'maxValue'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: null,
                    ),
                    FieldNode(
                      name: NameNode(value: 'validationPattern'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: null,
                    ),
                    FieldNode(
                      name: NameNode(value: 'validationMessage'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: null,
                    ),
                    FieldNode(
                      name: NameNode(value: 'filterOptionsQuestion'),
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
                      name: NameNode(value: 'options'),
                      alias: null,
                      arguments: [
                        ArgumentNode(
                          name: NameNode(value: 'first'),
                          value: IntValueNode(value: '50'),
                        )
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
                                  name: NameNode(value: 'text'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null,
                                ),
                                FieldNode(
                                  name: NameNode(value: 'localizedText'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null,
                                ),
                                FieldNode(
                                  name: NameNode(value: 'optionWarning'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null,
                                ),
                                FieldNode(
                                  name: NameNode(value: 'optionWarningText'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null,
                                ),
                                FieldNode(
                                  name:
                                      NameNode(value: 'localizedOptionWarning'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null,
                                ),
                                FieldNode(
                                  name: NameNode(
                                      value: 'localizedOptionWarningText'),
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
                                  name: NameNode(value: 'conditions'),
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
                                      name: NameNode(value: 'conditionType'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null,
                                    ),
                                    FieldNode(
                                      name: NameNode(value: 'logicOperator'),
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
                                      name: NameNode(value: 'targetQuestion'),
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
                                          name: NameNode(value: 'key'),
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
                                      name: NameNode(value: 'value'),
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
      name: NameNode(value: 'conditions'),
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
          name: NameNode(value: 'conditionType'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: 'logicOperator'),
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
          name: NameNode(value: 'targetQuestion'),
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
              name: NameNode(value: 'key'),
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
          name: NameNode(value: 'value'),
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
);
const documentNodeFragmentQuestionFetch = DocumentNode(definitions: [
  fragmentDefinitionQuestionFetch,
]);

extension ClientExtension$Fragment$QuestionFetch on graphql.GraphQLClient {
  void writeFragment$QuestionFetch({
    required Fragment$QuestionFetch data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'QuestionFetch',
            document: documentNodeFragmentQuestionFetch,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$QuestionFetch? readFragment$QuestionFetch({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'QuestionFetch',
          document: documentNodeFragmentQuestionFetch,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$QuestionFetch.fromJson(result);
  }
}

class Fragment$QuestionFetch$filterOptionsQuestion {
  Fragment$QuestionFetch$filterOptionsQuestion({
    required this.id,
    this.$__typename = 'QuestionNode',
  });

  factory Fragment$QuestionFetch$filterOptionsQuestion.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Fragment$QuestionFetch$filterOptionsQuestion(
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
    if (other is! Fragment$QuestionFetch$filterOptionsQuestion ||
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

extension UtilityExtension$Fragment$QuestionFetch$filterOptionsQuestion
    on Fragment$QuestionFetch$filterOptionsQuestion {
  CopyWith$Fragment$QuestionFetch$filterOptionsQuestion<
          Fragment$QuestionFetch$filterOptionsQuestion>
      get copyWith => CopyWith$Fragment$QuestionFetch$filterOptionsQuestion(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$QuestionFetch$filterOptionsQuestion<TRes> {
  factory CopyWith$Fragment$QuestionFetch$filterOptionsQuestion(
    Fragment$QuestionFetch$filterOptionsQuestion instance,
    TRes Function(Fragment$QuestionFetch$filterOptionsQuestion) then,
  ) = _CopyWithImpl$Fragment$QuestionFetch$filterOptionsQuestion;

  factory CopyWith$Fragment$QuestionFetch$filterOptionsQuestion.stub(TRes res) =
      _CopyWithStubImpl$Fragment$QuestionFetch$filterOptionsQuestion;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$QuestionFetch$filterOptionsQuestion<TRes>
    implements CopyWith$Fragment$QuestionFetch$filterOptionsQuestion<TRes> {
  _CopyWithImpl$Fragment$QuestionFetch$filterOptionsQuestion(
    this._instance,
    this._then,
  );

  final Fragment$QuestionFetch$filterOptionsQuestion _instance;

  final TRes Function(Fragment$QuestionFetch$filterOptionsQuestion) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$QuestionFetch$filterOptionsQuestion(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$QuestionFetch$filterOptionsQuestion<TRes>
    implements CopyWith$Fragment$QuestionFetch$filterOptionsQuestion<TRes> {
  _CopyWithStubImpl$Fragment$QuestionFetch$filterOptionsQuestion(this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$QuestionFetch$page {
  Fragment$QuestionFetch$page({
    required this.order,
    required this.id,
    this.$__typename = 'SurveyPageNode',
  });

  factory Fragment$QuestionFetch$page.fromJson(Map<String, dynamic> json) {
    final l$order = json['order'];
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Fragment$QuestionFetch$page(
      order: (l$order as int),
      id: (l$id as String),
      $__typename: (l$$__typename as String),
    );
  }

  final int order;

  final String id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$order = order;
    _resultData['order'] = l$order;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$order = order;
    final l$id = id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$order,
      l$id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$QuestionFetch$page ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$order = order;
    final lOther$order = other.order;
    if (l$order != lOther$order) {
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

extension UtilityExtension$Fragment$QuestionFetch$page
    on Fragment$QuestionFetch$page {
  CopyWith$Fragment$QuestionFetch$page<Fragment$QuestionFetch$page>
      get copyWith => CopyWith$Fragment$QuestionFetch$page(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$QuestionFetch$page<TRes> {
  factory CopyWith$Fragment$QuestionFetch$page(
    Fragment$QuestionFetch$page instance,
    TRes Function(Fragment$QuestionFetch$page) then,
  ) = _CopyWithImpl$Fragment$QuestionFetch$page;

  factory CopyWith$Fragment$QuestionFetch$page.stub(TRes res) =
      _CopyWithStubImpl$Fragment$QuestionFetch$page;

  TRes call({
    int? order,
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$QuestionFetch$page<TRes>
    implements CopyWith$Fragment$QuestionFetch$page<TRes> {
  _CopyWithImpl$Fragment$QuestionFetch$page(
    this._instance,
    this._then,
  );

  final Fragment$QuestionFetch$page _instance;

  final TRes Function(Fragment$QuestionFetch$page) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? order = _undefined,
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$QuestionFetch$page(
        order: order == _undefined || order == null
            ? _instance.order
            : (order as int),
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$QuestionFetch$page<TRes>
    implements CopyWith$Fragment$QuestionFetch$page<TRes> {
  _CopyWithStubImpl$Fragment$QuestionFetch$page(this._res);

  TRes _res;

  call({
    int? order,
    String? id,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$QuestionFetch$options {
  Fragment$QuestionFetch$options({
    required this.edges,
    this.$__typename = 'QuestionOptionNodeConnection',
  });

  factory Fragment$QuestionFetch$options.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Fragment$QuestionFetch$options(
      edges: (l$edges as List<dynamic>)
          .map((e) => e == null
              ? null
              : Fragment$QuestionFetch$options$edges.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$QuestionFetch$options$edges?> edges;

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
    if (other is! Fragment$QuestionFetch$options ||
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

extension UtilityExtension$Fragment$QuestionFetch$options
    on Fragment$QuestionFetch$options {
  CopyWith$Fragment$QuestionFetch$options<Fragment$QuestionFetch$options>
      get copyWith => CopyWith$Fragment$QuestionFetch$options(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$QuestionFetch$options<TRes> {
  factory CopyWith$Fragment$QuestionFetch$options(
    Fragment$QuestionFetch$options instance,
    TRes Function(Fragment$QuestionFetch$options) then,
  ) = _CopyWithImpl$Fragment$QuestionFetch$options;

  factory CopyWith$Fragment$QuestionFetch$options.stub(TRes res) =
      _CopyWithStubImpl$Fragment$QuestionFetch$options;

  TRes call({
    List<Fragment$QuestionFetch$options$edges?>? edges,
    String? $__typename,
  });
  TRes edges(
      Iterable<Fragment$QuestionFetch$options$edges?> Function(
              Iterable<
                  CopyWith$Fragment$QuestionFetch$options$edges<
                      Fragment$QuestionFetch$options$edges>?>)
          _fn);
}

class _CopyWithImpl$Fragment$QuestionFetch$options<TRes>
    implements CopyWith$Fragment$QuestionFetch$options<TRes> {
  _CopyWithImpl$Fragment$QuestionFetch$options(
    this._instance,
    this._then,
  );

  final Fragment$QuestionFetch$options _instance;

  final TRes Function(Fragment$QuestionFetch$options) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$QuestionFetch$options(
        edges: edges == _undefined || edges == null
            ? _instance.edges
            : (edges as List<Fragment$QuestionFetch$options$edges?>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes edges(
          Iterable<Fragment$QuestionFetch$options$edges?> Function(
                  Iterable<
                      CopyWith$Fragment$QuestionFetch$options$edges<
                          Fragment$QuestionFetch$options$edges>?>)
              _fn) =>
      call(
          edges: _fn(_instance.edges.map((e) => e == null
              ? null
              : CopyWith$Fragment$QuestionFetch$options$edges(
                  e,
                  (i) => i,
                ))).toList());
}

class _CopyWithStubImpl$Fragment$QuestionFetch$options<TRes>
    implements CopyWith$Fragment$QuestionFetch$options<TRes> {
  _CopyWithStubImpl$Fragment$QuestionFetch$options(this._res);

  TRes _res;

  call({
    List<Fragment$QuestionFetch$options$edges?>? edges,
    String? $__typename,
  }) =>
      _res;

  edges(_fn) => _res;
}

class Fragment$QuestionFetch$options$edges {
  Fragment$QuestionFetch$options$edges({
    this.node,
    this.$__typename = 'QuestionOptionNodeEdge',
  });

  factory Fragment$QuestionFetch$options$edges.fromJson(
      Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Fragment$QuestionFetch$options$edges(
      node: l$node == null
          ? null
          : Fragment$QuestionFetch$options$edges$node.fromJson(
              (l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$QuestionFetch$options$edges$node? node;

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
    if (other is! Fragment$QuestionFetch$options$edges ||
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

extension UtilityExtension$Fragment$QuestionFetch$options$edges
    on Fragment$QuestionFetch$options$edges {
  CopyWith$Fragment$QuestionFetch$options$edges<
          Fragment$QuestionFetch$options$edges>
      get copyWith => CopyWith$Fragment$QuestionFetch$options$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$QuestionFetch$options$edges<TRes> {
  factory CopyWith$Fragment$QuestionFetch$options$edges(
    Fragment$QuestionFetch$options$edges instance,
    TRes Function(Fragment$QuestionFetch$options$edges) then,
  ) = _CopyWithImpl$Fragment$QuestionFetch$options$edges;

  factory CopyWith$Fragment$QuestionFetch$options$edges.stub(TRes res) =
      _CopyWithStubImpl$Fragment$QuestionFetch$options$edges;

  TRes call({
    Fragment$QuestionFetch$options$edges$node? node,
    String? $__typename,
  });
  CopyWith$Fragment$QuestionFetch$options$edges$node<TRes> get node;
}

class _CopyWithImpl$Fragment$QuestionFetch$options$edges<TRes>
    implements CopyWith$Fragment$QuestionFetch$options$edges<TRes> {
  _CopyWithImpl$Fragment$QuestionFetch$options$edges(
    this._instance,
    this._then,
  );

  final Fragment$QuestionFetch$options$edges _instance;

  final TRes Function(Fragment$QuestionFetch$options$edges) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$QuestionFetch$options$edges(
        node: node == _undefined
            ? _instance.node
            : (node as Fragment$QuestionFetch$options$edges$node?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$QuestionFetch$options$edges$node<TRes> get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Fragment$QuestionFetch$options$edges$node.stub(
            _then(_instance))
        : CopyWith$Fragment$QuestionFetch$options$edges$node(
            local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Fragment$QuestionFetch$options$edges<TRes>
    implements CopyWith$Fragment$QuestionFetch$options$edges<TRes> {
  _CopyWithStubImpl$Fragment$QuestionFetch$options$edges(this._res);

  TRes _res;

  call({
    Fragment$QuestionFetch$options$edges$node? node,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$QuestionFetch$options$edges$node<TRes> get node =>
      CopyWith$Fragment$QuestionFetch$options$edges$node.stub(_res);
}

class Fragment$QuestionFetch$options$edges$node {
  Fragment$QuestionFetch$options$edges$node({
    required this.id,
    required this.text,
    this.localizedText,
    this.optionWarning,
    this.optionWarningText,
    this.localizedOptionWarning,
    this.localizedOptionWarningText,
    required this.order,
    this.conditions,
    this.hasSubQuestion,
    this.subQuestions,
    this.$__typename = 'QuestionOptionNode',
  });

  factory Fragment$QuestionFetch$options$edges$node.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$text = json['text'];
    final l$localizedText = json['localizedText'];
    final l$optionWarning = json['optionWarning'];
    final l$optionWarningText = json['optionWarningText'];
    final l$localizedOptionWarning = json['localizedOptionWarning'];
    final l$localizedOptionWarningText = json['localizedOptionWarningText'];
    final l$order = json['order'];
    final l$conditions = json['conditions'];
    final l$hasSubQuestion = json['hasSubQuestion'];
    final l$subQuestions = json['subQuestions'];
    final l$$__typename = json['__typename'];
    return Fragment$QuestionFetch$options$edges$node(
      id: (l$id as String),
      text: (l$text as String),
      localizedText: (l$localizedText as String?),
      optionWarning: (l$optionWarning as String?),
      optionWarningText: (l$optionWarningText as String?),
      localizedOptionWarning: (l$localizedOptionWarning as String?),
      localizedOptionWarningText: (l$localizedOptionWarningText as String?),
      order: (l$order as int),
      conditions: (l$conditions as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Fragment$QuestionFetch$options$edges$node$conditions.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      hasSubQuestion: (l$hasSubQuestion as bool?),
      subQuestions: (l$subQuestions as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Fragment$QuestionFetch$options$edges$node$subQuestions.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String text;

  final String? localizedText;

  final String? optionWarning;

  final String? optionWarningText;

  final String? localizedOptionWarning;

  final String? localizedOptionWarningText;

  final int order;

  final List<Fragment$QuestionFetch$options$edges$node$conditions?>? conditions;

  final bool? hasSubQuestion;

  final List<Fragment$QuestionFetch$options$edges$node$subQuestions?>?
      subQuestions;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$text = text;
    _resultData['text'] = l$text;
    final l$localizedText = localizedText;
    _resultData['localizedText'] = l$localizedText;
    final l$optionWarning = optionWarning;
    _resultData['optionWarning'] = l$optionWarning;
    final l$optionWarningText = optionWarningText;
    _resultData['optionWarningText'] = l$optionWarningText;
    final l$localizedOptionWarning = localizedOptionWarning;
    _resultData['localizedOptionWarning'] = l$localizedOptionWarning;
    final l$localizedOptionWarningText = localizedOptionWarningText;
    _resultData['localizedOptionWarningText'] = l$localizedOptionWarningText;
    final l$order = order;
    _resultData['order'] = l$order;
    final l$conditions = conditions;
    _resultData['conditions'] = l$conditions?.map((e) => e?.toJson()).toList();
    final l$hasSubQuestion = hasSubQuestion;
    _resultData['hasSubQuestion'] = l$hasSubQuestion;
    final l$subQuestions = subQuestions;
    _resultData['subQuestions'] =
        l$subQuestions?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$text = text;
    final l$localizedText = localizedText;
    final l$optionWarning = optionWarning;
    final l$optionWarningText = optionWarningText;
    final l$localizedOptionWarning = localizedOptionWarning;
    final l$localizedOptionWarningText = localizedOptionWarningText;
    final l$order = order;
    final l$conditions = conditions;
    final l$hasSubQuestion = hasSubQuestion;
    final l$subQuestions = subQuestions;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$text,
      l$localizedText,
      l$optionWarning,
      l$optionWarningText,
      l$localizedOptionWarning,
      l$localizedOptionWarningText,
      l$order,
      l$conditions == null ? null : Object.hashAll(l$conditions.map((v) => v)),
      l$hasSubQuestion,
      l$subQuestions == null
          ? null
          : Object.hashAll(l$subQuestions.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$QuestionFetch$options$edges$node ||
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
    final l$localizedText = localizedText;
    final lOther$localizedText = other.localizedText;
    if (l$localizedText != lOther$localizedText) {
      return false;
    }
    final l$optionWarning = optionWarning;
    final lOther$optionWarning = other.optionWarning;
    if (l$optionWarning != lOther$optionWarning) {
      return false;
    }
    final l$optionWarningText = optionWarningText;
    final lOther$optionWarningText = other.optionWarningText;
    if (l$optionWarningText != lOther$optionWarningText) {
      return false;
    }
    final l$localizedOptionWarning = localizedOptionWarning;
    final lOther$localizedOptionWarning = other.localizedOptionWarning;
    if (l$localizedOptionWarning != lOther$localizedOptionWarning) {
      return false;
    }
    final l$localizedOptionWarningText = localizedOptionWarningText;
    final lOther$localizedOptionWarningText = other.localizedOptionWarningText;
    if (l$localizedOptionWarningText != lOther$localizedOptionWarningText) {
      return false;
    }
    final l$order = order;
    final lOther$order = other.order;
    if (l$order != lOther$order) {
      return false;
    }
    final l$conditions = conditions;
    final lOther$conditions = other.conditions;
    if (l$conditions != null && lOther$conditions != null) {
      if (l$conditions.length != lOther$conditions.length) {
        return false;
      }
      for (int i = 0; i < l$conditions.length; i++) {
        final l$conditions$entry = l$conditions[i];
        final lOther$conditions$entry = lOther$conditions[i];
        if (l$conditions$entry != lOther$conditions$entry) {
          return false;
        }
      }
    } else if (l$conditions != lOther$conditions) {
      return false;
    }
    final l$hasSubQuestion = hasSubQuestion;
    final lOther$hasSubQuestion = other.hasSubQuestion;
    if (l$hasSubQuestion != lOther$hasSubQuestion) {
      return false;
    }
    final l$subQuestions = subQuestions;
    final lOther$subQuestions = other.subQuestions;
    if (l$subQuestions != null && lOther$subQuestions != null) {
      if (l$subQuestions.length != lOther$subQuestions.length) {
        return false;
      }
      for (int i = 0; i < l$subQuestions.length; i++) {
        final l$subQuestions$entry = l$subQuestions[i];
        final lOther$subQuestions$entry = lOther$subQuestions[i];
        if (l$subQuestions$entry != lOther$subQuestions$entry) {
          return false;
        }
      }
    } else if (l$subQuestions != lOther$subQuestions) {
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

extension UtilityExtension$Fragment$QuestionFetch$options$edges$node
    on Fragment$QuestionFetch$options$edges$node {
  CopyWith$Fragment$QuestionFetch$options$edges$node<
          Fragment$QuestionFetch$options$edges$node>
      get copyWith => CopyWith$Fragment$QuestionFetch$options$edges$node(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$QuestionFetch$options$edges$node<TRes> {
  factory CopyWith$Fragment$QuestionFetch$options$edges$node(
    Fragment$QuestionFetch$options$edges$node instance,
    TRes Function(Fragment$QuestionFetch$options$edges$node) then,
  ) = _CopyWithImpl$Fragment$QuestionFetch$options$edges$node;

  factory CopyWith$Fragment$QuestionFetch$options$edges$node.stub(TRes res) =
      _CopyWithStubImpl$Fragment$QuestionFetch$options$edges$node;

  TRes call({
    String? id,
    String? text,
    String? localizedText,
    String? optionWarning,
    String? optionWarningText,
    String? localizedOptionWarning,
    String? localizedOptionWarningText,
    int? order,
    List<Fragment$QuestionFetch$options$edges$node$conditions?>? conditions,
    bool? hasSubQuestion,
    List<Fragment$QuestionFetch$options$edges$node$subQuestions?>? subQuestions,
    String? $__typename,
  });
  TRes conditions(
      Iterable<Fragment$QuestionFetch$options$edges$node$conditions?>? Function(
              Iterable<
                  CopyWith$Fragment$QuestionFetch$options$edges$node$conditions<
                      Fragment$QuestionFetch$options$edges$node$conditions>?>?)
          _fn);
  TRes subQuestions(
      Iterable<Fragment$QuestionFetch$options$edges$node$subQuestions?>? Function(
              Iterable<
                  CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions<
                      Fragment$QuestionFetch$options$edges$node$subQuestions>?>?)
          _fn);
}

class _CopyWithImpl$Fragment$QuestionFetch$options$edges$node<TRes>
    implements CopyWith$Fragment$QuestionFetch$options$edges$node<TRes> {
  _CopyWithImpl$Fragment$QuestionFetch$options$edges$node(
    this._instance,
    this._then,
  );

  final Fragment$QuestionFetch$options$edges$node _instance;

  final TRes Function(Fragment$QuestionFetch$options$edges$node) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? text = _undefined,
    Object? localizedText = _undefined,
    Object? optionWarning = _undefined,
    Object? optionWarningText = _undefined,
    Object? localizedOptionWarning = _undefined,
    Object? localizedOptionWarningText = _undefined,
    Object? order = _undefined,
    Object? conditions = _undefined,
    Object? hasSubQuestion = _undefined,
    Object? subQuestions = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$QuestionFetch$options$edges$node(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        text: text == _undefined || text == null
            ? _instance.text
            : (text as String),
        localizedText: localizedText == _undefined
            ? _instance.localizedText
            : (localizedText as String?),
        optionWarning: optionWarning == _undefined
            ? _instance.optionWarning
            : (optionWarning as String?),
        optionWarningText: optionWarningText == _undefined
            ? _instance.optionWarningText
            : (optionWarningText as String?),
        localizedOptionWarning: localizedOptionWarning == _undefined
            ? _instance.localizedOptionWarning
            : (localizedOptionWarning as String?),
        localizedOptionWarningText: localizedOptionWarningText == _undefined
            ? _instance.localizedOptionWarningText
            : (localizedOptionWarningText as String?),
        order: order == _undefined || order == null
            ? _instance.order
            : (order as int),
        conditions: conditions == _undefined
            ? _instance.conditions
            : (conditions as List<
                Fragment$QuestionFetch$options$edges$node$conditions?>?),
        hasSubQuestion: hasSubQuestion == _undefined
            ? _instance.hasSubQuestion
            : (hasSubQuestion as bool?),
        subQuestions: subQuestions == _undefined
            ? _instance.subQuestions
            : (subQuestions as List<
                Fragment$QuestionFetch$options$edges$node$subQuestions?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes conditions(
          Iterable<Fragment$QuestionFetch$options$edges$node$conditions?>? Function(
                  Iterable<
                      CopyWith$Fragment$QuestionFetch$options$edges$node$conditions<
                          Fragment$QuestionFetch$options$edges$node$conditions>?>?)
              _fn) =>
      call(
          conditions: _fn(_instance.conditions?.map((e) => e == null
              ? null
              : CopyWith$Fragment$QuestionFetch$options$edges$node$conditions(
                  e,
                  (i) => i,
                )))?.toList());

  TRes subQuestions(
          Iterable<Fragment$QuestionFetch$options$edges$node$subQuestions?>? Function(
                  Iterable<
                      CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions<
                          Fragment$QuestionFetch$options$edges$node$subQuestions>?>?)
              _fn) =>
      call(
          subQuestions: _fn(_instance.subQuestions?.map((e) => e == null
              ? null
              : CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions(
                  e,
                  (i) => i,
                )))?.toList());
}

class _CopyWithStubImpl$Fragment$QuestionFetch$options$edges$node<TRes>
    implements CopyWith$Fragment$QuestionFetch$options$edges$node<TRes> {
  _CopyWithStubImpl$Fragment$QuestionFetch$options$edges$node(this._res);

  TRes _res;

  call({
    String? id,
    String? text,
    String? localizedText,
    String? optionWarning,
    String? optionWarningText,
    String? localizedOptionWarning,
    String? localizedOptionWarningText,
    int? order,
    List<Fragment$QuestionFetch$options$edges$node$conditions?>? conditions,
    bool? hasSubQuestion,
    List<Fragment$QuestionFetch$options$edges$node$subQuestions?>? subQuestions,
    String? $__typename,
  }) =>
      _res;

  conditions(_fn) => _res;

  subQuestions(_fn) => _res;
}

class Fragment$QuestionFetch$options$edges$node$conditions {
  Fragment$QuestionFetch$options$edges$node$conditions({
    required this.id,
    required this.conditionType,
    required this.logicOperator,
    required this.order,
    required this.targetQuestion,
    this.value,
    this.$__typename = 'OptionConditionNode',
  });

  factory Fragment$QuestionFetch$options$edges$node$conditions.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$conditionType = json['conditionType'];
    final l$logicOperator = json['logicOperator'];
    final l$order = json['order'];
    final l$targetQuestion = json['targetQuestion'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Fragment$QuestionFetch$options$edges$node$conditions(
      id: (l$id as String),
      conditionType: fromJson$Enum$SurveyOptionConditionConditionTypeChoices(
          (l$conditionType as String)),
      logicOperator: fromJson$Enum$SurveyOptionConditionLogicOperatorChoices(
          (l$logicOperator as String)),
      order: (l$order as int),
      targetQuestion:
          Fragment$QuestionFetch$options$edges$node$conditions$targetQuestion
              .fromJson((l$targetQuestion as Map<String, dynamic>)),
      value: (l$value as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Enum$SurveyOptionConditionConditionTypeChoices conditionType;

  final Enum$SurveyOptionConditionLogicOperatorChoices logicOperator;

  final int order;

  final Fragment$QuestionFetch$options$edges$node$conditions$targetQuestion
      targetQuestion;

  final String? value;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$conditionType = conditionType;
    _resultData['conditionType'] =
        toJson$Enum$SurveyOptionConditionConditionTypeChoices(l$conditionType);
    final l$logicOperator = logicOperator;
    _resultData['logicOperator'] =
        toJson$Enum$SurveyOptionConditionLogicOperatorChoices(l$logicOperator);
    final l$order = order;
    _resultData['order'] = l$order;
    final l$targetQuestion = targetQuestion;
    _resultData['targetQuestion'] = l$targetQuestion.toJson();
    final l$value = value;
    _resultData['value'] = l$value;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$conditionType = conditionType;
    final l$logicOperator = logicOperator;
    final l$order = order;
    final l$targetQuestion = targetQuestion;
    final l$value = value;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$conditionType,
      l$logicOperator,
      l$order,
      l$targetQuestion,
      l$value,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$QuestionFetch$options$edges$node$conditions ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$conditionType = conditionType;
    final lOther$conditionType = other.conditionType;
    if (l$conditionType != lOther$conditionType) {
      return false;
    }
    final l$logicOperator = logicOperator;
    final lOther$logicOperator = other.logicOperator;
    if (l$logicOperator != lOther$logicOperator) {
      return false;
    }
    final l$order = order;
    final lOther$order = other.order;
    if (l$order != lOther$order) {
      return false;
    }
    final l$targetQuestion = targetQuestion;
    final lOther$targetQuestion = other.targetQuestion;
    if (l$targetQuestion != lOther$targetQuestion) {
      return false;
    }
    final l$value = value;
    final lOther$value = other.value;
    if (l$value != lOther$value) {
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

extension UtilityExtension$Fragment$QuestionFetch$options$edges$node$conditions
    on Fragment$QuestionFetch$options$edges$node$conditions {
  CopyWith$Fragment$QuestionFetch$options$edges$node$conditions<
          Fragment$QuestionFetch$options$edges$node$conditions>
      get copyWith =>
          CopyWith$Fragment$QuestionFetch$options$edges$node$conditions(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$QuestionFetch$options$edges$node$conditions<
    TRes> {
  factory CopyWith$Fragment$QuestionFetch$options$edges$node$conditions(
    Fragment$QuestionFetch$options$edges$node$conditions instance,
    TRes Function(Fragment$QuestionFetch$options$edges$node$conditions) then,
  ) = _CopyWithImpl$Fragment$QuestionFetch$options$edges$node$conditions;

  factory CopyWith$Fragment$QuestionFetch$options$edges$node$conditions.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$QuestionFetch$options$edges$node$conditions;

  TRes call({
    String? id,
    Enum$SurveyOptionConditionConditionTypeChoices? conditionType,
    Enum$SurveyOptionConditionLogicOperatorChoices? logicOperator,
    int? order,
    Fragment$QuestionFetch$options$edges$node$conditions$targetQuestion?
        targetQuestion,
    String? value,
    String? $__typename,
  });
  CopyWith$Fragment$QuestionFetch$options$edges$node$conditions$targetQuestion<
      TRes> get targetQuestion;
}

class _CopyWithImpl$Fragment$QuestionFetch$options$edges$node$conditions<TRes>
    implements
        CopyWith$Fragment$QuestionFetch$options$edges$node$conditions<TRes> {
  _CopyWithImpl$Fragment$QuestionFetch$options$edges$node$conditions(
    this._instance,
    this._then,
  );

  final Fragment$QuestionFetch$options$edges$node$conditions _instance;

  final TRes Function(Fragment$QuestionFetch$options$edges$node$conditions)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? conditionType = _undefined,
    Object? logicOperator = _undefined,
    Object? order = _undefined,
    Object? targetQuestion = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$QuestionFetch$options$edges$node$conditions(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        conditionType: conditionType == _undefined || conditionType == null
            ? _instance.conditionType
            : (conditionType as Enum$SurveyOptionConditionConditionTypeChoices),
        logicOperator: logicOperator == _undefined || logicOperator == null
            ? _instance.logicOperator
            : (logicOperator as Enum$SurveyOptionConditionLogicOperatorChoices),
        order: order == _undefined || order == null
            ? _instance.order
            : (order as int),
        targetQuestion: targetQuestion == _undefined || targetQuestion == null
            ? _instance.targetQuestion
            : (targetQuestion
                as Fragment$QuestionFetch$options$edges$node$conditions$targetQuestion),
        value: value == _undefined ? _instance.value : (value as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$QuestionFetch$options$edges$node$conditions$targetQuestion<
      TRes> get targetQuestion {
    final local$targetQuestion = _instance.targetQuestion;
    return CopyWith$Fragment$QuestionFetch$options$edges$node$conditions$targetQuestion(
        local$targetQuestion, (e) => call(targetQuestion: e));
  }
}

class _CopyWithStubImpl$Fragment$QuestionFetch$options$edges$node$conditions<
        TRes>
    implements
        CopyWith$Fragment$QuestionFetch$options$edges$node$conditions<TRes> {
  _CopyWithStubImpl$Fragment$QuestionFetch$options$edges$node$conditions(
      this._res);

  TRes _res;

  call({
    String? id,
    Enum$SurveyOptionConditionConditionTypeChoices? conditionType,
    Enum$SurveyOptionConditionLogicOperatorChoices? logicOperator,
    int? order,
    Fragment$QuestionFetch$options$edges$node$conditions$targetQuestion?
        targetQuestion,
    String? value,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$QuestionFetch$options$edges$node$conditions$targetQuestion<
          TRes>
      get targetQuestion =>
          CopyWith$Fragment$QuestionFetch$options$edges$node$conditions$targetQuestion
              .stub(_res);
}

class Fragment$QuestionFetch$options$edges$node$conditions$targetQuestion {
  Fragment$QuestionFetch$options$edges$node$conditions$targetQuestion({
    required this.id,
    this.key,
    this.$__typename = 'QuestionNode',
  });

  factory Fragment$QuestionFetch$options$edges$node$conditions$targetQuestion.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$key = json['key'];
    final l$$__typename = json['__typename'];
    return Fragment$QuestionFetch$options$edges$node$conditions$targetQuestion(
      id: (l$id as String),
      key: (l$key as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String? key;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$key = key;
    _resultData['key'] = l$key;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$key = key;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$key,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other
            is! Fragment$QuestionFetch$options$edges$node$conditions$targetQuestion ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$key = key;
    final lOther$key = other.key;
    if (l$key != lOther$key) {
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

extension UtilityExtension$Fragment$QuestionFetch$options$edges$node$conditions$targetQuestion
    on Fragment$QuestionFetch$options$edges$node$conditions$targetQuestion {
  CopyWith$Fragment$QuestionFetch$options$edges$node$conditions$targetQuestion<
          Fragment$QuestionFetch$options$edges$node$conditions$targetQuestion>
      get copyWith =>
          CopyWith$Fragment$QuestionFetch$options$edges$node$conditions$targetQuestion(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$QuestionFetch$options$edges$node$conditions$targetQuestion<
    TRes> {
  factory CopyWith$Fragment$QuestionFetch$options$edges$node$conditions$targetQuestion(
    Fragment$QuestionFetch$options$edges$node$conditions$targetQuestion
        instance,
    TRes Function(
            Fragment$QuestionFetch$options$edges$node$conditions$targetQuestion)
        then,
  ) = _CopyWithImpl$Fragment$QuestionFetch$options$edges$node$conditions$targetQuestion;

  factory CopyWith$Fragment$QuestionFetch$options$edges$node$conditions$targetQuestion.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$QuestionFetch$options$edges$node$conditions$targetQuestion;

  TRes call({
    String? id,
    String? key,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$QuestionFetch$options$edges$node$conditions$targetQuestion<
        TRes>
    implements
        CopyWith$Fragment$QuestionFetch$options$edges$node$conditions$targetQuestion<
            TRes> {
  _CopyWithImpl$Fragment$QuestionFetch$options$edges$node$conditions$targetQuestion(
    this._instance,
    this._then,
  );

  final Fragment$QuestionFetch$options$edges$node$conditions$targetQuestion
      _instance;

  final TRes Function(
          Fragment$QuestionFetch$options$edges$node$conditions$targetQuestion)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? key = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$QuestionFetch$options$edges$node$conditions$targetQuestion(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        key: key == _undefined ? _instance.key : (key as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$QuestionFetch$options$edges$node$conditions$targetQuestion<
        TRes>
    implements
        CopyWith$Fragment$QuestionFetch$options$edges$node$conditions$targetQuestion<
            TRes> {
  _CopyWithStubImpl$Fragment$QuestionFetch$options$edges$node$conditions$targetQuestion(
      this._res);

  TRes _res;

  call({
    String? id,
    String? key,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$QuestionFetch$options$edges$node$subQuestions {
  Fragment$QuestionFetch$options$edges$node$subQuestions({
    required this.id,
    required this.text,
    this.localizedText,
    this.hint,
    required this.questionType,
    required this.isRequired,
    required this.order,
    this.minLength,
    this.maxLength,
    this.minValue,
    this.maxValue,
    this.validationPattern,
    this.validationMessage,
    this.filterOptionsQuestion,
    required this.options,
    this.$__typename = 'QuestionNode',
  });

  factory Fragment$QuestionFetch$options$edges$node$subQuestions.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$text = json['text'];
    final l$localizedText = json['localizedText'];
    final l$hint = json['hint'];
    final l$questionType = json['questionType'];
    final l$isRequired = json['isRequired'];
    final l$order = json['order'];
    final l$minLength = json['minLength'];
    final l$maxLength = json['maxLength'];
    final l$minValue = json['minValue'];
    final l$maxValue = json['maxValue'];
    final l$validationPattern = json['validationPattern'];
    final l$validationMessage = json['validationMessage'];
    final l$filterOptionsQuestion = json['filterOptionsQuestion'];
    final l$options = json['options'];
    final l$$__typename = json['__typename'];
    return Fragment$QuestionFetch$options$edges$node$subQuestions(
      id: (l$id as String),
      text: (l$text as String),
      localizedText: (l$localizedText as String?),
      hint: (l$hint as String?),
      questionType: fromJson$Enum$SurveyQuestionQuestionTypeChoices(
          (l$questionType as String)),
      isRequired: (l$isRequired as bool),
      order: (l$order as int),
      minLength: (l$minLength as int?),
      maxLength: (l$maxLength as int?),
      minValue: (l$minValue as String?),
      maxValue: (l$maxValue as String?),
      validationPattern: (l$validationPattern as String?),
      validationMessage: (l$validationMessage as String?),
      filterOptionsQuestion: l$filterOptionsQuestion == null
          ? null
          : Fragment$QuestionFetch$options$edges$node$subQuestions$filterOptionsQuestion
              .fromJson((l$filterOptionsQuestion as Map<String, dynamic>)),
      options: Fragment$QuestionFetch$options$edges$node$subQuestions$options
          .fromJson((l$options as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String text;

  final String? localizedText;

  final String? hint;

  final Enum$SurveyQuestionQuestionTypeChoices questionType;

  final bool isRequired;

  final int order;

  final int? minLength;

  final int? maxLength;

  final String? minValue;

  final String? maxValue;

  final String? validationPattern;

  final String? validationMessage;

  final Fragment$QuestionFetch$options$edges$node$subQuestions$filterOptionsQuestion?
      filterOptionsQuestion;

  final Fragment$QuestionFetch$options$edges$node$subQuestions$options options;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$text = text;
    _resultData['text'] = l$text;
    final l$localizedText = localizedText;
    _resultData['localizedText'] = l$localizedText;
    final l$hint = hint;
    _resultData['hint'] = l$hint;
    final l$questionType = questionType;
    _resultData['questionType'] =
        toJson$Enum$SurveyQuestionQuestionTypeChoices(l$questionType);
    final l$isRequired = isRequired;
    _resultData['isRequired'] = l$isRequired;
    final l$order = order;
    _resultData['order'] = l$order;
    final l$minLength = minLength;
    _resultData['minLength'] = l$minLength;
    final l$maxLength = maxLength;
    _resultData['maxLength'] = l$maxLength;
    final l$minValue = minValue;
    _resultData['minValue'] = l$minValue;
    final l$maxValue = maxValue;
    _resultData['maxValue'] = l$maxValue;
    final l$validationPattern = validationPattern;
    _resultData['validationPattern'] = l$validationPattern;
    final l$validationMessage = validationMessage;
    _resultData['validationMessage'] = l$validationMessage;
    final l$filterOptionsQuestion = filterOptionsQuestion;
    _resultData['filterOptionsQuestion'] = l$filterOptionsQuestion?.toJson();
    final l$options = options;
    _resultData['options'] = l$options.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$text = text;
    final l$localizedText = localizedText;
    final l$hint = hint;
    final l$questionType = questionType;
    final l$isRequired = isRequired;
    final l$order = order;
    final l$minLength = minLength;
    final l$maxLength = maxLength;
    final l$minValue = minValue;
    final l$maxValue = maxValue;
    final l$validationPattern = validationPattern;
    final l$validationMessage = validationMessage;
    final l$filterOptionsQuestion = filterOptionsQuestion;
    final l$options = options;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$text,
      l$localizedText,
      l$hint,
      l$questionType,
      l$isRequired,
      l$order,
      l$minLength,
      l$maxLength,
      l$minValue,
      l$maxValue,
      l$validationPattern,
      l$validationMessage,
      l$filterOptionsQuestion,
      l$options,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$QuestionFetch$options$edges$node$subQuestions ||
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
    final l$localizedText = localizedText;
    final lOther$localizedText = other.localizedText;
    if (l$localizedText != lOther$localizedText) {
      return false;
    }
    final l$hint = hint;
    final lOther$hint = other.hint;
    if (l$hint != lOther$hint) {
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
    final l$order = order;
    final lOther$order = other.order;
    if (l$order != lOther$order) {
      return false;
    }
    final l$minLength = minLength;
    final lOther$minLength = other.minLength;
    if (l$minLength != lOther$minLength) {
      return false;
    }
    final l$maxLength = maxLength;
    final lOther$maxLength = other.maxLength;
    if (l$maxLength != lOther$maxLength) {
      return false;
    }
    final l$minValue = minValue;
    final lOther$minValue = other.minValue;
    if (l$minValue != lOther$minValue) {
      return false;
    }
    final l$maxValue = maxValue;
    final lOther$maxValue = other.maxValue;
    if (l$maxValue != lOther$maxValue) {
      return false;
    }
    final l$validationPattern = validationPattern;
    final lOther$validationPattern = other.validationPattern;
    if (l$validationPattern != lOther$validationPattern) {
      return false;
    }
    final l$validationMessage = validationMessage;
    final lOther$validationMessage = other.validationMessage;
    if (l$validationMessage != lOther$validationMessage) {
      return false;
    }
    final l$filterOptionsQuestion = filterOptionsQuestion;
    final lOther$filterOptionsQuestion = other.filterOptionsQuestion;
    if (l$filterOptionsQuestion != lOther$filterOptionsQuestion) {
      return false;
    }
    final l$options = options;
    final lOther$options = other.options;
    if (l$options != lOther$options) {
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

extension UtilityExtension$Fragment$QuestionFetch$options$edges$node$subQuestions
    on Fragment$QuestionFetch$options$edges$node$subQuestions {
  CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions<
          Fragment$QuestionFetch$options$edges$node$subQuestions>
      get copyWith =>
          CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions<
    TRes> {
  factory CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions(
    Fragment$QuestionFetch$options$edges$node$subQuestions instance,
    TRes Function(Fragment$QuestionFetch$options$edges$node$subQuestions) then,
  ) = _CopyWithImpl$Fragment$QuestionFetch$options$edges$node$subQuestions;

  factory CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$QuestionFetch$options$edges$node$subQuestions;

  TRes call({
    String? id,
    String? text,
    String? localizedText,
    String? hint,
    Enum$SurveyQuestionQuestionTypeChoices? questionType,
    bool? isRequired,
    int? order,
    int? minLength,
    int? maxLength,
    String? minValue,
    String? maxValue,
    String? validationPattern,
    String? validationMessage,
    Fragment$QuestionFetch$options$edges$node$subQuestions$filterOptionsQuestion?
        filterOptionsQuestion,
    Fragment$QuestionFetch$options$edges$node$subQuestions$options? options,
    String? $__typename,
  });
  CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$filterOptionsQuestion<
      TRes> get filterOptionsQuestion;
  CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$options<TRes>
      get options;
}

class _CopyWithImpl$Fragment$QuestionFetch$options$edges$node$subQuestions<TRes>
    implements
        CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions<TRes> {
  _CopyWithImpl$Fragment$QuestionFetch$options$edges$node$subQuestions(
    this._instance,
    this._then,
  );

  final Fragment$QuestionFetch$options$edges$node$subQuestions _instance;

  final TRes Function(Fragment$QuestionFetch$options$edges$node$subQuestions)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? text = _undefined,
    Object? localizedText = _undefined,
    Object? hint = _undefined,
    Object? questionType = _undefined,
    Object? isRequired = _undefined,
    Object? order = _undefined,
    Object? minLength = _undefined,
    Object? maxLength = _undefined,
    Object? minValue = _undefined,
    Object? maxValue = _undefined,
    Object? validationPattern = _undefined,
    Object? validationMessage = _undefined,
    Object? filterOptionsQuestion = _undefined,
    Object? options = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$QuestionFetch$options$edges$node$subQuestions(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        text: text == _undefined || text == null
            ? _instance.text
            : (text as String),
        localizedText: localizedText == _undefined
            ? _instance.localizedText
            : (localizedText as String?),
        hint: hint == _undefined ? _instance.hint : (hint as String?),
        questionType: questionType == _undefined || questionType == null
            ? _instance.questionType
            : (questionType as Enum$SurveyQuestionQuestionTypeChoices),
        isRequired: isRequired == _undefined || isRequired == null
            ? _instance.isRequired
            : (isRequired as bool),
        order: order == _undefined || order == null
            ? _instance.order
            : (order as int),
        minLength:
            minLength == _undefined ? _instance.minLength : (minLength as int?),
        maxLength:
            maxLength == _undefined ? _instance.maxLength : (maxLength as int?),
        minValue:
            minValue == _undefined ? _instance.minValue : (minValue as String?),
        maxValue:
            maxValue == _undefined ? _instance.maxValue : (maxValue as String?),
        validationPattern: validationPattern == _undefined
            ? _instance.validationPattern
            : (validationPattern as String?),
        validationMessage: validationMessage == _undefined
            ? _instance.validationMessage
            : (validationMessage as String?),
        filterOptionsQuestion: filterOptionsQuestion == _undefined
            ? _instance.filterOptionsQuestion
            : (filterOptionsQuestion
                as Fragment$QuestionFetch$options$edges$node$subQuestions$filterOptionsQuestion?),
        options: options == _undefined || options == null
            ? _instance.options
            : (options
                as Fragment$QuestionFetch$options$edges$node$subQuestions$options),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$filterOptionsQuestion<
      TRes> get filterOptionsQuestion {
    final local$filterOptionsQuestion = _instance.filterOptionsQuestion;
    return local$filterOptionsQuestion == null
        ? CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$filterOptionsQuestion
            .stub(_then(_instance))
        : CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$filterOptionsQuestion(
            local$filterOptionsQuestion, (e) => call(filterOptionsQuestion: e));
  }

  CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$options<TRes>
      get options {
    final local$options = _instance.options;
    return CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$options(
        local$options, (e) => call(options: e));
  }
}

class _CopyWithStubImpl$Fragment$QuestionFetch$options$edges$node$subQuestions<
        TRes>
    implements
        CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions<TRes> {
  _CopyWithStubImpl$Fragment$QuestionFetch$options$edges$node$subQuestions(
      this._res);

  TRes _res;

  call({
    String? id,
    String? text,
    String? localizedText,
    String? hint,
    Enum$SurveyQuestionQuestionTypeChoices? questionType,
    bool? isRequired,
    int? order,
    int? minLength,
    int? maxLength,
    String? minValue,
    String? maxValue,
    String? validationPattern,
    String? validationMessage,
    Fragment$QuestionFetch$options$edges$node$subQuestions$filterOptionsQuestion?
        filterOptionsQuestion,
    Fragment$QuestionFetch$options$edges$node$subQuestions$options? options,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$filterOptionsQuestion<
          TRes>
      get filterOptionsQuestion =>
          CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$filterOptionsQuestion
              .stub(_res);

  CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$options<TRes>
      get options =>
          CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$options
              .stub(_res);
}

class Fragment$QuestionFetch$options$edges$node$subQuestions$filterOptionsQuestion {
  Fragment$QuestionFetch$options$edges$node$subQuestions$filterOptionsQuestion({
    required this.id,
    this.$__typename = 'QuestionNode',
  });

  factory Fragment$QuestionFetch$options$edges$node$subQuestions$filterOptionsQuestion.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Fragment$QuestionFetch$options$edges$node$subQuestions$filterOptionsQuestion(
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
    if (other
            is! Fragment$QuestionFetch$options$edges$node$subQuestions$filterOptionsQuestion ||
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

extension UtilityExtension$Fragment$QuestionFetch$options$edges$node$subQuestions$filterOptionsQuestion
    on Fragment$QuestionFetch$options$edges$node$subQuestions$filterOptionsQuestion {
  CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$filterOptionsQuestion<
          Fragment$QuestionFetch$options$edges$node$subQuestions$filterOptionsQuestion>
      get copyWith =>
          CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$filterOptionsQuestion(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$filterOptionsQuestion<
    TRes> {
  factory CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$filterOptionsQuestion(
    Fragment$QuestionFetch$options$edges$node$subQuestions$filterOptionsQuestion
        instance,
    TRes Function(
            Fragment$QuestionFetch$options$edges$node$subQuestions$filterOptionsQuestion)
        then,
  ) = _CopyWithImpl$Fragment$QuestionFetch$options$edges$node$subQuestions$filterOptionsQuestion;

  factory CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$filterOptionsQuestion.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$QuestionFetch$options$edges$node$subQuestions$filterOptionsQuestion;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$QuestionFetch$options$edges$node$subQuestions$filterOptionsQuestion<
        TRes>
    implements
        CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$filterOptionsQuestion<
            TRes> {
  _CopyWithImpl$Fragment$QuestionFetch$options$edges$node$subQuestions$filterOptionsQuestion(
    this._instance,
    this._then,
  );

  final Fragment$QuestionFetch$options$edges$node$subQuestions$filterOptionsQuestion
      _instance;

  final TRes Function(
          Fragment$QuestionFetch$options$edges$node$subQuestions$filterOptionsQuestion)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Fragment$QuestionFetch$options$edges$node$subQuestions$filterOptionsQuestion(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$QuestionFetch$options$edges$node$subQuestions$filterOptionsQuestion<
        TRes>
    implements
        CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$filterOptionsQuestion<
            TRes> {
  _CopyWithStubImpl$Fragment$QuestionFetch$options$edges$node$subQuestions$filterOptionsQuestion(
      this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$QuestionFetch$options$edges$node$subQuestions$options {
  Fragment$QuestionFetch$options$edges$node$subQuestions$options({
    required this.edges,
    this.$__typename = 'QuestionOptionNodeConnection',
  });

  factory Fragment$QuestionFetch$options$edges$node$subQuestions$options.fromJson(
      Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Fragment$QuestionFetch$options$edges$node$subQuestions$options(
      edges: (l$edges as List<dynamic>)
          .map((e) => e == null
              ? null
              : Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<
          Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges?>
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
            is! Fragment$QuestionFetch$options$edges$node$subQuestions$options ||
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

extension UtilityExtension$Fragment$QuestionFetch$options$edges$node$subQuestions$options
    on Fragment$QuestionFetch$options$edges$node$subQuestions$options {
  CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$options<
          Fragment$QuestionFetch$options$edges$node$subQuestions$options>
      get copyWith =>
          CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$options(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$options<
    TRes> {
  factory CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$options(
    Fragment$QuestionFetch$options$edges$node$subQuestions$options instance,
    TRes Function(
            Fragment$QuestionFetch$options$edges$node$subQuestions$options)
        then,
  ) = _CopyWithImpl$Fragment$QuestionFetch$options$edges$node$subQuestions$options;

  factory CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$options.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$QuestionFetch$options$edges$node$subQuestions$options;

  TRes call({
    List<Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges?>?
        edges,
    String? $__typename,
  });
  TRes edges(
      Iterable<Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges?> Function(
              Iterable<
                  CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges<
                      Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges>?>)
          _fn);
}

class _CopyWithImpl$Fragment$QuestionFetch$options$edges$node$subQuestions$options<
        TRes>
    implements
        CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$options<
            TRes> {
  _CopyWithImpl$Fragment$QuestionFetch$options$edges$node$subQuestions$options(
    this._instance,
    this._then,
  );

  final Fragment$QuestionFetch$options$edges$node$subQuestions$options
      _instance;

  final TRes Function(
      Fragment$QuestionFetch$options$edges$node$subQuestions$options) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$QuestionFetch$options$edges$node$subQuestions$options(
        edges: edges == _undefined || edges == null
            ? _instance.edges
            : (edges as List<
                Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges?>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes edges(
          Iterable<Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges?> Function(
                  Iterable<
                      CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges<
                          Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges>?>)
              _fn) =>
      call(
          edges: _fn(_instance.edges.map((e) => e == null
              ? null
              : CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges(
                  e,
                  (i) => i,
                ))).toList());
}

class _CopyWithStubImpl$Fragment$QuestionFetch$options$edges$node$subQuestions$options<
        TRes>
    implements
        CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$options<
            TRes> {
  _CopyWithStubImpl$Fragment$QuestionFetch$options$edges$node$subQuestions$options(
      this._res);

  TRes _res;

  call({
    List<Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges?>?
        edges,
    String? $__typename,
  }) =>
      _res;

  edges(_fn) => _res;
}

class Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges {
  Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges({
    this.node,
    this.$__typename = 'QuestionOptionNodeEdge',
  });

  factory Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges.fromJson(
      Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges(
      node: l$node == null
          ? null
          : Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node
              .fromJson((l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node?
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
            is! Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges ||
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

extension UtilityExtension$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges
    on Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges {
  CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges<
          Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges>
      get copyWith =>
          CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges<
    TRes> {
  factory CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges(
    Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges
        instance,
    TRes Function(
            Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges)
        then,
  ) = _CopyWithImpl$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges;

  factory CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges;

  TRes call({
    Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node?
        node,
    String? $__typename,
  });
  CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node<
      TRes> get node;
}

class _CopyWithImpl$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges<
        TRes>
    implements
        CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges<
            TRes> {
  _CopyWithImpl$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges(
    this._instance,
    this._then,
  );

  final Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges
      _instance;

  final TRes Function(
          Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges(
        node: node == _undefined
            ? _instance.node
            : (node
                as Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node<
      TRes> get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node
            .stub(_then(_instance))
        : CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node(
            local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges<
        TRes>
    implements
        CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges<
            TRes> {
  _CopyWithStubImpl$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges(
      this._res);

  TRes _res;

  call({
    Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node?
        node,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node<
          TRes>
      get node =>
          CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node
              .stub(_res);
}

class Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node {
  Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node({
    required this.id,
    required this.text,
    this.localizedText,
    this.optionWarning,
    this.optionWarningText,
    this.localizedOptionWarning,
    this.localizedOptionWarningText,
    required this.order,
    this.conditions,
    this.$__typename = 'QuestionOptionNode',
  });

  factory Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$text = json['text'];
    final l$localizedText = json['localizedText'];
    final l$optionWarning = json['optionWarning'];
    final l$optionWarningText = json['optionWarningText'];
    final l$localizedOptionWarning = json['localizedOptionWarning'];
    final l$localizedOptionWarningText = json['localizedOptionWarningText'];
    final l$order = json['order'];
    final l$conditions = json['conditions'];
    final l$$__typename = json['__typename'];
    return Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node(
      id: (l$id as String),
      text: (l$text as String),
      localizedText: (l$localizedText as String?),
      optionWarning: (l$optionWarning as String?),
      optionWarningText: (l$optionWarningText as String?),
      localizedOptionWarning: (l$localizedOptionWarning as String?),
      localizedOptionWarningText: (l$localizedOptionWarningText as String?),
      order: (l$order as int),
      conditions: (l$conditions as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String text;

  final String? localizedText;

  final String? optionWarning;

  final String? optionWarningText;

  final String? localizedOptionWarning;

  final String? localizedOptionWarningText;

  final int order;

  final List<
          Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions?>?
      conditions;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$text = text;
    _resultData['text'] = l$text;
    final l$localizedText = localizedText;
    _resultData['localizedText'] = l$localizedText;
    final l$optionWarning = optionWarning;
    _resultData['optionWarning'] = l$optionWarning;
    final l$optionWarningText = optionWarningText;
    _resultData['optionWarningText'] = l$optionWarningText;
    final l$localizedOptionWarning = localizedOptionWarning;
    _resultData['localizedOptionWarning'] = l$localizedOptionWarning;
    final l$localizedOptionWarningText = localizedOptionWarningText;
    _resultData['localizedOptionWarningText'] = l$localizedOptionWarningText;
    final l$order = order;
    _resultData['order'] = l$order;
    final l$conditions = conditions;
    _resultData['conditions'] = l$conditions?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$text = text;
    final l$localizedText = localizedText;
    final l$optionWarning = optionWarning;
    final l$optionWarningText = optionWarningText;
    final l$localizedOptionWarning = localizedOptionWarning;
    final l$localizedOptionWarningText = localizedOptionWarningText;
    final l$order = order;
    final l$conditions = conditions;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$text,
      l$localizedText,
      l$optionWarning,
      l$optionWarningText,
      l$localizedOptionWarning,
      l$localizedOptionWarningText,
      l$order,
      l$conditions == null ? null : Object.hashAll(l$conditions.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other
            is! Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node ||
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
    final l$localizedText = localizedText;
    final lOther$localizedText = other.localizedText;
    if (l$localizedText != lOther$localizedText) {
      return false;
    }
    final l$optionWarning = optionWarning;
    final lOther$optionWarning = other.optionWarning;
    if (l$optionWarning != lOther$optionWarning) {
      return false;
    }
    final l$optionWarningText = optionWarningText;
    final lOther$optionWarningText = other.optionWarningText;
    if (l$optionWarningText != lOther$optionWarningText) {
      return false;
    }
    final l$localizedOptionWarning = localizedOptionWarning;
    final lOther$localizedOptionWarning = other.localizedOptionWarning;
    if (l$localizedOptionWarning != lOther$localizedOptionWarning) {
      return false;
    }
    final l$localizedOptionWarningText = localizedOptionWarningText;
    final lOther$localizedOptionWarningText = other.localizedOptionWarningText;
    if (l$localizedOptionWarningText != lOther$localizedOptionWarningText) {
      return false;
    }
    final l$order = order;
    final lOther$order = other.order;
    if (l$order != lOther$order) {
      return false;
    }
    final l$conditions = conditions;
    final lOther$conditions = other.conditions;
    if (l$conditions != null && lOther$conditions != null) {
      if (l$conditions.length != lOther$conditions.length) {
        return false;
      }
      for (int i = 0; i < l$conditions.length; i++) {
        final l$conditions$entry = l$conditions[i];
        final lOther$conditions$entry = lOther$conditions[i];
        if (l$conditions$entry != lOther$conditions$entry) {
          return false;
        }
      }
    } else if (l$conditions != lOther$conditions) {
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

extension UtilityExtension$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node
    on Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node {
  CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node<
          Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node>
      get copyWith =>
          CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node<
    TRes> {
  factory CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node(
    Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node
        instance,
    TRes Function(
            Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node)
        then,
  ) = _CopyWithImpl$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node;

  factory CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node;

  TRes call({
    String? id,
    String? text,
    String? localizedText,
    String? optionWarning,
    String? optionWarningText,
    String? localizedOptionWarning,
    String? localizedOptionWarningText,
    int? order,
    List<Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions?>?
        conditions,
    String? $__typename,
  });
  TRes conditions(
      Iterable<Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions?>? Function(
              Iterable<
                  CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions<
                      Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions>?>?)
          _fn);
}

class _CopyWithImpl$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node<
        TRes>
    implements
        CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node<
            TRes> {
  _CopyWithImpl$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node(
    this._instance,
    this._then,
  );

  final Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node
      _instance;

  final TRes Function(
          Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? text = _undefined,
    Object? localizedText = _undefined,
    Object? optionWarning = _undefined,
    Object? optionWarningText = _undefined,
    Object? localizedOptionWarning = _undefined,
    Object? localizedOptionWarningText = _undefined,
    Object? order = _undefined,
    Object? conditions = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        text: text == _undefined || text == null
            ? _instance.text
            : (text as String),
        localizedText: localizedText == _undefined
            ? _instance.localizedText
            : (localizedText as String?),
        optionWarning: optionWarning == _undefined
            ? _instance.optionWarning
            : (optionWarning as String?),
        optionWarningText: optionWarningText == _undefined
            ? _instance.optionWarningText
            : (optionWarningText as String?),
        localizedOptionWarning: localizedOptionWarning == _undefined
            ? _instance.localizedOptionWarning
            : (localizedOptionWarning as String?),
        localizedOptionWarningText: localizedOptionWarningText == _undefined
            ? _instance.localizedOptionWarningText
            : (localizedOptionWarningText as String?),
        order: order == _undefined || order == null
            ? _instance.order
            : (order as int),
        conditions: conditions == _undefined
            ? _instance.conditions
            : (conditions as List<
                Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes conditions(
          Iterable<Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions?>? Function(
                  Iterable<
                      CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions<
                          Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions>?>?)
              _fn) =>
      call(
          conditions: _fn(_instance.conditions?.map((e) => e == null
              ? null
              : CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions(
                  e,
                  (i) => i,
                )))?.toList());
}

class _CopyWithStubImpl$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node<
        TRes>
    implements
        CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node<
            TRes> {
  _CopyWithStubImpl$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node(
      this._res);

  TRes _res;

  call({
    String? id,
    String? text,
    String? localizedText,
    String? optionWarning,
    String? optionWarningText,
    String? localizedOptionWarning,
    String? localizedOptionWarningText,
    int? order,
    List<Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions?>?
        conditions,
    String? $__typename,
  }) =>
      _res;

  conditions(_fn) => _res;
}

class Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions {
  Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions({
    required this.id,
    required this.conditionType,
    required this.logicOperator,
    required this.order,
    required this.targetQuestion,
    this.value,
    this.$__typename = 'OptionConditionNode',
  });

  factory Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$conditionType = json['conditionType'];
    final l$logicOperator = json['logicOperator'];
    final l$order = json['order'];
    final l$targetQuestion = json['targetQuestion'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions(
      id: (l$id as String),
      conditionType: fromJson$Enum$SurveyOptionConditionConditionTypeChoices(
          (l$conditionType as String)),
      logicOperator: fromJson$Enum$SurveyOptionConditionLogicOperatorChoices(
          (l$logicOperator as String)),
      order: (l$order as int),
      targetQuestion:
          Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions$targetQuestion
              .fromJson((l$targetQuestion as Map<String, dynamic>)),
      value: (l$value as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Enum$SurveyOptionConditionConditionTypeChoices conditionType;

  final Enum$SurveyOptionConditionLogicOperatorChoices logicOperator;

  final int order;

  final Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions$targetQuestion
      targetQuestion;

  final String? value;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$conditionType = conditionType;
    _resultData['conditionType'] =
        toJson$Enum$SurveyOptionConditionConditionTypeChoices(l$conditionType);
    final l$logicOperator = logicOperator;
    _resultData['logicOperator'] =
        toJson$Enum$SurveyOptionConditionLogicOperatorChoices(l$logicOperator);
    final l$order = order;
    _resultData['order'] = l$order;
    final l$targetQuestion = targetQuestion;
    _resultData['targetQuestion'] = l$targetQuestion.toJson();
    final l$value = value;
    _resultData['value'] = l$value;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$conditionType = conditionType;
    final l$logicOperator = logicOperator;
    final l$order = order;
    final l$targetQuestion = targetQuestion;
    final l$value = value;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$conditionType,
      l$logicOperator,
      l$order,
      l$targetQuestion,
      l$value,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other
            is! Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$conditionType = conditionType;
    final lOther$conditionType = other.conditionType;
    if (l$conditionType != lOther$conditionType) {
      return false;
    }
    final l$logicOperator = logicOperator;
    final lOther$logicOperator = other.logicOperator;
    if (l$logicOperator != lOther$logicOperator) {
      return false;
    }
    final l$order = order;
    final lOther$order = other.order;
    if (l$order != lOther$order) {
      return false;
    }
    final l$targetQuestion = targetQuestion;
    final lOther$targetQuestion = other.targetQuestion;
    if (l$targetQuestion != lOther$targetQuestion) {
      return false;
    }
    final l$value = value;
    final lOther$value = other.value;
    if (l$value != lOther$value) {
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

extension UtilityExtension$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions
    on Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions {
  CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions<
          Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions>
      get copyWith =>
          CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions<
    TRes> {
  factory CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions(
    Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions
        instance,
    TRes Function(
            Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions)
        then,
  ) = _CopyWithImpl$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions;

  factory CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions;

  TRes call({
    String? id,
    Enum$SurveyOptionConditionConditionTypeChoices? conditionType,
    Enum$SurveyOptionConditionLogicOperatorChoices? logicOperator,
    int? order,
    Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions$targetQuestion?
        targetQuestion,
    String? value,
    String? $__typename,
  });
  CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions$targetQuestion<
      TRes> get targetQuestion;
}

class _CopyWithImpl$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions<
        TRes>
    implements
        CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions<
            TRes> {
  _CopyWithImpl$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions(
    this._instance,
    this._then,
  );

  final Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions
      _instance;

  final TRes Function(
          Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? conditionType = _undefined,
    Object? logicOperator = _undefined,
    Object? order = _undefined,
    Object? targetQuestion = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        conditionType: conditionType == _undefined || conditionType == null
            ? _instance.conditionType
            : (conditionType as Enum$SurveyOptionConditionConditionTypeChoices),
        logicOperator: logicOperator == _undefined || logicOperator == null
            ? _instance.logicOperator
            : (logicOperator as Enum$SurveyOptionConditionLogicOperatorChoices),
        order: order == _undefined || order == null
            ? _instance.order
            : (order as int),
        targetQuestion: targetQuestion == _undefined || targetQuestion == null
            ? _instance.targetQuestion
            : (targetQuestion
                as Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions$targetQuestion),
        value: value == _undefined ? _instance.value : (value as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions$targetQuestion<
      TRes> get targetQuestion {
    final local$targetQuestion = _instance.targetQuestion;
    return CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions$targetQuestion(
        local$targetQuestion, (e) => call(targetQuestion: e));
  }
}

class _CopyWithStubImpl$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions<
        TRes>
    implements
        CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions<
            TRes> {
  _CopyWithStubImpl$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions(
      this._res);

  TRes _res;

  call({
    String? id,
    Enum$SurveyOptionConditionConditionTypeChoices? conditionType,
    Enum$SurveyOptionConditionLogicOperatorChoices? logicOperator,
    int? order,
    Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions$targetQuestion?
        targetQuestion,
    String? value,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions$targetQuestion<
          TRes>
      get targetQuestion =>
          CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions$targetQuestion
              .stub(_res);
}

class Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions$targetQuestion {
  Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions$targetQuestion({
    required this.id,
    this.key,
    this.$__typename = 'QuestionNode',
  });

  factory Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions$targetQuestion.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$key = json['key'];
    final l$$__typename = json['__typename'];
    return Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions$targetQuestion(
      id: (l$id as String),
      key: (l$key as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String? key;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$key = key;
    _resultData['key'] = l$key;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$key = key;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$key,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other
            is! Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions$targetQuestion ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$key = key;
    final lOther$key = other.key;
    if (l$key != lOther$key) {
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

extension UtilityExtension$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions$targetQuestion
    on Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions$targetQuestion {
  CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions$targetQuestion<
          Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions$targetQuestion>
      get copyWith =>
          CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions$targetQuestion(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions$targetQuestion<
    TRes> {
  factory CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions$targetQuestion(
    Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions$targetQuestion
        instance,
    TRes Function(
            Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions$targetQuestion)
        then,
  ) = _CopyWithImpl$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions$targetQuestion;

  factory CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions$targetQuestion.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions$targetQuestion;

  TRes call({
    String? id,
    String? key,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions$targetQuestion<
        TRes>
    implements
        CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions$targetQuestion<
            TRes> {
  _CopyWithImpl$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions$targetQuestion(
    this._instance,
    this._then,
  );

  final Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions$targetQuestion
      _instance;

  final TRes Function(
          Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions$targetQuestion)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? key = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions$targetQuestion(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        key: key == _undefined ? _instance.key : (key as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions$targetQuestion<
        TRes>
    implements
        CopyWith$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions$targetQuestion<
            TRes> {
  _CopyWithStubImpl$Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions$targetQuestion(
      this._res);

  TRes _res;

  call({
    String? id,
    String? key,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$QuestionFetch$conditions {
  Fragment$QuestionFetch$conditions({
    required this.id,
    required this.conditionType,
    required this.logicOperator,
    required this.order,
    required this.targetQuestion,
    this.value,
    this.$__typename = 'QuestionConditionNode',
  });

  factory Fragment$QuestionFetch$conditions.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$conditionType = json['conditionType'];
    final l$logicOperator = json['logicOperator'];
    final l$order = json['order'];
    final l$targetQuestion = json['targetQuestion'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Fragment$QuestionFetch$conditions(
      id: (l$id as String),
      conditionType: fromJson$Enum$SurveyQuestionConditionConditionTypeChoices(
          (l$conditionType as String)),
      logicOperator: fromJson$Enum$SurveyQuestionConditionLogicOperatorChoices(
          (l$logicOperator as String)),
      order: (l$order as int),
      targetQuestion: Fragment$QuestionFetch$conditions$targetQuestion.fromJson(
          (l$targetQuestion as Map<String, dynamic>)),
      value: (l$value as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Enum$SurveyQuestionConditionConditionTypeChoices conditionType;

  final Enum$SurveyQuestionConditionLogicOperatorChoices logicOperator;

  final int order;

  final Fragment$QuestionFetch$conditions$targetQuestion targetQuestion;

  final String? value;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$conditionType = conditionType;
    _resultData['conditionType'] =
        toJson$Enum$SurveyQuestionConditionConditionTypeChoices(
            l$conditionType);
    final l$logicOperator = logicOperator;
    _resultData['logicOperator'] =
        toJson$Enum$SurveyQuestionConditionLogicOperatorChoices(
            l$logicOperator);
    final l$order = order;
    _resultData['order'] = l$order;
    final l$targetQuestion = targetQuestion;
    _resultData['targetQuestion'] = l$targetQuestion.toJson();
    final l$value = value;
    _resultData['value'] = l$value;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$conditionType = conditionType;
    final l$logicOperator = logicOperator;
    final l$order = order;
    final l$targetQuestion = targetQuestion;
    final l$value = value;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$conditionType,
      l$logicOperator,
      l$order,
      l$targetQuestion,
      l$value,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$QuestionFetch$conditions ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$conditionType = conditionType;
    final lOther$conditionType = other.conditionType;
    if (l$conditionType != lOther$conditionType) {
      return false;
    }
    final l$logicOperator = logicOperator;
    final lOther$logicOperator = other.logicOperator;
    if (l$logicOperator != lOther$logicOperator) {
      return false;
    }
    final l$order = order;
    final lOther$order = other.order;
    if (l$order != lOther$order) {
      return false;
    }
    final l$targetQuestion = targetQuestion;
    final lOther$targetQuestion = other.targetQuestion;
    if (l$targetQuestion != lOther$targetQuestion) {
      return false;
    }
    final l$value = value;
    final lOther$value = other.value;
    if (l$value != lOther$value) {
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

extension UtilityExtension$Fragment$QuestionFetch$conditions
    on Fragment$QuestionFetch$conditions {
  CopyWith$Fragment$QuestionFetch$conditions<Fragment$QuestionFetch$conditions>
      get copyWith => CopyWith$Fragment$QuestionFetch$conditions(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$QuestionFetch$conditions<TRes> {
  factory CopyWith$Fragment$QuestionFetch$conditions(
    Fragment$QuestionFetch$conditions instance,
    TRes Function(Fragment$QuestionFetch$conditions) then,
  ) = _CopyWithImpl$Fragment$QuestionFetch$conditions;

  factory CopyWith$Fragment$QuestionFetch$conditions.stub(TRes res) =
      _CopyWithStubImpl$Fragment$QuestionFetch$conditions;

  TRes call({
    String? id,
    Enum$SurveyQuestionConditionConditionTypeChoices? conditionType,
    Enum$SurveyQuestionConditionLogicOperatorChoices? logicOperator,
    int? order,
    Fragment$QuestionFetch$conditions$targetQuestion? targetQuestion,
    String? value,
    String? $__typename,
  });
  CopyWith$Fragment$QuestionFetch$conditions$targetQuestion<TRes>
      get targetQuestion;
}

class _CopyWithImpl$Fragment$QuestionFetch$conditions<TRes>
    implements CopyWith$Fragment$QuestionFetch$conditions<TRes> {
  _CopyWithImpl$Fragment$QuestionFetch$conditions(
    this._instance,
    this._then,
  );

  final Fragment$QuestionFetch$conditions _instance;

  final TRes Function(Fragment$QuestionFetch$conditions) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? conditionType = _undefined,
    Object? logicOperator = _undefined,
    Object? order = _undefined,
    Object? targetQuestion = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$QuestionFetch$conditions(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        conditionType: conditionType == _undefined || conditionType == null
            ? _instance.conditionType
            : (conditionType
                as Enum$SurveyQuestionConditionConditionTypeChoices),
        logicOperator: logicOperator == _undefined || logicOperator == null
            ? _instance.logicOperator
            : (logicOperator
                as Enum$SurveyQuestionConditionLogicOperatorChoices),
        order: order == _undefined || order == null
            ? _instance.order
            : (order as int),
        targetQuestion: targetQuestion == _undefined || targetQuestion == null
            ? _instance.targetQuestion
            : (targetQuestion
                as Fragment$QuestionFetch$conditions$targetQuestion),
        value: value == _undefined ? _instance.value : (value as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$QuestionFetch$conditions$targetQuestion<TRes>
      get targetQuestion {
    final local$targetQuestion = _instance.targetQuestion;
    return CopyWith$Fragment$QuestionFetch$conditions$targetQuestion(
        local$targetQuestion, (e) => call(targetQuestion: e));
  }
}

class _CopyWithStubImpl$Fragment$QuestionFetch$conditions<TRes>
    implements CopyWith$Fragment$QuestionFetch$conditions<TRes> {
  _CopyWithStubImpl$Fragment$QuestionFetch$conditions(this._res);

  TRes _res;

  call({
    String? id,
    Enum$SurveyQuestionConditionConditionTypeChoices? conditionType,
    Enum$SurveyQuestionConditionLogicOperatorChoices? logicOperator,
    int? order,
    Fragment$QuestionFetch$conditions$targetQuestion? targetQuestion,
    String? value,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$QuestionFetch$conditions$targetQuestion<TRes>
      get targetQuestion =>
          CopyWith$Fragment$QuestionFetch$conditions$targetQuestion.stub(_res);
}

class Fragment$QuestionFetch$conditions$targetQuestion {
  Fragment$QuestionFetch$conditions$targetQuestion({
    required this.id,
    this.key,
    this.$__typename = 'QuestionNode',
  });

  factory Fragment$QuestionFetch$conditions$targetQuestion.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$key = json['key'];
    final l$$__typename = json['__typename'];
    return Fragment$QuestionFetch$conditions$targetQuestion(
      id: (l$id as String),
      key: (l$key as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String? key;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$key = key;
    _resultData['key'] = l$key;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$key = key;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$key,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$QuestionFetch$conditions$targetQuestion ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$key = key;
    final lOther$key = other.key;
    if (l$key != lOther$key) {
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

extension UtilityExtension$Fragment$QuestionFetch$conditions$targetQuestion
    on Fragment$QuestionFetch$conditions$targetQuestion {
  CopyWith$Fragment$QuestionFetch$conditions$targetQuestion<
          Fragment$QuestionFetch$conditions$targetQuestion>
      get copyWith => CopyWith$Fragment$QuestionFetch$conditions$targetQuestion(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$QuestionFetch$conditions$targetQuestion<TRes> {
  factory CopyWith$Fragment$QuestionFetch$conditions$targetQuestion(
    Fragment$QuestionFetch$conditions$targetQuestion instance,
    TRes Function(Fragment$QuestionFetch$conditions$targetQuestion) then,
  ) = _CopyWithImpl$Fragment$QuestionFetch$conditions$targetQuestion;

  factory CopyWith$Fragment$QuestionFetch$conditions$targetQuestion.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$QuestionFetch$conditions$targetQuestion;

  TRes call({
    String? id,
    String? key,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$QuestionFetch$conditions$targetQuestion<TRes>
    implements CopyWith$Fragment$QuestionFetch$conditions$targetQuestion<TRes> {
  _CopyWithImpl$Fragment$QuestionFetch$conditions$targetQuestion(
    this._instance,
    this._then,
  );

  final Fragment$QuestionFetch$conditions$targetQuestion _instance;

  final TRes Function(Fragment$QuestionFetch$conditions$targetQuestion) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? key = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$QuestionFetch$conditions$targetQuestion(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        key: key == _undefined ? _instance.key : (key as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$QuestionFetch$conditions$targetQuestion<TRes>
    implements CopyWith$Fragment$QuestionFetch$conditions$targetQuestion<TRes> {
  _CopyWithStubImpl$Fragment$QuestionFetch$conditions$targetQuestion(this._res);

  TRes _res;

  call({
    String? id,
    String? key,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$AccessibleSurveys {
  factory Variables$Query$AccessibleSurveys({
    int? first,
    String? after,
  }) =>
      Variables$Query$AccessibleSurveys._({
        if (first != null) r'first': first,
        if (after != null) r'after': after,
      });

  Variables$Query$AccessibleSurveys._(this._$data);

  factory Variables$Query$AccessibleSurveys.fromJson(
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
    return Variables$Query$AccessibleSurveys._(result$data);
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

  CopyWith$Variables$Query$AccessibleSurveys<Variables$Query$AccessibleSurveys>
      get copyWith => CopyWith$Variables$Query$AccessibleSurveys(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$AccessibleSurveys ||
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

abstract class CopyWith$Variables$Query$AccessibleSurveys<TRes> {
  factory CopyWith$Variables$Query$AccessibleSurveys(
    Variables$Query$AccessibleSurveys instance,
    TRes Function(Variables$Query$AccessibleSurveys) then,
  ) = _CopyWithImpl$Variables$Query$AccessibleSurveys;

  factory CopyWith$Variables$Query$AccessibleSurveys.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$AccessibleSurveys;

  TRes call({
    int? first,
    String? after,
  });
}

class _CopyWithImpl$Variables$Query$AccessibleSurveys<TRes>
    implements CopyWith$Variables$Query$AccessibleSurveys<TRes> {
  _CopyWithImpl$Variables$Query$AccessibleSurveys(
    this._instance,
    this._then,
  );

  final Variables$Query$AccessibleSurveys _instance;

  final TRes Function(Variables$Query$AccessibleSurveys) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? first = _undefined,
    Object? after = _undefined,
  }) =>
      _then(Variables$Query$AccessibleSurveys._({
        ..._instance._$data,
        if (first != _undefined) 'first': (first as int?),
        if (after != _undefined) 'after': (after as String?),
      }));
}

class _CopyWithStubImpl$Variables$Query$AccessibleSurveys<TRes>
    implements CopyWith$Variables$Query$AccessibleSurveys<TRes> {
  _CopyWithStubImpl$Variables$Query$AccessibleSurveys(this._res);

  TRes _res;

  call({
    int? first,
    String? after,
  }) =>
      _res;
}

class Query$AccessibleSurveys {
  Query$AccessibleSurveys({
    this.accessibleSurveys,
    this.$__typename = 'Query',
  });

  factory Query$AccessibleSurveys.fromJson(Map<String, dynamic> json) {
    final l$accessibleSurveys = json['accessibleSurveys'];
    final l$$__typename = json['__typename'];
    return Query$AccessibleSurveys(
      accessibleSurveys: l$accessibleSurveys == null
          ? null
          : Query$AccessibleSurveys$accessibleSurveys.fromJson(
              (l$accessibleSurveys as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$AccessibleSurveys$accessibleSurveys? accessibleSurveys;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$accessibleSurveys = accessibleSurveys;
    _resultData['accessibleSurveys'] = l$accessibleSurveys?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$accessibleSurveys = accessibleSurveys;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$accessibleSurveys,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$AccessibleSurveys || runtimeType != other.runtimeType) {
      return false;
    }
    final l$accessibleSurveys = accessibleSurveys;
    final lOther$accessibleSurveys = other.accessibleSurveys;
    if (l$accessibleSurveys != lOther$accessibleSurveys) {
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

extension UtilityExtension$Query$AccessibleSurveys on Query$AccessibleSurveys {
  CopyWith$Query$AccessibleSurveys<Query$AccessibleSurveys> get copyWith =>
      CopyWith$Query$AccessibleSurveys(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$AccessibleSurveys<TRes> {
  factory CopyWith$Query$AccessibleSurveys(
    Query$AccessibleSurveys instance,
    TRes Function(Query$AccessibleSurveys) then,
  ) = _CopyWithImpl$Query$AccessibleSurveys;

  factory CopyWith$Query$AccessibleSurveys.stub(TRes res) =
      _CopyWithStubImpl$Query$AccessibleSurveys;

  TRes call({
    Query$AccessibleSurveys$accessibleSurveys? accessibleSurveys,
    String? $__typename,
  });
  CopyWith$Query$AccessibleSurveys$accessibleSurveys<TRes>
      get accessibleSurveys;
}

class _CopyWithImpl$Query$AccessibleSurveys<TRes>
    implements CopyWith$Query$AccessibleSurveys<TRes> {
  _CopyWithImpl$Query$AccessibleSurveys(
    this._instance,
    this._then,
  );

  final Query$AccessibleSurveys _instance;

  final TRes Function(Query$AccessibleSurveys) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? accessibleSurveys = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$AccessibleSurveys(
        accessibleSurveys: accessibleSurveys == _undefined
            ? _instance.accessibleSurveys
            : (accessibleSurveys as Query$AccessibleSurveys$accessibleSurveys?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$AccessibleSurveys$accessibleSurveys<TRes>
      get accessibleSurveys {
    final local$accessibleSurveys = _instance.accessibleSurveys;
    return local$accessibleSurveys == null
        ? CopyWith$Query$AccessibleSurveys$accessibleSurveys.stub(
            _then(_instance))
        : CopyWith$Query$AccessibleSurveys$accessibleSurveys(
            local$accessibleSurveys, (e) => call(accessibleSurveys: e));
  }
}

class _CopyWithStubImpl$Query$AccessibleSurveys<TRes>
    implements CopyWith$Query$AccessibleSurveys<TRes> {
  _CopyWithStubImpl$Query$AccessibleSurveys(this._res);

  TRes _res;

  call({
    Query$AccessibleSurveys$accessibleSurveys? accessibleSurveys,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$AccessibleSurveys$accessibleSurveys<TRes>
      get accessibleSurveys =>
          CopyWith$Query$AccessibleSurveys$accessibleSurveys.stub(_res);
}

const documentNodeQueryAccessibleSurveys = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'AccessibleSurveys'),
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
        name: NameNode(value: 'accessibleSurveys'),
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
                    name: NameNode(value: 'description'),
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
                    name: NameNode(value: 'updatedAt'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'endDate'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'createdBy'),
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
                    name: NameNode(value: 'submissionCount'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'hasSubmitted'),
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
Query$AccessibleSurveys _parserFn$Query$AccessibleSurveys(
        Map<String, dynamic> data) =>
    Query$AccessibleSurveys.fromJson(data);
typedef OnQueryComplete$Query$AccessibleSurveys = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$AccessibleSurveys?,
);

class Options$Query$AccessibleSurveys
    extends graphql.QueryOptions<Query$AccessibleSurveys> {
  Options$Query$AccessibleSurveys({
    String? operationName,
    Variables$Query$AccessibleSurveys? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$AccessibleSurveys? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$AccessibleSurveys? onComplete,
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
                        : _parserFn$Query$AccessibleSurveys(data),
                  ),
          onError: onError,
          document: documentNodeQueryAccessibleSurveys,
          parserFn: _parserFn$Query$AccessibleSurveys,
        );

  final OnQueryComplete$Query$AccessibleSurveys? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$AccessibleSurveys
    extends graphql.WatchQueryOptions<Query$AccessibleSurveys> {
  WatchOptions$Query$AccessibleSurveys({
    String? operationName,
    Variables$Query$AccessibleSurveys? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$AccessibleSurveys? typedOptimisticResult,
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
          document: documentNodeQueryAccessibleSurveys,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$AccessibleSurveys,
        );
}

class FetchMoreOptions$Query$AccessibleSurveys
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$AccessibleSurveys({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$AccessibleSurveys? variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables?.toJson() ?? {},
          document: documentNodeQueryAccessibleSurveys,
        );
}

extension ClientExtension$Query$AccessibleSurveys on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$AccessibleSurveys>> query$AccessibleSurveys(
          [Options$Query$AccessibleSurveys? options]) async =>
      await this.query(options ?? Options$Query$AccessibleSurveys());
  graphql.ObservableQuery<Query$AccessibleSurveys> watchQuery$AccessibleSurveys(
          [WatchOptions$Query$AccessibleSurveys? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$AccessibleSurveys());
  void writeQuery$AccessibleSurveys({
    required Query$AccessibleSurveys data,
    Variables$Query$AccessibleSurveys? variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryAccessibleSurveys),
          variables: variables?.toJson() ?? const {},
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$AccessibleSurveys? readQuery$AccessibleSurveys({
    Variables$Query$AccessibleSurveys? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryAccessibleSurveys),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$AccessibleSurveys.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$AccessibleSurveys>
    useQuery$AccessibleSurveys([Options$Query$AccessibleSurveys? options]) =>
        graphql_flutter.useQuery(options ?? Options$Query$AccessibleSurveys());
graphql.ObservableQuery<Query$AccessibleSurveys>
    useWatchQuery$AccessibleSurveys(
            [WatchOptions$Query$AccessibleSurveys? options]) =>
        graphql_flutter
            .useWatchQuery(options ?? WatchOptions$Query$AccessibleSurveys());

class Query$AccessibleSurveys$Widget
    extends graphql_flutter.Query<Query$AccessibleSurveys> {
  Query$AccessibleSurveys$Widget({
    widgets.Key? key,
    Options$Query$AccessibleSurveys? options,
    required graphql_flutter.QueryBuilder<Query$AccessibleSurveys> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$AccessibleSurveys(),
          builder: builder,
        );
}

class Query$AccessibleSurveys$accessibleSurveys {
  Query$AccessibleSurveys$accessibleSurveys({
    required this.edges,
    required this.pageInfo,
    this.$__typename = 'SurveyNodeConnection',
  });

  factory Query$AccessibleSurveys$accessibleSurveys.fromJson(
      Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$pageInfo = json['pageInfo'];
    final l$$__typename = json['__typename'];
    return Query$AccessibleSurveys$accessibleSurveys(
      edges: (l$edges as List<dynamic>)
          .map((e) => e == null
              ? null
              : Query$AccessibleSurveys$accessibleSurveys$edges.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      pageInfo: Query$AccessibleSurveys$accessibleSurveys$pageInfo.fromJson(
          (l$pageInfo as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$AccessibleSurveys$accessibleSurveys$edges?> edges;

  final Query$AccessibleSurveys$accessibleSurveys$pageInfo pageInfo;

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
    if (other is! Query$AccessibleSurveys$accessibleSurveys ||
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

extension UtilityExtension$Query$AccessibleSurveys$accessibleSurveys
    on Query$AccessibleSurveys$accessibleSurveys {
  CopyWith$Query$AccessibleSurveys$accessibleSurveys<
          Query$AccessibleSurveys$accessibleSurveys>
      get copyWith => CopyWith$Query$AccessibleSurveys$accessibleSurveys(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$AccessibleSurveys$accessibleSurveys<TRes> {
  factory CopyWith$Query$AccessibleSurveys$accessibleSurveys(
    Query$AccessibleSurveys$accessibleSurveys instance,
    TRes Function(Query$AccessibleSurveys$accessibleSurveys) then,
  ) = _CopyWithImpl$Query$AccessibleSurveys$accessibleSurveys;

  factory CopyWith$Query$AccessibleSurveys$accessibleSurveys.stub(TRes res) =
      _CopyWithStubImpl$Query$AccessibleSurveys$accessibleSurveys;

  TRes call({
    List<Query$AccessibleSurveys$accessibleSurveys$edges?>? edges,
    Query$AccessibleSurveys$accessibleSurveys$pageInfo? pageInfo,
    String? $__typename,
  });
  TRes edges(
      Iterable<Query$AccessibleSurveys$accessibleSurveys$edges?> Function(
              Iterable<
                  CopyWith$Query$AccessibleSurveys$accessibleSurveys$edges<
                      Query$AccessibleSurveys$accessibleSurveys$edges>?>)
          _fn);
  CopyWith$Query$AccessibleSurveys$accessibleSurveys$pageInfo<TRes>
      get pageInfo;
}

class _CopyWithImpl$Query$AccessibleSurveys$accessibleSurveys<TRes>
    implements CopyWith$Query$AccessibleSurveys$accessibleSurveys<TRes> {
  _CopyWithImpl$Query$AccessibleSurveys$accessibleSurveys(
    this._instance,
    this._then,
  );

  final Query$AccessibleSurveys$accessibleSurveys _instance;

  final TRes Function(Query$AccessibleSurveys$accessibleSurveys) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? pageInfo = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$AccessibleSurveys$accessibleSurveys(
        edges: edges == _undefined || edges == null
            ? _instance.edges
            : (edges as List<Query$AccessibleSurveys$accessibleSurveys$edges?>),
        pageInfo: pageInfo == _undefined || pageInfo == null
            ? _instance.pageInfo
            : (pageInfo as Query$AccessibleSurveys$accessibleSurveys$pageInfo),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes edges(
          Iterable<Query$AccessibleSurveys$accessibleSurveys$edges?> Function(
                  Iterable<
                      CopyWith$Query$AccessibleSurveys$accessibleSurveys$edges<
                          Query$AccessibleSurveys$accessibleSurveys$edges>?>)
              _fn) =>
      call(
          edges: _fn(_instance.edges.map((e) => e == null
              ? null
              : CopyWith$Query$AccessibleSurveys$accessibleSurveys$edges(
                  e,
                  (i) => i,
                ))).toList());

  CopyWith$Query$AccessibleSurveys$accessibleSurveys$pageInfo<TRes>
      get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return CopyWith$Query$AccessibleSurveys$accessibleSurveys$pageInfo(
        local$pageInfo, (e) => call(pageInfo: e));
  }
}

class _CopyWithStubImpl$Query$AccessibleSurveys$accessibleSurveys<TRes>
    implements CopyWith$Query$AccessibleSurveys$accessibleSurveys<TRes> {
  _CopyWithStubImpl$Query$AccessibleSurveys$accessibleSurveys(this._res);

  TRes _res;

  call({
    List<Query$AccessibleSurveys$accessibleSurveys$edges?>? edges,
    Query$AccessibleSurveys$accessibleSurveys$pageInfo? pageInfo,
    String? $__typename,
  }) =>
      _res;

  edges(_fn) => _res;

  CopyWith$Query$AccessibleSurveys$accessibleSurveys$pageInfo<TRes>
      get pageInfo =>
          CopyWith$Query$AccessibleSurveys$accessibleSurveys$pageInfo.stub(
              _res);
}

class Query$AccessibleSurveys$accessibleSurveys$edges {
  Query$AccessibleSurveys$accessibleSurveys$edges({
    this.node,
    this.$__typename = 'SurveyNodeEdge',
  });

  factory Query$AccessibleSurveys$accessibleSurveys$edges.fromJson(
      Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$AccessibleSurveys$accessibleSurveys$edges(
      node: l$node == null
          ? null
          : Query$AccessibleSurveys$accessibleSurveys$edges$node.fromJson(
              (l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$AccessibleSurveys$accessibleSurveys$edges$node? node;

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
    if (other is! Query$AccessibleSurveys$accessibleSurveys$edges ||
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

extension UtilityExtension$Query$AccessibleSurveys$accessibleSurveys$edges
    on Query$AccessibleSurveys$accessibleSurveys$edges {
  CopyWith$Query$AccessibleSurveys$accessibleSurveys$edges<
          Query$AccessibleSurveys$accessibleSurveys$edges>
      get copyWith => CopyWith$Query$AccessibleSurveys$accessibleSurveys$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$AccessibleSurveys$accessibleSurveys$edges<TRes> {
  factory CopyWith$Query$AccessibleSurveys$accessibleSurveys$edges(
    Query$AccessibleSurveys$accessibleSurveys$edges instance,
    TRes Function(Query$AccessibleSurveys$accessibleSurveys$edges) then,
  ) = _CopyWithImpl$Query$AccessibleSurveys$accessibleSurveys$edges;

  factory CopyWith$Query$AccessibleSurveys$accessibleSurveys$edges.stub(
          TRes res) =
      _CopyWithStubImpl$Query$AccessibleSurveys$accessibleSurveys$edges;

  TRes call({
    Query$AccessibleSurveys$accessibleSurveys$edges$node? node,
    String? $__typename,
  });
  CopyWith$Query$AccessibleSurveys$accessibleSurveys$edges$node<TRes> get node;
}

class _CopyWithImpl$Query$AccessibleSurveys$accessibleSurveys$edges<TRes>
    implements CopyWith$Query$AccessibleSurveys$accessibleSurveys$edges<TRes> {
  _CopyWithImpl$Query$AccessibleSurveys$accessibleSurveys$edges(
    this._instance,
    this._then,
  );

  final Query$AccessibleSurveys$accessibleSurveys$edges _instance;

  final TRes Function(Query$AccessibleSurveys$accessibleSurveys$edges) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$AccessibleSurveys$accessibleSurveys$edges(
        node: node == _undefined
            ? _instance.node
            : (node as Query$AccessibleSurveys$accessibleSurveys$edges$node?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$AccessibleSurveys$accessibleSurveys$edges$node<TRes> get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Query$AccessibleSurveys$accessibleSurveys$edges$node.stub(
            _then(_instance))
        : CopyWith$Query$AccessibleSurveys$accessibleSurveys$edges$node(
            local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Query$AccessibleSurveys$accessibleSurveys$edges<TRes>
    implements CopyWith$Query$AccessibleSurveys$accessibleSurveys$edges<TRes> {
  _CopyWithStubImpl$Query$AccessibleSurveys$accessibleSurveys$edges(this._res);

  TRes _res;

  call({
    Query$AccessibleSurveys$accessibleSurveys$edges$node? node,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$AccessibleSurveys$accessibleSurveys$edges$node<TRes>
      get node =>
          CopyWith$Query$AccessibleSurveys$accessibleSurveys$edges$node.stub(
              _res);
}

class Query$AccessibleSurveys$accessibleSurveys$edges$node {
  Query$AccessibleSurveys$accessibleSurveys$edges$node({
    required this.id,
    required this.title,
    this.description,
    required this.isActive,
    required this.visibility,
    required this.createdAt,
    required this.updatedAt,
    this.endDate,
    this.createdBy,
    this.submissionCount,
    this.hasSubmitted,
    this.$__typename = 'SurveyNode',
  });

  factory Query$AccessibleSurveys$accessibleSurveys$edges$node.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$description = json['description'];
    final l$isActive = json['isActive'];
    final l$visibility = json['visibility'];
    final l$createdAt = json['createdAt'];
    final l$updatedAt = json['updatedAt'];
    final l$endDate = json['endDate'];
    final l$createdBy = json['createdBy'];
    final l$submissionCount = json['submissionCount'];
    final l$hasSubmitted = json['hasSubmitted'];
    final l$$__typename = json['__typename'];
    return Query$AccessibleSurveys$accessibleSurveys$edges$node(
      id: (l$id as String),
      title: (l$title as String),
      description: (l$description as String?),
      isActive: (l$isActive as bool),
      visibility:
          fromJson$Enum$SurveySurveyVisibilityChoices((l$visibility as String)),
      createdAt: DateTime.parse((l$createdAt as String)),
      updatedAt: DateTime.parse((l$updatedAt as String)),
      endDate: (l$endDate as String?),
      createdBy: l$createdBy == null
          ? null
          : Query$AccessibleSurveys$accessibleSurveys$edges$node$createdBy
              .fromJson((l$createdBy as Map<String, dynamic>)),
      submissionCount: (l$submissionCount as int?),
      hasSubmitted: (l$hasSubmitted as bool?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final String? description;

  final bool isActive;

  final Enum$SurveySurveyVisibilityChoices visibility;

  final DateTime createdAt;

  final DateTime updatedAt;

  final String? endDate;

  final Query$AccessibleSurveys$accessibleSurveys$edges$node$createdBy?
      createdBy;

  final int? submissionCount;

  final bool? hasSubmitted;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$isActive = isActive;
    _resultData['isActive'] = l$isActive;
    final l$visibility = visibility;
    _resultData['visibility'] =
        toJson$Enum$SurveySurveyVisibilityChoices(l$visibility);
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt.toIso8601String();
    final l$updatedAt = updatedAt;
    _resultData['updatedAt'] = l$updatedAt.toIso8601String();
    final l$endDate = endDate;
    _resultData['endDate'] = l$endDate;
    final l$createdBy = createdBy;
    _resultData['createdBy'] = l$createdBy?.toJson();
    final l$submissionCount = submissionCount;
    _resultData['submissionCount'] = l$submissionCount;
    final l$hasSubmitted = hasSubmitted;
    _resultData['hasSubmitted'] = l$hasSubmitted;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$description = description;
    final l$isActive = isActive;
    final l$visibility = visibility;
    final l$createdAt = createdAt;
    final l$updatedAt = updatedAt;
    final l$endDate = endDate;
    final l$createdBy = createdBy;
    final l$submissionCount = submissionCount;
    final l$hasSubmitted = hasSubmitted;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$description,
      l$isActive,
      l$visibility,
      l$createdAt,
      l$updatedAt,
      l$endDate,
      l$createdBy,
      l$submissionCount,
      l$hasSubmitted,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$AccessibleSurveys$accessibleSurveys$edges$node ||
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
    final l$updatedAt = updatedAt;
    final lOther$updatedAt = other.updatedAt;
    if (l$updatedAt != lOther$updatedAt) {
      return false;
    }
    final l$endDate = endDate;
    final lOther$endDate = other.endDate;
    if (l$endDate != lOther$endDate) {
      return false;
    }
    final l$createdBy = createdBy;
    final lOther$createdBy = other.createdBy;
    if (l$createdBy != lOther$createdBy) {
      return false;
    }
    final l$submissionCount = submissionCount;
    final lOther$submissionCount = other.submissionCount;
    if (l$submissionCount != lOther$submissionCount) {
      return false;
    }
    final l$hasSubmitted = hasSubmitted;
    final lOther$hasSubmitted = other.hasSubmitted;
    if (l$hasSubmitted != lOther$hasSubmitted) {
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

extension UtilityExtension$Query$AccessibleSurveys$accessibleSurveys$edges$node
    on Query$AccessibleSurveys$accessibleSurveys$edges$node {
  CopyWith$Query$AccessibleSurveys$accessibleSurveys$edges$node<
          Query$AccessibleSurveys$accessibleSurveys$edges$node>
      get copyWith =>
          CopyWith$Query$AccessibleSurveys$accessibleSurveys$edges$node(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$AccessibleSurveys$accessibleSurveys$edges$node<
    TRes> {
  factory CopyWith$Query$AccessibleSurveys$accessibleSurveys$edges$node(
    Query$AccessibleSurveys$accessibleSurveys$edges$node instance,
    TRes Function(Query$AccessibleSurveys$accessibleSurveys$edges$node) then,
  ) = _CopyWithImpl$Query$AccessibleSurveys$accessibleSurveys$edges$node;

  factory CopyWith$Query$AccessibleSurveys$accessibleSurveys$edges$node.stub(
          TRes res) =
      _CopyWithStubImpl$Query$AccessibleSurveys$accessibleSurveys$edges$node;

  TRes call({
    String? id,
    String? title,
    String? description,
    bool? isActive,
    Enum$SurveySurveyVisibilityChoices? visibility,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? endDate,
    Query$AccessibleSurveys$accessibleSurveys$edges$node$createdBy? createdBy,
    int? submissionCount,
    bool? hasSubmitted,
    String? $__typename,
  });
  CopyWith$Query$AccessibleSurveys$accessibleSurveys$edges$node$createdBy<TRes>
      get createdBy;
}

class _CopyWithImpl$Query$AccessibleSurveys$accessibleSurveys$edges$node<TRes>
    implements
        CopyWith$Query$AccessibleSurveys$accessibleSurveys$edges$node<TRes> {
  _CopyWithImpl$Query$AccessibleSurveys$accessibleSurveys$edges$node(
    this._instance,
    this._then,
  );

  final Query$AccessibleSurveys$accessibleSurveys$edges$node _instance;

  final TRes Function(Query$AccessibleSurveys$accessibleSurveys$edges$node)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? description = _undefined,
    Object? isActive = _undefined,
    Object? visibility = _undefined,
    Object? createdAt = _undefined,
    Object? updatedAt = _undefined,
    Object? endDate = _undefined,
    Object? createdBy = _undefined,
    Object? submissionCount = _undefined,
    Object? hasSubmitted = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$AccessibleSurveys$accessibleSurveys$edges$node(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        description: description == _undefined
            ? _instance.description
            : (description as String?),
        isActive: isActive == _undefined || isActive == null
            ? _instance.isActive
            : (isActive as bool),
        visibility: visibility == _undefined || visibility == null
            ? _instance.visibility
            : (visibility as Enum$SurveySurveyVisibilityChoices),
        createdAt: createdAt == _undefined || createdAt == null
            ? _instance.createdAt
            : (createdAt as DateTime),
        updatedAt: updatedAt == _undefined || updatedAt == null
            ? _instance.updatedAt
            : (updatedAt as DateTime),
        endDate:
            endDate == _undefined ? _instance.endDate : (endDate as String?),
        createdBy: createdBy == _undefined
            ? _instance.createdBy
            : (createdBy
                as Query$AccessibleSurveys$accessibleSurveys$edges$node$createdBy?),
        submissionCount: submissionCount == _undefined
            ? _instance.submissionCount
            : (submissionCount as int?),
        hasSubmitted: hasSubmitted == _undefined
            ? _instance.hasSubmitted
            : (hasSubmitted as bool?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$AccessibleSurveys$accessibleSurveys$edges$node$createdBy<TRes>
      get createdBy {
    final local$createdBy = _instance.createdBy;
    return local$createdBy == null
        ? CopyWith$Query$AccessibleSurveys$accessibleSurveys$edges$node$createdBy
            .stub(_then(_instance))
        : CopyWith$Query$AccessibleSurveys$accessibleSurveys$edges$node$createdBy(
            local$createdBy, (e) => call(createdBy: e));
  }
}

class _CopyWithStubImpl$Query$AccessibleSurveys$accessibleSurveys$edges$node<
        TRes>
    implements
        CopyWith$Query$AccessibleSurveys$accessibleSurveys$edges$node<TRes> {
  _CopyWithStubImpl$Query$AccessibleSurveys$accessibleSurveys$edges$node(
      this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? description,
    bool? isActive,
    Enum$SurveySurveyVisibilityChoices? visibility,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? endDate,
    Query$AccessibleSurveys$accessibleSurveys$edges$node$createdBy? createdBy,
    int? submissionCount,
    bool? hasSubmitted,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$AccessibleSurveys$accessibleSurveys$edges$node$createdBy<TRes>
      get createdBy =>
          CopyWith$Query$AccessibleSurveys$accessibleSurveys$edges$node$createdBy
              .stub(_res);
}

class Query$AccessibleSurveys$accessibleSurveys$edges$node$createdBy {
  Query$AccessibleSurveys$accessibleSurveys$edges$node$createdBy({
    required this.username,
    required this.firstName,
    required this.lastName,
    this.$__typename = 'UserNode',
  });

  factory Query$AccessibleSurveys$accessibleSurveys$edges$node$createdBy.fromJson(
      Map<String, dynamic> json) {
    final l$username = json['username'];
    final l$firstName = json['firstName'];
    final l$lastName = json['lastName'];
    final l$$__typename = json['__typename'];
    return Query$AccessibleSurveys$accessibleSurveys$edges$node$createdBy(
      username: (l$username as String),
      firstName: (l$firstName as String),
      lastName: (l$lastName as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String username;

  final String firstName;

  final String lastName;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$username = username;
    _resultData['username'] = l$username;
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
    final l$username = username;
    final l$firstName = firstName;
    final l$lastName = lastName;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$username,
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
    if (other
            is! Query$AccessibleSurveys$accessibleSurveys$edges$node$createdBy ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$username = username;
    final lOther$username = other.username;
    if (l$username != lOther$username) {
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

extension UtilityExtension$Query$AccessibleSurveys$accessibleSurveys$edges$node$createdBy
    on Query$AccessibleSurveys$accessibleSurveys$edges$node$createdBy {
  CopyWith$Query$AccessibleSurveys$accessibleSurveys$edges$node$createdBy<
          Query$AccessibleSurveys$accessibleSurveys$edges$node$createdBy>
      get copyWith =>
          CopyWith$Query$AccessibleSurveys$accessibleSurveys$edges$node$createdBy(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$AccessibleSurveys$accessibleSurveys$edges$node$createdBy<
    TRes> {
  factory CopyWith$Query$AccessibleSurveys$accessibleSurveys$edges$node$createdBy(
    Query$AccessibleSurveys$accessibleSurveys$edges$node$createdBy instance,
    TRes Function(
            Query$AccessibleSurveys$accessibleSurveys$edges$node$createdBy)
        then,
  ) = _CopyWithImpl$Query$AccessibleSurveys$accessibleSurveys$edges$node$createdBy;

  factory CopyWith$Query$AccessibleSurveys$accessibleSurveys$edges$node$createdBy.stub(
          TRes res) =
      _CopyWithStubImpl$Query$AccessibleSurveys$accessibleSurveys$edges$node$createdBy;

  TRes call({
    String? username,
    String? firstName,
    String? lastName,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$AccessibleSurveys$accessibleSurveys$edges$node$createdBy<
        TRes>
    implements
        CopyWith$Query$AccessibleSurveys$accessibleSurveys$edges$node$createdBy<
            TRes> {
  _CopyWithImpl$Query$AccessibleSurveys$accessibleSurveys$edges$node$createdBy(
    this._instance,
    this._then,
  );

  final Query$AccessibleSurveys$accessibleSurveys$edges$node$createdBy
      _instance;

  final TRes Function(
      Query$AccessibleSurveys$accessibleSurveys$edges$node$createdBy) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? username = _undefined,
    Object? firstName = _undefined,
    Object? lastName = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$AccessibleSurveys$accessibleSurveys$edges$node$createdBy(
        username: username == _undefined || username == null
            ? _instance.username
            : (username as String),
        firstName: firstName == _undefined || firstName == null
            ? _instance.firstName
            : (firstName as String),
        lastName: lastName == _undefined || lastName == null
            ? _instance.lastName
            : (lastName as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$AccessibleSurveys$accessibleSurveys$edges$node$createdBy<
        TRes>
    implements
        CopyWith$Query$AccessibleSurveys$accessibleSurveys$edges$node$createdBy<
            TRes> {
  _CopyWithStubImpl$Query$AccessibleSurveys$accessibleSurveys$edges$node$createdBy(
      this._res);

  TRes _res;

  call({
    String? username,
    String? firstName,
    String? lastName,
    String? $__typename,
  }) =>
      _res;
}

class Query$AccessibleSurveys$accessibleSurveys$pageInfo {
  Query$AccessibleSurveys$accessibleSurveys$pageInfo({
    required this.hasNextPage,
    required this.hasPreviousPage,
    this.startCursor,
    this.endCursor,
    this.$__typename = 'PageInfo',
  });

  factory Query$AccessibleSurveys$accessibleSurveys$pageInfo.fromJson(
      Map<String, dynamic> json) {
    final l$hasNextPage = json['hasNextPage'];
    final l$hasPreviousPage = json['hasPreviousPage'];
    final l$startCursor = json['startCursor'];
    final l$endCursor = json['endCursor'];
    final l$$__typename = json['__typename'];
    return Query$AccessibleSurveys$accessibleSurveys$pageInfo(
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
    if (other is! Query$AccessibleSurveys$accessibleSurveys$pageInfo ||
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

extension UtilityExtension$Query$AccessibleSurveys$accessibleSurveys$pageInfo
    on Query$AccessibleSurveys$accessibleSurveys$pageInfo {
  CopyWith$Query$AccessibleSurveys$accessibleSurveys$pageInfo<
          Query$AccessibleSurveys$accessibleSurveys$pageInfo>
      get copyWith =>
          CopyWith$Query$AccessibleSurveys$accessibleSurveys$pageInfo(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$AccessibleSurveys$accessibleSurveys$pageInfo<
    TRes> {
  factory CopyWith$Query$AccessibleSurveys$accessibleSurveys$pageInfo(
    Query$AccessibleSurveys$accessibleSurveys$pageInfo instance,
    TRes Function(Query$AccessibleSurveys$accessibleSurveys$pageInfo) then,
  ) = _CopyWithImpl$Query$AccessibleSurveys$accessibleSurveys$pageInfo;

  factory CopyWith$Query$AccessibleSurveys$accessibleSurveys$pageInfo.stub(
          TRes res) =
      _CopyWithStubImpl$Query$AccessibleSurveys$accessibleSurveys$pageInfo;

  TRes call({
    bool? hasNextPage,
    bool? hasPreviousPage,
    String? startCursor,
    String? endCursor,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$AccessibleSurveys$accessibleSurveys$pageInfo<TRes>
    implements
        CopyWith$Query$AccessibleSurveys$accessibleSurveys$pageInfo<TRes> {
  _CopyWithImpl$Query$AccessibleSurveys$accessibleSurveys$pageInfo(
    this._instance,
    this._then,
  );

  final Query$AccessibleSurveys$accessibleSurveys$pageInfo _instance;

  final TRes Function(Query$AccessibleSurveys$accessibleSurveys$pageInfo) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? hasNextPage = _undefined,
    Object? hasPreviousPage = _undefined,
    Object? startCursor = _undefined,
    Object? endCursor = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$AccessibleSurveys$accessibleSurveys$pageInfo(
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

class _CopyWithStubImpl$Query$AccessibleSurveys$accessibleSurveys$pageInfo<TRes>
    implements
        CopyWith$Query$AccessibleSurveys$accessibleSurveys$pageInfo<TRes> {
  _CopyWithStubImpl$Query$AccessibleSurveys$accessibleSurveys$pageInfo(
      this._res);

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

class Variables$Query$SurveyBasic {
  factory Variables$Query$SurveyBasic({required String id}) =>
      Variables$Query$SurveyBasic._({
        r'id': id,
      });

  Variables$Query$SurveyBasic._(this._$data);

  factory Variables$Query$SurveyBasic.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Query$SurveyBasic._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$SurveyBasic<Variables$Query$SurveyBasic>
      get copyWith => CopyWith$Variables$Query$SurveyBasic(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$SurveyBasic ||
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

abstract class CopyWith$Variables$Query$SurveyBasic<TRes> {
  factory CopyWith$Variables$Query$SurveyBasic(
    Variables$Query$SurveyBasic instance,
    TRes Function(Variables$Query$SurveyBasic) then,
  ) = _CopyWithImpl$Variables$Query$SurveyBasic;

  factory CopyWith$Variables$Query$SurveyBasic.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$SurveyBasic;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Query$SurveyBasic<TRes>
    implements CopyWith$Variables$Query$SurveyBasic<TRes> {
  _CopyWithImpl$Variables$Query$SurveyBasic(
    this._instance,
    this._then,
  );

  final Variables$Query$SurveyBasic _instance;

  final TRes Function(Variables$Query$SurveyBasic) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) => _then(Variables$Query$SurveyBasic._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$SurveyBasic<TRes>
    implements CopyWith$Variables$Query$SurveyBasic<TRes> {
  _CopyWithStubImpl$Variables$Query$SurveyBasic(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Query$SurveyBasic {
  Query$SurveyBasic({
    this.survey,
    this.$__typename = 'Query',
  });

  factory Query$SurveyBasic.fromJson(Map<String, dynamic> json) {
    final l$survey = json['survey'];
    final l$$__typename = json['__typename'];
    return Query$SurveyBasic(
      survey: l$survey == null
          ? null
          : Query$SurveyBasic$survey.fromJson(
              (l$survey as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$SurveyBasic$survey? survey;

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
    if (other is! Query$SurveyBasic || runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$SurveyBasic on Query$SurveyBasic {
  CopyWith$Query$SurveyBasic<Query$SurveyBasic> get copyWith =>
      CopyWith$Query$SurveyBasic(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$SurveyBasic<TRes> {
  factory CopyWith$Query$SurveyBasic(
    Query$SurveyBasic instance,
    TRes Function(Query$SurveyBasic) then,
  ) = _CopyWithImpl$Query$SurveyBasic;

  factory CopyWith$Query$SurveyBasic.stub(TRes res) =
      _CopyWithStubImpl$Query$SurveyBasic;

  TRes call({
    Query$SurveyBasic$survey? survey,
    String? $__typename,
  });
  CopyWith$Query$SurveyBasic$survey<TRes> get survey;
}

class _CopyWithImpl$Query$SurveyBasic<TRes>
    implements CopyWith$Query$SurveyBasic<TRes> {
  _CopyWithImpl$Query$SurveyBasic(
    this._instance,
    this._then,
  );

  final Query$SurveyBasic _instance;

  final TRes Function(Query$SurveyBasic) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? survey = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$SurveyBasic(
        survey: survey == _undefined
            ? _instance.survey
            : (survey as Query$SurveyBasic$survey?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$SurveyBasic$survey<TRes> get survey {
    final local$survey = _instance.survey;
    return local$survey == null
        ? CopyWith$Query$SurveyBasic$survey.stub(_then(_instance))
        : CopyWith$Query$SurveyBasic$survey(
            local$survey, (e) => call(survey: e));
  }
}

class _CopyWithStubImpl$Query$SurveyBasic<TRes>
    implements CopyWith$Query$SurveyBasic<TRes> {
  _CopyWithStubImpl$Query$SurveyBasic(this._res);

  TRes _res;

  call({
    Query$SurveyBasic$survey? survey,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$SurveyBasic$survey<TRes> get survey =>
      CopyWith$Query$SurveyBasic$survey.stub(_res);
}

const documentNodeQuerySurveyBasic = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'SurveyBasic'),
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
        name: NameNode(value: 'survey'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'id')),
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
            name: NameNode(value: 'submissionCount'),
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
            name: NameNode(value: 'consentText'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'endDate'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'allowMultipleSubmissions'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'defaultLanguage'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'availableLanguages'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'hasSubmitted'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'updatedAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'consentTranslations'),
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
                name: NameNode(value: 'language'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'consentText'),
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
Query$SurveyBasic _parserFn$Query$SurveyBasic(Map<String, dynamic> data) =>
    Query$SurveyBasic.fromJson(data);
typedef OnQueryComplete$Query$SurveyBasic = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$SurveyBasic?,
);

class Options$Query$SurveyBasic
    extends graphql.QueryOptions<Query$SurveyBasic> {
  Options$Query$SurveyBasic({
    String? operationName,
    required Variables$Query$SurveyBasic variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$SurveyBasic? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$SurveyBasic? onComplete,
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
                    data == null ? null : _parserFn$Query$SurveyBasic(data),
                  ),
          onError: onError,
          document: documentNodeQuerySurveyBasic,
          parserFn: _parserFn$Query$SurveyBasic,
        );

  final OnQueryComplete$Query$SurveyBasic? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$SurveyBasic
    extends graphql.WatchQueryOptions<Query$SurveyBasic> {
  WatchOptions$Query$SurveyBasic({
    String? operationName,
    required Variables$Query$SurveyBasic variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$SurveyBasic? typedOptimisticResult,
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
          document: documentNodeQuerySurveyBasic,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$SurveyBasic,
        );
}

class FetchMoreOptions$Query$SurveyBasic extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$SurveyBasic({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$SurveyBasic variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerySurveyBasic,
        );
}

extension ClientExtension$Query$SurveyBasic on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$SurveyBasic>> query$SurveyBasic(
          Options$Query$SurveyBasic options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$SurveyBasic> watchQuery$SurveyBasic(
          WatchOptions$Query$SurveyBasic options) =>
      this.watchQuery(options);
  void writeQuery$SurveyBasic({
    required Query$SurveyBasic data,
    required Variables$Query$SurveyBasic variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQuerySurveyBasic),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$SurveyBasic? readQuery$SurveyBasic({
    required Variables$Query$SurveyBasic variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQuerySurveyBasic),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$SurveyBasic.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$SurveyBasic> useQuery$SurveyBasic(
        Options$Query$SurveyBasic options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$SurveyBasic> useWatchQuery$SurveyBasic(
        WatchOptions$Query$SurveyBasic options) =>
    graphql_flutter.useWatchQuery(options);

class Query$SurveyBasic$Widget
    extends graphql_flutter.Query<Query$SurveyBasic> {
  Query$SurveyBasic$Widget({
    widgets.Key? key,
    required Options$Query$SurveyBasic options,
    required graphql_flutter.QueryBuilder<Query$SurveyBasic> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$SurveyBasic$survey {
  Query$SurveyBasic$survey({
    required this.id,
    this.submissionCount,
    required this.title,
    this.description,
    required this.isActive,
    required this.visibility,
    this.consentText,
    this.endDate,
    required this.allowMultipleSubmissions,
    required this.defaultLanguage,
    this.availableLanguages,
    this.hasSubmitted,
    required this.updatedAt,
    this.consentTranslations,
    this.$__typename = 'SurveyNode',
  });

  factory Query$SurveyBasic$survey.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$submissionCount = json['submissionCount'];
    final l$title = json['title'];
    final l$description = json['description'];
    final l$isActive = json['isActive'];
    final l$visibility = json['visibility'];
    final l$consentText = json['consentText'];
    final l$endDate = json['endDate'];
    final l$allowMultipleSubmissions = json['allowMultipleSubmissions'];
    final l$defaultLanguage = json['defaultLanguage'];
    final l$availableLanguages = json['availableLanguages'];
    final l$hasSubmitted = json['hasSubmitted'];
    final l$updatedAt = json['updatedAt'];
    final l$consentTranslations = json['consentTranslations'];
    final l$$__typename = json['__typename'];
    return Query$SurveyBasic$survey(
      id: (l$id as String),
      submissionCount: (l$submissionCount as int?),
      title: (l$title as String),
      description: (l$description as String?),
      isActive: (l$isActive as bool),
      visibility:
          fromJson$Enum$SurveySurveyVisibilityChoices((l$visibility as String)),
      consentText: (l$consentText as String?),
      endDate: (l$endDate as String?),
      allowMultipleSubmissions: (l$allowMultipleSubmissions as bool),
      defaultLanguage: fromJson$Enum$SurveySurveyDefaultLanguageChoices(
          (l$defaultLanguage as String)),
      availableLanguages: (l$availableLanguages as List<dynamic>?)
          ?.map((e) => (e as String?))
          .toList(),
      hasSubmitted: (l$hasSubmitted as bool?),
      updatedAt: DateTime.parse((l$updatedAt as String)),
      consentTranslations: (l$consentTranslations as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Query$SurveyBasic$survey$consentTranslations.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final int? submissionCount;

  final String title;

  final String? description;

  final bool isActive;

  final Enum$SurveySurveyVisibilityChoices visibility;

  final String? consentText;

  final String? endDate;

  final bool allowMultipleSubmissions;

  final Enum$SurveySurveyDefaultLanguageChoices defaultLanguage;

  final List<String?>? availableLanguages;

  final bool? hasSubmitted;

  final DateTime updatedAt;

  final List<Query$SurveyBasic$survey$consentTranslations?>?
      consentTranslations;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$submissionCount = submissionCount;
    _resultData['submissionCount'] = l$submissionCount;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$isActive = isActive;
    _resultData['isActive'] = l$isActive;
    final l$visibility = visibility;
    _resultData['visibility'] =
        toJson$Enum$SurveySurveyVisibilityChoices(l$visibility);
    final l$consentText = consentText;
    _resultData['consentText'] = l$consentText;
    final l$endDate = endDate;
    _resultData['endDate'] = l$endDate;
    final l$allowMultipleSubmissions = allowMultipleSubmissions;
    _resultData['allowMultipleSubmissions'] = l$allowMultipleSubmissions;
    final l$defaultLanguage = defaultLanguage;
    _resultData['defaultLanguage'] =
        toJson$Enum$SurveySurveyDefaultLanguageChoices(l$defaultLanguage);
    final l$availableLanguages = availableLanguages;
    _resultData['availableLanguages'] =
        l$availableLanguages?.map((e) => e).toList();
    final l$hasSubmitted = hasSubmitted;
    _resultData['hasSubmitted'] = l$hasSubmitted;
    final l$updatedAt = updatedAt;
    _resultData['updatedAt'] = l$updatedAt.toIso8601String();
    final l$consentTranslations = consentTranslations;
    _resultData['consentTranslations'] =
        l$consentTranslations?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$submissionCount = submissionCount;
    final l$title = title;
    final l$description = description;
    final l$isActive = isActive;
    final l$visibility = visibility;
    final l$consentText = consentText;
    final l$endDate = endDate;
    final l$allowMultipleSubmissions = allowMultipleSubmissions;
    final l$defaultLanguage = defaultLanguage;
    final l$availableLanguages = availableLanguages;
    final l$hasSubmitted = hasSubmitted;
    final l$updatedAt = updatedAt;
    final l$consentTranslations = consentTranslations;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$submissionCount,
      l$title,
      l$description,
      l$isActive,
      l$visibility,
      l$consentText,
      l$endDate,
      l$allowMultipleSubmissions,
      l$defaultLanguage,
      l$availableLanguages == null
          ? null
          : Object.hashAll(l$availableLanguages.map((v) => v)),
      l$hasSubmitted,
      l$updatedAt,
      l$consentTranslations == null
          ? null
          : Object.hashAll(l$consentTranslations.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$SurveyBasic$survey ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$submissionCount = submissionCount;
    final lOther$submissionCount = other.submissionCount;
    if (l$submissionCount != lOther$submissionCount) {
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
    final l$consentText = consentText;
    final lOther$consentText = other.consentText;
    if (l$consentText != lOther$consentText) {
      return false;
    }
    final l$endDate = endDate;
    final lOther$endDate = other.endDate;
    if (l$endDate != lOther$endDate) {
      return false;
    }
    final l$allowMultipleSubmissions = allowMultipleSubmissions;
    final lOther$allowMultipleSubmissions = other.allowMultipleSubmissions;
    if (l$allowMultipleSubmissions != lOther$allowMultipleSubmissions) {
      return false;
    }
    final l$defaultLanguage = defaultLanguage;
    final lOther$defaultLanguage = other.defaultLanguage;
    if (l$defaultLanguage != lOther$defaultLanguage) {
      return false;
    }
    final l$availableLanguages = availableLanguages;
    final lOther$availableLanguages = other.availableLanguages;
    if (l$availableLanguages != null && lOther$availableLanguages != null) {
      if (l$availableLanguages.length != lOther$availableLanguages.length) {
        return false;
      }
      for (int i = 0; i < l$availableLanguages.length; i++) {
        final l$availableLanguages$entry = l$availableLanguages[i];
        final lOther$availableLanguages$entry = lOther$availableLanguages[i];
        if (l$availableLanguages$entry != lOther$availableLanguages$entry) {
          return false;
        }
      }
    } else if (l$availableLanguages != lOther$availableLanguages) {
      return false;
    }
    final l$hasSubmitted = hasSubmitted;
    final lOther$hasSubmitted = other.hasSubmitted;
    if (l$hasSubmitted != lOther$hasSubmitted) {
      return false;
    }
    final l$updatedAt = updatedAt;
    final lOther$updatedAt = other.updatedAt;
    if (l$updatedAt != lOther$updatedAt) {
      return false;
    }
    final l$consentTranslations = consentTranslations;
    final lOther$consentTranslations = other.consentTranslations;
    if (l$consentTranslations != null && lOther$consentTranslations != null) {
      if (l$consentTranslations.length != lOther$consentTranslations.length) {
        return false;
      }
      for (int i = 0; i < l$consentTranslations.length; i++) {
        final l$consentTranslations$entry = l$consentTranslations[i];
        final lOther$consentTranslations$entry = lOther$consentTranslations[i];
        if (l$consentTranslations$entry != lOther$consentTranslations$entry) {
          return false;
        }
      }
    } else if (l$consentTranslations != lOther$consentTranslations) {
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

extension UtilityExtension$Query$SurveyBasic$survey
    on Query$SurveyBasic$survey {
  CopyWith$Query$SurveyBasic$survey<Query$SurveyBasic$survey> get copyWith =>
      CopyWith$Query$SurveyBasic$survey(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$SurveyBasic$survey<TRes> {
  factory CopyWith$Query$SurveyBasic$survey(
    Query$SurveyBasic$survey instance,
    TRes Function(Query$SurveyBasic$survey) then,
  ) = _CopyWithImpl$Query$SurveyBasic$survey;

  factory CopyWith$Query$SurveyBasic$survey.stub(TRes res) =
      _CopyWithStubImpl$Query$SurveyBasic$survey;

  TRes call({
    String? id,
    int? submissionCount,
    String? title,
    String? description,
    bool? isActive,
    Enum$SurveySurveyVisibilityChoices? visibility,
    String? consentText,
    String? endDate,
    bool? allowMultipleSubmissions,
    Enum$SurveySurveyDefaultLanguageChoices? defaultLanguage,
    List<String?>? availableLanguages,
    bool? hasSubmitted,
    DateTime? updatedAt,
    List<Query$SurveyBasic$survey$consentTranslations?>? consentTranslations,
    String? $__typename,
  });
  TRes consentTranslations(
      Iterable<Query$SurveyBasic$survey$consentTranslations?>? Function(
              Iterable<
                  CopyWith$Query$SurveyBasic$survey$consentTranslations<
                      Query$SurveyBasic$survey$consentTranslations>?>?)
          _fn);
}

class _CopyWithImpl$Query$SurveyBasic$survey<TRes>
    implements CopyWith$Query$SurveyBasic$survey<TRes> {
  _CopyWithImpl$Query$SurveyBasic$survey(
    this._instance,
    this._then,
  );

  final Query$SurveyBasic$survey _instance;

  final TRes Function(Query$SurveyBasic$survey) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? submissionCount = _undefined,
    Object? title = _undefined,
    Object? description = _undefined,
    Object? isActive = _undefined,
    Object? visibility = _undefined,
    Object? consentText = _undefined,
    Object? endDate = _undefined,
    Object? allowMultipleSubmissions = _undefined,
    Object? defaultLanguage = _undefined,
    Object? availableLanguages = _undefined,
    Object? hasSubmitted = _undefined,
    Object? updatedAt = _undefined,
    Object? consentTranslations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$SurveyBasic$survey(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        submissionCount: submissionCount == _undefined
            ? _instance.submissionCount
            : (submissionCount as int?),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        description: description == _undefined
            ? _instance.description
            : (description as String?),
        isActive: isActive == _undefined || isActive == null
            ? _instance.isActive
            : (isActive as bool),
        visibility: visibility == _undefined || visibility == null
            ? _instance.visibility
            : (visibility as Enum$SurveySurveyVisibilityChoices),
        consentText: consentText == _undefined
            ? _instance.consentText
            : (consentText as String?),
        endDate:
            endDate == _undefined ? _instance.endDate : (endDate as String?),
        allowMultipleSubmissions: allowMultipleSubmissions == _undefined ||
                allowMultipleSubmissions == null
            ? _instance.allowMultipleSubmissions
            : (allowMultipleSubmissions as bool),
        defaultLanguage:
            defaultLanguage == _undefined || defaultLanguage == null
                ? _instance.defaultLanguage
                : (defaultLanguage as Enum$SurveySurveyDefaultLanguageChoices),
        availableLanguages: availableLanguages == _undefined
            ? _instance.availableLanguages
            : (availableLanguages as List<String?>?),
        hasSubmitted: hasSubmitted == _undefined
            ? _instance.hasSubmitted
            : (hasSubmitted as bool?),
        updatedAt: updatedAt == _undefined || updatedAt == null
            ? _instance.updatedAt
            : (updatedAt as DateTime),
        consentTranslations: consentTranslations == _undefined
            ? _instance.consentTranslations
            : (consentTranslations
                as List<Query$SurveyBasic$survey$consentTranslations?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes consentTranslations(
          Iterable<Query$SurveyBasic$survey$consentTranslations?>? Function(
                  Iterable<
                      CopyWith$Query$SurveyBasic$survey$consentTranslations<
                          Query$SurveyBasic$survey$consentTranslations>?>?)
              _fn) =>
      call(
          consentTranslations:
              _fn(_instance.consentTranslations?.map((e) => e == null
                  ? null
                  : CopyWith$Query$SurveyBasic$survey$consentTranslations(
                      e,
                      (i) => i,
                    )))?.toList());
}

class _CopyWithStubImpl$Query$SurveyBasic$survey<TRes>
    implements CopyWith$Query$SurveyBasic$survey<TRes> {
  _CopyWithStubImpl$Query$SurveyBasic$survey(this._res);

  TRes _res;

  call({
    String? id,
    int? submissionCount,
    String? title,
    String? description,
    bool? isActive,
    Enum$SurveySurveyVisibilityChoices? visibility,
    String? consentText,
    String? endDate,
    bool? allowMultipleSubmissions,
    Enum$SurveySurveyDefaultLanguageChoices? defaultLanguage,
    List<String?>? availableLanguages,
    bool? hasSubmitted,
    DateTime? updatedAt,
    List<Query$SurveyBasic$survey$consentTranslations?>? consentTranslations,
    String? $__typename,
  }) =>
      _res;

  consentTranslations(_fn) => _res;
}

class Query$SurveyBasic$survey$consentTranslations {
  Query$SurveyBasic$survey$consentTranslations({
    required this.id,
    required this.language,
    required this.consentText,
    this.$__typename = 'SurveyConsentTranslationNode',
  });

  factory Query$SurveyBasic$survey$consentTranslations.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$language = json['language'];
    final l$consentText = json['consentText'];
    final l$$__typename = json['__typename'];
    return Query$SurveyBasic$survey$consentTranslations(
      id: (l$id as String),
      language: fromJson$Enum$SurveySurveyConsentTranslationLanguageChoices(
          (l$language as String)),
      consentText: (l$consentText as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Enum$SurveySurveyConsentTranslationLanguageChoices language;

  final String consentText;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$language = language;
    _resultData['language'] =
        toJson$Enum$SurveySurveyConsentTranslationLanguageChoices(l$language);
    final l$consentText = consentText;
    _resultData['consentText'] = l$consentText;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$language = language;
    final l$consentText = consentText;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$language,
      l$consentText,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$SurveyBasic$survey$consentTranslations ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$language = language;
    final lOther$language = other.language;
    if (l$language != lOther$language) {
      return false;
    }
    final l$consentText = consentText;
    final lOther$consentText = other.consentText;
    if (l$consentText != lOther$consentText) {
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

extension UtilityExtension$Query$SurveyBasic$survey$consentTranslations
    on Query$SurveyBasic$survey$consentTranslations {
  CopyWith$Query$SurveyBasic$survey$consentTranslations<
          Query$SurveyBasic$survey$consentTranslations>
      get copyWith => CopyWith$Query$SurveyBasic$survey$consentTranslations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$SurveyBasic$survey$consentTranslations<TRes> {
  factory CopyWith$Query$SurveyBasic$survey$consentTranslations(
    Query$SurveyBasic$survey$consentTranslations instance,
    TRes Function(Query$SurveyBasic$survey$consentTranslations) then,
  ) = _CopyWithImpl$Query$SurveyBasic$survey$consentTranslations;

  factory CopyWith$Query$SurveyBasic$survey$consentTranslations.stub(TRes res) =
      _CopyWithStubImpl$Query$SurveyBasic$survey$consentTranslations;

  TRes call({
    String? id,
    Enum$SurveySurveyConsentTranslationLanguageChoices? language,
    String? consentText,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$SurveyBasic$survey$consentTranslations<TRes>
    implements CopyWith$Query$SurveyBasic$survey$consentTranslations<TRes> {
  _CopyWithImpl$Query$SurveyBasic$survey$consentTranslations(
    this._instance,
    this._then,
  );

  final Query$SurveyBasic$survey$consentTranslations _instance;

  final TRes Function(Query$SurveyBasic$survey$consentTranslations) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? language = _undefined,
    Object? consentText = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$SurveyBasic$survey$consentTranslations(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        language: language == _undefined || language == null
            ? _instance.language
            : (language as Enum$SurveySurveyConsentTranslationLanguageChoices),
        consentText: consentText == _undefined || consentText == null
            ? _instance.consentText
            : (consentText as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$SurveyBasic$survey$consentTranslations<TRes>
    implements CopyWith$Query$SurveyBasic$survey$consentTranslations<TRes> {
  _CopyWithStubImpl$Query$SurveyBasic$survey$consentTranslations(this._res);

  TRes _res;

  call({
    String? id,
    Enum$SurveySurveyConsentTranslationLanguageChoices? language,
    String? consentText,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$Survey {
  factory Variables$Query$Survey({
    required String id,
    String? language,
  }) =>
      Variables$Query$Survey._({
        r'id': id,
        if (language != null) r'language': language,
      });

  Variables$Query$Survey._(this._$data);

  factory Variables$Query$Survey.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('language')) {
      final l$language = data['language'];
      result$data['language'] = (l$language as String?);
    }
    return Variables$Query$Survey._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String? get language => (_$data['language'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('language')) {
      final l$language = language;
      result$data['language'] = l$language;
    }
    return result$data;
  }

  CopyWith$Variables$Query$Survey<Variables$Query$Survey> get copyWith =>
      CopyWith$Variables$Query$Survey(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$Survey || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$language = language;
    final lOther$language = other.language;
    if (_$data.containsKey('language') !=
        other._$data.containsKey('language')) {
      return false;
    }
    if (l$language != lOther$language) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$language = language;
    return Object.hashAll([
      l$id,
      _$data.containsKey('language') ? l$language : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$Survey<TRes> {
  factory CopyWith$Variables$Query$Survey(
    Variables$Query$Survey instance,
    TRes Function(Variables$Query$Survey) then,
  ) = _CopyWithImpl$Variables$Query$Survey;

  factory CopyWith$Variables$Query$Survey.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$Survey;

  TRes call({
    String? id,
    String? language,
  });
}

class _CopyWithImpl$Variables$Query$Survey<TRes>
    implements CopyWith$Variables$Query$Survey<TRes> {
  _CopyWithImpl$Variables$Query$Survey(
    this._instance,
    this._then,
  );

  final Variables$Query$Survey _instance;

  final TRes Function(Variables$Query$Survey) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? language = _undefined,
  }) =>
      _then(Variables$Query$Survey._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
        if (language != _undefined) 'language': (language as String?),
      }));
}

class _CopyWithStubImpl$Variables$Query$Survey<TRes>
    implements CopyWith$Variables$Query$Survey<TRes> {
  _CopyWithStubImpl$Variables$Query$Survey(this._res);

  TRes _res;

  call({
    String? id,
    String? language,
  }) =>
      _res;
}

class Query$Survey {
  Query$Survey({
    this.survey,
    this.$__typename = 'Query',
  });

  factory Query$Survey.fromJson(Map<String, dynamic> json) {
    final l$survey = json['survey'];
    final l$$__typename = json['__typename'];
    return Query$Survey(
      survey: l$survey == null
          ? null
          : Query$Survey$survey.fromJson((l$survey as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$Survey$survey? survey;

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
    if (other is! Query$Survey || runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$Survey on Query$Survey {
  CopyWith$Query$Survey<Query$Survey> get copyWith => CopyWith$Query$Survey(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$Survey<TRes> {
  factory CopyWith$Query$Survey(
    Query$Survey instance,
    TRes Function(Query$Survey) then,
  ) = _CopyWithImpl$Query$Survey;

  factory CopyWith$Query$Survey.stub(TRes res) = _CopyWithStubImpl$Query$Survey;

  TRes call({
    Query$Survey$survey? survey,
    String? $__typename,
  });
  CopyWith$Query$Survey$survey<TRes> get survey;
}

class _CopyWithImpl$Query$Survey<TRes> implements CopyWith$Query$Survey<TRes> {
  _CopyWithImpl$Query$Survey(
    this._instance,
    this._then,
  );

  final Query$Survey _instance;

  final TRes Function(Query$Survey) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? survey = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Survey(
        survey: survey == _undefined
            ? _instance.survey
            : (survey as Query$Survey$survey?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$Survey$survey<TRes> get survey {
    final local$survey = _instance.survey;
    return local$survey == null
        ? CopyWith$Query$Survey$survey.stub(_then(_instance))
        : CopyWith$Query$Survey$survey(local$survey, (e) => call(survey: e));
  }
}

class _CopyWithStubImpl$Query$Survey<TRes>
    implements CopyWith$Query$Survey<TRes> {
  _CopyWithStubImpl$Query$Survey(this._res);

  TRes _res;

  call({
    Query$Survey$survey? survey,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$Survey$survey<TRes> get survey =>
      CopyWith$Query$Survey$survey.stub(_res);
}

const documentNodeQuerySurvey = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'Survey'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'language')),
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
        name: NameNode(value: 'survey'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'id')),
          ),
          ArgumentNode(
            name: NameNode(value: 'language'),
            value: VariableNode(name: NameNode(value: 'language')),
          ),
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
            name: NameNode(value: 'submissionCount'),
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
            name: NameNode(value: 'consentText'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'displayMode'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'endDate'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'allowMultipleSubmissions'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'defaultLanguage'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'availableLanguages'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'hasSubmitted'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'updatedAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'consentTranslations'),
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
                name: NameNode(value: 'language'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'consentText'),
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
            name: NameNode(value: 'pages'),
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
                        name: NameNode(value: 'description'),
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
                                  FragmentSpreadNode(
                                    name: NameNode(value: 'QuestionFetch'),
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
  fragmentDefinitionQuestionFetch,
]);
Query$Survey _parserFn$Query$Survey(Map<String, dynamic> data) =>
    Query$Survey.fromJson(data);
typedef OnQueryComplete$Query$Survey = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$Survey?,
);

class Options$Query$Survey extends graphql.QueryOptions<Query$Survey> {
  Options$Query$Survey({
    String? operationName,
    required Variables$Query$Survey variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$Survey? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$Survey? onComplete,
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
                    data == null ? null : _parserFn$Query$Survey(data),
                  ),
          onError: onError,
          document: documentNodeQuerySurvey,
          parserFn: _parserFn$Query$Survey,
        );

  final OnQueryComplete$Query$Survey? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$Survey
    extends graphql.WatchQueryOptions<Query$Survey> {
  WatchOptions$Query$Survey({
    String? operationName,
    required Variables$Query$Survey variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$Survey? typedOptimisticResult,
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
          document: documentNodeQuerySurvey,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$Survey,
        );
}

class FetchMoreOptions$Query$Survey extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$Survey({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$Survey variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerySurvey,
        );
}

extension ClientExtension$Query$Survey on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$Survey>> query$Survey(
          Options$Query$Survey options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$Survey> watchQuery$Survey(
          WatchOptions$Query$Survey options) =>
      this.watchQuery(options);
  void writeQuery$Survey({
    required Query$Survey data,
    required Variables$Query$Survey variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQuerySurvey),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$Survey? readQuery$Survey({
    required Variables$Query$Survey variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQuerySurvey),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$Survey.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$Survey> useQuery$Survey(
        Options$Query$Survey options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$Survey> useWatchQuery$Survey(
        WatchOptions$Query$Survey options) =>
    graphql_flutter.useWatchQuery(options);

class Query$Survey$Widget extends graphql_flutter.Query<Query$Survey> {
  Query$Survey$Widget({
    widgets.Key? key,
    required Options$Query$Survey options,
    required graphql_flutter.QueryBuilder<Query$Survey> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$Survey$survey {
  Query$Survey$survey({
    required this.id,
    this.submissionCount,
    required this.title,
    this.description,
    required this.isActive,
    required this.visibility,
    this.consentText,
    required this.displayMode,
    this.endDate,
    required this.allowMultipleSubmissions,
    required this.defaultLanguage,
    this.availableLanguages,
    this.hasSubmitted,
    required this.updatedAt,
    this.consentTranslations,
    required this.pages,
    this.$__typename = 'SurveyNode',
  });

  factory Query$Survey$survey.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$submissionCount = json['submissionCount'];
    final l$title = json['title'];
    final l$description = json['description'];
    final l$isActive = json['isActive'];
    final l$visibility = json['visibility'];
    final l$consentText = json['consentText'];
    final l$displayMode = json['displayMode'];
    final l$endDate = json['endDate'];
    final l$allowMultipleSubmissions = json['allowMultipleSubmissions'];
    final l$defaultLanguage = json['defaultLanguage'];
    final l$availableLanguages = json['availableLanguages'];
    final l$hasSubmitted = json['hasSubmitted'];
    final l$updatedAt = json['updatedAt'];
    final l$consentTranslations = json['consentTranslations'];
    final l$pages = json['pages'];
    final l$$__typename = json['__typename'];
    return Query$Survey$survey(
      id: (l$id as String),
      submissionCount: (l$submissionCount as int?),
      title: (l$title as String),
      description: (l$description as String?),
      isActive: (l$isActive as bool),
      visibility:
          fromJson$Enum$SurveySurveyVisibilityChoices((l$visibility as String)),
      consentText: (l$consentText as String?),
      displayMode: fromJson$Enum$SurveySurveyDisplayModeChoices(
          (l$displayMode as String)),
      endDate: (l$endDate as String?),
      allowMultipleSubmissions: (l$allowMultipleSubmissions as bool),
      defaultLanguage: fromJson$Enum$SurveySurveyDefaultLanguageChoices(
          (l$defaultLanguage as String)),
      availableLanguages: (l$availableLanguages as List<dynamic>?)
          ?.map((e) => (e as String?))
          .toList(),
      hasSubmitted: (l$hasSubmitted as bool?),
      updatedAt: DateTime.parse((l$updatedAt as String)),
      consentTranslations: (l$consentTranslations as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Query$Survey$survey$consentTranslations.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      pages:
          Query$Survey$survey$pages.fromJson((l$pages as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final int? submissionCount;

  final String title;

  final String? description;

  final bool isActive;

  final Enum$SurveySurveyVisibilityChoices visibility;

  final String? consentText;

  final Enum$SurveySurveyDisplayModeChoices displayMode;

  final String? endDate;

  final bool allowMultipleSubmissions;

  final Enum$SurveySurveyDefaultLanguageChoices defaultLanguage;

  final List<String?>? availableLanguages;

  final bool? hasSubmitted;

  final DateTime updatedAt;

  final List<Query$Survey$survey$consentTranslations?>? consentTranslations;

  final Query$Survey$survey$pages pages;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$submissionCount = submissionCount;
    _resultData['submissionCount'] = l$submissionCount;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$isActive = isActive;
    _resultData['isActive'] = l$isActive;
    final l$visibility = visibility;
    _resultData['visibility'] =
        toJson$Enum$SurveySurveyVisibilityChoices(l$visibility);
    final l$consentText = consentText;
    _resultData['consentText'] = l$consentText;
    final l$displayMode = displayMode;
    _resultData['displayMode'] =
        toJson$Enum$SurveySurveyDisplayModeChoices(l$displayMode);
    final l$endDate = endDate;
    _resultData['endDate'] = l$endDate;
    final l$allowMultipleSubmissions = allowMultipleSubmissions;
    _resultData['allowMultipleSubmissions'] = l$allowMultipleSubmissions;
    final l$defaultLanguage = defaultLanguage;
    _resultData['defaultLanguage'] =
        toJson$Enum$SurveySurveyDefaultLanguageChoices(l$defaultLanguage);
    final l$availableLanguages = availableLanguages;
    _resultData['availableLanguages'] =
        l$availableLanguages?.map((e) => e).toList();
    final l$hasSubmitted = hasSubmitted;
    _resultData['hasSubmitted'] = l$hasSubmitted;
    final l$updatedAt = updatedAt;
    _resultData['updatedAt'] = l$updatedAt.toIso8601String();
    final l$consentTranslations = consentTranslations;
    _resultData['consentTranslations'] =
        l$consentTranslations?.map((e) => e?.toJson()).toList();
    final l$pages = pages;
    _resultData['pages'] = l$pages.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$submissionCount = submissionCount;
    final l$title = title;
    final l$description = description;
    final l$isActive = isActive;
    final l$visibility = visibility;
    final l$consentText = consentText;
    final l$displayMode = displayMode;
    final l$endDate = endDate;
    final l$allowMultipleSubmissions = allowMultipleSubmissions;
    final l$defaultLanguage = defaultLanguage;
    final l$availableLanguages = availableLanguages;
    final l$hasSubmitted = hasSubmitted;
    final l$updatedAt = updatedAt;
    final l$consentTranslations = consentTranslations;
    final l$pages = pages;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$submissionCount,
      l$title,
      l$description,
      l$isActive,
      l$visibility,
      l$consentText,
      l$displayMode,
      l$endDate,
      l$allowMultipleSubmissions,
      l$defaultLanguage,
      l$availableLanguages == null
          ? null
          : Object.hashAll(l$availableLanguages.map((v) => v)),
      l$hasSubmitted,
      l$updatedAt,
      l$consentTranslations == null
          ? null
          : Object.hashAll(l$consentTranslations.map((v) => v)),
      l$pages,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Survey$survey || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$submissionCount = submissionCount;
    final lOther$submissionCount = other.submissionCount;
    if (l$submissionCount != lOther$submissionCount) {
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
    final l$consentText = consentText;
    final lOther$consentText = other.consentText;
    if (l$consentText != lOther$consentText) {
      return false;
    }
    final l$displayMode = displayMode;
    final lOther$displayMode = other.displayMode;
    if (l$displayMode != lOther$displayMode) {
      return false;
    }
    final l$endDate = endDate;
    final lOther$endDate = other.endDate;
    if (l$endDate != lOther$endDate) {
      return false;
    }
    final l$allowMultipleSubmissions = allowMultipleSubmissions;
    final lOther$allowMultipleSubmissions = other.allowMultipleSubmissions;
    if (l$allowMultipleSubmissions != lOther$allowMultipleSubmissions) {
      return false;
    }
    final l$defaultLanguage = defaultLanguage;
    final lOther$defaultLanguage = other.defaultLanguage;
    if (l$defaultLanguage != lOther$defaultLanguage) {
      return false;
    }
    final l$availableLanguages = availableLanguages;
    final lOther$availableLanguages = other.availableLanguages;
    if (l$availableLanguages != null && lOther$availableLanguages != null) {
      if (l$availableLanguages.length != lOther$availableLanguages.length) {
        return false;
      }
      for (int i = 0; i < l$availableLanguages.length; i++) {
        final l$availableLanguages$entry = l$availableLanguages[i];
        final lOther$availableLanguages$entry = lOther$availableLanguages[i];
        if (l$availableLanguages$entry != lOther$availableLanguages$entry) {
          return false;
        }
      }
    } else if (l$availableLanguages != lOther$availableLanguages) {
      return false;
    }
    final l$hasSubmitted = hasSubmitted;
    final lOther$hasSubmitted = other.hasSubmitted;
    if (l$hasSubmitted != lOther$hasSubmitted) {
      return false;
    }
    final l$updatedAt = updatedAt;
    final lOther$updatedAt = other.updatedAt;
    if (l$updatedAt != lOther$updatedAt) {
      return false;
    }
    final l$consentTranslations = consentTranslations;
    final lOther$consentTranslations = other.consentTranslations;
    if (l$consentTranslations != null && lOther$consentTranslations != null) {
      if (l$consentTranslations.length != lOther$consentTranslations.length) {
        return false;
      }
      for (int i = 0; i < l$consentTranslations.length; i++) {
        final l$consentTranslations$entry = l$consentTranslations[i];
        final lOther$consentTranslations$entry = lOther$consentTranslations[i];
        if (l$consentTranslations$entry != lOther$consentTranslations$entry) {
          return false;
        }
      }
    } else if (l$consentTranslations != lOther$consentTranslations) {
      return false;
    }
    final l$pages = pages;
    final lOther$pages = other.pages;
    if (l$pages != lOther$pages) {
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

extension UtilityExtension$Query$Survey$survey on Query$Survey$survey {
  CopyWith$Query$Survey$survey<Query$Survey$survey> get copyWith =>
      CopyWith$Query$Survey$survey(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$Survey$survey<TRes> {
  factory CopyWith$Query$Survey$survey(
    Query$Survey$survey instance,
    TRes Function(Query$Survey$survey) then,
  ) = _CopyWithImpl$Query$Survey$survey;

  factory CopyWith$Query$Survey$survey.stub(TRes res) =
      _CopyWithStubImpl$Query$Survey$survey;

  TRes call({
    String? id,
    int? submissionCount,
    String? title,
    String? description,
    bool? isActive,
    Enum$SurveySurveyVisibilityChoices? visibility,
    String? consentText,
    Enum$SurveySurveyDisplayModeChoices? displayMode,
    String? endDate,
    bool? allowMultipleSubmissions,
    Enum$SurveySurveyDefaultLanguageChoices? defaultLanguage,
    List<String?>? availableLanguages,
    bool? hasSubmitted,
    DateTime? updatedAt,
    List<Query$Survey$survey$consentTranslations?>? consentTranslations,
    Query$Survey$survey$pages? pages,
    String? $__typename,
  });
  TRes consentTranslations(
      Iterable<Query$Survey$survey$consentTranslations?>? Function(
              Iterable<
                  CopyWith$Query$Survey$survey$consentTranslations<
                      Query$Survey$survey$consentTranslations>?>?)
          _fn);
  CopyWith$Query$Survey$survey$pages<TRes> get pages;
}

class _CopyWithImpl$Query$Survey$survey<TRes>
    implements CopyWith$Query$Survey$survey<TRes> {
  _CopyWithImpl$Query$Survey$survey(
    this._instance,
    this._then,
  );

  final Query$Survey$survey _instance;

  final TRes Function(Query$Survey$survey) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? submissionCount = _undefined,
    Object? title = _undefined,
    Object? description = _undefined,
    Object? isActive = _undefined,
    Object? visibility = _undefined,
    Object? consentText = _undefined,
    Object? displayMode = _undefined,
    Object? endDate = _undefined,
    Object? allowMultipleSubmissions = _undefined,
    Object? defaultLanguage = _undefined,
    Object? availableLanguages = _undefined,
    Object? hasSubmitted = _undefined,
    Object? updatedAt = _undefined,
    Object? consentTranslations = _undefined,
    Object? pages = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Survey$survey(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        submissionCount: submissionCount == _undefined
            ? _instance.submissionCount
            : (submissionCount as int?),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        description: description == _undefined
            ? _instance.description
            : (description as String?),
        isActive: isActive == _undefined || isActive == null
            ? _instance.isActive
            : (isActive as bool),
        visibility: visibility == _undefined || visibility == null
            ? _instance.visibility
            : (visibility as Enum$SurveySurveyVisibilityChoices),
        consentText: consentText == _undefined
            ? _instance.consentText
            : (consentText as String?),
        displayMode: displayMode == _undefined || displayMode == null
            ? _instance.displayMode
            : (displayMode as Enum$SurveySurveyDisplayModeChoices),
        endDate:
            endDate == _undefined ? _instance.endDate : (endDate as String?),
        allowMultipleSubmissions: allowMultipleSubmissions == _undefined ||
                allowMultipleSubmissions == null
            ? _instance.allowMultipleSubmissions
            : (allowMultipleSubmissions as bool),
        defaultLanguage:
            defaultLanguage == _undefined || defaultLanguage == null
                ? _instance.defaultLanguage
                : (defaultLanguage as Enum$SurveySurveyDefaultLanguageChoices),
        availableLanguages: availableLanguages == _undefined
            ? _instance.availableLanguages
            : (availableLanguages as List<String?>?),
        hasSubmitted: hasSubmitted == _undefined
            ? _instance.hasSubmitted
            : (hasSubmitted as bool?),
        updatedAt: updatedAt == _undefined || updatedAt == null
            ? _instance.updatedAt
            : (updatedAt as DateTime),
        consentTranslations: consentTranslations == _undefined
            ? _instance.consentTranslations
            : (consentTranslations
                as List<Query$Survey$survey$consentTranslations?>?),
        pages: pages == _undefined || pages == null
            ? _instance.pages
            : (pages as Query$Survey$survey$pages),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes consentTranslations(
          Iterable<Query$Survey$survey$consentTranslations?>? Function(
                  Iterable<
                      CopyWith$Query$Survey$survey$consentTranslations<
                          Query$Survey$survey$consentTranslations>?>?)
              _fn) =>
      call(
          consentTranslations:
              _fn(_instance.consentTranslations?.map((e) => e == null
                  ? null
                  : CopyWith$Query$Survey$survey$consentTranslations(
                      e,
                      (i) => i,
                    )))?.toList());

  CopyWith$Query$Survey$survey$pages<TRes> get pages {
    final local$pages = _instance.pages;
    return CopyWith$Query$Survey$survey$pages(
        local$pages, (e) => call(pages: e));
  }
}

class _CopyWithStubImpl$Query$Survey$survey<TRes>
    implements CopyWith$Query$Survey$survey<TRes> {
  _CopyWithStubImpl$Query$Survey$survey(this._res);

  TRes _res;

  call({
    String? id,
    int? submissionCount,
    String? title,
    String? description,
    bool? isActive,
    Enum$SurveySurveyVisibilityChoices? visibility,
    String? consentText,
    Enum$SurveySurveyDisplayModeChoices? displayMode,
    String? endDate,
    bool? allowMultipleSubmissions,
    Enum$SurveySurveyDefaultLanguageChoices? defaultLanguage,
    List<String?>? availableLanguages,
    bool? hasSubmitted,
    DateTime? updatedAt,
    List<Query$Survey$survey$consentTranslations?>? consentTranslations,
    Query$Survey$survey$pages? pages,
    String? $__typename,
  }) =>
      _res;

  consentTranslations(_fn) => _res;

  CopyWith$Query$Survey$survey$pages<TRes> get pages =>
      CopyWith$Query$Survey$survey$pages.stub(_res);
}

class Query$Survey$survey$consentTranslations {
  Query$Survey$survey$consentTranslations({
    required this.id,
    required this.language,
    required this.consentText,
    this.$__typename = 'SurveyConsentTranslationNode',
  });

  factory Query$Survey$survey$consentTranslations.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$language = json['language'];
    final l$consentText = json['consentText'];
    final l$$__typename = json['__typename'];
    return Query$Survey$survey$consentTranslations(
      id: (l$id as String),
      language: fromJson$Enum$SurveySurveyConsentTranslationLanguageChoices(
          (l$language as String)),
      consentText: (l$consentText as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Enum$SurveySurveyConsentTranslationLanguageChoices language;

  final String consentText;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$language = language;
    _resultData['language'] =
        toJson$Enum$SurveySurveyConsentTranslationLanguageChoices(l$language);
    final l$consentText = consentText;
    _resultData['consentText'] = l$consentText;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$language = language;
    final l$consentText = consentText;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$language,
      l$consentText,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Survey$survey$consentTranslations ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$language = language;
    final lOther$language = other.language;
    if (l$language != lOther$language) {
      return false;
    }
    final l$consentText = consentText;
    final lOther$consentText = other.consentText;
    if (l$consentText != lOther$consentText) {
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

extension UtilityExtension$Query$Survey$survey$consentTranslations
    on Query$Survey$survey$consentTranslations {
  CopyWith$Query$Survey$survey$consentTranslations<
          Query$Survey$survey$consentTranslations>
      get copyWith => CopyWith$Query$Survey$survey$consentTranslations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$Survey$survey$consentTranslations<TRes> {
  factory CopyWith$Query$Survey$survey$consentTranslations(
    Query$Survey$survey$consentTranslations instance,
    TRes Function(Query$Survey$survey$consentTranslations) then,
  ) = _CopyWithImpl$Query$Survey$survey$consentTranslations;

  factory CopyWith$Query$Survey$survey$consentTranslations.stub(TRes res) =
      _CopyWithStubImpl$Query$Survey$survey$consentTranslations;

  TRes call({
    String? id,
    Enum$SurveySurveyConsentTranslationLanguageChoices? language,
    String? consentText,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$Survey$survey$consentTranslations<TRes>
    implements CopyWith$Query$Survey$survey$consentTranslations<TRes> {
  _CopyWithImpl$Query$Survey$survey$consentTranslations(
    this._instance,
    this._then,
  );

  final Query$Survey$survey$consentTranslations _instance;

  final TRes Function(Query$Survey$survey$consentTranslations) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? language = _undefined,
    Object? consentText = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Survey$survey$consentTranslations(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        language: language == _undefined || language == null
            ? _instance.language
            : (language as Enum$SurveySurveyConsentTranslationLanguageChoices),
        consentText: consentText == _undefined || consentText == null
            ? _instance.consentText
            : (consentText as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$Survey$survey$consentTranslations<TRes>
    implements CopyWith$Query$Survey$survey$consentTranslations<TRes> {
  _CopyWithStubImpl$Query$Survey$survey$consentTranslations(this._res);

  TRes _res;

  call({
    String? id,
    Enum$SurveySurveyConsentTranslationLanguageChoices? language,
    String? consentText,
    String? $__typename,
  }) =>
      _res;
}

class Query$Survey$survey$pages {
  Query$Survey$survey$pages({
    required this.edges,
    this.$__typename = 'SurveyPageNodeConnection',
  });

  factory Query$Survey$survey$pages.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Query$Survey$survey$pages(
      edges: (l$edges as List<dynamic>)
          .map((e) => e == null
              ? null
              : Query$Survey$survey$pages$edges.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$Survey$survey$pages$edges?> edges;

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
    if (other is! Query$Survey$survey$pages ||
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

extension UtilityExtension$Query$Survey$survey$pages
    on Query$Survey$survey$pages {
  CopyWith$Query$Survey$survey$pages<Query$Survey$survey$pages> get copyWith =>
      CopyWith$Query$Survey$survey$pages(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$Survey$survey$pages<TRes> {
  factory CopyWith$Query$Survey$survey$pages(
    Query$Survey$survey$pages instance,
    TRes Function(Query$Survey$survey$pages) then,
  ) = _CopyWithImpl$Query$Survey$survey$pages;

  factory CopyWith$Query$Survey$survey$pages.stub(TRes res) =
      _CopyWithStubImpl$Query$Survey$survey$pages;

  TRes call({
    List<Query$Survey$survey$pages$edges?>? edges,
    String? $__typename,
  });
  TRes edges(
      Iterable<Query$Survey$survey$pages$edges?> Function(
              Iterable<
                  CopyWith$Query$Survey$survey$pages$edges<
                      Query$Survey$survey$pages$edges>?>)
          _fn);
}

class _CopyWithImpl$Query$Survey$survey$pages<TRes>
    implements CopyWith$Query$Survey$survey$pages<TRes> {
  _CopyWithImpl$Query$Survey$survey$pages(
    this._instance,
    this._then,
  );

  final Query$Survey$survey$pages _instance;

  final TRes Function(Query$Survey$survey$pages) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Survey$survey$pages(
        edges: edges == _undefined || edges == null
            ? _instance.edges
            : (edges as List<Query$Survey$survey$pages$edges?>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes edges(
          Iterable<Query$Survey$survey$pages$edges?> Function(
                  Iterable<
                      CopyWith$Query$Survey$survey$pages$edges<
                          Query$Survey$survey$pages$edges>?>)
              _fn) =>
      call(
          edges: _fn(_instance.edges.map((e) => e == null
              ? null
              : CopyWith$Query$Survey$survey$pages$edges(
                  e,
                  (i) => i,
                ))).toList());
}

class _CopyWithStubImpl$Query$Survey$survey$pages<TRes>
    implements CopyWith$Query$Survey$survey$pages<TRes> {
  _CopyWithStubImpl$Query$Survey$survey$pages(this._res);

  TRes _res;

  call({
    List<Query$Survey$survey$pages$edges?>? edges,
    String? $__typename,
  }) =>
      _res;

  edges(_fn) => _res;
}

class Query$Survey$survey$pages$edges {
  Query$Survey$survey$pages$edges({
    this.node,
    this.$__typename = 'SurveyPageNodeEdge',
  });

  factory Query$Survey$survey$pages$edges.fromJson(Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$Survey$survey$pages$edges(
      node: l$node == null
          ? null
          : Query$Survey$survey$pages$edges$node.fromJson(
              (l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$Survey$survey$pages$edges$node? node;

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
    if (other is! Query$Survey$survey$pages$edges ||
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

extension UtilityExtension$Query$Survey$survey$pages$edges
    on Query$Survey$survey$pages$edges {
  CopyWith$Query$Survey$survey$pages$edges<Query$Survey$survey$pages$edges>
      get copyWith => CopyWith$Query$Survey$survey$pages$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$Survey$survey$pages$edges<TRes> {
  factory CopyWith$Query$Survey$survey$pages$edges(
    Query$Survey$survey$pages$edges instance,
    TRes Function(Query$Survey$survey$pages$edges) then,
  ) = _CopyWithImpl$Query$Survey$survey$pages$edges;

  factory CopyWith$Query$Survey$survey$pages$edges.stub(TRes res) =
      _CopyWithStubImpl$Query$Survey$survey$pages$edges;

  TRes call({
    Query$Survey$survey$pages$edges$node? node,
    String? $__typename,
  });
  CopyWith$Query$Survey$survey$pages$edges$node<TRes> get node;
}

class _CopyWithImpl$Query$Survey$survey$pages$edges<TRes>
    implements CopyWith$Query$Survey$survey$pages$edges<TRes> {
  _CopyWithImpl$Query$Survey$survey$pages$edges(
    this._instance,
    this._then,
  );

  final Query$Survey$survey$pages$edges _instance;

  final TRes Function(Query$Survey$survey$pages$edges) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Survey$survey$pages$edges(
        node: node == _undefined
            ? _instance.node
            : (node as Query$Survey$survey$pages$edges$node?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$Survey$survey$pages$edges$node<TRes> get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Query$Survey$survey$pages$edges$node.stub(_then(_instance))
        : CopyWith$Query$Survey$survey$pages$edges$node(
            local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Query$Survey$survey$pages$edges<TRes>
    implements CopyWith$Query$Survey$survey$pages$edges<TRes> {
  _CopyWithStubImpl$Query$Survey$survey$pages$edges(this._res);

  TRes _res;

  call({
    Query$Survey$survey$pages$edges$node? node,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$Survey$survey$pages$edges$node<TRes> get node =>
      CopyWith$Query$Survey$survey$pages$edges$node.stub(_res);
}

class Query$Survey$survey$pages$edges$node {
  Query$Survey$survey$pages$edges$node({
    required this.id,
    this.title,
    this.localizedTitle,
    this.description,
    required this.order,
    required this.questions,
    this.$__typename = 'SurveyPageNode',
  });

  factory Query$Survey$survey$pages$edges$node.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$localizedTitle = json['localizedTitle'];
    final l$description = json['description'];
    final l$order = json['order'];
    final l$questions = json['questions'];
    final l$$__typename = json['__typename'];
    return Query$Survey$survey$pages$edges$node(
      id: (l$id as String),
      title: (l$title as String?),
      localizedTitle: (l$localizedTitle as String?),
      description: (l$description as String?),
      order: (l$order as int),
      questions: Query$Survey$survey$pages$edges$node$questions.fromJson(
          (l$questions as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String? title;

  final String? localizedTitle;

  final String? description;

  final int order;

  final Query$Survey$survey$pages$edges$node$questions questions;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$localizedTitle = localizedTitle;
    _resultData['localizedTitle'] = l$localizedTitle;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$order = order;
    _resultData['order'] = l$order;
    final l$questions = questions;
    _resultData['questions'] = l$questions.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$localizedTitle = localizedTitle;
    final l$description = description;
    final l$order = order;
    final l$questions = questions;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$localizedTitle,
      l$description,
      l$order,
      l$questions,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Survey$survey$pages$edges$node ||
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
    final l$localizedTitle = localizedTitle;
    final lOther$localizedTitle = other.localizedTitle;
    if (l$localizedTitle != lOther$localizedTitle) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$order = order;
    final lOther$order = other.order;
    if (l$order != lOther$order) {
      return false;
    }
    final l$questions = questions;
    final lOther$questions = other.questions;
    if (l$questions != lOther$questions) {
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

extension UtilityExtension$Query$Survey$survey$pages$edges$node
    on Query$Survey$survey$pages$edges$node {
  CopyWith$Query$Survey$survey$pages$edges$node<
          Query$Survey$survey$pages$edges$node>
      get copyWith => CopyWith$Query$Survey$survey$pages$edges$node(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$Survey$survey$pages$edges$node<TRes> {
  factory CopyWith$Query$Survey$survey$pages$edges$node(
    Query$Survey$survey$pages$edges$node instance,
    TRes Function(Query$Survey$survey$pages$edges$node) then,
  ) = _CopyWithImpl$Query$Survey$survey$pages$edges$node;

  factory CopyWith$Query$Survey$survey$pages$edges$node.stub(TRes res) =
      _CopyWithStubImpl$Query$Survey$survey$pages$edges$node;

  TRes call({
    String? id,
    String? title,
    String? localizedTitle,
    String? description,
    int? order,
    Query$Survey$survey$pages$edges$node$questions? questions,
    String? $__typename,
  });
  CopyWith$Query$Survey$survey$pages$edges$node$questions<TRes> get questions;
}

class _CopyWithImpl$Query$Survey$survey$pages$edges$node<TRes>
    implements CopyWith$Query$Survey$survey$pages$edges$node<TRes> {
  _CopyWithImpl$Query$Survey$survey$pages$edges$node(
    this._instance,
    this._then,
  );

  final Query$Survey$survey$pages$edges$node _instance;

  final TRes Function(Query$Survey$survey$pages$edges$node) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? localizedTitle = _undefined,
    Object? description = _undefined,
    Object? order = _undefined,
    Object? questions = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Survey$survey$pages$edges$node(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined ? _instance.title : (title as String?),
        localizedTitle: localizedTitle == _undefined
            ? _instance.localizedTitle
            : (localizedTitle as String?),
        description: description == _undefined
            ? _instance.description
            : (description as String?),
        order: order == _undefined || order == null
            ? _instance.order
            : (order as int),
        questions: questions == _undefined || questions == null
            ? _instance.questions
            : (questions as Query$Survey$survey$pages$edges$node$questions),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$Survey$survey$pages$edges$node$questions<TRes> get questions {
    final local$questions = _instance.questions;
    return CopyWith$Query$Survey$survey$pages$edges$node$questions(
        local$questions, (e) => call(questions: e));
  }
}

class _CopyWithStubImpl$Query$Survey$survey$pages$edges$node<TRes>
    implements CopyWith$Query$Survey$survey$pages$edges$node<TRes> {
  _CopyWithStubImpl$Query$Survey$survey$pages$edges$node(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? localizedTitle,
    String? description,
    int? order,
    Query$Survey$survey$pages$edges$node$questions? questions,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$Survey$survey$pages$edges$node$questions<TRes> get questions =>
      CopyWith$Query$Survey$survey$pages$edges$node$questions.stub(_res);
}

class Query$Survey$survey$pages$edges$node$questions {
  Query$Survey$survey$pages$edges$node$questions({
    required this.edges,
    this.$__typename = 'QuestionNodeConnection',
  });

  factory Query$Survey$survey$pages$edges$node$questions.fromJson(
      Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Query$Survey$survey$pages$edges$node$questions(
      edges: (l$edges as List<dynamic>)
          .map((e) => e == null
              ? null
              : Query$Survey$survey$pages$edges$node$questions$edges.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$Survey$survey$pages$edges$node$questions$edges?> edges;

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
    if (other is! Query$Survey$survey$pages$edges$node$questions ||
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

extension UtilityExtension$Query$Survey$survey$pages$edges$node$questions
    on Query$Survey$survey$pages$edges$node$questions {
  CopyWith$Query$Survey$survey$pages$edges$node$questions<
          Query$Survey$survey$pages$edges$node$questions>
      get copyWith => CopyWith$Query$Survey$survey$pages$edges$node$questions(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$Survey$survey$pages$edges$node$questions<TRes> {
  factory CopyWith$Query$Survey$survey$pages$edges$node$questions(
    Query$Survey$survey$pages$edges$node$questions instance,
    TRes Function(Query$Survey$survey$pages$edges$node$questions) then,
  ) = _CopyWithImpl$Query$Survey$survey$pages$edges$node$questions;

  factory CopyWith$Query$Survey$survey$pages$edges$node$questions.stub(
          TRes res) =
      _CopyWithStubImpl$Query$Survey$survey$pages$edges$node$questions;

  TRes call({
    List<Query$Survey$survey$pages$edges$node$questions$edges?>? edges,
    String? $__typename,
  });
  TRes edges(
      Iterable<Query$Survey$survey$pages$edges$node$questions$edges?> Function(
              Iterable<
                  CopyWith$Query$Survey$survey$pages$edges$node$questions$edges<
                      Query$Survey$survey$pages$edges$node$questions$edges>?>)
          _fn);
}

class _CopyWithImpl$Query$Survey$survey$pages$edges$node$questions<TRes>
    implements CopyWith$Query$Survey$survey$pages$edges$node$questions<TRes> {
  _CopyWithImpl$Query$Survey$survey$pages$edges$node$questions(
    this._instance,
    this._then,
  );

  final Query$Survey$survey$pages$edges$node$questions _instance;

  final TRes Function(Query$Survey$survey$pages$edges$node$questions) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Survey$survey$pages$edges$node$questions(
        edges: edges == _undefined || edges == null
            ? _instance.edges
            : (edges
                as List<Query$Survey$survey$pages$edges$node$questions$edges?>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes edges(
          Iterable<Query$Survey$survey$pages$edges$node$questions$edges?> Function(
                  Iterable<
                      CopyWith$Query$Survey$survey$pages$edges$node$questions$edges<
                          Query$Survey$survey$pages$edges$node$questions$edges>?>)
              _fn) =>
      call(
          edges: _fn(_instance.edges.map((e) => e == null
              ? null
              : CopyWith$Query$Survey$survey$pages$edges$node$questions$edges(
                  e,
                  (i) => i,
                ))).toList());
}

class _CopyWithStubImpl$Query$Survey$survey$pages$edges$node$questions<TRes>
    implements CopyWith$Query$Survey$survey$pages$edges$node$questions<TRes> {
  _CopyWithStubImpl$Query$Survey$survey$pages$edges$node$questions(this._res);

  TRes _res;

  call({
    List<Query$Survey$survey$pages$edges$node$questions$edges?>? edges,
    String? $__typename,
  }) =>
      _res;

  edges(_fn) => _res;
}

class Query$Survey$survey$pages$edges$node$questions$edges {
  Query$Survey$survey$pages$edges$node$questions$edges({
    this.node,
    this.$__typename = 'QuestionNodeEdge',
  });

  factory Query$Survey$survey$pages$edges$node$questions$edges.fromJson(
      Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$Survey$survey$pages$edges$node$questions$edges(
      node: l$node == null
          ? null
          : Fragment$QuestionFetch.fromJson((l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$QuestionFetch? node;

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
    if (other is! Query$Survey$survey$pages$edges$node$questions$edges ||
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

extension UtilityExtension$Query$Survey$survey$pages$edges$node$questions$edges
    on Query$Survey$survey$pages$edges$node$questions$edges {
  CopyWith$Query$Survey$survey$pages$edges$node$questions$edges<
          Query$Survey$survey$pages$edges$node$questions$edges>
      get copyWith =>
          CopyWith$Query$Survey$survey$pages$edges$node$questions$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$Survey$survey$pages$edges$node$questions$edges<
    TRes> {
  factory CopyWith$Query$Survey$survey$pages$edges$node$questions$edges(
    Query$Survey$survey$pages$edges$node$questions$edges instance,
    TRes Function(Query$Survey$survey$pages$edges$node$questions$edges) then,
  ) = _CopyWithImpl$Query$Survey$survey$pages$edges$node$questions$edges;

  factory CopyWith$Query$Survey$survey$pages$edges$node$questions$edges.stub(
          TRes res) =
      _CopyWithStubImpl$Query$Survey$survey$pages$edges$node$questions$edges;

  TRes call({
    Fragment$QuestionFetch? node,
    String? $__typename,
  });
  CopyWith$Fragment$QuestionFetch<TRes> get node;
}

class _CopyWithImpl$Query$Survey$survey$pages$edges$node$questions$edges<TRes>
    implements
        CopyWith$Query$Survey$survey$pages$edges$node$questions$edges<TRes> {
  _CopyWithImpl$Query$Survey$survey$pages$edges$node$questions$edges(
    this._instance,
    this._then,
  );

  final Query$Survey$survey$pages$edges$node$questions$edges _instance;

  final TRes Function(Query$Survey$survey$pages$edges$node$questions$edges)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Survey$survey$pages$edges$node$questions$edges(
        node: node == _undefined
            ? _instance.node
            : (node as Fragment$QuestionFetch?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$QuestionFetch<TRes> get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Fragment$QuestionFetch.stub(_then(_instance))
        : CopyWith$Fragment$QuestionFetch(local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Query$Survey$survey$pages$edges$node$questions$edges<
        TRes>
    implements
        CopyWith$Query$Survey$survey$pages$edges$node$questions$edges<TRes> {
  _CopyWithStubImpl$Query$Survey$survey$pages$edges$node$questions$edges(
      this._res);

  TRes _res;

  call({
    Fragment$QuestionFetch? node,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$QuestionFetch<TRes> get node =>
      CopyWith$Fragment$QuestionFetch.stub(_res);
}

class Variables$Mutation$CreateSubmission {
  factory Variables$Mutation$CreateSubmission({
    required String surveyId,
    String? status,
    String? localId,
  }) =>
      Variables$Mutation$CreateSubmission._({
        r'surveyId': surveyId,
        if (status != null) r'status': status,
        if (localId != null) r'localId': localId,
      });

  Variables$Mutation$CreateSubmission._(this._$data);

  factory Variables$Mutation$CreateSubmission.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$surveyId = data['surveyId'];
    result$data['surveyId'] = (l$surveyId as String);
    if (data.containsKey('status')) {
      final l$status = data['status'];
      result$data['status'] = (l$status as String?);
    }
    if (data.containsKey('localId')) {
      final l$localId = data['localId'];
      result$data['localId'] = (l$localId as String?);
    }
    return Variables$Mutation$CreateSubmission._(result$data);
  }

  Map<String, dynamic> _$data;

  String get surveyId => (_$data['surveyId'] as String);

  String? get status => (_$data['status'] as String?);

  String? get localId => (_$data['localId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$surveyId = surveyId;
    result$data['surveyId'] = l$surveyId;
    if (_$data.containsKey('status')) {
      final l$status = status;
      result$data['status'] = l$status;
    }
    if (_$data.containsKey('localId')) {
      final l$localId = localId;
      result$data['localId'] = l$localId;
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$CreateSubmission<
          Variables$Mutation$CreateSubmission>
      get copyWith => CopyWith$Variables$Mutation$CreateSubmission(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$CreateSubmission ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$surveyId = surveyId;
    final lOther$surveyId = other.surveyId;
    if (l$surveyId != lOther$surveyId) {
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
    final l$localId = localId;
    final lOther$localId = other.localId;
    if (_$data.containsKey('localId') != other._$data.containsKey('localId')) {
      return false;
    }
    if (l$localId != lOther$localId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$surveyId = surveyId;
    final l$status = status;
    final l$localId = localId;
    return Object.hashAll([
      l$surveyId,
      _$data.containsKey('status') ? l$status : const {},
      _$data.containsKey('localId') ? l$localId : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$CreateSubmission<TRes> {
  factory CopyWith$Variables$Mutation$CreateSubmission(
    Variables$Mutation$CreateSubmission instance,
    TRes Function(Variables$Mutation$CreateSubmission) then,
  ) = _CopyWithImpl$Variables$Mutation$CreateSubmission;

  factory CopyWith$Variables$Mutation$CreateSubmission.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$CreateSubmission;

  TRes call({
    String? surveyId,
    String? status,
    String? localId,
  });
}

class _CopyWithImpl$Variables$Mutation$CreateSubmission<TRes>
    implements CopyWith$Variables$Mutation$CreateSubmission<TRes> {
  _CopyWithImpl$Variables$Mutation$CreateSubmission(
    this._instance,
    this._then,
  );

  final Variables$Mutation$CreateSubmission _instance;

  final TRes Function(Variables$Mutation$CreateSubmission) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? surveyId = _undefined,
    Object? status = _undefined,
    Object? localId = _undefined,
  }) =>
      _then(Variables$Mutation$CreateSubmission._({
        ..._instance._$data,
        if (surveyId != _undefined && surveyId != null)
          'surveyId': (surveyId as String),
        if (status != _undefined) 'status': (status as String?),
        if (localId != _undefined) 'localId': (localId as String?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$CreateSubmission<TRes>
    implements CopyWith$Variables$Mutation$CreateSubmission<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CreateSubmission(this._res);

  TRes _res;

  call({
    String? surveyId,
    String? status,
    String? localId,
  }) =>
      _res;
}

class Mutation$CreateSubmission {
  Mutation$CreateSubmission({
    this.createSubmission,
    this.$__typename = 'Mutation',
  });

  factory Mutation$CreateSubmission.fromJson(Map<String, dynamic> json) {
    final l$createSubmission = json['createSubmission'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateSubmission(
      createSubmission: l$createSubmission == null
          ? null
          : Mutation$CreateSubmission$createSubmission.fromJson(
              (l$createSubmission as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CreateSubmission$createSubmission? createSubmission;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$createSubmission = createSubmission;
    _resultData['createSubmission'] = l$createSubmission?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$createSubmission = createSubmission;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$createSubmission,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateSubmission ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$createSubmission = createSubmission;
    final lOther$createSubmission = other.createSubmission;
    if (l$createSubmission != lOther$createSubmission) {
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

extension UtilityExtension$Mutation$CreateSubmission
    on Mutation$CreateSubmission {
  CopyWith$Mutation$CreateSubmission<Mutation$CreateSubmission> get copyWith =>
      CopyWith$Mutation$CreateSubmission(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$CreateSubmission<TRes> {
  factory CopyWith$Mutation$CreateSubmission(
    Mutation$CreateSubmission instance,
    TRes Function(Mutation$CreateSubmission) then,
  ) = _CopyWithImpl$Mutation$CreateSubmission;

  factory CopyWith$Mutation$CreateSubmission.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateSubmission;

  TRes call({
    Mutation$CreateSubmission$createSubmission? createSubmission,
    String? $__typename,
  });
  CopyWith$Mutation$CreateSubmission$createSubmission<TRes>
      get createSubmission;
}

class _CopyWithImpl$Mutation$CreateSubmission<TRes>
    implements CopyWith$Mutation$CreateSubmission<TRes> {
  _CopyWithImpl$Mutation$CreateSubmission(
    this._instance,
    this._then,
  );

  final Mutation$CreateSubmission _instance;

  final TRes Function(Mutation$CreateSubmission) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? createSubmission = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$CreateSubmission(
        createSubmission: createSubmission == _undefined
            ? _instance.createSubmission
            : (createSubmission as Mutation$CreateSubmission$createSubmission?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$CreateSubmission$createSubmission<TRes>
      get createSubmission {
    final local$createSubmission = _instance.createSubmission;
    return local$createSubmission == null
        ? CopyWith$Mutation$CreateSubmission$createSubmission.stub(
            _then(_instance))
        : CopyWith$Mutation$CreateSubmission$createSubmission(
            local$createSubmission, (e) => call(createSubmission: e));
  }
}

class _CopyWithStubImpl$Mutation$CreateSubmission<TRes>
    implements CopyWith$Mutation$CreateSubmission<TRes> {
  _CopyWithStubImpl$Mutation$CreateSubmission(this._res);

  TRes _res;

  call({
    Mutation$CreateSubmission$createSubmission? createSubmission,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$CreateSubmission$createSubmission<TRes>
      get createSubmission =>
          CopyWith$Mutation$CreateSubmission$createSubmission.stub(_res);
}

const documentNodeMutationCreateSubmission = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'CreateSubmission'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'surveyId')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'status')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'localId')),
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
        name: NameNode(value: 'createSubmission'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'surveyId'),
            value: VariableNode(name: NameNode(value: 'surveyId')),
          ),
          ArgumentNode(
            name: NameNode(value: 'status'),
            value: VariableNode(name: NameNode(value: 'status')),
          ),
          ArgumentNode(
            name: NameNode(value: 'localId'),
            value: VariableNode(name: NameNode(value: 'localId')),
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
            name: NameNode(value: 'errors'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'submission'),
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
                name: NameNode(value: 'localId'),
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
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Mutation$CreateSubmission _parserFn$Mutation$CreateSubmission(
        Map<String, dynamic> data) =>
    Mutation$CreateSubmission.fromJson(data);
typedef OnMutationCompleted$Mutation$CreateSubmission = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$CreateSubmission?,
);

class Options$Mutation$CreateSubmission
    extends graphql.MutationOptions<Mutation$CreateSubmission> {
  Options$Mutation$CreateSubmission({
    String? operationName,
    required Variables$Mutation$CreateSubmission variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateSubmission? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateSubmission? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateSubmission>? update,
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
                        : _parserFn$Mutation$CreateSubmission(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationCreateSubmission,
          parserFn: _parserFn$Mutation$CreateSubmission,
        );

  final OnMutationCompleted$Mutation$CreateSubmission? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$CreateSubmission
    extends graphql.WatchQueryOptions<Mutation$CreateSubmission> {
  WatchOptions$Mutation$CreateSubmission({
    String? operationName,
    required Variables$Mutation$CreateSubmission variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateSubmission? typedOptimisticResult,
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
          document: documentNodeMutationCreateSubmission,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$CreateSubmission,
        );
}

extension ClientExtension$Mutation$CreateSubmission on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$CreateSubmission>>
      mutate$CreateSubmission(
              Options$Mutation$CreateSubmission options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$CreateSubmission>
      watchMutation$CreateSubmission(
              WatchOptions$Mutation$CreateSubmission options) =>
          this.watchMutation(options);
}

class Mutation$CreateSubmission$HookResult {
  Mutation$CreateSubmission$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$CreateSubmission runMutation;

  final graphql.QueryResult<Mutation$CreateSubmission> result;
}

Mutation$CreateSubmission$HookResult useMutation$CreateSubmission(
    [WidgetOptions$Mutation$CreateSubmission? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$CreateSubmission());
  return Mutation$CreateSubmission$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$CreateSubmission>
    useWatchMutation$CreateSubmission(
            WatchOptions$Mutation$CreateSubmission options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$CreateSubmission
    extends graphql.MutationOptions<Mutation$CreateSubmission> {
  WidgetOptions$Mutation$CreateSubmission({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateSubmission? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateSubmission? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateSubmission>? update,
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
                        : _parserFn$Mutation$CreateSubmission(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationCreateSubmission,
          parserFn: _parserFn$Mutation$CreateSubmission,
        );

  final OnMutationCompleted$Mutation$CreateSubmission? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$CreateSubmission
    = graphql.MultiSourceResult<Mutation$CreateSubmission> Function(
  Variables$Mutation$CreateSubmission, {
  Object? optimisticResult,
  Mutation$CreateSubmission? typedOptimisticResult,
});
typedef Builder$Mutation$CreateSubmission = widgets.Widget Function(
  RunMutation$Mutation$CreateSubmission,
  graphql.QueryResult<Mutation$CreateSubmission>?,
);

class Mutation$CreateSubmission$Widget
    extends graphql_flutter.Mutation<Mutation$CreateSubmission> {
  Mutation$CreateSubmission$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$CreateSubmission? options,
    required Builder$Mutation$CreateSubmission builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$CreateSubmission(),
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

class Mutation$CreateSubmission$createSubmission {
  Mutation$CreateSubmission$createSubmission({
    this.success,
    this.errors,
    this.submission,
    this.$__typename = 'CreateSubmissionMutation',
  });

  factory Mutation$CreateSubmission$createSubmission.fromJson(
      Map<String, dynamic> json) {
    final l$success = json['success'];
    final l$errors = json['errors'];
    final l$submission = json['submission'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateSubmission$createSubmission(
      success: (l$success as bool?),
      errors: (l$errors as List<dynamic>?)?.map((e) => (e as String?)).toList(),
      submission: l$submission == null
          ? null
          : Mutation$CreateSubmission$createSubmission$submission.fromJson(
              (l$submission as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? success;

  final List<String?>? errors;

  final Mutation$CreateSubmission$createSubmission$submission? submission;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$success = success;
    _resultData['success'] = l$success;
    final l$errors = errors;
    _resultData['errors'] = l$errors?.map((e) => e).toList();
    final l$submission = submission;
    _resultData['submission'] = l$submission?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$success = success;
    final l$errors = errors;
    final l$submission = submission;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$success,
      l$errors == null ? null : Object.hashAll(l$errors.map((v) => v)),
      l$submission,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateSubmission$createSubmission ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$success = success;
    final lOther$success = other.success;
    if (l$success != lOther$success) {
      return false;
    }
    final l$errors = errors;
    final lOther$errors = other.errors;
    if (l$errors != null && lOther$errors != null) {
      if (l$errors.length != lOther$errors.length) {
        return false;
      }
      for (int i = 0; i < l$errors.length; i++) {
        final l$errors$entry = l$errors[i];
        final lOther$errors$entry = lOther$errors[i];
        if (l$errors$entry != lOther$errors$entry) {
          return false;
        }
      }
    } else if (l$errors != lOther$errors) {
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

extension UtilityExtension$Mutation$CreateSubmission$createSubmission
    on Mutation$CreateSubmission$createSubmission {
  CopyWith$Mutation$CreateSubmission$createSubmission<
          Mutation$CreateSubmission$createSubmission>
      get copyWith => CopyWith$Mutation$CreateSubmission$createSubmission(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$CreateSubmission$createSubmission<TRes> {
  factory CopyWith$Mutation$CreateSubmission$createSubmission(
    Mutation$CreateSubmission$createSubmission instance,
    TRes Function(Mutation$CreateSubmission$createSubmission) then,
  ) = _CopyWithImpl$Mutation$CreateSubmission$createSubmission;

  factory CopyWith$Mutation$CreateSubmission$createSubmission.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateSubmission$createSubmission;

  TRes call({
    bool? success,
    List<String?>? errors,
    Mutation$CreateSubmission$createSubmission$submission? submission,
    String? $__typename,
  });
  CopyWith$Mutation$CreateSubmission$createSubmission$submission<TRes>
      get submission;
}

class _CopyWithImpl$Mutation$CreateSubmission$createSubmission<TRes>
    implements CopyWith$Mutation$CreateSubmission$createSubmission<TRes> {
  _CopyWithImpl$Mutation$CreateSubmission$createSubmission(
    this._instance,
    this._then,
  );

  final Mutation$CreateSubmission$createSubmission _instance;

  final TRes Function(Mutation$CreateSubmission$createSubmission) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? success = _undefined,
    Object? errors = _undefined,
    Object? submission = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$CreateSubmission$createSubmission(
        success: success == _undefined ? _instance.success : (success as bool?),
        errors: errors == _undefined
            ? _instance.errors
            : (errors as List<String?>?),
        submission: submission == _undefined
            ? _instance.submission
            : (submission
                as Mutation$CreateSubmission$createSubmission$submission?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$CreateSubmission$createSubmission$submission<TRes>
      get submission {
    final local$submission = _instance.submission;
    return local$submission == null
        ? CopyWith$Mutation$CreateSubmission$createSubmission$submission.stub(
            _then(_instance))
        : CopyWith$Mutation$CreateSubmission$createSubmission$submission(
            local$submission, (e) => call(submission: e));
  }
}

class _CopyWithStubImpl$Mutation$CreateSubmission$createSubmission<TRes>
    implements CopyWith$Mutation$CreateSubmission$createSubmission<TRes> {
  _CopyWithStubImpl$Mutation$CreateSubmission$createSubmission(this._res);

  TRes _res;

  call({
    bool? success,
    List<String?>? errors,
    Mutation$CreateSubmission$createSubmission$submission? submission,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$CreateSubmission$createSubmission$submission<TRes>
      get submission =>
          CopyWith$Mutation$CreateSubmission$createSubmission$submission.stub(
              _res);
}

class Mutation$CreateSubmission$createSubmission$submission {
  Mutation$CreateSubmission$createSubmission$submission({
    required this.id,
    this.localId,
    required this.status,
    required this.survey,
    this.$__typename = 'SubmissionNode',
  });

  factory Mutation$CreateSubmission$createSubmission$submission.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$localId = json['localId'];
    final l$status = json['status'];
    final l$survey = json['survey'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateSubmission$createSubmission$submission(
      id: (l$id as String),
      localId: (l$localId as String?),
      status: fromJson$Enum$SurveySubmissionStatusChoices((l$status as String)),
      survey:
          Mutation$CreateSubmission$createSubmission$submission$survey.fromJson(
              (l$survey as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String? localId;

  final Enum$SurveySubmissionStatusChoices status;

  final Mutation$CreateSubmission$createSubmission$submission$survey survey;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$localId = localId;
    _resultData['localId'] = l$localId;
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
    final l$localId = localId;
    final l$status = status;
    final l$survey = survey;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$localId,
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
    if (other is! Mutation$CreateSubmission$createSubmission$submission ||
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

extension UtilityExtension$Mutation$CreateSubmission$createSubmission$submission
    on Mutation$CreateSubmission$createSubmission$submission {
  CopyWith$Mutation$CreateSubmission$createSubmission$submission<
          Mutation$CreateSubmission$createSubmission$submission>
      get copyWith =>
          CopyWith$Mutation$CreateSubmission$createSubmission$submission(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$CreateSubmission$createSubmission$submission<
    TRes> {
  factory CopyWith$Mutation$CreateSubmission$createSubmission$submission(
    Mutation$CreateSubmission$createSubmission$submission instance,
    TRes Function(Mutation$CreateSubmission$createSubmission$submission) then,
  ) = _CopyWithImpl$Mutation$CreateSubmission$createSubmission$submission;

  factory CopyWith$Mutation$CreateSubmission$createSubmission$submission.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$CreateSubmission$createSubmission$submission;

  TRes call({
    String? id,
    String? localId,
    Enum$SurveySubmissionStatusChoices? status,
    Mutation$CreateSubmission$createSubmission$submission$survey? survey,
    String? $__typename,
  });
  CopyWith$Mutation$CreateSubmission$createSubmission$submission$survey<TRes>
      get survey;
}

class _CopyWithImpl$Mutation$CreateSubmission$createSubmission$submission<TRes>
    implements
        CopyWith$Mutation$CreateSubmission$createSubmission$submission<TRes> {
  _CopyWithImpl$Mutation$CreateSubmission$createSubmission$submission(
    this._instance,
    this._then,
  );

  final Mutation$CreateSubmission$createSubmission$submission _instance;

  final TRes Function(Mutation$CreateSubmission$createSubmission$submission)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? localId = _undefined,
    Object? status = _undefined,
    Object? survey = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$CreateSubmission$createSubmission$submission(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        localId:
            localId == _undefined ? _instance.localId : (localId as String?),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as Enum$SurveySubmissionStatusChoices),
        survey: survey == _undefined || survey == null
            ? _instance.survey
            : (survey
                as Mutation$CreateSubmission$createSubmission$submission$survey),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$CreateSubmission$createSubmission$submission$survey<TRes>
      get survey {
    final local$survey = _instance.survey;
    return CopyWith$Mutation$CreateSubmission$createSubmission$submission$survey(
        local$survey, (e) => call(survey: e));
  }
}

class _CopyWithStubImpl$Mutation$CreateSubmission$createSubmission$submission<
        TRes>
    implements
        CopyWith$Mutation$CreateSubmission$createSubmission$submission<TRes> {
  _CopyWithStubImpl$Mutation$CreateSubmission$createSubmission$submission(
      this._res);

  TRes _res;

  call({
    String? id,
    String? localId,
    Enum$SurveySubmissionStatusChoices? status,
    Mutation$CreateSubmission$createSubmission$submission$survey? survey,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$CreateSubmission$createSubmission$submission$survey<TRes>
      get survey =>
          CopyWith$Mutation$CreateSubmission$createSubmission$submission$survey
              .stub(_res);
}

class Mutation$CreateSubmission$createSubmission$submission$survey {
  Mutation$CreateSubmission$createSubmission$submission$survey({
    required this.id,
    required this.title,
    this.$__typename = 'SurveyNode',
  });

  factory Mutation$CreateSubmission$createSubmission$submission$survey.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateSubmission$createSubmission$submission$survey(
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
            is! Mutation$CreateSubmission$createSubmission$submission$survey ||
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

extension UtilityExtension$Mutation$CreateSubmission$createSubmission$submission$survey
    on Mutation$CreateSubmission$createSubmission$submission$survey {
  CopyWith$Mutation$CreateSubmission$createSubmission$submission$survey<
          Mutation$CreateSubmission$createSubmission$submission$survey>
      get copyWith =>
          CopyWith$Mutation$CreateSubmission$createSubmission$submission$survey(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$CreateSubmission$createSubmission$submission$survey<
    TRes> {
  factory CopyWith$Mutation$CreateSubmission$createSubmission$submission$survey(
    Mutation$CreateSubmission$createSubmission$submission$survey instance,
    TRes Function(Mutation$CreateSubmission$createSubmission$submission$survey)
        then,
  ) = _CopyWithImpl$Mutation$CreateSubmission$createSubmission$submission$survey;

  factory CopyWith$Mutation$CreateSubmission$createSubmission$submission$survey.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$CreateSubmission$createSubmission$submission$survey;

  TRes call({
    String? id,
    String? title,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$CreateSubmission$createSubmission$submission$survey<
        TRes>
    implements
        CopyWith$Mutation$CreateSubmission$createSubmission$submission$survey<
            TRes> {
  _CopyWithImpl$Mutation$CreateSubmission$createSubmission$submission$survey(
    this._instance,
    this._then,
  );

  final Mutation$CreateSubmission$createSubmission$submission$survey _instance;

  final TRes Function(
      Mutation$CreateSubmission$createSubmission$submission$survey) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$CreateSubmission$createSubmission$submission$survey(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$CreateSubmission$createSubmission$submission$survey<
        TRes>
    implements
        CopyWith$Mutation$CreateSubmission$createSubmission$submission$survey<
            TRes> {
  _CopyWithStubImpl$Mutation$CreateSubmission$createSubmission$submission$survey(
      this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$SaveAnswer {
  factory Variables$Mutation$SaveAnswer({
    required String submissionId,
    required String questionId,
    String? textAnswer,
    List<String?>? selectedOptionIds,
    String? otherText,
  }) =>
      Variables$Mutation$SaveAnswer._({
        r'submissionId': submissionId,
        r'questionId': questionId,
        if (textAnswer != null) r'textAnswer': textAnswer,
        if (selectedOptionIds != null) r'selectedOptionIds': selectedOptionIds,
        if (otherText != null) r'otherText': otherText,
      });

  Variables$Mutation$SaveAnswer._(this._$data);

  factory Variables$Mutation$SaveAnswer.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$submissionId = data['submissionId'];
    result$data['submissionId'] = (l$submissionId as String);
    final l$questionId = data['questionId'];
    result$data['questionId'] = (l$questionId as String);
    if (data.containsKey('textAnswer')) {
      final l$textAnswer = data['textAnswer'];
      result$data['textAnswer'] = (l$textAnswer as String?);
    }
    if (data.containsKey('selectedOptionIds')) {
      final l$selectedOptionIds = data['selectedOptionIds'];
      result$data['selectedOptionIds'] = (l$selectedOptionIds as List<dynamic>?)
          ?.map((e) => (e as String?))
          .toList();
    }
    if (data.containsKey('otherText')) {
      final l$otherText = data['otherText'];
      result$data['otherText'] = (l$otherText as String?);
    }
    return Variables$Mutation$SaveAnswer._(result$data);
  }

  Map<String, dynamic> _$data;

  String get submissionId => (_$data['submissionId'] as String);

  String get questionId => (_$data['questionId'] as String);

  String? get textAnswer => (_$data['textAnswer'] as String?);

  List<String?>? get selectedOptionIds =>
      (_$data['selectedOptionIds'] as List<String?>?);

  String? get otherText => (_$data['otherText'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$submissionId = submissionId;
    result$data['submissionId'] = l$submissionId;
    final l$questionId = questionId;
    result$data['questionId'] = l$questionId;
    if (_$data.containsKey('textAnswer')) {
      final l$textAnswer = textAnswer;
      result$data['textAnswer'] = l$textAnswer;
    }
    if (_$data.containsKey('selectedOptionIds')) {
      final l$selectedOptionIds = selectedOptionIds;
      result$data['selectedOptionIds'] =
          l$selectedOptionIds?.map((e) => e).toList();
    }
    if (_$data.containsKey('otherText')) {
      final l$otherText = otherText;
      result$data['otherText'] = l$otherText;
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$SaveAnswer<Variables$Mutation$SaveAnswer>
      get copyWith => CopyWith$Variables$Mutation$SaveAnswer(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$SaveAnswer ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$submissionId = submissionId;
    final lOther$submissionId = other.submissionId;
    if (l$submissionId != lOther$submissionId) {
      return false;
    }
    final l$questionId = questionId;
    final lOther$questionId = other.questionId;
    if (l$questionId != lOther$questionId) {
      return false;
    }
    final l$textAnswer = textAnswer;
    final lOther$textAnswer = other.textAnswer;
    if (_$data.containsKey('textAnswer') !=
        other._$data.containsKey('textAnswer')) {
      return false;
    }
    if (l$textAnswer != lOther$textAnswer) {
      return false;
    }
    final l$selectedOptionIds = selectedOptionIds;
    final lOther$selectedOptionIds = other.selectedOptionIds;
    if (_$data.containsKey('selectedOptionIds') !=
        other._$data.containsKey('selectedOptionIds')) {
      return false;
    }
    if (l$selectedOptionIds != null && lOther$selectedOptionIds != null) {
      if (l$selectedOptionIds.length != lOther$selectedOptionIds.length) {
        return false;
      }
      for (int i = 0; i < l$selectedOptionIds.length; i++) {
        final l$selectedOptionIds$entry = l$selectedOptionIds[i];
        final lOther$selectedOptionIds$entry = lOther$selectedOptionIds[i];
        if (l$selectedOptionIds$entry != lOther$selectedOptionIds$entry) {
          return false;
        }
      }
    } else if (l$selectedOptionIds != lOther$selectedOptionIds) {
      return false;
    }
    final l$otherText = otherText;
    final lOther$otherText = other.otherText;
    if (_$data.containsKey('otherText') !=
        other._$data.containsKey('otherText')) {
      return false;
    }
    if (l$otherText != lOther$otherText) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$submissionId = submissionId;
    final l$questionId = questionId;
    final l$textAnswer = textAnswer;
    final l$selectedOptionIds = selectedOptionIds;
    final l$otherText = otherText;
    return Object.hashAll([
      l$submissionId,
      l$questionId,
      _$data.containsKey('textAnswer') ? l$textAnswer : const {},
      _$data.containsKey('selectedOptionIds')
          ? l$selectedOptionIds == null
              ? null
              : Object.hashAll(l$selectedOptionIds.map((v) => v))
          : const {},
      _$data.containsKey('otherText') ? l$otherText : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$SaveAnswer<TRes> {
  factory CopyWith$Variables$Mutation$SaveAnswer(
    Variables$Mutation$SaveAnswer instance,
    TRes Function(Variables$Mutation$SaveAnswer) then,
  ) = _CopyWithImpl$Variables$Mutation$SaveAnswer;

  factory CopyWith$Variables$Mutation$SaveAnswer.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$SaveAnswer;

  TRes call({
    String? submissionId,
    String? questionId,
    String? textAnswer,
    List<String?>? selectedOptionIds,
    String? otherText,
  });
}

class _CopyWithImpl$Variables$Mutation$SaveAnswer<TRes>
    implements CopyWith$Variables$Mutation$SaveAnswer<TRes> {
  _CopyWithImpl$Variables$Mutation$SaveAnswer(
    this._instance,
    this._then,
  );

  final Variables$Mutation$SaveAnswer _instance;

  final TRes Function(Variables$Mutation$SaveAnswer) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? submissionId = _undefined,
    Object? questionId = _undefined,
    Object? textAnswer = _undefined,
    Object? selectedOptionIds = _undefined,
    Object? otherText = _undefined,
  }) =>
      _then(Variables$Mutation$SaveAnswer._({
        ..._instance._$data,
        if (submissionId != _undefined && submissionId != null)
          'submissionId': (submissionId as String),
        if (questionId != _undefined && questionId != null)
          'questionId': (questionId as String),
        if (textAnswer != _undefined) 'textAnswer': (textAnswer as String?),
        if (selectedOptionIds != _undefined)
          'selectedOptionIds': (selectedOptionIds as List<String?>?),
        if (otherText != _undefined) 'otherText': (otherText as String?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$SaveAnswer<TRes>
    implements CopyWith$Variables$Mutation$SaveAnswer<TRes> {
  _CopyWithStubImpl$Variables$Mutation$SaveAnswer(this._res);

  TRes _res;

  call({
    String? submissionId,
    String? questionId,
    String? textAnswer,
    List<String?>? selectedOptionIds,
    String? otherText,
  }) =>
      _res;
}

class Mutation$SaveAnswer {
  Mutation$SaveAnswer({
    this.saveAnswer,
    this.$__typename = 'Mutation',
  });

  factory Mutation$SaveAnswer.fromJson(Map<String, dynamic> json) {
    final l$saveAnswer = json['saveAnswer'];
    final l$$__typename = json['__typename'];
    return Mutation$SaveAnswer(
      saveAnswer: l$saveAnswer == null
          ? null
          : Mutation$SaveAnswer$saveAnswer.fromJson(
              (l$saveAnswer as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$SaveAnswer$saveAnswer? saveAnswer;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$saveAnswer = saveAnswer;
    _resultData['saveAnswer'] = l$saveAnswer?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$saveAnswer = saveAnswer;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$saveAnswer,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$SaveAnswer || runtimeType != other.runtimeType) {
      return false;
    }
    final l$saveAnswer = saveAnswer;
    final lOther$saveAnswer = other.saveAnswer;
    if (l$saveAnswer != lOther$saveAnswer) {
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

extension UtilityExtension$Mutation$SaveAnswer on Mutation$SaveAnswer {
  CopyWith$Mutation$SaveAnswer<Mutation$SaveAnswer> get copyWith =>
      CopyWith$Mutation$SaveAnswer(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$SaveAnswer<TRes> {
  factory CopyWith$Mutation$SaveAnswer(
    Mutation$SaveAnswer instance,
    TRes Function(Mutation$SaveAnswer) then,
  ) = _CopyWithImpl$Mutation$SaveAnswer;

  factory CopyWith$Mutation$SaveAnswer.stub(TRes res) =
      _CopyWithStubImpl$Mutation$SaveAnswer;

  TRes call({
    Mutation$SaveAnswer$saveAnswer? saveAnswer,
    String? $__typename,
  });
  CopyWith$Mutation$SaveAnswer$saveAnswer<TRes> get saveAnswer;
}

class _CopyWithImpl$Mutation$SaveAnswer<TRes>
    implements CopyWith$Mutation$SaveAnswer<TRes> {
  _CopyWithImpl$Mutation$SaveAnswer(
    this._instance,
    this._then,
  );

  final Mutation$SaveAnswer _instance;

  final TRes Function(Mutation$SaveAnswer) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? saveAnswer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$SaveAnswer(
        saveAnswer: saveAnswer == _undefined
            ? _instance.saveAnswer
            : (saveAnswer as Mutation$SaveAnswer$saveAnswer?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$SaveAnswer$saveAnswer<TRes> get saveAnswer {
    final local$saveAnswer = _instance.saveAnswer;
    return local$saveAnswer == null
        ? CopyWith$Mutation$SaveAnswer$saveAnswer.stub(_then(_instance))
        : CopyWith$Mutation$SaveAnswer$saveAnswer(
            local$saveAnswer, (e) => call(saveAnswer: e));
  }
}

class _CopyWithStubImpl$Mutation$SaveAnswer<TRes>
    implements CopyWith$Mutation$SaveAnswer<TRes> {
  _CopyWithStubImpl$Mutation$SaveAnswer(this._res);

  TRes _res;

  call({
    Mutation$SaveAnswer$saveAnswer? saveAnswer,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$SaveAnswer$saveAnswer<TRes> get saveAnswer =>
      CopyWith$Mutation$SaveAnswer$saveAnswer.stub(_res);
}

const documentNodeMutationSaveAnswer = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'SaveAnswer'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'submissionId')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'questionId')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'textAnswer')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'selectedOptionIds')),
        type: ListTypeNode(
          type: NamedTypeNode(
            name: NameNode(value: 'ID'),
            isNonNull: false,
          ),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'otherText')),
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
        name: NameNode(value: 'saveAnswer'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'submissionId'),
            value: VariableNode(name: NameNode(value: 'submissionId')),
          ),
          ArgumentNode(
            name: NameNode(value: 'questionId'),
            value: VariableNode(name: NameNode(value: 'questionId')),
          ),
          ArgumentNode(
            name: NameNode(value: 'textAnswer'),
            value: VariableNode(name: NameNode(value: 'textAnswer')),
          ),
          ArgumentNode(
            name: NameNode(value: 'selectedOptionIds'),
            value: VariableNode(name: NameNode(value: 'selectedOptionIds')),
          ),
          ArgumentNode(
            name: NameNode(value: 'otherText'),
            value: VariableNode(name: NameNode(value: 'otherText')),
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
            name: NameNode(value: 'errors'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'answer'),
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
]);
Mutation$SaveAnswer _parserFn$Mutation$SaveAnswer(Map<String, dynamic> data) =>
    Mutation$SaveAnswer.fromJson(data);
typedef OnMutationCompleted$Mutation$SaveAnswer = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$SaveAnswer?,
);

class Options$Mutation$SaveAnswer
    extends graphql.MutationOptions<Mutation$SaveAnswer> {
  Options$Mutation$SaveAnswer({
    String? operationName,
    required Variables$Mutation$SaveAnswer variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SaveAnswer? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$SaveAnswer? onCompleted,
    graphql.OnMutationUpdate<Mutation$SaveAnswer>? update,
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
                    data == null ? null : _parserFn$Mutation$SaveAnswer(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationSaveAnswer,
          parserFn: _parserFn$Mutation$SaveAnswer,
        );

  final OnMutationCompleted$Mutation$SaveAnswer? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$SaveAnswer
    extends graphql.WatchQueryOptions<Mutation$SaveAnswer> {
  WatchOptions$Mutation$SaveAnswer({
    String? operationName,
    required Variables$Mutation$SaveAnswer variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SaveAnswer? typedOptimisticResult,
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
          document: documentNodeMutationSaveAnswer,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$SaveAnswer,
        );
}

extension ClientExtension$Mutation$SaveAnswer on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$SaveAnswer>> mutate$SaveAnswer(
          Options$Mutation$SaveAnswer options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$SaveAnswer> watchMutation$SaveAnswer(
          WatchOptions$Mutation$SaveAnswer options) =>
      this.watchMutation(options);
}

class Mutation$SaveAnswer$HookResult {
  Mutation$SaveAnswer$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$SaveAnswer runMutation;

  final graphql.QueryResult<Mutation$SaveAnswer> result;
}

Mutation$SaveAnswer$HookResult useMutation$SaveAnswer(
    [WidgetOptions$Mutation$SaveAnswer? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$SaveAnswer());
  return Mutation$SaveAnswer$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$SaveAnswer> useWatchMutation$SaveAnswer(
        WatchOptions$Mutation$SaveAnswer options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$SaveAnswer
    extends graphql.MutationOptions<Mutation$SaveAnswer> {
  WidgetOptions$Mutation$SaveAnswer({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SaveAnswer? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$SaveAnswer? onCompleted,
    graphql.OnMutationUpdate<Mutation$SaveAnswer>? update,
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
                    data == null ? null : _parserFn$Mutation$SaveAnswer(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationSaveAnswer,
          parserFn: _parserFn$Mutation$SaveAnswer,
        );

  final OnMutationCompleted$Mutation$SaveAnswer? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$SaveAnswer
    = graphql.MultiSourceResult<Mutation$SaveAnswer> Function(
  Variables$Mutation$SaveAnswer, {
  Object? optimisticResult,
  Mutation$SaveAnswer? typedOptimisticResult,
});
typedef Builder$Mutation$SaveAnswer = widgets.Widget Function(
  RunMutation$Mutation$SaveAnswer,
  graphql.QueryResult<Mutation$SaveAnswer>?,
);

class Mutation$SaveAnswer$Widget
    extends graphql_flutter.Mutation<Mutation$SaveAnswer> {
  Mutation$SaveAnswer$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$SaveAnswer? options,
    required Builder$Mutation$SaveAnswer builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$SaveAnswer(),
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

class Mutation$SaveAnswer$saveAnswer {
  Mutation$SaveAnswer$saveAnswer({
    this.success,
    this.errors,
    this.answer,
    this.$__typename = 'SaveAnswerMutation',
  });

  factory Mutation$SaveAnswer$saveAnswer.fromJson(Map<String, dynamic> json) {
    final l$success = json['success'];
    final l$errors = json['errors'];
    final l$answer = json['answer'];
    final l$$__typename = json['__typename'];
    return Mutation$SaveAnswer$saveAnswer(
      success: (l$success as bool?),
      errors: (l$errors as List<dynamic>?)?.map((e) => (e as String?)).toList(),
      answer: l$answer == null
          ? null
          : Mutation$SaveAnswer$saveAnswer$answer.fromJson(
              (l$answer as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? success;

  final List<String?>? errors;

  final Mutation$SaveAnswer$saveAnswer$answer? answer;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$success = success;
    _resultData['success'] = l$success;
    final l$errors = errors;
    _resultData['errors'] = l$errors?.map((e) => e).toList();
    final l$answer = answer;
    _resultData['answer'] = l$answer?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$success = success;
    final l$errors = errors;
    final l$answer = answer;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$success,
      l$errors == null ? null : Object.hashAll(l$errors.map((v) => v)),
      l$answer,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$SaveAnswer$saveAnswer ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$success = success;
    final lOther$success = other.success;
    if (l$success != lOther$success) {
      return false;
    }
    final l$errors = errors;
    final lOther$errors = other.errors;
    if (l$errors != null && lOther$errors != null) {
      if (l$errors.length != lOther$errors.length) {
        return false;
      }
      for (int i = 0; i < l$errors.length; i++) {
        final l$errors$entry = l$errors[i];
        final lOther$errors$entry = lOther$errors[i];
        if (l$errors$entry != lOther$errors$entry) {
          return false;
        }
      }
    } else if (l$errors != lOther$errors) {
      return false;
    }
    final l$answer = answer;
    final lOther$answer = other.answer;
    if (l$answer != lOther$answer) {
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

extension UtilityExtension$Mutation$SaveAnswer$saveAnswer
    on Mutation$SaveAnswer$saveAnswer {
  CopyWith$Mutation$SaveAnswer$saveAnswer<Mutation$SaveAnswer$saveAnswer>
      get copyWith => CopyWith$Mutation$SaveAnswer$saveAnswer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$SaveAnswer$saveAnswer<TRes> {
  factory CopyWith$Mutation$SaveAnswer$saveAnswer(
    Mutation$SaveAnswer$saveAnswer instance,
    TRes Function(Mutation$SaveAnswer$saveAnswer) then,
  ) = _CopyWithImpl$Mutation$SaveAnswer$saveAnswer;

  factory CopyWith$Mutation$SaveAnswer$saveAnswer.stub(TRes res) =
      _CopyWithStubImpl$Mutation$SaveAnswer$saveAnswer;

  TRes call({
    bool? success,
    List<String?>? errors,
    Mutation$SaveAnswer$saveAnswer$answer? answer,
    String? $__typename,
  });
  CopyWith$Mutation$SaveAnswer$saveAnswer$answer<TRes> get answer;
}

class _CopyWithImpl$Mutation$SaveAnswer$saveAnswer<TRes>
    implements CopyWith$Mutation$SaveAnswer$saveAnswer<TRes> {
  _CopyWithImpl$Mutation$SaveAnswer$saveAnswer(
    this._instance,
    this._then,
  );

  final Mutation$SaveAnswer$saveAnswer _instance;

  final TRes Function(Mutation$SaveAnswer$saveAnswer) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? success = _undefined,
    Object? errors = _undefined,
    Object? answer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$SaveAnswer$saveAnswer(
        success: success == _undefined ? _instance.success : (success as bool?),
        errors: errors == _undefined
            ? _instance.errors
            : (errors as List<String?>?),
        answer: answer == _undefined
            ? _instance.answer
            : (answer as Mutation$SaveAnswer$saveAnswer$answer?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$SaveAnswer$saveAnswer$answer<TRes> get answer {
    final local$answer = _instance.answer;
    return local$answer == null
        ? CopyWith$Mutation$SaveAnswer$saveAnswer$answer.stub(_then(_instance))
        : CopyWith$Mutation$SaveAnswer$saveAnswer$answer(
            local$answer, (e) => call(answer: e));
  }
}

class _CopyWithStubImpl$Mutation$SaveAnswer$saveAnswer<TRes>
    implements CopyWith$Mutation$SaveAnswer$saveAnswer<TRes> {
  _CopyWithStubImpl$Mutation$SaveAnswer$saveAnswer(this._res);

  TRes _res;

  call({
    bool? success,
    List<String?>? errors,
    Mutation$SaveAnswer$saveAnswer$answer? answer,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$SaveAnswer$saveAnswer$answer<TRes> get answer =>
      CopyWith$Mutation$SaveAnswer$saveAnswer$answer.stub(_res);
}

class Mutation$SaveAnswer$saveAnswer$answer {
  Mutation$SaveAnswer$saveAnswer$answer({
    required this.id,
    required this.question,
    this.textAnswer,
    this.otherText,
    required this.selectedOptions,
    this.$__typename = 'SubmissionAnswerNode',
  });

  factory Mutation$SaveAnswer$saveAnswer$answer.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$question = json['question'];
    final l$textAnswer = json['textAnswer'];
    final l$otherText = json['otherText'];
    final l$selectedOptions = json['selectedOptions'];
    final l$$__typename = json['__typename'];
    return Mutation$SaveAnswer$saveAnswer$answer(
      id: (l$id as String),
      question: Mutation$SaveAnswer$saveAnswer$answer$question.fromJson(
          (l$question as Map<String, dynamic>)),
      textAnswer: (l$textAnswer as String?),
      otherText: (l$otherText as String?),
      selectedOptions:
          Mutation$SaveAnswer$saveAnswer$answer$selectedOptions.fromJson(
              (l$selectedOptions as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Mutation$SaveAnswer$saveAnswer$answer$question question;

  final String? textAnswer;

  final String? otherText;

  final Mutation$SaveAnswer$saveAnswer$answer$selectedOptions selectedOptions;

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
    if (other is! Mutation$SaveAnswer$saveAnswer$answer ||
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

extension UtilityExtension$Mutation$SaveAnswer$saveAnswer$answer
    on Mutation$SaveAnswer$saveAnswer$answer {
  CopyWith$Mutation$SaveAnswer$saveAnswer$answer<
          Mutation$SaveAnswer$saveAnswer$answer>
      get copyWith => CopyWith$Mutation$SaveAnswer$saveAnswer$answer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$SaveAnswer$saveAnswer$answer<TRes> {
  factory CopyWith$Mutation$SaveAnswer$saveAnswer$answer(
    Mutation$SaveAnswer$saveAnswer$answer instance,
    TRes Function(Mutation$SaveAnswer$saveAnswer$answer) then,
  ) = _CopyWithImpl$Mutation$SaveAnswer$saveAnswer$answer;

  factory CopyWith$Mutation$SaveAnswer$saveAnswer$answer.stub(TRes res) =
      _CopyWithStubImpl$Mutation$SaveAnswer$saveAnswer$answer;

  TRes call({
    String? id,
    Mutation$SaveAnswer$saveAnswer$answer$question? question,
    String? textAnswer,
    String? otherText,
    Mutation$SaveAnswer$saveAnswer$answer$selectedOptions? selectedOptions,
    String? $__typename,
  });
  CopyWith$Mutation$SaveAnswer$saveAnswer$answer$question<TRes> get question;
  CopyWith$Mutation$SaveAnswer$saveAnswer$answer$selectedOptions<TRes>
      get selectedOptions;
}

class _CopyWithImpl$Mutation$SaveAnswer$saveAnswer$answer<TRes>
    implements CopyWith$Mutation$SaveAnswer$saveAnswer$answer<TRes> {
  _CopyWithImpl$Mutation$SaveAnswer$saveAnswer$answer(
    this._instance,
    this._then,
  );

  final Mutation$SaveAnswer$saveAnswer$answer _instance;

  final TRes Function(Mutation$SaveAnswer$saveAnswer$answer) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? question = _undefined,
    Object? textAnswer = _undefined,
    Object? otherText = _undefined,
    Object? selectedOptions = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$SaveAnswer$saveAnswer$answer(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        question: question == _undefined || question == null
            ? _instance.question
            : (question as Mutation$SaveAnswer$saveAnswer$answer$question),
        textAnswer: textAnswer == _undefined
            ? _instance.textAnswer
            : (textAnswer as String?),
        otherText: otherText == _undefined
            ? _instance.otherText
            : (otherText as String?),
        selectedOptions:
            selectedOptions == _undefined || selectedOptions == null
                ? _instance.selectedOptions
                : (selectedOptions
                    as Mutation$SaveAnswer$saveAnswer$answer$selectedOptions),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$SaveAnswer$saveAnswer$answer$question<TRes> get question {
    final local$question = _instance.question;
    return CopyWith$Mutation$SaveAnswer$saveAnswer$answer$question(
        local$question, (e) => call(question: e));
  }

  CopyWith$Mutation$SaveAnswer$saveAnswer$answer$selectedOptions<TRes>
      get selectedOptions {
    final local$selectedOptions = _instance.selectedOptions;
    return CopyWith$Mutation$SaveAnswer$saveAnswer$answer$selectedOptions(
        local$selectedOptions, (e) => call(selectedOptions: e));
  }
}

class _CopyWithStubImpl$Mutation$SaveAnswer$saveAnswer$answer<TRes>
    implements CopyWith$Mutation$SaveAnswer$saveAnswer$answer<TRes> {
  _CopyWithStubImpl$Mutation$SaveAnswer$saveAnswer$answer(this._res);

  TRes _res;

  call({
    String? id,
    Mutation$SaveAnswer$saveAnswer$answer$question? question,
    String? textAnswer,
    String? otherText,
    Mutation$SaveAnswer$saveAnswer$answer$selectedOptions? selectedOptions,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$SaveAnswer$saveAnswer$answer$question<TRes> get question =>
      CopyWith$Mutation$SaveAnswer$saveAnswer$answer$question.stub(_res);

  CopyWith$Mutation$SaveAnswer$saveAnswer$answer$selectedOptions<TRes>
      get selectedOptions =>
          CopyWith$Mutation$SaveAnswer$saveAnswer$answer$selectedOptions.stub(
              _res);
}

class Mutation$SaveAnswer$saveAnswer$answer$question {
  Mutation$SaveAnswer$saveAnswer$answer$question({
    required this.id,
    required this.text,
    this.$__typename = 'QuestionNode',
  });

  factory Mutation$SaveAnswer$saveAnswer$answer$question.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$text = json['text'];
    final l$$__typename = json['__typename'];
    return Mutation$SaveAnswer$saveAnswer$answer$question(
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
    if (other is! Mutation$SaveAnswer$saveAnswer$answer$question ||
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

extension UtilityExtension$Mutation$SaveAnswer$saveAnswer$answer$question
    on Mutation$SaveAnswer$saveAnswer$answer$question {
  CopyWith$Mutation$SaveAnswer$saveAnswer$answer$question<
          Mutation$SaveAnswer$saveAnswer$answer$question>
      get copyWith => CopyWith$Mutation$SaveAnswer$saveAnswer$answer$question(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$SaveAnswer$saveAnswer$answer$question<TRes> {
  factory CopyWith$Mutation$SaveAnswer$saveAnswer$answer$question(
    Mutation$SaveAnswer$saveAnswer$answer$question instance,
    TRes Function(Mutation$SaveAnswer$saveAnswer$answer$question) then,
  ) = _CopyWithImpl$Mutation$SaveAnswer$saveAnswer$answer$question;

  factory CopyWith$Mutation$SaveAnswer$saveAnswer$answer$question.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$SaveAnswer$saveAnswer$answer$question;

  TRes call({
    String? id,
    String? text,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$SaveAnswer$saveAnswer$answer$question<TRes>
    implements CopyWith$Mutation$SaveAnswer$saveAnswer$answer$question<TRes> {
  _CopyWithImpl$Mutation$SaveAnswer$saveAnswer$answer$question(
    this._instance,
    this._then,
  );

  final Mutation$SaveAnswer$saveAnswer$answer$question _instance;

  final TRes Function(Mutation$SaveAnswer$saveAnswer$answer$question) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? text = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$SaveAnswer$saveAnswer$answer$question(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        text: text == _undefined || text == null
            ? _instance.text
            : (text as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$SaveAnswer$saveAnswer$answer$question<TRes>
    implements CopyWith$Mutation$SaveAnswer$saveAnswer$answer$question<TRes> {
  _CopyWithStubImpl$Mutation$SaveAnswer$saveAnswer$answer$question(this._res);

  TRes _res;

  call({
    String? id,
    String? text,
    String? $__typename,
  }) =>
      _res;
}

class Mutation$SaveAnswer$saveAnswer$answer$selectedOptions {
  Mutation$SaveAnswer$saveAnswer$answer$selectedOptions({
    required this.edges,
    this.$__typename = 'QuestionOptionNodeConnection',
  });

  factory Mutation$SaveAnswer$saveAnswer$answer$selectedOptions.fromJson(
      Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Mutation$SaveAnswer$saveAnswer$answer$selectedOptions(
      edges: (l$edges as List<dynamic>)
          .map((e) => e == null
              ? null
              : Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges?>
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
    if (other is! Mutation$SaveAnswer$saveAnswer$answer$selectedOptions ||
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

extension UtilityExtension$Mutation$SaveAnswer$saveAnswer$answer$selectedOptions
    on Mutation$SaveAnswer$saveAnswer$answer$selectedOptions {
  CopyWith$Mutation$SaveAnswer$saveAnswer$answer$selectedOptions<
          Mutation$SaveAnswer$saveAnswer$answer$selectedOptions>
      get copyWith =>
          CopyWith$Mutation$SaveAnswer$saveAnswer$answer$selectedOptions(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$SaveAnswer$saveAnswer$answer$selectedOptions<
    TRes> {
  factory CopyWith$Mutation$SaveAnswer$saveAnswer$answer$selectedOptions(
    Mutation$SaveAnswer$saveAnswer$answer$selectedOptions instance,
    TRes Function(Mutation$SaveAnswer$saveAnswer$answer$selectedOptions) then,
  ) = _CopyWithImpl$Mutation$SaveAnswer$saveAnswer$answer$selectedOptions;

  factory CopyWith$Mutation$SaveAnswer$saveAnswer$answer$selectedOptions.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$SaveAnswer$saveAnswer$answer$selectedOptions;

  TRes call({
    List<Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges?>? edges,
    String? $__typename,
  });
  TRes edges(
      Iterable<Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges?> Function(
              Iterable<
                  CopyWith$Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges<
                      Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges>?>)
          _fn);
}

class _CopyWithImpl$Mutation$SaveAnswer$saveAnswer$answer$selectedOptions<TRes>
    implements
        CopyWith$Mutation$SaveAnswer$saveAnswer$answer$selectedOptions<TRes> {
  _CopyWithImpl$Mutation$SaveAnswer$saveAnswer$answer$selectedOptions(
    this._instance,
    this._then,
  );

  final Mutation$SaveAnswer$saveAnswer$answer$selectedOptions _instance;

  final TRes Function(Mutation$SaveAnswer$saveAnswer$answer$selectedOptions)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$SaveAnswer$saveAnswer$answer$selectedOptions(
        edges: edges == _undefined || edges == null
            ? _instance.edges
            : (edges as List<
                Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges?>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes edges(
          Iterable<Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges?> Function(
                  Iterable<
                      CopyWith$Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges<
                          Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges>?>)
              _fn) =>
      call(
          edges: _fn(_instance.edges.map((e) => e == null
              ? null
              : CopyWith$Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges(
                  e,
                  (i) => i,
                ))).toList());
}

class _CopyWithStubImpl$Mutation$SaveAnswer$saveAnswer$answer$selectedOptions<
        TRes>
    implements
        CopyWith$Mutation$SaveAnswer$saveAnswer$answer$selectedOptions<TRes> {
  _CopyWithStubImpl$Mutation$SaveAnswer$saveAnswer$answer$selectedOptions(
      this._res);

  TRes _res;

  call({
    List<Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges?>? edges,
    String? $__typename,
  }) =>
      _res;

  edges(_fn) => _res;
}

class Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges {
  Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges({
    this.node,
    this.$__typename = 'QuestionOptionNodeEdge',
  });

  factory Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges.fromJson(
      Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges(
      node: l$node == null
          ? null
          : Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges$node
              .fromJson((l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges$node? node;

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
    if (other is! Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges ||
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

extension UtilityExtension$Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges
    on Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges {
  CopyWith$Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges<
          Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges>
      get copyWith =>
          CopyWith$Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges<
    TRes> {
  factory CopyWith$Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges(
    Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges instance,
    TRes Function(Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges)
        then,
  ) = _CopyWithImpl$Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges;

  factory CopyWith$Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges;

  TRes call({
    Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges$node? node,
    String? $__typename,
  });
  CopyWith$Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges$node<
      TRes> get node;
}

class _CopyWithImpl$Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges<
        TRes>
    implements
        CopyWith$Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges<
            TRes> {
  _CopyWithImpl$Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges(
    this._instance,
    this._then,
  );

  final Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges _instance;

  final TRes Function(
      Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges(
        node: node == _undefined
            ? _instance.node
            : (node
                as Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges$node?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges$node<
      TRes> get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges$node
            .stub(_then(_instance))
        : CopyWith$Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges$node(
            local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges<
        TRes>
    implements
        CopyWith$Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges<
            TRes> {
  _CopyWithStubImpl$Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges(
      this._res);

  TRes _res;

  call({
    Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges$node? node,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges$node<
          TRes>
      get node =>
          CopyWith$Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges$node
              .stub(_res);
}

class Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges$node {
  Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges$node({
    required this.id,
    required this.text,
    this.$__typename = 'QuestionOptionNode',
  });

  factory Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges$node.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$text = json['text'];
    final l$$__typename = json['__typename'];
    return Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges$node(
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
            is! Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges$node ||
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

extension UtilityExtension$Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges$node
    on Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges$node {
  CopyWith$Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges$node<
          Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges$node>
      get copyWith =>
          CopyWith$Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges$node(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges$node<
    TRes> {
  factory CopyWith$Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges$node(
    Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges$node instance,
    TRes Function(
            Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges$node)
        then,
  ) = _CopyWithImpl$Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges$node;

  factory CopyWith$Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges$node.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges$node;

  TRes call({
    String? id,
    String? text,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges$node<
        TRes>
    implements
        CopyWith$Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges$node<
            TRes> {
  _CopyWithImpl$Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges$node(
    this._instance,
    this._then,
  );

  final Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges$node
      _instance;

  final TRes Function(
      Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges$node) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? text = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges$node(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        text: text == _undefined || text == null
            ? _instance.text
            : (text as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges$node<
        TRes>
    implements
        CopyWith$Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges$node<
            TRes> {
  _CopyWithStubImpl$Mutation$SaveAnswer$saveAnswer$answer$selectedOptions$edges$node(
      this._res);

  TRes _res;

  call({
    String? id,
    String? text,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$SubmitSurvey {
  factory Variables$Mutation$SubmitSurvey({
    required String surveyId,
    required List<Input$AnswerInput> answers,
    String? language,
    String? submissionId,
    String? localId,
    String? appVersion,
  }) =>
      Variables$Mutation$SubmitSurvey._({
        r'surveyId': surveyId,
        r'answers': answers,
        if (language != null) r'language': language,
        if (submissionId != null) r'submissionId': submissionId,
        if (localId != null) r'localId': localId,
        if (appVersion != null) r'appVersion': appVersion,
      });

  Variables$Mutation$SubmitSurvey._(this._$data);

  factory Variables$Mutation$SubmitSurvey.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$surveyId = data['surveyId'];
    result$data['surveyId'] = (l$surveyId as String);
    final l$answers = data['answers'];
    result$data['answers'] = (l$answers as List<dynamic>)
        .map((e) => Input$AnswerInput.fromJson((e as Map<String, dynamic>)))
        .toList();
    if (data.containsKey('language')) {
      final l$language = data['language'];
      result$data['language'] = (l$language as String?);
    }
    if (data.containsKey('submissionId')) {
      final l$submissionId = data['submissionId'];
      result$data['submissionId'] = (l$submissionId as String?);
    }
    if (data.containsKey('localId')) {
      final l$localId = data['localId'];
      result$data['localId'] = (l$localId as String?);
    }
    if (data.containsKey('appVersion')) {
      final l$appVersion = data['appVersion'];
      result$data['appVersion'] = (l$appVersion as String?);
    }
    return Variables$Mutation$SubmitSurvey._(result$data);
  }

  Map<String, dynamic> _$data;

  String get surveyId => (_$data['surveyId'] as String);

  List<Input$AnswerInput> get answers =>
      (_$data['answers'] as List<Input$AnswerInput>);

  String? get language => (_$data['language'] as String?);

  String? get submissionId => (_$data['submissionId'] as String?);

  String? get localId => (_$data['localId'] as String?);

  String? get appVersion => (_$data['appVersion'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$surveyId = surveyId;
    result$data['surveyId'] = l$surveyId;
    final l$answers = answers;
    result$data['answers'] = l$answers.map((e) => e.toJson()).toList();
    if (_$data.containsKey('language')) {
      final l$language = language;
      result$data['language'] = l$language;
    }
    if (_$data.containsKey('submissionId')) {
      final l$submissionId = submissionId;
      result$data['submissionId'] = l$submissionId;
    }
    if (_$data.containsKey('localId')) {
      final l$localId = localId;
      result$data['localId'] = l$localId;
    }
    if (_$data.containsKey('appVersion')) {
      final l$appVersion = appVersion;
      result$data['appVersion'] = l$appVersion;
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$SubmitSurvey<Variables$Mutation$SubmitSurvey>
      get copyWith => CopyWith$Variables$Mutation$SubmitSurvey(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$SubmitSurvey ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$surveyId = surveyId;
    final lOther$surveyId = other.surveyId;
    if (l$surveyId != lOther$surveyId) {
      return false;
    }
    final l$answers = answers;
    final lOther$answers = other.answers;
    if (l$answers.length != lOther$answers.length) {
      return false;
    }
    for (int i = 0; i < l$answers.length; i++) {
      final l$answers$entry = l$answers[i];
      final lOther$answers$entry = lOther$answers[i];
      if (l$answers$entry != lOther$answers$entry) {
        return false;
      }
    }
    final l$language = language;
    final lOther$language = other.language;
    if (_$data.containsKey('language') !=
        other._$data.containsKey('language')) {
      return false;
    }
    if (l$language != lOther$language) {
      return false;
    }
    final l$submissionId = submissionId;
    final lOther$submissionId = other.submissionId;
    if (_$data.containsKey('submissionId') !=
        other._$data.containsKey('submissionId')) {
      return false;
    }
    if (l$submissionId != lOther$submissionId) {
      return false;
    }
    final l$localId = localId;
    final lOther$localId = other.localId;
    if (_$data.containsKey('localId') != other._$data.containsKey('localId')) {
      return false;
    }
    if (l$localId != lOther$localId) {
      return false;
    }
    final l$appVersion = appVersion;
    final lOther$appVersion = other.appVersion;
    if (_$data.containsKey('appVersion') !=
        other._$data.containsKey('appVersion')) {
      return false;
    }
    if (l$appVersion != lOther$appVersion) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$surveyId = surveyId;
    final l$answers = answers;
    final l$language = language;
    final l$submissionId = submissionId;
    final l$localId = localId;
    final l$appVersion = appVersion;
    return Object.hashAll([
      l$surveyId,
      Object.hashAll(l$answers.map((v) => v)),
      _$data.containsKey('language') ? l$language : const {},
      _$data.containsKey('submissionId') ? l$submissionId : const {},
      _$data.containsKey('localId') ? l$localId : const {},
      _$data.containsKey('appVersion') ? l$appVersion : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$SubmitSurvey<TRes> {
  factory CopyWith$Variables$Mutation$SubmitSurvey(
    Variables$Mutation$SubmitSurvey instance,
    TRes Function(Variables$Mutation$SubmitSurvey) then,
  ) = _CopyWithImpl$Variables$Mutation$SubmitSurvey;

  factory CopyWith$Variables$Mutation$SubmitSurvey.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$SubmitSurvey;

  TRes call({
    String? surveyId,
    List<Input$AnswerInput>? answers,
    String? language,
    String? submissionId,
    String? localId,
    String? appVersion,
  });
}

class _CopyWithImpl$Variables$Mutation$SubmitSurvey<TRes>
    implements CopyWith$Variables$Mutation$SubmitSurvey<TRes> {
  _CopyWithImpl$Variables$Mutation$SubmitSurvey(
    this._instance,
    this._then,
  );

  final Variables$Mutation$SubmitSurvey _instance;

  final TRes Function(Variables$Mutation$SubmitSurvey) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? surveyId = _undefined,
    Object? answers = _undefined,
    Object? language = _undefined,
    Object? submissionId = _undefined,
    Object? localId = _undefined,
    Object? appVersion = _undefined,
  }) =>
      _then(Variables$Mutation$SubmitSurvey._({
        ..._instance._$data,
        if (surveyId != _undefined && surveyId != null)
          'surveyId': (surveyId as String),
        if (answers != _undefined && answers != null)
          'answers': (answers as List<Input$AnswerInput>),
        if (language != _undefined) 'language': (language as String?),
        if (submissionId != _undefined)
          'submissionId': (submissionId as String?),
        if (localId != _undefined) 'localId': (localId as String?),
        if (appVersion != _undefined) 'appVersion': (appVersion as String?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$SubmitSurvey<TRes>
    implements CopyWith$Variables$Mutation$SubmitSurvey<TRes> {
  _CopyWithStubImpl$Variables$Mutation$SubmitSurvey(this._res);

  TRes _res;

  call({
    String? surveyId,
    List<Input$AnswerInput>? answers,
    String? language,
    String? submissionId,
    String? localId,
    String? appVersion,
  }) =>
      _res;
}

class Mutation$SubmitSurvey {
  Mutation$SubmitSurvey({
    this.submitSurvey,
    this.$__typename = 'Mutation',
  });

  factory Mutation$SubmitSurvey.fromJson(Map<String, dynamic> json) {
    final l$submitSurvey = json['submitSurvey'];
    final l$$__typename = json['__typename'];
    return Mutation$SubmitSurvey(
      submitSurvey: l$submitSurvey == null
          ? null
          : Mutation$SubmitSurvey$submitSurvey.fromJson(
              (l$submitSurvey as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$SubmitSurvey$submitSurvey? submitSurvey;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$submitSurvey = submitSurvey;
    _resultData['submitSurvey'] = l$submitSurvey?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$submitSurvey = submitSurvey;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$submitSurvey,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$SubmitSurvey || runtimeType != other.runtimeType) {
      return false;
    }
    final l$submitSurvey = submitSurvey;
    final lOther$submitSurvey = other.submitSurvey;
    if (l$submitSurvey != lOther$submitSurvey) {
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

extension UtilityExtension$Mutation$SubmitSurvey on Mutation$SubmitSurvey {
  CopyWith$Mutation$SubmitSurvey<Mutation$SubmitSurvey> get copyWith =>
      CopyWith$Mutation$SubmitSurvey(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$SubmitSurvey<TRes> {
  factory CopyWith$Mutation$SubmitSurvey(
    Mutation$SubmitSurvey instance,
    TRes Function(Mutation$SubmitSurvey) then,
  ) = _CopyWithImpl$Mutation$SubmitSurvey;

  factory CopyWith$Mutation$SubmitSurvey.stub(TRes res) =
      _CopyWithStubImpl$Mutation$SubmitSurvey;

  TRes call({
    Mutation$SubmitSurvey$submitSurvey? submitSurvey,
    String? $__typename,
  });
  CopyWith$Mutation$SubmitSurvey$submitSurvey<TRes> get submitSurvey;
}

class _CopyWithImpl$Mutation$SubmitSurvey<TRes>
    implements CopyWith$Mutation$SubmitSurvey<TRes> {
  _CopyWithImpl$Mutation$SubmitSurvey(
    this._instance,
    this._then,
  );

  final Mutation$SubmitSurvey _instance;

  final TRes Function(Mutation$SubmitSurvey) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? submitSurvey = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$SubmitSurvey(
        submitSurvey: submitSurvey == _undefined
            ? _instance.submitSurvey
            : (submitSurvey as Mutation$SubmitSurvey$submitSurvey?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$SubmitSurvey$submitSurvey<TRes> get submitSurvey {
    final local$submitSurvey = _instance.submitSurvey;
    return local$submitSurvey == null
        ? CopyWith$Mutation$SubmitSurvey$submitSurvey.stub(_then(_instance))
        : CopyWith$Mutation$SubmitSurvey$submitSurvey(
            local$submitSurvey, (e) => call(submitSurvey: e));
  }
}

class _CopyWithStubImpl$Mutation$SubmitSurvey<TRes>
    implements CopyWith$Mutation$SubmitSurvey<TRes> {
  _CopyWithStubImpl$Mutation$SubmitSurvey(this._res);

  TRes _res;

  call({
    Mutation$SubmitSurvey$submitSurvey? submitSurvey,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$SubmitSurvey$submitSurvey<TRes> get submitSurvey =>
      CopyWith$Mutation$SubmitSurvey$submitSurvey.stub(_res);
}

const documentNodeMutationSubmitSurvey = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'SubmitSurvey'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'surveyId')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'answers')),
        type: ListTypeNode(
          type: NamedTypeNode(
            name: NameNode(value: 'AnswerInput'),
            isNonNull: true,
          ),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'language')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'submissionId')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'localId')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'appVersion')),
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
        name: NameNode(value: 'submitSurvey'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'surveyId'),
            value: VariableNode(name: NameNode(value: 'surveyId')),
          ),
          ArgumentNode(
            name: NameNode(value: 'answers'),
            value: VariableNode(name: NameNode(value: 'answers')),
          ),
          ArgumentNode(
            name: NameNode(value: 'language'),
            value: VariableNode(name: NameNode(value: 'language')),
          ),
          ArgumentNode(
            name: NameNode(value: 'submissionId'),
            value: VariableNode(name: NameNode(value: 'submissionId')),
          ),
          ArgumentNode(
            name: NameNode(value: 'localId'),
            value: VariableNode(name: NameNode(value: 'localId')),
          ),
          ArgumentNode(
            name: NameNode(value: 'appVersion'),
            value: VariableNode(name: NameNode(value: 'appVersion')),
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
            name: NameNode(value: 'errors'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'submission'),
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
                name: NameNode(value: 'localId'),
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
Mutation$SubmitSurvey _parserFn$Mutation$SubmitSurvey(
        Map<String, dynamic> data) =>
    Mutation$SubmitSurvey.fromJson(data);
typedef OnMutationCompleted$Mutation$SubmitSurvey = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$SubmitSurvey?,
);

class Options$Mutation$SubmitSurvey
    extends graphql.MutationOptions<Mutation$SubmitSurvey> {
  Options$Mutation$SubmitSurvey({
    String? operationName,
    required Variables$Mutation$SubmitSurvey variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SubmitSurvey? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$SubmitSurvey? onCompleted,
    graphql.OnMutationUpdate<Mutation$SubmitSurvey>? update,
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
                    data == null ? null : _parserFn$Mutation$SubmitSurvey(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationSubmitSurvey,
          parserFn: _parserFn$Mutation$SubmitSurvey,
        );

  final OnMutationCompleted$Mutation$SubmitSurvey? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$SubmitSurvey
    extends graphql.WatchQueryOptions<Mutation$SubmitSurvey> {
  WatchOptions$Mutation$SubmitSurvey({
    String? operationName,
    required Variables$Mutation$SubmitSurvey variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SubmitSurvey? typedOptimisticResult,
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
          document: documentNodeMutationSubmitSurvey,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$SubmitSurvey,
        );
}

extension ClientExtension$Mutation$SubmitSurvey on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$SubmitSurvey>> mutate$SubmitSurvey(
          Options$Mutation$SubmitSurvey options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$SubmitSurvey> watchMutation$SubmitSurvey(
          WatchOptions$Mutation$SubmitSurvey options) =>
      this.watchMutation(options);
}

class Mutation$SubmitSurvey$HookResult {
  Mutation$SubmitSurvey$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$SubmitSurvey runMutation;

  final graphql.QueryResult<Mutation$SubmitSurvey> result;
}

Mutation$SubmitSurvey$HookResult useMutation$SubmitSurvey(
    [WidgetOptions$Mutation$SubmitSurvey? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$SubmitSurvey());
  return Mutation$SubmitSurvey$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$SubmitSurvey> useWatchMutation$SubmitSurvey(
        WatchOptions$Mutation$SubmitSurvey options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$SubmitSurvey
    extends graphql.MutationOptions<Mutation$SubmitSurvey> {
  WidgetOptions$Mutation$SubmitSurvey({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SubmitSurvey? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$SubmitSurvey? onCompleted,
    graphql.OnMutationUpdate<Mutation$SubmitSurvey>? update,
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
                    data == null ? null : _parserFn$Mutation$SubmitSurvey(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationSubmitSurvey,
          parserFn: _parserFn$Mutation$SubmitSurvey,
        );

  final OnMutationCompleted$Mutation$SubmitSurvey? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$SubmitSurvey
    = graphql.MultiSourceResult<Mutation$SubmitSurvey> Function(
  Variables$Mutation$SubmitSurvey, {
  Object? optimisticResult,
  Mutation$SubmitSurvey? typedOptimisticResult,
});
typedef Builder$Mutation$SubmitSurvey = widgets.Widget Function(
  RunMutation$Mutation$SubmitSurvey,
  graphql.QueryResult<Mutation$SubmitSurvey>?,
);

class Mutation$SubmitSurvey$Widget
    extends graphql_flutter.Mutation<Mutation$SubmitSurvey> {
  Mutation$SubmitSurvey$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$SubmitSurvey? options,
    required Builder$Mutation$SubmitSurvey builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$SubmitSurvey(),
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

class Mutation$SubmitSurvey$submitSurvey {
  Mutation$SubmitSurvey$submitSurvey({
    this.success,
    this.errors,
    this.submission,
    this.$__typename = 'SubmitSurveyMutation',
  });

  factory Mutation$SubmitSurvey$submitSurvey.fromJson(
      Map<String, dynamic> json) {
    final l$success = json['success'];
    final l$errors = json['errors'];
    final l$submission = json['submission'];
    final l$$__typename = json['__typename'];
    return Mutation$SubmitSurvey$submitSurvey(
      success: (l$success as bool?),
      errors: (l$errors as List<dynamic>?)?.map((e) => (e as String?)).toList(),
      submission: l$submission == null
          ? null
          : Mutation$SubmitSurvey$submitSurvey$submission.fromJson(
              (l$submission as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? success;

  final List<String?>? errors;

  final Mutation$SubmitSurvey$submitSurvey$submission? submission;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$success = success;
    _resultData['success'] = l$success;
    final l$errors = errors;
    _resultData['errors'] = l$errors?.map((e) => e).toList();
    final l$submission = submission;
    _resultData['submission'] = l$submission?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$success = success;
    final l$errors = errors;
    final l$submission = submission;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$success,
      l$errors == null ? null : Object.hashAll(l$errors.map((v) => v)),
      l$submission,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$SubmitSurvey$submitSurvey ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$success = success;
    final lOther$success = other.success;
    if (l$success != lOther$success) {
      return false;
    }
    final l$errors = errors;
    final lOther$errors = other.errors;
    if (l$errors != null && lOther$errors != null) {
      if (l$errors.length != lOther$errors.length) {
        return false;
      }
      for (int i = 0; i < l$errors.length; i++) {
        final l$errors$entry = l$errors[i];
        final lOther$errors$entry = lOther$errors[i];
        if (l$errors$entry != lOther$errors$entry) {
          return false;
        }
      }
    } else if (l$errors != lOther$errors) {
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

extension UtilityExtension$Mutation$SubmitSurvey$submitSurvey
    on Mutation$SubmitSurvey$submitSurvey {
  CopyWith$Mutation$SubmitSurvey$submitSurvey<
          Mutation$SubmitSurvey$submitSurvey>
      get copyWith => CopyWith$Mutation$SubmitSurvey$submitSurvey(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$SubmitSurvey$submitSurvey<TRes> {
  factory CopyWith$Mutation$SubmitSurvey$submitSurvey(
    Mutation$SubmitSurvey$submitSurvey instance,
    TRes Function(Mutation$SubmitSurvey$submitSurvey) then,
  ) = _CopyWithImpl$Mutation$SubmitSurvey$submitSurvey;

  factory CopyWith$Mutation$SubmitSurvey$submitSurvey.stub(TRes res) =
      _CopyWithStubImpl$Mutation$SubmitSurvey$submitSurvey;

  TRes call({
    bool? success,
    List<String?>? errors,
    Mutation$SubmitSurvey$submitSurvey$submission? submission,
    String? $__typename,
  });
  CopyWith$Mutation$SubmitSurvey$submitSurvey$submission<TRes> get submission;
}

class _CopyWithImpl$Mutation$SubmitSurvey$submitSurvey<TRes>
    implements CopyWith$Mutation$SubmitSurvey$submitSurvey<TRes> {
  _CopyWithImpl$Mutation$SubmitSurvey$submitSurvey(
    this._instance,
    this._then,
  );

  final Mutation$SubmitSurvey$submitSurvey _instance;

  final TRes Function(Mutation$SubmitSurvey$submitSurvey) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? success = _undefined,
    Object? errors = _undefined,
    Object? submission = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$SubmitSurvey$submitSurvey(
        success: success == _undefined ? _instance.success : (success as bool?),
        errors: errors == _undefined
            ? _instance.errors
            : (errors as List<String?>?),
        submission: submission == _undefined
            ? _instance.submission
            : (submission as Mutation$SubmitSurvey$submitSurvey$submission?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$SubmitSurvey$submitSurvey$submission<TRes> get submission {
    final local$submission = _instance.submission;
    return local$submission == null
        ? CopyWith$Mutation$SubmitSurvey$submitSurvey$submission.stub(
            _then(_instance))
        : CopyWith$Mutation$SubmitSurvey$submitSurvey$submission(
            local$submission, (e) => call(submission: e));
  }
}

class _CopyWithStubImpl$Mutation$SubmitSurvey$submitSurvey<TRes>
    implements CopyWith$Mutation$SubmitSurvey$submitSurvey<TRes> {
  _CopyWithStubImpl$Mutation$SubmitSurvey$submitSurvey(this._res);

  TRes _res;

  call({
    bool? success,
    List<String?>? errors,
    Mutation$SubmitSurvey$submitSurvey$submission? submission,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$SubmitSurvey$submitSurvey$submission<TRes> get submission =>
      CopyWith$Mutation$SubmitSurvey$submitSurvey$submission.stub(_res);
}

class Mutation$SubmitSurvey$submitSurvey$submission {
  Mutation$SubmitSurvey$submitSurvey$submission({
    required this.id,
    this.localId,
    required this.submittedAt,
    required this.survey,
    required this.answers,
    this.$__typename = 'SubmissionNode',
  });

  factory Mutation$SubmitSurvey$submitSurvey$submission.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$localId = json['localId'];
    final l$submittedAt = json['submittedAt'];
    final l$survey = json['survey'];
    final l$answers = json['answers'];
    final l$$__typename = json['__typename'];
    return Mutation$SubmitSurvey$submitSurvey$submission(
      id: (l$id as String),
      localId: (l$localId as String?),
      submittedAt: DateTime.parse((l$submittedAt as String)),
      survey: Mutation$SubmitSurvey$submitSurvey$submission$survey.fromJson(
          (l$survey as Map<String, dynamic>)),
      answers: Mutation$SubmitSurvey$submitSurvey$submission$answers.fromJson(
          (l$answers as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String? localId;

  final DateTime submittedAt;

  final Mutation$SubmitSurvey$submitSurvey$submission$survey survey;

  final Mutation$SubmitSurvey$submitSurvey$submission$answers answers;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$localId = localId;
    _resultData['localId'] = l$localId;
    final l$submittedAt = submittedAt;
    _resultData['submittedAt'] = l$submittedAt.toIso8601String();
    final l$survey = survey;
    _resultData['survey'] = l$survey.toJson();
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
    final l$submittedAt = submittedAt;
    final l$survey = survey;
    final l$answers = answers;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$localId,
      l$submittedAt,
      l$survey,
      l$answers,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$SubmitSurvey$submitSurvey$submission ||
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

extension UtilityExtension$Mutation$SubmitSurvey$submitSurvey$submission
    on Mutation$SubmitSurvey$submitSurvey$submission {
  CopyWith$Mutation$SubmitSurvey$submitSurvey$submission<
          Mutation$SubmitSurvey$submitSurvey$submission>
      get copyWith => CopyWith$Mutation$SubmitSurvey$submitSurvey$submission(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$SubmitSurvey$submitSurvey$submission<TRes> {
  factory CopyWith$Mutation$SubmitSurvey$submitSurvey$submission(
    Mutation$SubmitSurvey$submitSurvey$submission instance,
    TRes Function(Mutation$SubmitSurvey$submitSurvey$submission) then,
  ) = _CopyWithImpl$Mutation$SubmitSurvey$submitSurvey$submission;

  factory CopyWith$Mutation$SubmitSurvey$submitSurvey$submission.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$SubmitSurvey$submitSurvey$submission;

  TRes call({
    String? id,
    String? localId,
    DateTime? submittedAt,
    Mutation$SubmitSurvey$submitSurvey$submission$survey? survey,
    Mutation$SubmitSurvey$submitSurvey$submission$answers? answers,
    String? $__typename,
  });
  CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$survey<TRes>
      get survey;
  CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers<TRes>
      get answers;
}

class _CopyWithImpl$Mutation$SubmitSurvey$submitSurvey$submission<TRes>
    implements CopyWith$Mutation$SubmitSurvey$submitSurvey$submission<TRes> {
  _CopyWithImpl$Mutation$SubmitSurvey$submitSurvey$submission(
    this._instance,
    this._then,
  );

  final Mutation$SubmitSurvey$submitSurvey$submission _instance;

  final TRes Function(Mutation$SubmitSurvey$submitSurvey$submission) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? localId = _undefined,
    Object? submittedAt = _undefined,
    Object? survey = _undefined,
    Object? answers = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$SubmitSurvey$submitSurvey$submission(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        localId:
            localId == _undefined ? _instance.localId : (localId as String?),
        submittedAt: submittedAt == _undefined || submittedAt == null
            ? _instance.submittedAt
            : (submittedAt as DateTime),
        survey: survey == _undefined || survey == null
            ? _instance.survey
            : (survey as Mutation$SubmitSurvey$submitSurvey$submission$survey),
        answers: answers == _undefined || answers == null
            ? _instance.answers
            : (answers
                as Mutation$SubmitSurvey$submitSurvey$submission$answers),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$survey<TRes>
      get survey {
    final local$survey = _instance.survey;
    return CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$survey(
        local$survey, (e) => call(survey: e));
  }

  CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers<TRes>
      get answers {
    final local$answers = _instance.answers;
    return CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers(
        local$answers, (e) => call(answers: e));
  }
}

class _CopyWithStubImpl$Mutation$SubmitSurvey$submitSurvey$submission<TRes>
    implements CopyWith$Mutation$SubmitSurvey$submitSurvey$submission<TRes> {
  _CopyWithStubImpl$Mutation$SubmitSurvey$submitSurvey$submission(this._res);

  TRes _res;

  call({
    String? id,
    String? localId,
    DateTime? submittedAt,
    Mutation$SubmitSurvey$submitSurvey$submission$survey? survey,
    Mutation$SubmitSurvey$submitSurvey$submission$answers? answers,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$survey<TRes>
      get survey =>
          CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$survey.stub(
              _res);

  CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers<TRes>
      get answers =>
          CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers.stub(
              _res);
}

class Mutation$SubmitSurvey$submitSurvey$submission$survey {
  Mutation$SubmitSurvey$submitSurvey$submission$survey({
    required this.id,
    required this.title,
    this.$__typename = 'SurveyNode',
  });

  factory Mutation$SubmitSurvey$submitSurvey$submission$survey.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$$__typename = json['__typename'];
    return Mutation$SubmitSurvey$submitSurvey$submission$survey(
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
    if (other is! Mutation$SubmitSurvey$submitSurvey$submission$survey ||
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

extension UtilityExtension$Mutation$SubmitSurvey$submitSurvey$submission$survey
    on Mutation$SubmitSurvey$submitSurvey$submission$survey {
  CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$survey<
          Mutation$SubmitSurvey$submitSurvey$submission$survey>
      get copyWith =>
          CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$survey(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$survey<
    TRes> {
  factory CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$survey(
    Mutation$SubmitSurvey$submitSurvey$submission$survey instance,
    TRes Function(Mutation$SubmitSurvey$submitSurvey$submission$survey) then,
  ) = _CopyWithImpl$Mutation$SubmitSurvey$submitSurvey$submission$survey;

  factory CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$survey.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$SubmitSurvey$submitSurvey$submission$survey;

  TRes call({
    String? id,
    String? title,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$SubmitSurvey$submitSurvey$submission$survey<TRes>
    implements
        CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$survey<TRes> {
  _CopyWithImpl$Mutation$SubmitSurvey$submitSurvey$submission$survey(
    this._instance,
    this._then,
  );

  final Mutation$SubmitSurvey$submitSurvey$submission$survey _instance;

  final TRes Function(Mutation$SubmitSurvey$submitSurvey$submission$survey)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$SubmitSurvey$submitSurvey$submission$survey(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$SubmitSurvey$submitSurvey$submission$survey<
        TRes>
    implements
        CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$survey<TRes> {
  _CopyWithStubImpl$Mutation$SubmitSurvey$submitSurvey$submission$survey(
      this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? $__typename,
  }) =>
      _res;
}

class Mutation$SubmitSurvey$submitSurvey$submission$answers {
  Mutation$SubmitSurvey$submitSurvey$submission$answers({
    required this.edges,
    this.$__typename = 'SubmissionAnswerNodeConnection',
  });

  factory Mutation$SubmitSurvey$submitSurvey$submission$answers.fromJson(
      Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Mutation$SubmitSurvey$submitSurvey$submission$answers(
      edges: (l$edges as List<dynamic>)
          .map((e) => e == null
              ? null
              : Mutation$SubmitSurvey$submitSurvey$submission$answers$edges
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Mutation$SubmitSurvey$submitSurvey$submission$answers$edges?>
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
    if (other is! Mutation$SubmitSurvey$submitSurvey$submission$answers ||
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

extension UtilityExtension$Mutation$SubmitSurvey$submitSurvey$submission$answers
    on Mutation$SubmitSurvey$submitSurvey$submission$answers {
  CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers<
          Mutation$SubmitSurvey$submitSurvey$submission$answers>
      get copyWith =>
          CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers<
    TRes> {
  factory CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers(
    Mutation$SubmitSurvey$submitSurvey$submission$answers instance,
    TRes Function(Mutation$SubmitSurvey$submitSurvey$submission$answers) then,
  ) = _CopyWithImpl$Mutation$SubmitSurvey$submitSurvey$submission$answers;

  factory CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$SubmitSurvey$submitSurvey$submission$answers;

  TRes call({
    List<Mutation$SubmitSurvey$submitSurvey$submission$answers$edges?>? edges,
    String? $__typename,
  });
  TRes edges(
      Iterable<Mutation$SubmitSurvey$submitSurvey$submission$answers$edges?> Function(
              Iterable<
                  CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges<
                      Mutation$SubmitSurvey$submitSurvey$submission$answers$edges>?>)
          _fn);
}

class _CopyWithImpl$Mutation$SubmitSurvey$submitSurvey$submission$answers<TRes>
    implements
        CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers<TRes> {
  _CopyWithImpl$Mutation$SubmitSurvey$submitSurvey$submission$answers(
    this._instance,
    this._then,
  );

  final Mutation$SubmitSurvey$submitSurvey$submission$answers _instance;

  final TRes Function(Mutation$SubmitSurvey$submitSurvey$submission$answers)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$SubmitSurvey$submitSurvey$submission$answers(
        edges: edges == _undefined || edges == null
            ? _instance.edges
            : (edges as List<
                Mutation$SubmitSurvey$submitSurvey$submission$answers$edges?>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes edges(
          Iterable<Mutation$SubmitSurvey$submitSurvey$submission$answers$edges?> Function(
                  Iterable<
                      CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges<
                          Mutation$SubmitSurvey$submitSurvey$submission$answers$edges>?>)
              _fn) =>
      call(
          edges: _fn(_instance.edges.map((e) => e == null
              ? null
              : CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges(
                  e,
                  (i) => i,
                ))).toList());
}

class _CopyWithStubImpl$Mutation$SubmitSurvey$submitSurvey$submission$answers<
        TRes>
    implements
        CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers<TRes> {
  _CopyWithStubImpl$Mutation$SubmitSurvey$submitSurvey$submission$answers(
      this._res);

  TRes _res;

  call({
    List<Mutation$SubmitSurvey$submitSurvey$submission$answers$edges?>? edges,
    String? $__typename,
  }) =>
      _res;

  edges(_fn) => _res;
}

class Mutation$SubmitSurvey$submitSurvey$submission$answers$edges {
  Mutation$SubmitSurvey$submitSurvey$submission$answers$edges({
    this.node,
    this.$__typename = 'SubmissionAnswerNodeEdge',
  });

  factory Mutation$SubmitSurvey$submitSurvey$submission$answers$edges.fromJson(
      Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Mutation$SubmitSurvey$submitSurvey$submission$answers$edges(
      node: l$node == null
          ? null
          : Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node
              .fromJson((l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node? node;

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
    if (other is! Mutation$SubmitSurvey$submitSurvey$submission$answers$edges ||
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

extension UtilityExtension$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges
    on Mutation$SubmitSurvey$submitSurvey$submission$answers$edges {
  CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges<
          Mutation$SubmitSurvey$submitSurvey$submission$answers$edges>
      get copyWith =>
          CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges<
    TRes> {
  factory CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges(
    Mutation$SubmitSurvey$submitSurvey$submission$answers$edges instance,
    TRes Function(Mutation$SubmitSurvey$submitSurvey$submission$answers$edges)
        then,
  ) = _CopyWithImpl$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges;

  factory CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges;

  TRes call({
    Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node? node,
    String? $__typename,
  });
  CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node<
      TRes> get node;
}

class _CopyWithImpl$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges<
        TRes>
    implements
        CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges<
            TRes> {
  _CopyWithImpl$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges(
    this._instance,
    this._then,
  );

  final Mutation$SubmitSurvey$submitSurvey$submission$answers$edges _instance;

  final TRes Function(
      Mutation$SubmitSurvey$submitSurvey$submission$answers$edges) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$SubmitSurvey$submitSurvey$submission$answers$edges(
        node: node == _undefined
            ? _instance.node
            : (node
                as Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node<
      TRes> get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node
            .stub(_then(_instance))
        : CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node(
            local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges<
        TRes>
    implements
        CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges<
            TRes> {
  _CopyWithStubImpl$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges(
      this._res);

  TRes _res;

  call({
    Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node? node,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node<
          TRes>
      get node =>
          CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node
              .stub(_res);
}

class Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node {
  Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node({
    required this.id,
    required this.question,
    this.textAnswer,
    this.otherText,
    required this.selectedOptions,
    this.$__typename = 'SubmissionAnswerNode',
  });

  factory Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$question = json['question'];
    final l$textAnswer = json['textAnswer'];
    final l$otherText = json['otherText'];
    final l$selectedOptions = json['selectedOptions'];
    final l$$__typename = json['__typename'];
    return Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node(
      id: (l$id as String),
      question:
          Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$question
              .fromJson((l$question as Map<String, dynamic>)),
      textAnswer: (l$textAnswer as String?),
      otherText: (l$otherText as String?),
      selectedOptions:
          Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions
              .fromJson((l$selectedOptions as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$question
      question;

  final String? textAnswer;

  final String? otherText;

  final Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions
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
    if (other
            is! Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node ||
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

extension UtilityExtension$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node
    on Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node {
  CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node<
          Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node>
      get copyWith =>
          CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node<
    TRes> {
  factory CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node(
    Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node instance,
    TRes Function(
            Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node)
        then,
  ) = _CopyWithImpl$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node;

  factory CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node;

  TRes call({
    String? id,
    Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$question?
        question,
    String? textAnswer,
    String? otherText,
    Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions?
        selectedOptions,
    String? $__typename,
  });
  CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$question<
      TRes> get question;
  CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions<
      TRes> get selectedOptions;
}

class _CopyWithImpl$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node<
        TRes>
    implements
        CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node<
            TRes> {
  _CopyWithImpl$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node(
    this._instance,
    this._then,
  );

  final Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node
      _instance;

  final TRes Function(
      Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? question = _undefined,
    Object? textAnswer = _undefined,
    Object? otherText = _undefined,
    Object? selectedOptions = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        question: question == _undefined || question == null
            ? _instance.question
            : (question
                as Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$question),
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
                as Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$question<
      TRes> get question {
    final local$question = _instance.question;
    return CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$question(
        local$question, (e) => call(question: e));
  }

  CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions<
      TRes> get selectedOptions {
    final local$selectedOptions = _instance.selectedOptions;
    return CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions(
        local$selectedOptions, (e) => call(selectedOptions: e));
  }
}

class _CopyWithStubImpl$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node<
        TRes>
    implements
        CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node<
            TRes> {
  _CopyWithStubImpl$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node(
      this._res);

  TRes _res;

  call({
    String? id,
    Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$question?
        question,
    String? textAnswer,
    String? otherText,
    Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions?
        selectedOptions,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$question<
          TRes>
      get question =>
          CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$question
              .stub(_res);

  CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions<
          TRes>
      get selectedOptions =>
          CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions
              .stub(_res);
}

class Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$question {
  Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$question({
    required this.id,
    required this.text,
    this.$__typename = 'QuestionNode',
  });

  factory Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$question.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$text = json['text'];
    final l$$__typename = json['__typename'];
    return Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$question(
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
            is! Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$question ||
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

extension UtilityExtension$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$question
    on Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$question {
  CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$question<
          Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$question>
      get copyWith =>
          CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$question(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$question<
    TRes> {
  factory CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$question(
    Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$question
        instance,
    TRes Function(
            Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$question)
        then,
  ) = _CopyWithImpl$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$question;

  factory CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$question.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$question;

  TRes call({
    String? id,
    String? text,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$question<
        TRes>
    implements
        CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$question<
            TRes> {
  _CopyWithImpl$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$question(
    this._instance,
    this._then,
  );

  final Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$question
      _instance;

  final TRes Function(
          Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$question)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? text = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$question(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        text: text == _undefined || text == null
            ? _instance.text
            : (text as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$question<
        TRes>
    implements
        CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$question<
            TRes> {
  _CopyWithStubImpl$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$question(
      this._res);

  TRes _res;

  call({
    String? id,
    String? text,
    String? $__typename,
  }) =>
      _res;
}

class Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions {
  Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions({
    required this.edges,
    this.$__typename = 'QuestionOptionNodeConnection',
  });

  factory Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions.fromJson(
      Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions(
      edges: (l$edges as List<dynamic>)
          .map((e) => e == null
              ? null
              : Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<
          Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges?>
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
            is! Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions ||
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

extension UtilityExtension$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions
    on Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions {
  CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions<
          Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions>
      get copyWith =>
          CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions<
    TRes> {
  factory CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions(
    Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions
        instance,
    TRes Function(
            Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions)
        then,
  ) = _CopyWithImpl$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions;

  factory CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions;

  TRes call({
    List<Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges?>?
        edges,
    String? $__typename,
  });
  TRes edges(
      Iterable<Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges?> Function(
              Iterable<
                  CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges<
                      Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges>?>)
          _fn);
}

class _CopyWithImpl$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions<
        TRes>
    implements
        CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions<
            TRes> {
  _CopyWithImpl$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions(
    this._instance,
    this._then,
  );

  final Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions
      _instance;

  final TRes Function(
          Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions(
        edges: edges == _undefined || edges == null
            ? _instance.edges
            : (edges as List<
                Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges?>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes edges(
          Iterable<Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges?> Function(
                  Iterable<
                      CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges<
                          Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges>?>)
              _fn) =>
      call(
          edges: _fn(_instance.edges.map((e) => e == null
              ? null
              : CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges(
                  e,
                  (i) => i,
                ))).toList());
}

class _CopyWithStubImpl$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions<
        TRes>
    implements
        CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions<
            TRes> {
  _CopyWithStubImpl$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions(
      this._res);

  TRes _res;

  call({
    List<Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges?>?
        edges,
    String? $__typename,
  }) =>
      _res;

  edges(_fn) => _res;
}

class Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges {
  Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges({
    this.node,
    this.$__typename = 'QuestionOptionNodeEdge',
  });

  factory Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges.fromJson(
      Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges(
      node: l$node == null
          ? null
          : Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges$node
              .fromJson((l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges$node?
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
            is! Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges ||
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

extension UtilityExtension$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges
    on Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges {
  CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges<
          Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges>
      get copyWith =>
          CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges<
    TRes> {
  factory CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges(
    Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges
        instance,
    TRes Function(
            Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges)
        then,
  ) = _CopyWithImpl$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges;

  factory CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges;

  TRes call({
    Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges$node?
        node,
    String? $__typename,
  });
  CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges$node<
      TRes> get node;
}

class _CopyWithImpl$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges<
        TRes>
    implements
        CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges<
            TRes> {
  _CopyWithImpl$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges(
    this._instance,
    this._then,
  );

  final Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges
      _instance;

  final TRes Function(
          Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges(
        node: node == _undefined
            ? _instance.node
            : (node
                as Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges$node?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges$node<
      TRes> get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges$node
            .stub(_then(_instance))
        : CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges$node(
            local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges<
        TRes>
    implements
        CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges<
            TRes> {
  _CopyWithStubImpl$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges(
      this._res);

  TRes _res;

  call({
    Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges$node?
        node,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges$node<
          TRes>
      get node =>
          CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges$node
              .stub(_res);
}

class Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges$node {
  Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges$node({
    required this.id,
    required this.text,
    this.$__typename = 'QuestionOptionNode',
  });

  factory Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges$node.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$text = json['text'];
    final l$$__typename = json['__typename'];
    return Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges$node(
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
            is! Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges$node ||
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

extension UtilityExtension$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges$node
    on Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges$node {
  CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges$node<
          Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges$node>
      get copyWith =>
          CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges$node(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges$node<
    TRes> {
  factory CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges$node(
    Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges$node
        instance,
    TRes Function(
            Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges$node)
        then,
  ) = _CopyWithImpl$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges$node;

  factory CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges$node.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges$node;

  TRes call({
    String? id,
    String? text,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges$node<
        TRes>
    implements
        CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges$node<
            TRes> {
  _CopyWithImpl$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges$node(
    this._instance,
    this._then,
  );

  final Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges$node
      _instance;

  final TRes Function(
          Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges$node)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? text = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges$node(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        text: text == _undefined || text == null
            ? _instance.text
            : (text as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges$node<
        TRes>
    implements
        CopyWith$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges$node<
            TRes> {
  _CopyWithStubImpl$Mutation$SubmitSurvey$submitSurvey$submission$answers$edges$node$selectedOptions$edges$node(
      this._res);

  TRes _res;

  call({
    String? id,
    String? text,
    String? $__typename,
  }) =>
      _res;
}
