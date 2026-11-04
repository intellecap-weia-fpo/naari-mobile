class Input$AnswerInput {
  factory Input$AnswerInput({
    String? otherText,
    String? photoImage,
    required String questionId,
    List<String?>? selectedOptionIds,
    String? signatureImage,
    String? textAnswer,
  }) =>
      Input$AnswerInput._({
        if (otherText != null) r'otherText': otherText,
        if (photoImage != null) r'photoImage': photoImage,
        r'questionId': questionId,
        if (selectedOptionIds != null) r'selectedOptionIds': selectedOptionIds,
        if (signatureImage != null) r'signatureImage': signatureImage,
        if (textAnswer != null) r'textAnswer': textAnswer,
      });

  Input$AnswerInput._(this._$data);

  factory Input$AnswerInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('otherText')) {
      final l$otherText = data['otherText'];
      result$data['otherText'] = (l$otherText as String?);
    }
    if (data.containsKey('photoImage')) {
      final l$photoImage = data['photoImage'];
      result$data['photoImage'] = (l$photoImage as String?);
    }
    final l$questionId = data['questionId'];
    result$data['questionId'] = (l$questionId as String);
    if (data.containsKey('selectedOptionIds')) {
      final l$selectedOptionIds = data['selectedOptionIds'];
      result$data['selectedOptionIds'] = (l$selectedOptionIds as List<dynamic>?)
          ?.map((e) => (e as String?))
          .toList();
    }
    if (data.containsKey('signatureImage')) {
      final l$signatureImage = data['signatureImage'];
      result$data['signatureImage'] = (l$signatureImage as String?);
    }
    if (data.containsKey('textAnswer')) {
      final l$textAnswer = data['textAnswer'];
      result$data['textAnswer'] = (l$textAnswer as String?);
    }
    return Input$AnswerInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get otherText => (_$data['otherText'] as String?);

  String? get photoImage => (_$data['photoImage'] as String?);

  String get questionId => (_$data['questionId'] as String);

  List<String?>? get selectedOptionIds =>
      (_$data['selectedOptionIds'] as List<String?>?);

  String? get signatureImage => (_$data['signatureImage'] as String?);

  String? get textAnswer => (_$data['textAnswer'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('otherText')) {
      final l$otherText = otherText;
      result$data['otherText'] = l$otherText;
    }
    if (_$data.containsKey('photoImage')) {
      final l$photoImage = photoImage;
      result$data['photoImage'] = l$photoImage;
    }
    final l$questionId = questionId;
    result$data['questionId'] = l$questionId;
    if (_$data.containsKey('selectedOptionIds')) {
      final l$selectedOptionIds = selectedOptionIds;
      result$data['selectedOptionIds'] =
          l$selectedOptionIds?.map((e) => e).toList();
    }
    if (_$data.containsKey('signatureImage')) {
      final l$signatureImage = signatureImage;
      result$data['signatureImage'] = l$signatureImage;
    }
    if (_$data.containsKey('textAnswer')) {
      final l$textAnswer = textAnswer;
      result$data['textAnswer'] = l$textAnswer;
    }
    return result$data;
  }

  CopyWith$Input$AnswerInput<Input$AnswerInput> get copyWith =>
      CopyWith$Input$AnswerInput(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$AnswerInput || runtimeType != other.runtimeType) {
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
    final l$photoImage = photoImage;
    final lOther$photoImage = other.photoImage;
    if (_$data.containsKey('photoImage') !=
        other._$data.containsKey('photoImage')) {
      return false;
    }
    if (l$photoImage != lOther$photoImage) {
      return false;
    }
    final l$questionId = questionId;
    final lOther$questionId = other.questionId;
    if (l$questionId != lOther$questionId) {
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
    final l$signatureImage = signatureImage;
    final lOther$signatureImage = other.signatureImage;
    if (_$data.containsKey('signatureImage') !=
        other._$data.containsKey('signatureImage')) {
      return false;
    }
    if (l$signatureImage != lOther$signatureImage) {
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
    return true;
  }

  @override
  int get hashCode {
    final l$otherText = otherText;
    final l$photoImage = photoImage;
    final l$questionId = questionId;
    final l$selectedOptionIds = selectedOptionIds;
    final l$signatureImage = signatureImage;
    final l$textAnswer = textAnswer;
    return Object.hashAll([
      _$data.containsKey('otherText') ? l$otherText : const {},
      _$data.containsKey('photoImage') ? l$photoImage : const {},
      l$questionId,
      _$data.containsKey('selectedOptionIds')
          ? l$selectedOptionIds == null
              ? null
              : Object.hashAll(l$selectedOptionIds.map((v) => v))
          : const {},
      _$data.containsKey('signatureImage') ? l$signatureImage : const {},
      _$data.containsKey('textAnswer') ? l$textAnswer : const {},
    ]);
  }
}

abstract class CopyWith$Input$AnswerInput<TRes> {
  factory CopyWith$Input$AnswerInput(
    Input$AnswerInput instance,
    TRes Function(Input$AnswerInput) then,
  ) = _CopyWithImpl$Input$AnswerInput;

  factory CopyWith$Input$AnswerInput.stub(TRes res) =
      _CopyWithStubImpl$Input$AnswerInput;

  TRes call({
    String? otherText,
    String? photoImage,
    String? questionId,
    List<String?>? selectedOptionIds,
    String? signatureImage,
    String? textAnswer,
  });
}

class _CopyWithImpl$Input$AnswerInput<TRes>
    implements CopyWith$Input$AnswerInput<TRes> {
  _CopyWithImpl$Input$AnswerInput(
    this._instance,
    this._then,
  );

  final Input$AnswerInput _instance;

  final TRes Function(Input$AnswerInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? otherText = _undefined,
    Object? photoImage = _undefined,
    Object? questionId = _undefined,
    Object? selectedOptionIds = _undefined,
    Object? signatureImage = _undefined,
    Object? textAnswer = _undefined,
  }) =>
      _then(Input$AnswerInput._({
        ..._instance._$data,
        if (otherText != _undefined) 'otherText': (otherText as String?),
        if (photoImage != _undefined) 'photoImage': (photoImage as String?),
        if (questionId != _undefined && questionId != null)
          'questionId': (questionId as String),
        if (selectedOptionIds != _undefined)
          'selectedOptionIds': (selectedOptionIds as List<String?>?),
        if (signatureImage != _undefined)
          'signatureImage': (signatureImage as String?),
        if (textAnswer != _undefined) 'textAnswer': (textAnswer as String?),
      }));
}

class _CopyWithStubImpl$Input$AnswerInput<TRes>
    implements CopyWith$Input$AnswerInput<TRes> {
  _CopyWithStubImpl$Input$AnswerInput(this._res);

  TRes _res;

  call({
    String? otherText,
    String? photoImage,
    String? questionId,
    List<String?>? selectedOptionIds,
    String? signatureImage,
    String? textAnswer,
  }) =>
      _res;
}

class Input$BoardDirectorProfileInput {
  factory Input$BoardDirectorProfileInput({
    String? educationalQualification,
    String? name,
    String? otherExperience,
    int? totalYearsOfExperience,
    Enum$BoardExperienceTypeEnum? typeOfExperience,
  }) =>
      Input$BoardDirectorProfileInput._({
        if (educationalQualification != null)
          r'educationalQualification': educationalQualification,
        if (name != null) r'name': name,
        if (otherExperience != null) r'otherExperience': otherExperience,
        if (totalYearsOfExperience != null)
          r'totalYearsOfExperience': totalYearsOfExperience,
        if (typeOfExperience != null) r'typeOfExperience': typeOfExperience,
      });

  Input$BoardDirectorProfileInput._(this._$data);

  factory Input$BoardDirectorProfileInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('educationalQualification')) {
      final l$educationalQualification = data['educationalQualification'];
      result$data['educationalQualification'] =
          (l$educationalQualification as String?);
    }
    if (data.containsKey('name')) {
      final l$name = data['name'];
      result$data['name'] = (l$name as String?);
    }
    if (data.containsKey('otherExperience')) {
      final l$otherExperience = data['otherExperience'];
      result$data['otherExperience'] = (l$otherExperience as String?);
    }
    if (data.containsKey('totalYearsOfExperience')) {
      final l$totalYearsOfExperience = data['totalYearsOfExperience'];
      result$data['totalYearsOfExperience'] =
          (l$totalYearsOfExperience as int?);
    }
    if (data.containsKey('typeOfExperience')) {
      final l$typeOfExperience = data['typeOfExperience'];
      result$data['typeOfExperience'] = l$typeOfExperience == null
          ? null
          : fromJson$Enum$BoardExperienceTypeEnum(
              (l$typeOfExperience as String));
    }
    return Input$BoardDirectorProfileInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get educationalQualification =>
      (_$data['educationalQualification'] as String?);

  String? get name => (_$data['name'] as String?);

  String? get otherExperience => (_$data['otherExperience'] as String?);

  int? get totalYearsOfExperience => (_$data['totalYearsOfExperience'] as int?);

  Enum$BoardExperienceTypeEnum? get typeOfExperience =>
      (_$data['typeOfExperience'] as Enum$BoardExperienceTypeEnum?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('educationalQualification')) {
      final l$educationalQualification = educationalQualification;
      result$data['educationalQualification'] = l$educationalQualification;
    }
    if (_$data.containsKey('name')) {
      final l$name = name;
      result$data['name'] = l$name;
    }
    if (_$data.containsKey('otherExperience')) {
      final l$otherExperience = otherExperience;
      result$data['otherExperience'] = l$otherExperience;
    }
    if (_$data.containsKey('totalYearsOfExperience')) {
      final l$totalYearsOfExperience = totalYearsOfExperience;
      result$data['totalYearsOfExperience'] = l$totalYearsOfExperience;
    }
    if (_$data.containsKey('typeOfExperience')) {
      final l$typeOfExperience = typeOfExperience;
      result$data['typeOfExperience'] = l$typeOfExperience == null
          ? null
          : toJson$Enum$BoardExperienceTypeEnum(l$typeOfExperience);
    }
    return result$data;
  }

  CopyWith$Input$BoardDirectorProfileInput<Input$BoardDirectorProfileInput>
      get copyWith => CopyWith$Input$BoardDirectorProfileInput(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$BoardDirectorProfileInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$educationalQualification = educationalQualification;
    final lOther$educationalQualification = other.educationalQualification;
    if (_$data.containsKey('educationalQualification') !=
        other._$data.containsKey('educationalQualification')) {
      return false;
    }
    if (l$educationalQualification != lOther$educationalQualification) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (_$data.containsKey('name') != other._$data.containsKey('name')) {
      return false;
    }
    if (l$name != lOther$name) {
      return false;
    }
    final l$otherExperience = otherExperience;
    final lOther$otherExperience = other.otherExperience;
    if (_$data.containsKey('otherExperience') !=
        other._$data.containsKey('otherExperience')) {
      return false;
    }
    if (l$otherExperience != lOther$otherExperience) {
      return false;
    }
    final l$totalYearsOfExperience = totalYearsOfExperience;
    final lOther$totalYearsOfExperience = other.totalYearsOfExperience;
    if (_$data.containsKey('totalYearsOfExperience') !=
        other._$data.containsKey('totalYearsOfExperience')) {
      return false;
    }
    if (l$totalYearsOfExperience != lOther$totalYearsOfExperience) {
      return false;
    }
    final l$typeOfExperience = typeOfExperience;
    final lOther$typeOfExperience = other.typeOfExperience;
    if (_$data.containsKey('typeOfExperience') !=
        other._$data.containsKey('typeOfExperience')) {
      return false;
    }
    if (l$typeOfExperience != lOther$typeOfExperience) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$educationalQualification = educationalQualification;
    final l$name = name;
    final l$otherExperience = otherExperience;
    final l$totalYearsOfExperience = totalYearsOfExperience;
    final l$typeOfExperience = typeOfExperience;
    return Object.hashAll([
      _$data.containsKey('educationalQualification')
          ? l$educationalQualification
          : const {},
      _$data.containsKey('name') ? l$name : const {},
      _$data.containsKey('otherExperience') ? l$otherExperience : const {},
      _$data.containsKey('totalYearsOfExperience')
          ? l$totalYearsOfExperience
          : const {},
      _$data.containsKey('typeOfExperience') ? l$typeOfExperience : const {},
    ]);
  }
}

abstract class CopyWith$Input$BoardDirectorProfileInput<TRes> {
  factory CopyWith$Input$BoardDirectorProfileInput(
    Input$BoardDirectorProfileInput instance,
    TRes Function(Input$BoardDirectorProfileInput) then,
  ) = _CopyWithImpl$Input$BoardDirectorProfileInput;

  factory CopyWith$Input$BoardDirectorProfileInput.stub(TRes res) =
      _CopyWithStubImpl$Input$BoardDirectorProfileInput;

  TRes call({
    String? educationalQualification,
    String? name,
    String? otherExperience,
    int? totalYearsOfExperience,
    Enum$BoardExperienceTypeEnum? typeOfExperience,
  });
}

class _CopyWithImpl$Input$BoardDirectorProfileInput<TRes>
    implements CopyWith$Input$BoardDirectorProfileInput<TRes> {
  _CopyWithImpl$Input$BoardDirectorProfileInput(
    this._instance,
    this._then,
  );

  final Input$BoardDirectorProfileInput _instance;

  final TRes Function(Input$BoardDirectorProfileInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? educationalQualification = _undefined,
    Object? name = _undefined,
    Object? otherExperience = _undefined,
    Object? totalYearsOfExperience = _undefined,
    Object? typeOfExperience = _undefined,
  }) =>
      _then(Input$BoardDirectorProfileInput._({
        ..._instance._$data,
        if (educationalQualification != _undefined)
          'educationalQualification': (educationalQualification as String?),
        if (name != _undefined) 'name': (name as String?),
        if (otherExperience != _undefined)
          'otherExperience': (otherExperience as String?),
        if (totalYearsOfExperience != _undefined)
          'totalYearsOfExperience': (totalYearsOfExperience as int?),
        if (typeOfExperience != _undefined)
          'typeOfExperience':
              (typeOfExperience as Enum$BoardExperienceTypeEnum?),
      }));
}

class _CopyWithStubImpl$Input$BoardDirectorProfileInput<TRes>
    implements CopyWith$Input$BoardDirectorProfileInput<TRes> {
  _CopyWithStubImpl$Input$BoardDirectorProfileInput(this._res);

  TRes _res;

  call({
    String? educationalQualification,
    String? name,
    String? otherExperience,
    int? totalYearsOfExperience,
    Enum$BoardExperienceTypeEnum? typeOfExperience,
  }) =>
      _res;
}

class Input$BusinessOperationsSubmissionInput {
  factory Input$BusinessOperationsSubmissionInput({
    String? accessibilityPercentage,
    bool? advisoryServices,
    Enum$DistanceAvailabilityTypeEnum? availabilityOfInputsPlace,
    Enum$PriceAffordabilityTypeEnum? availabilityOfInputsPriceAffordability,
    Enum$InputTimelinessTypeEnum? availabilityOfInputsTimeliness,
    bool? chilling,
    bool? cleaning,
    bool? contractFarming,
    bool? creditFacilities,
    bool? customHiringCenters,
    String? distanceOfOutputCollectionCentres,
    bool? electronicWeighingMachines,
    bool? gradingAndSorting,
    bool? labelling,
    bool? packaging,
    Enum$PriceVolatilityTypeEnum? priceVolatilityOfProducts,
    bool? processing,
    bool? qualityCheck,
    bool? soilTestingFacility,
    bool? storage,
    bool? transportationFacility,
  }) =>
      Input$BusinessOperationsSubmissionInput._({
        if (accessibilityPercentage != null)
          r'accessibilityPercentage': accessibilityPercentage,
        if (advisoryServices != null) r'advisoryServices': advisoryServices,
        if (availabilityOfInputsPlace != null)
          r'availabilityOfInputsPlace': availabilityOfInputsPlace,
        if (availabilityOfInputsPriceAffordability != null)
          r'availabilityOfInputsPriceAffordability':
              availabilityOfInputsPriceAffordability,
        if (availabilityOfInputsTimeliness != null)
          r'availabilityOfInputsTimeliness': availabilityOfInputsTimeliness,
        if (chilling != null) r'chilling': chilling,
        if (cleaning != null) r'cleaning': cleaning,
        if (contractFarming != null) r'contractFarming': contractFarming,
        if (creditFacilities != null) r'creditFacilities': creditFacilities,
        if (customHiringCenters != null)
          r'customHiringCenters': customHiringCenters,
        if (distanceOfOutputCollectionCentres != null)
          r'distanceOfOutputCollectionCentres':
              distanceOfOutputCollectionCentres,
        if (electronicWeighingMachines != null)
          r'electronicWeighingMachines': electronicWeighingMachines,
        if (gradingAndSorting != null) r'gradingAndSorting': gradingAndSorting,
        if (labelling != null) r'labelling': labelling,
        if (packaging != null) r'packaging': packaging,
        if (priceVolatilityOfProducts != null)
          r'priceVolatilityOfProducts': priceVolatilityOfProducts,
        if (processing != null) r'processing': processing,
        if (qualityCheck != null) r'qualityCheck': qualityCheck,
        if (soilTestingFacility != null)
          r'soilTestingFacility': soilTestingFacility,
        if (storage != null) r'storage': storage,
        if (transportationFacility != null)
          r'transportationFacility': transportationFacility,
      });

  Input$BusinessOperationsSubmissionInput._(this._$data);

  factory Input$BusinessOperationsSubmissionInput.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('accessibilityPercentage')) {
      final l$accessibilityPercentage = data['accessibilityPercentage'];
      result$data['accessibilityPercentage'] =
          (l$accessibilityPercentage as String?);
    }
    if (data.containsKey('advisoryServices')) {
      final l$advisoryServices = data['advisoryServices'];
      result$data['advisoryServices'] = (l$advisoryServices as bool?);
    }
    if (data.containsKey('availabilityOfInputsPlace')) {
      final l$availabilityOfInputsPlace = data['availabilityOfInputsPlace'];
      result$data['availabilityOfInputsPlace'] =
          l$availabilityOfInputsPlace == null
              ? null
              : fromJson$Enum$DistanceAvailabilityTypeEnum(
                  (l$availabilityOfInputsPlace as String));
    }
    if (data.containsKey('availabilityOfInputsPriceAffordability')) {
      final l$availabilityOfInputsPriceAffordability =
          data['availabilityOfInputsPriceAffordability'];
      result$data['availabilityOfInputsPriceAffordability'] =
          l$availabilityOfInputsPriceAffordability == null
              ? null
              : fromJson$Enum$PriceAffordabilityTypeEnum(
                  (l$availabilityOfInputsPriceAffordability as String));
    }
    if (data.containsKey('availabilityOfInputsTimeliness')) {
      final l$availabilityOfInputsTimeliness =
          data['availabilityOfInputsTimeliness'];
      result$data['availabilityOfInputsTimeliness'] =
          l$availabilityOfInputsTimeliness == null
              ? null
              : fromJson$Enum$InputTimelinessTypeEnum(
                  (l$availabilityOfInputsTimeliness as String));
    }
    if (data.containsKey('chilling')) {
      final l$chilling = data['chilling'];
      result$data['chilling'] = (l$chilling as bool?);
    }
    if (data.containsKey('cleaning')) {
      final l$cleaning = data['cleaning'];
      result$data['cleaning'] = (l$cleaning as bool?);
    }
    if (data.containsKey('contractFarming')) {
      final l$contractFarming = data['contractFarming'];
      result$data['contractFarming'] = (l$contractFarming as bool?);
    }
    if (data.containsKey('creditFacilities')) {
      final l$creditFacilities = data['creditFacilities'];
      result$data['creditFacilities'] = (l$creditFacilities as bool?);
    }
    if (data.containsKey('customHiringCenters')) {
      final l$customHiringCenters = data['customHiringCenters'];
      result$data['customHiringCenters'] = (l$customHiringCenters as bool?);
    }
    if (data.containsKey('distanceOfOutputCollectionCentres')) {
      final l$distanceOfOutputCollectionCentres =
          data['distanceOfOutputCollectionCentres'];
      result$data['distanceOfOutputCollectionCentres'] =
          (l$distanceOfOutputCollectionCentres as String?);
    }
    if (data.containsKey('electronicWeighingMachines')) {
      final l$electronicWeighingMachines = data['electronicWeighingMachines'];
      result$data['electronicWeighingMachines'] =
          (l$electronicWeighingMachines as bool?);
    }
    if (data.containsKey('gradingAndSorting')) {
      final l$gradingAndSorting = data['gradingAndSorting'];
      result$data['gradingAndSorting'] = (l$gradingAndSorting as bool?);
    }
    if (data.containsKey('labelling')) {
      final l$labelling = data['labelling'];
      result$data['labelling'] = (l$labelling as bool?);
    }
    if (data.containsKey('packaging')) {
      final l$packaging = data['packaging'];
      result$data['packaging'] = (l$packaging as bool?);
    }
    if (data.containsKey('priceVolatilityOfProducts')) {
      final l$priceVolatilityOfProducts = data['priceVolatilityOfProducts'];
      result$data['priceVolatilityOfProducts'] =
          l$priceVolatilityOfProducts == null
              ? null
              : fromJson$Enum$PriceVolatilityTypeEnum(
                  (l$priceVolatilityOfProducts as String));
    }
    if (data.containsKey('processing')) {
      final l$processing = data['processing'];
      result$data['processing'] = (l$processing as bool?);
    }
    if (data.containsKey('qualityCheck')) {
      final l$qualityCheck = data['qualityCheck'];
      result$data['qualityCheck'] = (l$qualityCheck as bool?);
    }
    if (data.containsKey('soilTestingFacility')) {
      final l$soilTestingFacility = data['soilTestingFacility'];
      result$data['soilTestingFacility'] = (l$soilTestingFacility as bool?);
    }
    if (data.containsKey('storage')) {
      final l$storage = data['storage'];
      result$data['storage'] = (l$storage as bool?);
    }
    if (data.containsKey('transportationFacility')) {
      final l$transportationFacility = data['transportationFacility'];
      result$data['transportationFacility'] =
          (l$transportationFacility as bool?);
    }
    return Input$BusinessOperationsSubmissionInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get accessibilityPercentage =>
      (_$data['accessibilityPercentage'] as String?);

  bool? get advisoryServices => (_$data['advisoryServices'] as bool?);

  Enum$DistanceAvailabilityTypeEnum? get availabilityOfInputsPlace =>
      (_$data['availabilityOfInputsPlace']
          as Enum$DistanceAvailabilityTypeEnum?);

  Enum$PriceAffordabilityTypeEnum? get availabilityOfInputsPriceAffordability =>
      (_$data['availabilityOfInputsPriceAffordability']
          as Enum$PriceAffordabilityTypeEnum?);

  Enum$InputTimelinessTypeEnum? get availabilityOfInputsTimeliness =>
      (_$data['availabilityOfInputsTimeliness']
          as Enum$InputTimelinessTypeEnum?);

  bool? get chilling => (_$data['chilling'] as bool?);

  bool? get cleaning => (_$data['cleaning'] as bool?);

  bool? get contractFarming => (_$data['contractFarming'] as bool?);

  bool? get creditFacilities => (_$data['creditFacilities'] as bool?);

  bool? get customHiringCenters => (_$data['customHiringCenters'] as bool?);

  String? get distanceOfOutputCollectionCentres =>
      (_$data['distanceOfOutputCollectionCentres'] as String?);

  bool? get electronicWeighingMachines =>
      (_$data['electronicWeighingMachines'] as bool?);

  bool? get gradingAndSorting => (_$data['gradingAndSorting'] as bool?);

  bool? get labelling => (_$data['labelling'] as bool?);

  bool? get packaging => (_$data['packaging'] as bool?);

  Enum$PriceVolatilityTypeEnum? get priceVolatilityOfProducts =>
      (_$data['priceVolatilityOfProducts'] as Enum$PriceVolatilityTypeEnum?);

  bool? get processing => (_$data['processing'] as bool?);

  bool? get qualityCheck => (_$data['qualityCheck'] as bool?);

  bool? get soilTestingFacility => (_$data['soilTestingFacility'] as bool?);

  bool? get storage => (_$data['storage'] as bool?);

  bool? get transportationFacility =>
      (_$data['transportationFacility'] as bool?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('accessibilityPercentage')) {
      final l$accessibilityPercentage = accessibilityPercentage;
      result$data['accessibilityPercentage'] = l$accessibilityPercentage;
    }
    if (_$data.containsKey('advisoryServices')) {
      final l$advisoryServices = advisoryServices;
      result$data['advisoryServices'] = l$advisoryServices;
    }
    if (_$data.containsKey('availabilityOfInputsPlace')) {
      final l$availabilityOfInputsPlace = availabilityOfInputsPlace;
      result$data['availabilityOfInputsPlace'] =
          l$availabilityOfInputsPlace == null
              ? null
              : toJson$Enum$DistanceAvailabilityTypeEnum(
                  l$availabilityOfInputsPlace);
    }
    if (_$data.containsKey('availabilityOfInputsPriceAffordability')) {
      final l$availabilityOfInputsPriceAffordability =
          availabilityOfInputsPriceAffordability;
      result$data['availabilityOfInputsPriceAffordability'] =
          l$availabilityOfInputsPriceAffordability == null
              ? null
              : toJson$Enum$PriceAffordabilityTypeEnum(
                  l$availabilityOfInputsPriceAffordability);
    }
    if (_$data.containsKey('availabilityOfInputsTimeliness')) {
      final l$availabilityOfInputsTimeliness = availabilityOfInputsTimeliness;
      result$data['availabilityOfInputsTimeliness'] =
          l$availabilityOfInputsTimeliness == null
              ? null
              : toJson$Enum$InputTimelinessTypeEnum(
                  l$availabilityOfInputsTimeliness);
    }
    if (_$data.containsKey('chilling')) {
      final l$chilling = chilling;
      result$data['chilling'] = l$chilling;
    }
    if (_$data.containsKey('cleaning')) {
      final l$cleaning = cleaning;
      result$data['cleaning'] = l$cleaning;
    }
    if (_$data.containsKey('contractFarming')) {
      final l$contractFarming = contractFarming;
      result$data['contractFarming'] = l$contractFarming;
    }
    if (_$data.containsKey('creditFacilities')) {
      final l$creditFacilities = creditFacilities;
      result$data['creditFacilities'] = l$creditFacilities;
    }
    if (_$data.containsKey('customHiringCenters')) {
      final l$customHiringCenters = customHiringCenters;
      result$data['customHiringCenters'] = l$customHiringCenters;
    }
    if (_$data.containsKey('distanceOfOutputCollectionCentres')) {
      final l$distanceOfOutputCollectionCentres =
          distanceOfOutputCollectionCentres;
      result$data['distanceOfOutputCollectionCentres'] =
          l$distanceOfOutputCollectionCentres;
    }
    if (_$data.containsKey('electronicWeighingMachines')) {
      final l$electronicWeighingMachines = electronicWeighingMachines;
      result$data['electronicWeighingMachines'] = l$electronicWeighingMachines;
    }
    if (_$data.containsKey('gradingAndSorting')) {
      final l$gradingAndSorting = gradingAndSorting;
      result$data['gradingAndSorting'] = l$gradingAndSorting;
    }
    if (_$data.containsKey('labelling')) {
      final l$labelling = labelling;
      result$data['labelling'] = l$labelling;
    }
    if (_$data.containsKey('packaging')) {
      final l$packaging = packaging;
      result$data['packaging'] = l$packaging;
    }
    if (_$data.containsKey('priceVolatilityOfProducts')) {
      final l$priceVolatilityOfProducts = priceVolatilityOfProducts;
      result$data['priceVolatilityOfProducts'] = l$priceVolatilityOfProducts ==
              null
          ? null
          : toJson$Enum$PriceVolatilityTypeEnum(l$priceVolatilityOfProducts);
    }
    if (_$data.containsKey('processing')) {
      final l$processing = processing;
      result$data['processing'] = l$processing;
    }
    if (_$data.containsKey('qualityCheck')) {
      final l$qualityCheck = qualityCheck;
      result$data['qualityCheck'] = l$qualityCheck;
    }
    if (_$data.containsKey('soilTestingFacility')) {
      final l$soilTestingFacility = soilTestingFacility;
      result$data['soilTestingFacility'] = l$soilTestingFacility;
    }
    if (_$data.containsKey('storage')) {
      final l$storage = storage;
      result$data['storage'] = l$storage;
    }
    if (_$data.containsKey('transportationFacility')) {
      final l$transportationFacility = transportationFacility;
      result$data['transportationFacility'] = l$transportationFacility;
    }
    return result$data;
  }

  CopyWith$Input$BusinessOperationsSubmissionInput<
          Input$BusinessOperationsSubmissionInput>
      get copyWith => CopyWith$Input$BusinessOperationsSubmissionInput(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$BusinessOperationsSubmissionInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$accessibilityPercentage = accessibilityPercentage;
    final lOther$accessibilityPercentage = other.accessibilityPercentage;
    if (_$data.containsKey('accessibilityPercentage') !=
        other._$data.containsKey('accessibilityPercentage')) {
      return false;
    }
    if (l$accessibilityPercentage != lOther$accessibilityPercentage) {
      return false;
    }
    final l$advisoryServices = advisoryServices;
    final lOther$advisoryServices = other.advisoryServices;
    if (_$data.containsKey('advisoryServices') !=
        other._$data.containsKey('advisoryServices')) {
      return false;
    }
    if (l$advisoryServices != lOther$advisoryServices) {
      return false;
    }
    final l$availabilityOfInputsPlace = availabilityOfInputsPlace;
    final lOther$availabilityOfInputsPlace = other.availabilityOfInputsPlace;
    if (_$data.containsKey('availabilityOfInputsPlace') !=
        other._$data.containsKey('availabilityOfInputsPlace')) {
      return false;
    }
    if (l$availabilityOfInputsPlace != lOther$availabilityOfInputsPlace) {
      return false;
    }
    final l$availabilityOfInputsPriceAffordability =
        availabilityOfInputsPriceAffordability;
    final lOther$availabilityOfInputsPriceAffordability =
        other.availabilityOfInputsPriceAffordability;
    if (_$data.containsKey('availabilityOfInputsPriceAffordability') !=
        other._$data.containsKey('availabilityOfInputsPriceAffordability')) {
      return false;
    }
    if (l$availabilityOfInputsPriceAffordability !=
        lOther$availabilityOfInputsPriceAffordability) {
      return false;
    }
    final l$availabilityOfInputsTimeliness = availabilityOfInputsTimeliness;
    final lOther$availabilityOfInputsTimeliness =
        other.availabilityOfInputsTimeliness;
    if (_$data.containsKey('availabilityOfInputsTimeliness') !=
        other._$data.containsKey('availabilityOfInputsTimeliness')) {
      return false;
    }
    if (l$availabilityOfInputsTimeliness !=
        lOther$availabilityOfInputsTimeliness) {
      return false;
    }
    final l$chilling = chilling;
    final lOther$chilling = other.chilling;
    if (_$data.containsKey('chilling') !=
        other._$data.containsKey('chilling')) {
      return false;
    }
    if (l$chilling != lOther$chilling) {
      return false;
    }
    final l$cleaning = cleaning;
    final lOther$cleaning = other.cleaning;
    if (_$data.containsKey('cleaning') !=
        other._$data.containsKey('cleaning')) {
      return false;
    }
    if (l$cleaning != lOther$cleaning) {
      return false;
    }
    final l$contractFarming = contractFarming;
    final lOther$contractFarming = other.contractFarming;
    if (_$data.containsKey('contractFarming') !=
        other._$data.containsKey('contractFarming')) {
      return false;
    }
    if (l$contractFarming != lOther$contractFarming) {
      return false;
    }
    final l$creditFacilities = creditFacilities;
    final lOther$creditFacilities = other.creditFacilities;
    if (_$data.containsKey('creditFacilities') !=
        other._$data.containsKey('creditFacilities')) {
      return false;
    }
    if (l$creditFacilities != lOther$creditFacilities) {
      return false;
    }
    final l$customHiringCenters = customHiringCenters;
    final lOther$customHiringCenters = other.customHiringCenters;
    if (_$data.containsKey('customHiringCenters') !=
        other._$data.containsKey('customHiringCenters')) {
      return false;
    }
    if (l$customHiringCenters != lOther$customHiringCenters) {
      return false;
    }
    final l$distanceOfOutputCollectionCentres =
        distanceOfOutputCollectionCentres;
    final lOther$distanceOfOutputCollectionCentres =
        other.distanceOfOutputCollectionCentres;
    if (_$data.containsKey('distanceOfOutputCollectionCentres') !=
        other._$data.containsKey('distanceOfOutputCollectionCentres')) {
      return false;
    }
    if (l$distanceOfOutputCollectionCentres !=
        lOther$distanceOfOutputCollectionCentres) {
      return false;
    }
    final l$electronicWeighingMachines = electronicWeighingMachines;
    final lOther$electronicWeighingMachines = other.electronicWeighingMachines;
    if (_$data.containsKey('electronicWeighingMachines') !=
        other._$data.containsKey('electronicWeighingMachines')) {
      return false;
    }
    if (l$electronicWeighingMachines != lOther$electronicWeighingMachines) {
      return false;
    }
    final l$gradingAndSorting = gradingAndSorting;
    final lOther$gradingAndSorting = other.gradingAndSorting;
    if (_$data.containsKey('gradingAndSorting') !=
        other._$data.containsKey('gradingAndSorting')) {
      return false;
    }
    if (l$gradingAndSorting != lOther$gradingAndSorting) {
      return false;
    }
    final l$labelling = labelling;
    final lOther$labelling = other.labelling;
    if (_$data.containsKey('labelling') !=
        other._$data.containsKey('labelling')) {
      return false;
    }
    if (l$labelling != lOther$labelling) {
      return false;
    }
    final l$packaging = packaging;
    final lOther$packaging = other.packaging;
    if (_$data.containsKey('packaging') !=
        other._$data.containsKey('packaging')) {
      return false;
    }
    if (l$packaging != lOther$packaging) {
      return false;
    }
    final l$priceVolatilityOfProducts = priceVolatilityOfProducts;
    final lOther$priceVolatilityOfProducts = other.priceVolatilityOfProducts;
    if (_$data.containsKey('priceVolatilityOfProducts') !=
        other._$data.containsKey('priceVolatilityOfProducts')) {
      return false;
    }
    if (l$priceVolatilityOfProducts != lOther$priceVolatilityOfProducts) {
      return false;
    }
    final l$processing = processing;
    final lOther$processing = other.processing;
    if (_$data.containsKey('processing') !=
        other._$data.containsKey('processing')) {
      return false;
    }
    if (l$processing != lOther$processing) {
      return false;
    }
    final l$qualityCheck = qualityCheck;
    final lOther$qualityCheck = other.qualityCheck;
    if (_$data.containsKey('qualityCheck') !=
        other._$data.containsKey('qualityCheck')) {
      return false;
    }
    if (l$qualityCheck != lOther$qualityCheck) {
      return false;
    }
    final l$soilTestingFacility = soilTestingFacility;
    final lOther$soilTestingFacility = other.soilTestingFacility;
    if (_$data.containsKey('soilTestingFacility') !=
        other._$data.containsKey('soilTestingFacility')) {
      return false;
    }
    if (l$soilTestingFacility != lOther$soilTestingFacility) {
      return false;
    }
    final l$storage = storage;
    final lOther$storage = other.storage;
    if (_$data.containsKey('storage') != other._$data.containsKey('storage')) {
      return false;
    }
    if (l$storage != lOther$storage) {
      return false;
    }
    final l$transportationFacility = transportationFacility;
    final lOther$transportationFacility = other.transportationFacility;
    if (_$data.containsKey('transportationFacility') !=
        other._$data.containsKey('transportationFacility')) {
      return false;
    }
    if (l$transportationFacility != lOther$transportationFacility) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$accessibilityPercentage = accessibilityPercentage;
    final l$advisoryServices = advisoryServices;
    final l$availabilityOfInputsPlace = availabilityOfInputsPlace;
    final l$availabilityOfInputsPriceAffordability =
        availabilityOfInputsPriceAffordability;
    final l$availabilityOfInputsTimeliness = availabilityOfInputsTimeliness;
    final l$chilling = chilling;
    final l$cleaning = cleaning;
    final l$contractFarming = contractFarming;
    final l$creditFacilities = creditFacilities;
    final l$customHiringCenters = customHiringCenters;
    final l$distanceOfOutputCollectionCentres =
        distanceOfOutputCollectionCentres;
    final l$electronicWeighingMachines = electronicWeighingMachines;
    final l$gradingAndSorting = gradingAndSorting;
    final l$labelling = labelling;
    final l$packaging = packaging;
    final l$priceVolatilityOfProducts = priceVolatilityOfProducts;
    final l$processing = processing;
    final l$qualityCheck = qualityCheck;
    final l$soilTestingFacility = soilTestingFacility;
    final l$storage = storage;
    final l$transportationFacility = transportationFacility;
    return Object.hashAll([
      _$data.containsKey('accessibilityPercentage')
          ? l$accessibilityPercentage
          : const {},
      _$data.containsKey('advisoryServices') ? l$advisoryServices : const {},
      _$data.containsKey('availabilityOfInputsPlace')
          ? l$availabilityOfInputsPlace
          : const {},
      _$data.containsKey('availabilityOfInputsPriceAffordability')
          ? l$availabilityOfInputsPriceAffordability
          : const {},
      _$data.containsKey('availabilityOfInputsTimeliness')
          ? l$availabilityOfInputsTimeliness
          : const {},
      _$data.containsKey('chilling') ? l$chilling : const {},
      _$data.containsKey('cleaning') ? l$cleaning : const {},
      _$data.containsKey('contractFarming') ? l$contractFarming : const {},
      _$data.containsKey('creditFacilities') ? l$creditFacilities : const {},
      _$data.containsKey('customHiringCenters')
          ? l$customHiringCenters
          : const {},
      _$data.containsKey('distanceOfOutputCollectionCentres')
          ? l$distanceOfOutputCollectionCentres
          : const {},
      _$data.containsKey('electronicWeighingMachines')
          ? l$electronicWeighingMachines
          : const {},
      _$data.containsKey('gradingAndSorting') ? l$gradingAndSorting : const {},
      _$data.containsKey('labelling') ? l$labelling : const {},
      _$data.containsKey('packaging') ? l$packaging : const {},
      _$data.containsKey('priceVolatilityOfProducts')
          ? l$priceVolatilityOfProducts
          : const {},
      _$data.containsKey('processing') ? l$processing : const {},
      _$data.containsKey('qualityCheck') ? l$qualityCheck : const {},
      _$data.containsKey('soilTestingFacility')
          ? l$soilTestingFacility
          : const {},
      _$data.containsKey('storage') ? l$storage : const {},
      _$data.containsKey('transportationFacility')
          ? l$transportationFacility
          : const {},
    ]);
  }
}

abstract class CopyWith$Input$BusinessOperationsSubmissionInput<TRes> {
  factory CopyWith$Input$BusinessOperationsSubmissionInput(
    Input$BusinessOperationsSubmissionInput instance,
    TRes Function(Input$BusinessOperationsSubmissionInput) then,
  ) = _CopyWithImpl$Input$BusinessOperationsSubmissionInput;

  factory CopyWith$Input$BusinessOperationsSubmissionInput.stub(TRes res) =
      _CopyWithStubImpl$Input$BusinessOperationsSubmissionInput;

  TRes call({
    String? accessibilityPercentage,
    bool? advisoryServices,
    Enum$DistanceAvailabilityTypeEnum? availabilityOfInputsPlace,
    Enum$PriceAffordabilityTypeEnum? availabilityOfInputsPriceAffordability,
    Enum$InputTimelinessTypeEnum? availabilityOfInputsTimeliness,
    bool? chilling,
    bool? cleaning,
    bool? contractFarming,
    bool? creditFacilities,
    bool? customHiringCenters,
    String? distanceOfOutputCollectionCentres,
    bool? electronicWeighingMachines,
    bool? gradingAndSorting,
    bool? labelling,
    bool? packaging,
    Enum$PriceVolatilityTypeEnum? priceVolatilityOfProducts,
    bool? processing,
    bool? qualityCheck,
    bool? soilTestingFacility,
    bool? storage,
    bool? transportationFacility,
  });
}

class _CopyWithImpl$Input$BusinessOperationsSubmissionInput<TRes>
    implements CopyWith$Input$BusinessOperationsSubmissionInput<TRes> {
  _CopyWithImpl$Input$BusinessOperationsSubmissionInput(
    this._instance,
    this._then,
  );

  final Input$BusinessOperationsSubmissionInput _instance;

  final TRes Function(Input$BusinessOperationsSubmissionInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? accessibilityPercentage = _undefined,
    Object? advisoryServices = _undefined,
    Object? availabilityOfInputsPlace = _undefined,
    Object? availabilityOfInputsPriceAffordability = _undefined,
    Object? availabilityOfInputsTimeliness = _undefined,
    Object? chilling = _undefined,
    Object? cleaning = _undefined,
    Object? contractFarming = _undefined,
    Object? creditFacilities = _undefined,
    Object? customHiringCenters = _undefined,
    Object? distanceOfOutputCollectionCentres = _undefined,
    Object? electronicWeighingMachines = _undefined,
    Object? gradingAndSorting = _undefined,
    Object? labelling = _undefined,
    Object? packaging = _undefined,
    Object? priceVolatilityOfProducts = _undefined,
    Object? processing = _undefined,
    Object? qualityCheck = _undefined,
    Object? soilTestingFacility = _undefined,
    Object? storage = _undefined,
    Object? transportationFacility = _undefined,
  }) =>
      _then(Input$BusinessOperationsSubmissionInput._({
        ..._instance._$data,
        if (accessibilityPercentage != _undefined)
          'accessibilityPercentage': (accessibilityPercentage as String?),
        if (advisoryServices != _undefined)
          'advisoryServices': (advisoryServices as bool?),
        if (availabilityOfInputsPlace != _undefined)
          'availabilityOfInputsPlace':
              (availabilityOfInputsPlace as Enum$DistanceAvailabilityTypeEnum?),
        if (availabilityOfInputsPriceAffordability != _undefined)
          'availabilityOfInputsPriceAffordability':
              (availabilityOfInputsPriceAffordability
                  as Enum$PriceAffordabilityTypeEnum?),
        if (availabilityOfInputsTimeliness != _undefined)
          'availabilityOfInputsTimeliness':
              (availabilityOfInputsTimeliness as Enum$InputTimelinessTypeEnum?),
        if (chilling != _undefined) 'chilling': (chilling as bool?),
        if (cleaning != _undefined) 'cleaning': (cleaning as bool?),
        if (contractFarming != _undefined)
          'contractFarming': (contractFarming as bool?),
        if (creditFacilities != _undefined)
          'creditFacilities': (creditFacilities as bool?),
        if (customHiringCenters != _undefined)
          'customHiringCenters': (customHiringCenters as bool?),
        if (distanceOfOutputCollectionCentres != _undefined)
          'distanceOfOutputCollectionCentres':
              (distanceOfOutputCollectionCentres as String?),
        if (electronicWeighingMachines != _undefined)
          'electronicWeighingMachines': (electronicWeighingMachines as bool?),
        if (gradingAndSorting != _undefined)
          'gradingAndSorting': (gradingAndSorting as bool?),
        if (labelling != _undefined) 'labelling': (labelling as bool?),
        if (packaging != _undefined) 'packaging': (packaging as bool?),
        if (priceVolatilityOfProducts != _undefined)
          'priceVolatilityOfProducts':
              (priceVolatilityOfProducts as Enum$PriceVolatilityTypeEnum?),
        if (processing != _undefined) 'processing': (processing as bool?),
        if (qualityCheck != _undefined) 'qualityCheck': (qualityCheck as bool?),
        if (soilTestingFacility != _undefined)
          'soilTestingFacility': (soilTestingFacility as bool?),
        if (storage != _undefined) 'storage': (storage as bool?),
        if (transportationFacility != _undefined)
          'transportationFacility': (transportationFacility as bool?),
      }));
}

class _CopyWithStubImpl$Input$BusinessOperationsSubmissionInput<TRes>
    implements CopyWith$Input$BusinessOperationsSubmissionInput<TRes> {
  _CopyWithStubImpl$Input$BusinessOperationsSubmissionInput(this._res);

  TRes _res;

  call({
    String? accessibilityPercentage,
    bool? advisoryServices,
    Enum$DistanceAvailabilityTypeEnum? availabilityOfInputsPlace,
    Enum$PriceAffordabilityTypeEnum? availabilityOfInputsPriceAffordability,
    Enum$InputTimelinessTypeEnum? availabilityOfInputsTimeliness,
    bool? chilling,
    bool? cleaning,
    bool? contractFarming,
    bool? creditFacilities,
    bool? customHiringCenters,
    String? distanceOfOutputCollectionCentres,
    bool? electronicWeighingMachines,
    bool? gradingAndSorting,
    bool? labelling,
    bool? packaging,
    Enum$PriceVolatilityTypeEnum? priceVolatilityOfProducts,
    bool? processing,
    bool? qualityCheck,
    bool? soilTestingFacility,
    bool? storage,
    bool? transportationFacility,
  }) =>
      _res;
}

class Input$CEOProfileSubmissionInput {
  factory Input$CEOProfileSubmissionInput({
    String? name,
    int? numberOfYearsAssociated,
    String? otherExperienceType,
    String? qualification,
    int? totalYearsOfExperience,
    Enum$ExperienceTypeEnum? typeOfExperience,
  }) =>
      Input$CEOProfileSubmissionInput._({
        if (name != null) r'name': name,
        if (numberOfYearsAssociated != null)
          r'numberOfYearsAssociated': numberOfYearsAssociated,
        if (otherExperienceType != null)
          r'otherExperienceType': otherExperienceType,
        if (qualification != null) r'qualification': qualification,
        if (totalYearsOfExperience != null)
          r'totalYearsOfExperience': totalYearsOfExperience,
        if (typeOfExperience != null) r'typeOfExperience': typeOfExperience,
      });

  Input$CEOProfileSubmissionInput._(this._$data);

  factory Input$CEOProfileSubmissionInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('name')) {
      final l$name = data['name'];
      result$data['name'] = (l$name as String?);
    }
    if (data.containsKey('numberOfYearsAssociated')) {
      final l$numberOfYearsAssociated = data['numberOfYearsAssociated'];
      result$data['numberOfYearsAssociated'] =
          (l$numberOfYearsAssociated as int?);
    }
    if (data.containsKey('otherExperienceType')) {
      final l$otherExperienceType = data['otherExperienceType'];
      result$data['otherExperienceType'] = (l$otherExperienceType as String?);
    }
    if (data.containsKey('qualification')) {
      final l$qualification = data['qualification'];
      result$data['qualification'] = (l$qualification as String?);
    }
    if (data.containsKey('totalYearsOfExperience')) {
      final l$totalYearsOfExperience = data['totalYearsOfExperience'];
      result$data['totalYearsOfExperience'] =
          (l$totalYearsOfExperience as int?);
    }
    if (data.containsKey('typeOfExperience')) {
      final l$typeOfExperience = data['typeOfExperience'];
      result$data['typeOfExperience'] = l$typeOfExperience == null
          ? null
          : fromJson$Enum$ExperienceTypeEnum((l$typeOfExperience as String));
    }
    return Input$CEOProfileSubmissionInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get name => (_$data['name'] as String?);

  int? get numberOfYearsAssociated =>
      (_$data['numberOfYearsAssociated'] as int?);

  String? get otherExperienceType => (_$data['otherExperienceType'] as String?);

  String? get qualification => (_$data['qualification'] as String?);

  int? get totalYearsOfExperience => (_$data['totalYearsOfExperience'] as int?);

  Enum$ExperienceTypeEnum? get typeOfExperience =>
      (_$data['typeOfExperience'] as Enum$ExperienceTypeEnum?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('name')) {
      final l$name = name;
      result$data['name'] = l$name;
    }
    if (_$data.containsKey('numberOfYearsAssociated')) {
      final l$numberOfYearsAssociated = numberOfYearsAssociated;
      result$data['numberOfYearsAssociated'] = l$numberOfYearsAssociated;
    }
    if (_$data.containsKey('otherExperienceType')) {
      final l$otherExperienceType = otherExperienceType;
      result$data['otherExperienceType'] = l$otherExperienceType;
    }
    if (_$data.containsKey('qualification')) {
      final l$qualification = qualification;
      result$data['qualification'] = l$qualification;
    }
    if (_$data.containsKey('totalYearsOfExperience')) {
      final l$totalYearsOfExperience = totalYearsOfExperience;
      result$data['totalYearsOfExperience'] = l$totalYearsOfExperience;
    }
    if (_$data.containsKey('typeOfExperience')) {
      final l$typeOfExperience = typeOfExperience;
      result$data['typeOfExperience'] = l$typeOfExperience == null
          ? null
          : toJson$Enum$ExperienceTypeEnum(l$typeOfExperience);
    }
    return result$data;
  }

  CopyWith$Input$CEOProfileSubmissionInput<Input$CEOProfileSubmissionInput>
      get copyWith => CopyWith$Input$CEOProfileSubmissionInput(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$CEOProfileSubmissionInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (_$data.containsKey('name') != other._$data.containsKey('name')) {
      return false;
    }
    if (l$name != lOther$name) {
      return false;
    }
    final l$numberOfYearsAssociated = numberOfYearsAssociated;
    final lOther$numberOfYearsAssociated = other.numberOfYearsAssociated;
    if (_$data.containsKey('numberOfYearsAssociated') !=
        other._$data.containsKey('numberOfYearsAssociated')) {
      return false;
    }
    if (l$numberOfYearsAssociated != lOther$numberOfYearsAssociated) {
      return false;
    }
    final l$otherExperienceType = otherExperienceType;
    final lOther$otherExperienceType = other.otherExperienceType;
    if (_$data.containsKey('otherExperienceType') !=
        other._$data.containsKey('otherExperienceType')) {
      return false;
    }
    if (l$otherExperienceType != lOther$otherExperienceType) {
      return false;
    }
    final l$qualification = qualification;
    final lOther$qualification = other.qualification;
    if (_$data.containsKey('qualification') !=
        other._$data.containsKey('qualification')) {
      return false;
    }
    if (l$qualification != lOther$qualification) {
      return false;
    }
    final l$totalYearsOfExperience = totalYearsOfExperience;
    final lOther$totalYearsOfExperience = other.totalYearsOfExperience;
    if (_$data.containsKey('totalYearsOfExperience') !=
        other._$data.containsKey('totalYearsOfExperience')) {
      return false;
    }
    if (l$totalYearsOfExperience != lOther$totalYearsOfExperience) {
      return false;
    }
    final l$typeOfExperience = typeOfExperience;
    final lOther$typeOfExperience = other.typeOfExperience;
    if (_$data.containsKey('typeOfExperience') !=
        other._$data.containsKey('typeOfExperience')) {
      return false;
    }
    if (l$typeOfExperience != lOther$typeOfExperience) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$numberOfYearsAssociated = numberOfYearsAssociated;
    final l$otherExperienceType = otherExperienceType;
    final l$qualification = qualification;
    final l$totalYearsOfExperience = totalYearsOfExperience;
    final l$typeOfExperience = typeOfExperience;
    return Object.hashAll([
      _$data.containsKey('name') ? l$name : const {},
      _$data.containsKey('numberOfYearsAssociated')
          ? l$numberOfYearsAssociated
          : const {},
      _$data.containsKey('otherExperienceType')
          ? l$otherExperienceType
          : const {},
      _$data.containsKey('qualification') ? l$qualification : const {},
      _$data.containsKey('totalYearsOfExperience')
          ? l$totalYearsOfExperience
          : const {},
      _$data.containsKey('typeOfExperience') ? l$typeOfExperience : const {},
    ]);
  }
}

abstract class CopyWith$Input$CEOProfileSubmissionInput<TRes> {
  factory CopyWith$Input$CEOProfileSubmissionInput(
    Input$CEOProfileSubmissionInput instance,
    TRes Function(Input$CEOProfileSubmissionInput) then,
  ) = _CopyWithImpl$Input$CEOProfileSubmissionInput;

  factory CopyWith$Input$CEOProfileSubmissionInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CEOProfileSubmissionInput;

  TRes call({
    String? name,
    int? numberOfYearsAssociated,
    String? otherExperienceType,
    String? qualification,
    int? totalYearsOfExperience,
    Enum$ExperienceTypeEnum? typeOfExperience,
  });
}

class _CopyWithImpl$Input$CEOProfileSubmissionInput<TRes>
    implements CopyWith$Input$CEOProfileSubmissionInput<TRes> {
  _CopyWithImpl$Input$CEOProfileSubmissionInput(
    this._instance,
    this._then,
  );

  final Input$CEOProfileSubmissionInput _instance;

  final TRes Function(Input$CEOProfileSubmissionInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? numberOfYearsAssociated = _undefined,
    Object? otherExperienceType = _undefined,
    Object? qualification = _undefined,
    Object? totalYearsOfExperience = _undefined,
    Object? typeOfExperience = _undefined,
  }) =>
      _then(Input$CEOProfileSubmissionInput._({
        ..._instance._$data,
        if (name != _undefined) 'name': (name as String?),
        if (numberOfYearsAssociated != _undefined)
          'numberOfYearsAssociated': (numberOfYearsAssociated as int?),
        if (otherExperienceType != _undefined)
          'otherExperienceType': (otherExperienceType as String?),
        if (qualification != _undefined)
          'qualification': (qualification as String?),
        if (totalYearsOfExperience != _undefined)
          'totalYearsOfExperience': (totalYearsOfExperience as int?),
        if (typeOfExperience != _undefined)
          'typeOfExperience': (typeOfExperience as Enum$ExperienceTypeEnum?),
      }));
}

class _CopyWithStubImpl$Input$CEOProfileSubmissionInput<TRes>
    implements CopyWith$Input$CEOProfileSubmissionInput<TRes> {
  _CopyWithStubImpl$Input$CEOProfileSubmissionInput(this._res);

  TRes _res;

  call({
    String? name,
    int? numberOfYearsAssociated,
    String? otherExperienceType,
    String? qualification,
    int? totalYearsOfExperience,
    Enum$ExperienceTypeEnum? typeOfExperience,
  }) =>
      _res;
}

class Input$ComplianceDetailsSubmissionInput {
  factory Input$ComplianceDetailsSubmissionInput({
    Enum$ActRegisteredTypeEnum? actUnderRegistered,
    String? commencementDate,
    String? commencementPlace,
    String? commencementRegNo,
    String? dateOfRegistration,
    String? gstDate,
    String? gstPlace,
    String? gstRegNo,
    String? incorporationDate,
    String? incorporationPlace,
    String? incorporationRegNo,
    String? permanentAccountNumber,
    String? placeOfRegistration,
    String? registrationNo,
    String? taxAccountNumber,
  }) =>
      Input$ComplianceDetailsSubmissionInput._({
        if (actUnderRegistered != null)
          r'actUnderRegistered': actUnderRegistered,
        if (commencementDate != null) r'commencementDate': commencementDate,
        if (commencementPlace != null) r'commencementPlace': commencementPlace,
        if (commencementRegNo != null) r'commencementRegNo': commencementRegNo,
        if (dateOfRegistration != null)
          r'dateOfRegistration': dateOfRegistration,
        if (gstDate != null) r'gstDate': gstDate,
        if (gstPlace != null) r'gstPlace': gstPlace,
        if (gstRegNo != null) r'gstRegNo': gstRegNo,
        if (incorporationDate != null) r'incorporationDate': incorporationDate,
        if (incorporationPlace != null)
          r'incorporationPlace': incorporationPlace,
        if (incorporationRegNo != null)
          r'incorporationRegNo': incorporationRegNo,
        if (permanentAccountNumber != null)
          r'permanentAccountNumber': permanentAccountNumber,
        if (placeOfRegistration != null)
          r'placeOfRegistration': placeOfRegistration,
        if (registrationNo != null) r'registrationNo': registrationNo,
        if (taxAccountNumber != null) r'taxAccountNumber': taxAccountNumber,
      });

  Input$ComplianceDetailsSubmissionInput._(this._$data);

  factory Input$ComplianceDetailsSubmissionInput.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('actUnderRegistered')) {
      final l$actUnderRegistered = data['actUnderRegistered'];
      result$data['actUnderRegistered'] = l$actUnderRegistered == null
          ? null
          : fromJson$Enum$ActRegisteredTypeEnum(
              (l$actUnderRegistered as String));
    }
    if (data.containsKey('commencementDate')) {
      final l$commencementDate = data['commencementDate'];
      result$data['commencementDate'] = (l$commencementDate as String?);
    }
    if (data.containsKey('commencementPlace')) {
      final l$commencementPlace = data['commencementPlace'];
      result$data['commencementPlace'] = (l$commencementPlace as String?);
    }
    if (data.containsKey('commencementRegNo')) {
      final l$commencementRegNo = data['commencementRegNo'];
      result$data['commencementRegNo'] = (l$commencementRegNo as String?);
    }
    if (data.containsKey('dateOfRegistration')) {
      final l$dateOfRegistration = data['dateOfRegistration'];
      result$data['dateOfRegistration'] = (l$dateOfRegistration as String?);
    }
    if (data.containsKey('gstDate')) {
      final l$gstDate = data['gstDate'];
      result$data['gstDate'] = (l$gstDate as String?);
    }
    if (data.containsKey('gstPlace')) {
      final l$gstPlace = data['gstPlace'];
      result$data['gstPlace'] = (l$gstPlace as String?);
    }
    if (data.containsKey('gstRegNo')) {
      final l$gstRegNo = data['gstRegNo'];
      result$data['gstRegNo'] = (l$gstRegNo as String?);
    }
    if (data.containsKey('incorporationDate')) {
      final l$incorporationDate = data['incorporationDate'];
      result$data['incorporationDate'] = (l$incorporationDate as String?);
    }
    if (data.containsKey('incorporationPlace')) {
      final l$incorporationPlace = data['incorporationPlace'];
      result$data['incorporationPlace'] = (l$incorporationPlace as String?);
    }
    if (data.containsKey('incorporationRegNo')) {
      final l$incorporationRegNo = data['incorporationRegNo'];
      result$data['incorporationRegNo'] = (l$incorporationRegNo as String?);
    }
    if (data.containsKey('permanentAccountNumber')) {
      final l$permanentAccountNumber = data['permanentAccountNumber'];
      result$data['permanentAccountNumber'] =
          (l$permanentAccountNumber as String?);
    }
    if (data.containsKey('placeOfRegistration')) {
      final l$placeOfRegistration = data['placeOfRegistration'];
      result$data['placeOfRegistration'] = (l$placeOfRegistration as String?);
    }
    if (data.containsKey('registrationNo')) {
      final l$registrationNo = data['registrationNo'];
      result$data['registrationNo'] = (l$registrationNo as String?);
    }
    if (data.containsKey('taxAccountNumber')) {
      final l$taxAccountNumber = data['taxAccountNumber'];
      result$data['taxAccountNumber'] = (l$taxAccountNumber as String?);
    }
    return Input$ComplianceDetailsSubmissionInput._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$ActRegisteredTypeEnum? get actUnderRegistered =>
      (_$data['actUnderRegistered'] as Enum$ActRegisteredTypeEnum?);

  String? get commencementDate => (_$data['commencementDate'] as String?);

  String? get commencementPlace => (_$data['commencementPlace'] as String?);

  String? get commencementRegNo => (_$data['commencementRegNo'] as String?);

  String? get dateOfRegistration => (_$data['dateOfRegistration'] as String?);

  String? get gstDate => (_$data['gstDate'] as String?);

  String? get gstPlace => (_$data['gstPlace'] as String?);

  String? get gstRegNo => (_$data['gstRegNo'] as String?);

  String? get incorporationDate => (_$data['incorporationDate'] as String?);

  String? get incorporationPlace => (_$data['incorporationPlace'] as String?);

  String? get incorporationRegNo => (_$data['incorporationRegNo'] as String?);

  String? get permanentAccountNumber =>
      (_$data['permanentAccountNumber'] as String?);

  String? get placeOfRegistration => (_$data['placeOfRegistration'] as String?);

  String? get registrationNo => (_$data['registrationNo'] as String?);

  String? get taxAccountNumber => (_$data['taxAccountNumber'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('actUnderRegistered')) {
      final l$actUnderRegistered = actUnderRegistered;
      result$data['actUnderRegistered'] = l$actUnderRegistered == null
          ? null
          : toJson$Enum$ActRegisteredTypeEnum(l$actUnderRegistered);
    }
    if (_$data.containsKey('commencementDate')) {
      final l$commencementDate = commencementDate;
      result$data['commencementDate'] = l$commencementDate;
    }
    if (_$data.containsKey('commencementPlace')) {
      final l$commencementPlace = commencementPlace;
      result$data['commencementPlace'] = l$commencementPlace;
    }
    if (_$data.containsKey('commencementRegNo')) {
      final l$commencementRegNo = commencementRegNo;
      result$data['commencementRegNo'] = l$commencementRegNo;
    }
    if (_$data.containsKey('dateOfRegistration')) {
      final l$dateOfRegistration = dateOfRegistration;
      result$data['dateOfRegistration'] = l$dateOfRegistration;
    }
    if (_$data.containsKey('gstDate')) {
      final l$gstDate = gstDate;
      result$data['gstDate'] = l$gstDate;
    }
    if (_$data.containsKey('gstPlace')) {
      final l$gstPlace = gstPlace;
      result$data['gstPlace'] = l$gstPlace;
    }
    if (_$data.containsKey('gstRegNo')) {
      final l$gstRegNo = gstRegNo;
      result$data['gstRegNo'] = l$gstRegNo;
    }
    if (_$data.containsKey('incorporationDate')) {
      final l$incorporationDate = incorporationDate;
      result$data['incorporationDate'] = l$incorporationDate;
    }
    if (_$data.containsKey('incorporationPlace')) {
      final l$incorporationPlace = incorporationPlace;
      result$data['incorporationPlace'] = l$incorporationPlace;
    }
    if (_$data.containsKey('incorporationRegNo')) {
      final l$incorporationRegNo = incorporationRegNo;
      result$data['incorporationRegNo'] = l$incorporationRegNo;
    }
    if (_$data.containsKey('permanentAccountNumber')) {
      final l$permanentAccountNumber = permanentAccountNumber;
      result$data['permanentAccountNumber'] = l$permanentAccountNumber;
    }
    if (_$data.containsKey('placeOfRegistration')) {
      final l$placeOfRegistration = placeOfRegistration;
      result$data['placeOfRegistration'] = l$placeOfRegistration;
    }
    if (_$data.containsKey('registrationNo')) {
      final l$registrationNo = registrationNo;
      result$data['registrationNo'] = l$registrationNo;
    }
    if (_$data.containsKey('taxAccountNumber')) {
      final l$taxAccountNumber = taxAccountNumber;
      result$data['taxAccountNumber'] = l$taxAccountNumber;
    }
    return result$data;
  }

  CopyWith$Input$ComplianceDetailsSubmissionInput<
          Input$ComplianceDetailsSubmissionInput>
      get copyWith => CopyWith$Input$ComplianceDetailsSubmissionInput(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$ComplianceDetailsSubmissionInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$actUnderRegistered = actUnderRegistered;
    final lOther$actUnderRegistered = other.actUnderRegistered;
    if (_$data.containsKey('actUnderRegistered') !=
        other._$data.containsKey('actUnderRegistered')) {
      return false;
    }
    if (l$actUnderRegistered != lOther$actUnderRegistered) {
      return false;
    }
    final l$commencementDate = commencementDate;
    final lOther$commencementDate = other.commencementDate;
    if (_$data.containsKey('commencementDate') !=
        other._$data.containsKey('commencementDate')) {
      return false;
    }
    if (l$commencementDate != lOther$commencementDate) {
      return false;
    }
    final l$commencementPlace = commencementPlace;
    final lOther$commencementPlace = other.commencementPlace;
    if (_$data.containsKey('commencementPlace') !=
        other._$data.containsKey('commencementPlace')) {
      return false;
    }
    if (l$commencementPlace != lOther$commencementPlace) {
      return false;
    }
    final l$commencementRegNo = commencementRegNo;
    final lOther$commencementRegNo = other.commencementRegNo;
    if (_$data.containsKey('commencementRegNo') !=
        other._$data.containsKey('commencementRegNo')) {
      return false;
    }
    if (l$commencementRegNo != lOther$commencementRegNo) {
      return false;
    }
    final l$dateOfRegistration = dateOfRegistration;
    final lOther$dateOfRegistration = other.dateOfRegistration;
    if (_$data.containsKey('dateOfRegistration') !=
        other._$data.containsKey('dateOfRegistration')) {
      return false;
    }
    if (l$dateOfRegistration != lOther$dateOfRegistration) {
      return false;
    }
    final l$gstDate = gstDate;
    final lOther$gstDate = other.gstDate;
    if (_$data.containsKey('gstDate') != other._$data.containsKey('gstDate')) {
      return false;
    }
    if (l$gstDate != lOther$gstDate) {
      return false;
    }
    final l$gstPlace = gstPlace;
    final lOther$gstPlace = other.gstPlace;
    if (_$data.containsKey('gstPlace') !=
        other._$data.containsKey('gstPlace')) {
      return false;
    }
    if (l$gstPlace != lOther$gstPlace) {
      return false;
    }
    final l$gstRegNo = gstRegNo;
    final lOther$gstRegNo = other.gstRegNo;
    if (_$data.containsKey('gstRegNo') !=
        other._$data.containsKey('gstRegNo')) {
      return false;
    }
    if (l$gstRegNo != lOther$gstRegNo) {
      return false;
    }
    final l$incorporationDate = incorporationDate;
    final lOther$incorporationDate = other.incorporationDate;
    if (_$data.containsKey('incorporationDate') !=
        other._$data.containsKey('incorporationDate')) {
      return false;
    }
    if (l$incorporationDate != lOther$incorporationDate) {
      return false;
    }
    final l$incorporationPlace = incorporationPlace;
    final lOther$incorporationPlace = other.incorporationPlace;
    if (_$data.containsKey('incorporationPlace') !=
        other._$data.containsKey('incorporationPlace')) {
      return false;
    }
    if (l$incorporationPlace != lOther$incorporationPlace) {
      return false;
    }
    final l$incorporationRegNo = incorporationRegNo;
    final lOther$incorporationRegNo = other.incorporationRegNo;
    if (_$data.containsKey('incorporationRegNo') !=
        other._$data.containsKey('incorporationRegNo')) {
      return false;
    }
    if (l$incorporationRegNo != lOther$incorporationRegNo) {
      return false;
    }
    final l$permanentAccountNumber = permanentAccountNumber;
    final lOther$permanentAccountNumber = other.permanentAccountNumber;
    if (_$data.containsKey('permanentAccountNumber') !=
        other._$data.containsKey('permanentAccountNumber')) {
      return false;
    }
    if (l$permanentAccountNumber != lOther$permanentAccountNumber) {
      return false;
    }
    final l$placeOfRegistration = placeOfRegistration;
    final lOther$placeOfRegistration = other.placeOfRegistration;
    if (_$data.containsKey('placeOfRegistration') !=
        other._$data.containsKey('placeOfRegistration')) {
      return false;
    }
    if (l$placeOfRegistration != lOther$placeOfRegistration) {
      return false;
    }
    final l$registrationNo = registrationNo;
    final lOther$registrationNo = other.registrationNo;
    if (_$data.containsKey('registrationNo') !=
        other._$data.containsKey('registrationNo')) {
      return false;
    }
    if (l$registrationNo != lOther$registrationNo) {
      return false;
    }
    final l$taxAccountNumber = taxAccountNumber;
    final lOther$taxAccountNumber = other.taxAccountNumber;
    if (_$data.containsKey('taxAccountNumber') !=
        other._$data.containsKey('taxAccountNumber')) {
      return false;
    }
    if (l$taxAccountNumber != lOther$taxAccountNumber) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$actUnderRegistered = actUnderRegistered;
    final l$commencementDate = commencementDate;
    final l$commencementPlace = commencementPlace;
    final l$commencementRegNo = commencementRegNo;
    final l$dateOfRegistration = dateOfRegistration;
    final l$gstDate = gstDate;
    final l$gstPlace = gstPlace;
    final l$gstRegNo = gstRegNo;
    final l$incorporationDate = incorporationDate;
    final l$incorporationPlace = incorporationPlace;
    final l$incorporationRegNo = incorporationRegNo;
    final l$permanentAccountNumber = permanentAccountNumber;
    final l$placeOfRegistration = placeOfRegistration;
    final l$registrationNo = registrationNo;
    final l$taxAccountNumber = taxAccountNumber;
    return Object.hashAll([
      _$data.containsKey('actUnderRegistered')
          ? l$actUnderRegistered
          : const {},
      _$data.containsKey('commencementDate') ? l$commencementDate : const {},
      _$data.containsKey('commencementPlace') ? l$commencementPlace : const {},
      _$data.containsKey('commencementRegNo') ? l$commencementRegNo : const {},
      _$data.containsKey('dateOfRegistration')
          ? l$dateOfRegistration
          : const {},
      _$data.containsKey('gstDate') ? l$gstDate : const {},
      _$data.containsKey('gstPlace') ? l$gstPlace : const {},
      _$data.containsKey('gstRegNo') ? l$gstRegNo : const {},
      _$data.containsKey('incorporationDate') ? l$incorporationDate : const {},
      _$data.containsKey('incorporationPlace')
          ? l$incorporationPlace
          : const {},
      _$data.containsKey('incorporationRegNo')
          ? l$incorporationRegNo
          : const {},
      _$data.containsKey('permanentAccountNumber')
          ? l$permanentAccountNumber
          : const {},
      _$data.containsKey('placeOfRegistration')
          ? l$placeOfRegistration
          : const {},
      _$data.containsKey('registrationNo') ? l$registrationNo : const {},
      _$data.containsKey('taxAccountNumber') ? l$taxAccountNumber : const {},
    ]);
  }
}

abstract class CopyWith$Input$ComplianceDetailsSubmissionInput<TRes> {
  factory CopyWith$Input$ComplianceDetailsSubmissionInput(
    Input$ComplianceDetailsSubmissionInput instance,
    TRes Function(Input$ComplianceDetailsSubmissionInput) then,
  ) = _CopyWithImpl$Input$ComplianceDetailsSubmissionInput;

  factory CopyWith$Input$ComplianceDetailsSubmissionInput.stub(TRes res) =
      _CopyWithStubImpl$Input$ComplianceDetailsSubmissionInput;

  TRes call({
    Enum$ActRegisteredTypeEnum? actUnderRegistered,
    String? commencementDate,
    String? commencementPlace,
    String? commencementRegNo,
    String? dateOfRegistration,
    String? gstDate,
    String? gstPlace,
    String? gstRegNo,
    String? incorporationDate,
    String? incorporationPlace,
    String? incorporationRegNo,
    String? permanentAccountNumber,
    String? placeOfRegistration,
    String? registrationNo,
    String? taxAccountNumber,
  });
}

class _CopyWithImpl$Input$ComplianceDetailsSubmissionInput<TRes>
    implements CopyWith$Input$ComplianceDetailsSubmissionInput<TRes> {
  _CopyWithImpl$Input$ComplianceDetailsSubmissionInput(
    this._instance,
    this._then,
  );

  final Input$ComplianceDetailsSubmissionInput _instance;

  final TRes Function(Input$ComplianceDetailsSubmissionInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? actUnderRegistered = _undefined,
    Object? commencementDate = _undefined,
    Object? commencementPlace = _undefined,
    Object? commencementRegNo = _undefined,
    Object? dateOfRegistration = _undefined,
    Object? gstDate = _undefined,
    Object? gstPlace = _undefined,
    Object? gstRegNo = _undefined,
    Object? incorporationDate = _undefined,
    Object? incorporationPlace = _undefined,
    Object? incorporationRegNo = _undefined,
    Object? permanentAccountNumber = _undefined,
    Object? placeOfRegistration = _undefined,
    Object? registrationNo = _undefined,
    Object? taxAccountNumber = _undefined,
  }) =>
      _then(Input$ComplianceDetailsSubmissionInput._({
        ..._instance._$data,
        if (actUnderRegistered != _undefined)
          'actUnderRegistered':
              (actUnderRegistered as Enum$ActRegisteredTypeEnum?),
        if (commencementDate != _undefined)
          'commencementDate': (commencementDate as String?),
        if (commencementPlace != _undefined)
          'commencementPlace': (commencementPlace as String?),
        if (commencementRegNo != _undefined)
          'commencementRegNo': (commencementRegNo as String?),
        if (dateOfRegistration != _undefined)
          'dateOfRegistration': (dateOfRegistration as String?),
        if (gstDate != _undefined) 'gstDate': (gstDate as String?),
        if (gstPlace != _undefined) 'gstPlace': (gstPlace as String?),
        if (gstRegNo != _undefined) 'gstRegNo': (gstRegNo as String?),
        if (incorporationDate != _undefined)
          'incorporationDate': (incorporationDate as String?),
        if (incorporationPlace != _undefined)
          'incorporationPlace': (incorporationPlace as String?),
        if (incorporationRegNo != _undefined)
          'incorporationRegNo': (incorporationRegNo as String?),
        if (permanentAccountNumber != _undefined)
          'permanentAccountNumber': (permanentAccountNumber as String?),
        if (placeOfRegistration != _undefined)
          'placeOfRegistration': (placeOfRegistration as String?),
        if (registrationNo != _undefined)
          'registrationNo': (registrationNo as String?),
        if (taxAccountNumber != _undefined)
          'taxAccountNumber': (taxAccountNumber as String?),
      }));
}

class _CopyWithStubImpl$Input$ComplianceDetailsSubmissionInput<TRes>
    implements CopyWith$Input$ComplianceDetailsSubmissionInput<TRes> {
  _CopyWithStubImpl$Input$ComplianceDetailsSubmissionInput(this._res);

  TRes _res;

  call({
    Enum$ActRegisteredTypeEnum? actUnderRegistered,
    String? commencementDate,
    String? commencementPlace,
    String? commencementRegNo,
    String? dateOfRegistration,
    String? gstDate,
    String? gstPlace,
    String? gstRegNo,
    String? incorporationDate,
    String? incorporationPlace,
    String? incorporationRegNo,
    String? permanentAccountNumber,
    String? placeOfRegistration,
    String? registrationNo,
    String? taxAccountNumber,
  }) =>
      _res;
}

class Input$FPODetailsSubmissionInput {
  factory Input$FPODetailsSubmissionInput({
    double? ageOfFpoYears,
    String? dateOfCommencement,
    String? dateOfIncorporation,
    bool? dealsThroughPgsFigs,
    String? district,
    int? farmersTransacted,
    String? grantMakingOrganization,
    String? nameOfProducerOrganization,
    int? numPgsFigs,
    String? otherPromotingAgencyType,
    String? promotingAgencyName,
    bool? receivedGrants,
    String? registeredAddress,
    int? sizeOfFpoFy2122,
    int? sizeOfFpoFy2223,
    int? sizeOfFpoFy2324,
    String? state,
    bool? supportedByPromotingAgency,
    int? targetSizeOfFpo,
    Enum$FPOTypeEnum? typeOfFpo,
    Enum$ProducerOrgTypeEnum? typeOfProducerOrganization,
    Enum$PromotingAgencyTypeEnum? typeOfPromotingAgency,
    int? womenMembers,
  }) =>
      Input$FPODetailsSubmissionInput._({
        if (ageOfFpoYears != null) r'ageOfFpoYears': ageOfFpoYears,
        if (dateOfCommencement != null)
          r'dateOfCommencement': dateOfCommencement,
        if (dateOfIncorporation != null)
          r'dateOfIncorporation': dateOfIncorporation,
        if (dealsThroughPgsFigs != null)
          r'dealsThroughPgsFigs': dealsThroughPgsFigs,
        if (district != null) r'district': district,
        if (farmersTransacted != null) r'farmersTransacted': farmersTransacted,
        if (grantMakingOrganization != null)
          r'grantMakingOrganization': grantMakingOrganization,
        if (nameOfProducerOrganization != null)
          r'nameOfProducerOrganization': nameOfProducerOrganization,
        if (numPgsFigs != null) r'numPgsFigs': numPgsFigs,
        if (otherPromotingAgencyType != null)
          r'otherPromotingAgencyType': otherPromotingAgencyType,
        if (promotingAgencyName != null)
          r'promotingAgencyName': promotingAgencyName,
        if (receivedGrants != null) r'receivedGrants': receivedGrants,
        if (registeredAddress != null) r'registeredAddress': registeredAddress,
        if (sizeOfFpoFy2122 != null) r'sizeOfFpoFy2122': sizeOfFpoFy2122,
        if (sizeOfFpoFy2223 != null) r'sizeOfFpoFy2223': sizeOfFpoFy2223,
        if (sizeOfFpoFy2324 != null) r'sizeOfFpoFy2324': sizeOfFpoFy2324,
        if (state != null) r'state': state,
        if (supportedByPromotingAgency != null)
          r'supportedByPromotingAgency': supportedByPromotingAgency,
        if (targetSizeOfFpo != null) r'targetSizeOfFpo': targetSizeOfFpo,
        if (typeOfFpo != null) r'typeOfFpo': typeOfFpo,
        if (typeOfProducerOrganization != null)
          r'typeOfProducerOrganization': typeOfProducerOrganization,
        if (typeOfPromotingAgency != null)
          r'typeOfPromotingAgency': typeOfPromotingAgency,
        if (womenMembers != null) r'womenMembers': womenMembers,
      });

  Input$FPODetailsSubmissionInput._(this._$data);

  factory Input$FPODetailsSubmissionInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('ageOfFpoYears')) {
      final l$ageOfFpoYears = data['ageOfFpoYears'];
      result$data['ageOfFpoYears'] = (l$ageOfFpoYears as num?)?.toDouble();
    }
    if (data.containsKey('dateOfCommencement')) {
      final l$dateOfCommencement = data['dateOfCommencement'];
      result$data['dateOfCommencement'] = (l$dateOfCommencement as String?);
    }
    if (data.containsKey('dateOfIncorporation')) {
      final l$dateOfIncorporation = data['dateOfIncorporation'];
      result$data['dateOfIncorporation'] = (l$dateOfIncorporation as String?);
    }
    if (data.containsKey('dealsThroughPgsFigs')) {
      final l$dealsThroughPgsFigs = data['dealsThroughPgsFigs'];
      result$data['dealsThroughPgsFigs'] = (l$dealsThroughPgsFigs as bool?);
    }
    if (data.containsKey('district')) {
      final l$district = data['district'];
      result$data['district'] = (l$district as String?);
    }
    if (data.containsKey('farmersTransacted')) {
      final l$farmersTransacted = data['farmersTransacted'];
      result$data['farmersTransacted'] = (l$farmersTransacted as int?);
    }
    if (data.containsKey('grantMakingOrganization')) {
      final l$grantMakingOrganization = data['grantMakingOrganization'];
      result$data['grantMakingOrganization'] =
          (l$grantMakingOrganization as String?);
    }
    if (data.containsKey('nameOfProducerOrganization')) {
      final l$nameOfProducerOrganization = data['nameOfProducerOrganization'];
      result$data['nameOfProducerOrganization'] =
          (l$nameOfProducerOrganization as String?);
    }
    if (data.containsKey('numPgsFigs')) {
      final l$numPgsFigs = data['numPgsFigs'];
      result$data['numPgsFigs'] = (l$numPgsFigs as int?);
    }
    if (data.containsKey('otherPromotingAgencyType')) {
      final l$otherPromotingAgencyType = data['otherPromotingAgencyType'];
      result$data['otherPromotingAgencyType'] =
          (l$otherPromotingAgencyType as String?);
    }
    if (data.containsKey('promotingAgencyName')) {
      final l$promotingAgencyName = data['promotingAgencyName'];
      result$data['promotingAgencyName'] = (l$promotingAgencyName as String?);
    }
    if (data.containsKey('receivedGrants')) {
      final l$receivedGrants = data['receivedGrants'];
      result$data['receivedGrants'] = (l$receivedGrants as bool?);
    }
    if (data.containsKey('registeredAddress')) {
      final l$registeredAddress = data['registeredAddress'];
      result$data['registeredAddress'] = (l$registeredAddress as String?);
    }
    if (data.containsKey('sizeOfFpoFy2122')) {
      final l$sizeOfFpoFy2122 = data['sizeOfFpoFy2122'];
      result$data['sizeOfFpoFy2122'] = (l$sizeOfFpoFy2122 as int?);
    }
    if (data.containsKey('sizeOfFpoFy2223')) {
      final l$sizeOfFpoFy2223 = data['sizeOfFpoFy2223'];
      result$data['sizeOfFpoFy2223'] = (l$sizeOfFpoFy2223 as int?);
    }
    if (data.containsKey('sizeOfFpoFy2324')) {
      final l$sizeOfFpoFy2324 = data['sizeOfFpoFy2324'];
      result$data['sizeOfFpoFy2324'] = (l$sizeOfFpoFy2324 as int?);
    }
    if (data.containsKey('state')) {
      final l$state = data['state'];
      result$data['state'] = (l$state as String?);
    }
    if (data.containsKey('supportedByPromotingAgency')) {
      final l$supportedByPromotingAgency = data['supportedByPromotingAgency'];
      result$data['supportedByPromotingAgency'] =
          (l$supportedByPromotingAgency as bool?);
    }
    if (data.containsKey('targetSizeOfFpo')) {
      final l$targetSizeOfFpo = data['targetSizeOfFpo'];
      result$data['targetSizeOfFpo'] = (l$targetSizeOfFpo as int?);
    }
    if (data.containsKey('typeOfFpo')) {
      final l$typeOfFpo = data['typeOfFpo'];
      result$data['typeOfFpo'] = l$typeOfFpo == null
          ? null
          : fromJson$Enum$FPOTypeEnum((l$typeOfFpo as String));
    }
    if (data.containsKey('typeOfProducerOrganization')) {
      final l$typeOfProducerOrganization = data['typeOfProducerOrganization'];
      result$data['typeOfProducerOrganization'] =
          l$typeOfProducerOrganization == null
              ? null
              : fromJson$Enum$ProducerOrgTypeEnum(
                  (l$typeOfProducerOrganization as String));
    }
    if (data.containsKey('typeOfPromotingAgency')) {
      final l$typeOfPromotingAgency = data['typeOfPromotingAgency'];
      result$data['typeOfPromotingAgency'] = l$typeOfPromotingAgency == null
          ? null
          : fromJson$Enum$PromotingAgencyTypeEnum(
              (l$typeOfPromotingAgency as String));
    }
    if (data.containsKey('womenMembers')) {
      final l$womenMembers = data['womenMembers'];
      result$data['womenMembers'] = (l$womenMembers as int?);
    }
    return Input$FPODetailsSubmissionInput._(result$data);
  }

  Map<String, dynamic> _$data;

  double? get ageOfFpoYears => (_$data['ageOfFpoYears'] as double?);

  String? get dateOfCommencement => (_$data['dateOfCommencement'] as String?);

  String? get dateOfIncorporation => (_$data['dateOfIncorporation'] as String?);

  bool? get dealsThroughPgsFigs => (_$data['dealsThroughPgsFigs'] as bool?);

  String? get district => (_$data['district'] as String?);

  int? get farmersTransacted => (_$data['farmersTransacted'] as int?);

  String? get grantMakingOrganization =>
      (_$data['grantMakingOrganization'] as String?);

  String? get nameOfProducerOrganization =>
      (_$data['nameOfProducerOrganization'] as String?);

  int? get numPgsFigs => (_$data['numPgsFigs'] as int?);

  String? get otherPromotingAgencyType =>
      (_$data['otherPromotingAgencyType'] as String?);

  String? get promotingAgencyName => (_$data['promotingAgencyName'] as String?);

  bool? get receivedGrants => (_$data['receivedGrants'] as bool?);

  String? get registeredAddress => (_$data['registeredAddress'] as String?);

  int? get sizeOfFpoFy2122 => (_$data['sizeOfFpoFy2122'] as int?);

  int? get sizeOfFpoFy2223 => (_$data['sizeOfFpoFy2223'] as int?);

  int? get sizeOfFpoFy2324 => (_$data['sizeOfFpoFy2324'] as int?);

  String? get state => (_$data['state'] as String?);

  bool? get supportedByPromotingAgency =>
      (_$data['supportedByPromotingAgency'] as bool?);

  int? get targetSizeOfFpo => (_$data['targetSizeOfFpo'] as int?);

  Enum$FPOTypeEnum? get typeOfFpo => (_$data['typeOfFpo'] as Enum$FPOTypeEnum?);

  Enum$ProducerOrgTypeEnum? get typeOfProducerOrganization =>
      (_$data['typeOfProducerOrganization'] as Enum$ProducerOrgTypeEnum?);

  Enum$PromotingAgencyTypeEnum? get typeOfPromotingAgency =>
      (_$data['typeOfPromotingAgency'] as Enum$PromotingAgencyTypeEnum?);

  int? get womenMembers => (_$data['womenMembers'] as int?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('ageOfFpoYears')) {
      final l$ageOfFpoYears = ageOfFpoYears;
      result$data['ageOfFpoYears'] = l$ageOfFpoYears;
    }
    if (_$data.containsKey('dateOfCommencement')) {
      final l$dateOfCommencement = dateOfCommencement;
      result$data['dateOfCommencement'] = l$dateOfCommencement;
    }
    if (_$data.containsKey('dateOfIncorporation')) {
      final l$dateOfIncorporation = dateOfIncorporation;
      result$data['dateOfIncorporation'] = l$dateOfIncorporation;
    }
    if (_$data.containsKey('dealsThroughPgsFigs')) {
      final l$dealsThroughPgsFigs = dealsThroughPgsFigs;
      result$data['dealsThroughPgsFigs'] = l$dealsThroughPgsFigs;
    }
    if (_$data.containsKey('district')) {
      final l$district = district;
      result$data['district'] = l$district;
    }
    if (_$data.containsKey('farmersTransacted')) {
      final l$farmersTransacted = farmersTransacted;
      result$data['farmersTransacted'] = l$farmersTransacted;
    }
    if (_$data.containsKey('grantMakingOrganization')) {
      final l$grantMakingOrganization = grantMakingOrganization;
      result$data['grantMakingOrganization'] = l$grantMakingOrganization;
    }
    if (_$data.containsKey('nameOfProducerOrganization')) {
      final l$nameOfProducerOrganization = nameOfProducerOrganization;
      result$data['nameOfProducerOrganization'] = l$nameOfProducerOrganization;
    }
    if (_$data.containsKey('numPgsFigs')) {
      final l$numPgsFigs = numPgsFigs;
      result$data['numPgsFigs'] = l$numPgsFigs;
    }
    if (_$data.containsKey('otherPromotingAgencyType')) {
      final l$otherPromotingAgencyType = otherPromotingAgencyType;
      result$data['otherPromotingAgencyType'] = l$otherPromotingAgencyType;
    }
    if (_$data.containsKey('promotingAgencyName')) {
      final l$promotingAgencyName = promotingAgencyName;
      result$data['promotingAgencyName'] = l$promotingAgencyName;
    }
    if (_$data.containsKey('receivedGrants')) {
      final l$receivedGrants = receivedGrants;
      result$data['receivedGrants'] = l$receivedGrants;
    }
    if (_$data.containsKey('registeredAddress')) {
      final l$registeredAddress = registeredAddress;
      result$data['registeredAddress'] = l$registeredAddress;
    }
    if (_$data.containsKey('sizeOfFpoFy2122')) {
      final l$sizeOfFpoFy2122 = sizeOfFpoFy2122;
      result$data['sizeOfFpoFy2122'] = l$sizeOfFpoFy2122;
    }
    if (_$data.containsKey('sizeOfFpoFy2223')) {
      final l$sizeOfFpoFy2223 = sizeOfFpoFy2223;
      result$data['sizeOfFpoFy2223'] = l$sizeOfFpoFy2223;
    }
    if (_$data.containsKey('sizeOfFpoFy2324')) {
      final l$sizeOfFpoFy2324 = sizeOfFpoFy2324;
      result$data['sizeOfFpoFy2324'] = l$sizeOfFpoFy2324;
    }
    if (_$data.containsKey('state')) {
      final l$state = state;
      result$data['state'] = l$state;
    }
    if (_$data.containsKey('supportedByPromotingAgency')) {
      final l$supportedByPromotingAgency = supportedByPromotingAgency;
      result$data['supportedByPromotingAgency'] = l$supportedByPromotingAgency;
    }
    if (_$data.containsKey('targetSizeOfFpo')) {
      final l$targetSizeOfFpo = targetSizeOfFpo;
      result$data['targetSizeOfFpo'] = l$targetSizeOfFpo;
    }
    if (_$data.containsKey('typeOfFpo')) {
      final l$typeOfFpo = typeOfFpo;
      result$data['typeOfFpo'] =
          l$typeOfFpo == null ? null : toJson$Enum$FPOTypeEnum(l$typeOfFpo);
    }
    if (_$data.containsKey('typeOfProducerOrganization')) {
      final l$typeOfProducerOrganization = typeOfProducerOrganization;
      result$data['typeOfProducerOrganization'] =
          l$typeOfProducerOrganization == null
              ? null
              : toJson$Enum$ProducerOrgTypeEnum(l$typeOfProducerOrganization);
    }
    if (_$data.containsKey('typeOfPromotingAgency')) {
      final l$typeOfPromotingAgency = typeOfPromotingAgency;
      result$data['typeOfPromotingAgency'] = l$typeOfPromotingAgency == null
          ? null
          : toJson$Enum$PromotingAgencyTypeEnum(l$typeOfPromotingAgency);
    }
    if (_$data.containsKey('womenMembers')) {
      final l$womenMembers = womenMembers;
      result$data['womenMembers'] = l$womenMembers;
    }
    return result$data;
  }

  CopyWith$Input$FPODetailsSubmissionInput<Input$FPODetailsSubmissionInput>
      get copyWith => CopyWith$Input$FPODetailsSubmissionInput(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$FPODetailsSubmissionInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$ageOfFpoYears = ageOfFpoYears;
    final lOther$ageOfFpoYears = other.ageOfFpoYears;
    if (_$data.containsKey('ageOfFpoYears') !=
        other._$data.containsKey('ageOfFpoYears')) {
      return false;
    }
    if (l$ageOfFpoYears != lOther$ageOfFpoYears) {
      return false;
    }
    final l$dateOfCommencement = dateOfCommencement;
    final lOther$dateOfCommencement = other.dateOfCommencement;
    if (_$data.containsKey('dateOfCommencement') !=
        other._$data.containsKey('dateOfCommencement')) {
      return false;
    }
    if (l$dateOfCommencement != lOther$dateOfCommencement) {
      return false;
    }
    final l$dateOfIncorporation = dateOfIncorporation;
    final lOther$dateOfIncorporation = other.dateOfIncorporation;
    if (_$data.containsKey('dateOfIncorporation') !=
        other._$data.containsKey('dateOfIncorporation')) {
      return false;
    }
    if (l$dateOfIncorporation != lOther$dateOfIncorporation) {
      return false;
    }
    final l$dealsThroughPgsFigs = dealsThroughPgsFigs;
    final lOther$dealsThroughPgsFigs = other.dealsThroughPgsFigs;
    if (_$data.containsKey('dealsThroughPgsFigs') !=
        other._$data.containsKey('dealsThroughPgsFigs')) {
      return false;
    }
    if (l$dealsThroughPgsFigs != lOther$dealsThroughPgsFigs) {
      return false;
    }
    final l$district = district;
    final lOther$district = other.district;
    if (_$data.containsKey('district') !=
        other._$data.containsKey('district')) {
      return false;
    }
    if (l$district != lOther$district) {
      return false;
    }
    final l$farmersTransacted = farmersTransacted;
    final lOther$farmersTransacted = other.farmersTransacted;
    if (_$data.containsKey('farmersTransacted') !=
        other._$data.containsKey('farmersTransacted')) {
      return false;
    }
    if (l$farmersTransacted != lOther$farmersTransacted) {
      return false;
    }
    final l$grantMakingOrganization = grantMakingOrganization;
    final lOther$grantMakingOrganization = other.grantMakingOrganization;
    if (_$data.containsKey('grantMakingOrganization') !=
        other._$data.containsKey('grantMakingOrganization')) {
      return false;
    }
    if (l$grantMakingOrganization != lOther$grantMakingOrganization) {
      return false;
    }
    final l$nameOfProducerOrganization = nameOfProducerOrganization;
    final lOther$nameOfProducerOrganization = other.nameOfProducerOrganization;
    if (_$data.containsKey('nameOfProducerOrganization') !=
        other._$data.containsKey('nameOfProducerOrganization')) {
      return false;
    }
    if (l$nameOfProducerOrganization != lOther$nameOfProducerOrganization) {
      return false;
    }
    final l$numPgsFigs = numPgsFigs;
    final lOther$numPgsFigs = other.numPgsFigs;
    if (_$data.containsKey('numPgsFigs') !=
        other._$data.containsKey('numPgsFigs')) {
      return false;
    }
    if (l$numPgsFigs != lOther$numPgsFigs) {
      return false;
    }
    final l$otherPromotingAgencyType = otherPromotingAgencyType;
    final lOther$otherPromotingAgencyType = other.otherPromotingAgencyType;
    if (_$data.containsKey('otherPromotingAgencyType') !=
        other._$data.containsKey('otherPromotingAgencyType')) {
      return false;
    }
    if (l$otherPromotingAgencyType != lOther$otherPromotingAgencyType) {
      return false;
    }
    final l$promotingAgencyName = promotingAgencyName;
    final lOther$promotingAgencyName = other.promotingAgencyName;
    if (_$data.containsKey('promotingAgencyName') !=
        other._$data.containsKey('promotingAgencyName')) {
      return false;
    }
    if (l$promotingAgencyName != lOther$promotingAgencyName) {
      return false;
    }
    final l$receivedGrants = receivedGrants;
    final lOther$receivedGrants = other.receivedGrants;
    if (_$data.containsKey('receivedGrants') !=
        other._$data.containsKey('receivedGrants')) {
      return false;
    }
    if (l$receivedGrants != lOther$receivedGrants) {
      return false;
    }
    final l$registeredAddress = registeredAddress;
    final lOther$registeredAddress = other.registeredAddress;
    if (_$data.containsKey('registeredAddress') !=
        other._$data.containsKey('registeredAddress')) {
      return false;
    }
    if (l$registeredAddress != lOther$registeredAddress) {
      return false;
    }
    final l$sizeOfFpoFy2122 = sizeOfFpoFy2122;
    final lOther$sizeOfFpoFy2122 = other.sizeOfFpoFy2122;
    if (_$data.containsKey('sizeOfFpoFy2122') !=
        other._$data.containsKey('sizeOfFpoFy2122')) {
      return false;
    }
    if (l$sizeOfFpoFy2122 != lOther$sizeOfFpoFy2122) {
      return false;
    }
    final l$sizeOfFpoFy2223 = sizeOfFpoFy2223;
    final lOther$sizeOfFpoFy2223 = other.sizeOfFpoFy2223;
    if (_$data.containsKey('sizeOfFpoFy2223') !=
        other._$data.containsKey('sizeOfFpoFy2223')) {
      return false;
    }
    if (l$sizeOfFpoFy2223 != lOther$sizeOfFpoFy2223) {
      return false;
    }
    final l$sizeOfFpoFy2324 = sizeOfFpoFy2324;
    final lOther$sizeOfFpoFy2324 = other.sizeOfFpoFy2324;
    if (_$data.containsKey('sizeOfFpoFy2324') !=
        other._$data.containsKey('sizeOfFpoFy2324')) {
      return false;
    }
    if (l$sizeOfFpoFy2324 != lOther$sizeOfFpoFy2324) {
      return false;
    }
    final l$state = state;
    final lOther$state = other.state;
    if (_$data.containsKey('state') != other._$data.containsKey('state')) {
      return false;
    }
    if (l$state != lOther$state) {
      return false;
    }
    final l$supportedByPromotingAgency = supportedByPromotingAgency;
    final lOther$supportedByPromotingAgency = other.supportedByPromotingAgency;
    if (_$data.containsKey('supportedByPromotingAgency') !=
        other._$data.containsKey('supportedByPromotingAgency')) {
      return false;
    }
    if (l$supportedByPromotingAgency != lOther$supportedByPromotingAgency) {
      return false;
    }
    final l$targetSizeOfFpo = targetSizeOfFpo;
    final lOther$targetSizeOfFpo = other.targetSizeOfFpo;
    if (_$data.containsKey('targetSizeOfFpo') !=
        other._$data.containsKey('targetSizeOfFpo')) {
      return false;
    }
    if (l$targetSizeOfFpo != lOther$targetSizeOfFpo) {
      return false;
    }
    final l$typeOfFpo = typeOfFpo;
    final lOther$typeOfFpo = other.typeOfFpo;
    if (_$data.containsKey('typeOfFpo') !=
        other._$data.containsKey('typeOfFpo')) {
      return false;
    }
    if (l$typeOfFpo != lOther$typeOfFpo) {
      return false;
    }
    final l$typeOfProducerOrganization = typeOfProducerOrganization;
    final lOther$typeOfProducerOrganization = other.typeOfProducerOrganization;
    if (_$data.containsKey('typeOfProducerOrganization') !=
        other._$data.containsKey('typeOfProducerOrganization')) {
      return false;
    }
    if (l$typeOfProducerOrganization != lOther$typeOfProducerOrganization) {
      return false;
    }
    final l$typeOfPromotingAgency = typeOfPromotingAgency;
    final lOther$typeOfPromotingAgency = other.typeOfPromotingAgency;
    if (_$data.containsKey('typeOfPromotingAgency') !=
        other._$data.containsKey('typeOfPromotingAgency')) {
      return false;
    }
    if (l$typeOfPromotingAgency != lOther$typeOfPromotingAgency) {
      return false;
    }
    final l$womenMembers = womenMembers;
    final lOther$womenMembers = other.womenMembers;
    if (_$data.containsKey('womenMembers') !=
        other._$data.containsKey('womenMembers')) {
      return false;
    }
    if (l$womenMembers != lOther$womenMembers) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$ageOfFpoYears = ageOfFpoYears;
    final l$dateOfCommencement = dateOfCommencement;
    final l$dateOfIncorporation = dateOfIncorporation;
    final l$dealsThroughPgsFigs = dealsThroughPgsFigs;
    final l$district = district;
    final l$farmersTransacted = farmersTransacted;
    final l$grantMakingOrganization = grantMakingOrganization;
    final l$nameOfProducerOrganization = nameOfProducerOrganization;
    final l$numPgsFigs = numPgsFigs;
    final l$otherPromotingAgencyType = otherPromotingAgencyType;
    final l$promotingAgencyName = promotingAgencyName;
    final l$receivedGrants = receivedGrants;
    final l$registeredAddress = registeredAddress;
    final l$sizeOfFpoFy2122 = sizeOfFpoFy2122;
    final l$sizeOfFpoFy2223 = sizeOfFpoFy2223;
    final l$sizeOfFpoFy2324 = sizeOfFpoFy2324;
    final l$state = state;
    final l$supportedByPromotingAgency = supportedByPromotingAgency;
    final l$targetSizeOfFpo = targetSizeOfFpo;
    final l$typeOfFpo = typeOfFpo;
    final l$typeOfProducerOrganization = typeOfProducerOrganization;
    final l$typeOfPromotingAgency = typeOfPromotingAgency;
    final l$womenMembers = womenMembers;
    return Object.hashAll([
      _$data.containsKey('ageOfFpoYears') ? l$ageOfFpoYears : const {},
      _$data.containsKey('dateOfCommencement')
          ? l$dateOfCommencement
          : const {},
      _$data.containsKey('dateOfIncorporation')
          ? l$dateOfIncorporation
          : const {},
      _$data.containsKey('dealsThroughPgsFigs')
          ? l$dealsThroughPgsFigs
          : const {},
      _$data.containsKey('district') ? l$district : const {},
      _$data.containsKey('farmersTransacted') ? l$farmersTransacted : const {},
      _$data.containsKey('grantMakingOrganization')
          ? l$grantMakingOrganization
          : const {},
      _$data.containsKey('nameOfProducerOrganization')
          ? l$nameOfProducerOrganization
          : const {},
      _$data.containsKey('numPgsFigs') ? l$numPgsFigs : const {},
      _$data.containsKey('otherPromotingAgencyType')
          ? l$otherPromotingAgencyType
          : const {},
      _$data.containsKey('promotingAgencyName')
          ? l$promotingAgencyName
          : const {},
      _$data.containsKey('receivedGrants') ? l$receivedGrants : const {},
      _$data.containsKey('registeredAddress') ? l$registeredAddress : const {},
      _$data.containsKey('sizeOfFpoFy2122') ? l$sizeOfFpoFy2122 : const {},
      _$data.containsKey('sizeOfFpoFy2223') ? l$sizeOfFpoFy2223 : const {},
      _$data.containsKey('sizeOfFpoFy2324') ? l$sizeOfFpoFy2324 : const {},
      _$data.containsKey('state') ? l$state : const {},
      _$data.containsKey('supportedByPromotingAgency')
          ? l$supportedByPromotingAgency
          : const {},
      _$data.containsKey('targetSizeOfFpo') ? l$targetSizeOfFpo : const {},
      _$data.containsKey('typeOfFpo') ? l$typeOfFpo : const {},
      _$data.containsKey('typeOfProducerOrganization')
          ? l$typeOfProducerOrganization
          : const {},
      _$data.containsKey('typeOfPromotingAgency')
          ? l$typeOfPromotingAgency
          : const {},
      _$data.containsKey('womenMembers') ? l$womenMembers : const {},
    ]);
  }
}

abstract class CopyWith$Input$FPODetailsSubmissionInput<TRes> {
  factory CopyWith$Input$FPODetailsSubmissionInput(
    Input$FPODetailsSubmissionInput instance,
    TRes Function(Input$FPODetailsSubmissionInput) then,
  ) = _CopyWithImpl$Input$FPODetailsSubmissionInput;

  factory CopyWith$Input$FPODetailsSubmissionInput.stub(TRes res) =
      _CopyWithStubImpl$Input$FPODetailsSubmissionInput;

  TRes call({
    double? ageOfFpoYears,
    String? dateOfCommencement,
    String? dateOfIncorporation,
    bool? dealsThroughPgsFigs,
    String? district,
    int? farmersTransacted,
    String? grantMakingOrganization,
    String? nameOfProducerOrganization,
    int? numPgsFigs,
    String? otherPromotingAgencyType,
    String? promotingAgencyName,
    bool? receivedGrants,
    String? registeredAddress,
    int? sizeOfFpoFy2122,
    int? sizeOfFpoFy2223,
    int? sizeOfFpoFy2324,
    String? state,
    bool? supportedByPromotingAgency,
    int? targetSizeOfFpo,
    Enum$FPOTypeEnum? typeOfFpo,
    Enum$ProducerOrgTypeEnum? typeOfProducerOrganization,
    Enum$PromotingAgencyTypeEnum? typeOfPromotingAgency,
    int? womenMembers,
  });
}

class _CopyWithImpl$Input$FPODetailsSubmissionInput<TRes>
    implements CopyWith$Input$FPODetailsSubmissionInput<TRes> {
  _CopyWithImpl$Input$FPODetailsSubmissionInput(
    this._instance,
    this._then,
  );

  final Input$FPODetailsSubmissionInput _instance;

  final TRes Function(Input$FPODetailsSubmissionInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? ageOfFpoYears = _undefined,
    Object? dateOfCommencement = _undefined,
    Object? dateOfIncorporation = _undefined,
    Object? dealsThroughPgsFigs = _undefined,
    Object? district = _undefined,
    Object? farmersTransacted = _undefined,
    Object? grantMakingOrganization = _undefined,
    Object? nameOfProducerOrganization = _undefined,
    Object? numPgsFigs = _undefined,
    Object? otherPromotingAgencyType = _undefined,
    Object? promotingAgencyName = _undefined,
    Object? receivedGrants = _undefined,
    Object? registeredAddress = _undefined,
    Object? sizeOfFpoFy2122 = _undefined,
    Object? sizeOfFpoFy2223 = _undefined,
    Object? sizeOfFpoFy2324 = _undefined,
    Object? state = _undefined,
    Object? supportedByPromotingAgency = _undefined,
    Object? targetSizeOfFpo = _undefined,
    Object? typeOfFpo = _undefined,
    Object? typeOfProducerOrganization = _undefined,
    Object? typeOfPromotingAgency = _undefined,
    Object? womenMembers = _undefined,
  }) =>
      _then(Input$FPODetailsSubmissionInput._({
        ..._instance._$data,
        if (ageOfFpoYears != _undefined)
          'ageOfFpoYears': (ageOfFpoYears as double?),
        if (dateOfCommencement != _undefined)
          'dateOfCommencement': (dateOfCommencement as String?),
        if (dateOfIncorporation != _undefined)
          'dateOfIncorporation': (dateOfIncorporation as String?),
        if (dealsThroughPgsFigs != _undefined)
          'dealsThroughPgsFigs': (dealsThroughPgsFigs as bool?),
        if (district != _undefined) 'district': (district as String?),
        if (farmersTransacted != _undefined)
          'farmersTransacted': (farmersTransacted as int?),
        if (grantMakingOrganization != _undefined)
          'grantMakingOrganization': (grantMakingOrganization as String?),
        if (nameOfProducerOrganization != _undefined)
          'nameOfProducerOrganization': (nameOfProducerOrganization as String?),
        if (numPgsFigs != _undefined) 'numPgsFigs': (numPgsFigs as int?),
        if (otherPromotingAgencyType != _undefined)
          'otherPromotingAgencyType': (otherPromotingAgencyType as String?),
        if (promotingAgencyName != _undefined)
          'promotingAgencyName': (promotingAgencyName as String?),
        if (receivedGrants != _undefined)
          'receivedGrants': (receivedGrants as bool?),
        if (registeredAddress != _undefined)
          'registeredAddress': (registeredAddress as String?),
        if (sizeOfFpoFy2122 != _undefined)
          'sizeOfFpoFy2122': (sizeOfFpoFy2122 as int?),
        if (sizeOfFpoFy2223 != _undefined)
          'sizeOfFpoFy2223': (sizeOfFpoFy2223 as int?),
        if (sizeOfFpoFy2324 != _undefined)
          'sizeOfFpoFy2324': (sizeOfFpoFy2324 as int?),
        if (state != _undefined) 'state': (state as String?),
        if (supportedByPromotingAgency != _undefined)
          'supportedByPromotingAgency': (supportedByPromotingAgency as bool?),
        if (targetSizeOfFpo != _undefined)
          'targetSizeOfFpo': (targetSizeOfFpo as int?),
        if (typeOfFpo != _undefined)
          'typeOfFpo': (typeOfFpo as Enum$FPOTypeEnum?),
        if (typeOfProducerOrganization != _undefined)
          'typeOfProducerOrganization':
              (typeOfProducerOrganization as Enum$ProducerOrgTypeEnum?),
        if (typeOfPromotingAgency != _undefined)
          'typeOfPromotingAgency':
              (typeOfPromotingAgency as Enum$PromotingAgencyTypeEnum?),
        if (womenMembers != _undefined) 'womenMembers': (womenMembers as int?),
      }));
}

class _CopyWithStubImpl$Input$FPODetailsSubmissionInput<TRes>
    implements CopyWith$Input$FPODetailsSubmissionInput<TRes> {
  _CopyWithStubImpl$Input$FPODetailsSubmissionInput(this._res);

  TRes _res;

  call({
    double? ageOfFpoYears,
    String? dateOfCommencement,
    String? dateOfIncorporation,
    bool? dealsThroughPgsFigs,
    String? district,
    int? farmersTransacted,
    String? grantMakingOrganization,
    String? nameOfProducerOrganization,
    int? numPgsFigs,
    String? otherPromotingAgencyType,
    String? promotingAgencyName,
    bool? receivedGrants,
    String? registeredAddress,
    int? sizeOfFpoFy2122,
    int? sizeOfFpoFy2223,
    int? sizeOfFpoFy2324,
    String? state,
    bool? supportedByPromotingAgency,
    int? targetSizeOfFpo,
    Enum$FPOTypeEnum? typeOfFpo,
    Enum$ProducerOrgTypeEnum? typeOfProducerOrganization,
    Enum$PromotingAgencyTypeEnum? typeOfPromotingAgency,
    int? womenMembers,
  }) =>
      _res;
}

class Input$FinancialDetailsSubmissionV2Input {
  factory Input$FinancialDetailsSubmissionV2Input({
    String? cashChequePercentage,
    String? creditDefaultAmount,
    String? creditDefaultLender,
    String? creditDefaultYear,
    String? currentYearAccountsPayable,
    String? currentYearAccountsReceivable,
    String? currentYearAssets,
    String? currentYearClosingInventory,
    String? currentYearCogs,
    String? currentYearCurrentAssets,
    String? currentYearCurrentLiabilities,
    String? currentYearGrossProfit,
    String? currentYearInstitutionalProducts,
    String? currentYearInstitutionalRevenue,
    String? currentYearLenderName,
    String? currentYearLiabilities,
    String? currentYearLoanAmount,
    String? currentYearMatchingGrant,
    String? currentYearNetProfit,
    String? currentYearOpeningInventory,
    String? currentYearProducts,
    String? currentYearProjectGrant,
    String? currentYearQuantityProcured,
    String? currentYearQuantityProducts,
    String? currentYearRetailProducts,
    String? currentYearRetailRevenue,
    String? currentYearRevenue,
    String? currentYearShareCapital,
    int? currentYearShareholders,
    String? currentYearWholesaleProducts,
    String? currentYearWholesaleRevenue,
    int? daysPayableReceivableDifference,
    String? grossNetProfitMarginDifference,
    String? institutionalLendingHistory,
    String? loanDetails,
    String? operatingMarginCurrentYear,
    String? previousYearAccountsPayable,
    String? previousYearAccountsReceivable,
    String? previousYearAssets,
    String? previousYearClosingInventory,
    String? previousYearCogs,
    String? previousYearCurrentAssets,
    String? previousYearCurrentLiabilities,
    String? previousYearGrossProfit,
    String? previousYearInstitutionalProducts,
    String? previousYearInstitutionalRevenue,
    String? previousYearLenderName,
    String? previousYearLiabilities,
    String? previousYearLoanAmount,
    String? previousYearMatchingGrant,
    String? previousYearNetProfit,
    String? previousYearOpeningInventory,
    String? previousYearProducts,
    String? previousYearProjectGrant,
    String? previousYearQuantityProcured,
    String? previousYearQuantityProducts,
    String? previousYearRetailProducts,
    String? previousYearRetailRevenue,
    String? previousYearRevenue,
    String? previousYearShareCapital,
    int? previousYearShareholders,
    String? previousYearWholesaleProducts,
    String? previousYearWholesaleRevenue,
    String? targetRevenue,
    String? totalDebtToday,
    String? twoYearsBackAccountsPayable,
    String? twoYearsBackAccountsReceivable,
    String? twoYearsBackAssets,
    String? twoYearsBackClosingInventory,
    String? twoYearsBackCogs,
    String? twoYearsBackCurrentAssets,
    String? twoYearsBackCurrentLiabilities,
    String? twoYearsBackGrossProfit,
    String? twoYearsBackInstitutionalProducts,
    String? twoYearsBackInstitutionalRevenue,
    String? twoYearsBackLenderName,
    String? twoYearsBackLiabilities,
    String? twoYearsBackLoanAmount,
    String? twoYearsBackMatchingGrant,
    String? twoYearsBackNetProfit,
    String? twoYearsBackOpeningInventory,
    String? twoYearsBackProducts,
    String? twoYearsBackProjectGrant,
    String? twoYearsBackQuantityProcured,
    String? twoYearsBackQuantityProducts,
    String? twoYearsBackRetailProducts,
    String? twoYearsBackRetailRevenue,
    String? twoYearsBackRevenue,
    String? twoYearsBackShareCapital,
    int? twoYearsBackShareholders,
    String? twoYearsBackWholesaleProducts,
    String? twoYearsBackWholesaleRevenue,
  }) =>
      Input$FinancialDetailsSubmissionV2Input._({
        if (cashChequePercentage != null)
          r'cashChequePercentage': cashChequePercentage,
        if (creditDefaultAmount != null)
          r'creditDefaultAmount': creditDefaultAmount,
        if (creditDefaultLender != null)
          r'creditDefaultLender': creditDefaultLender,
        if (creditDefaultYear != null) r'creditDefaultYear': creditDefaultYear,
        if (currentYearAccountsPayable != null)
          r'currentYearAccountsPayable': currentYearAccountsPayable,
        if (currentYearAccountsReceivable != null)
          r'currentYearAccountsReceivable': currentYearAccountsReceivable,
        if (currentYearAssets != null) r'currentYearAssets': currentYearAssets,
        if (currentYearClosingInventory != null)
          r'currentYearClosingInventory': currentYearClosingInventory,
        if (currentYearCogs != null) r'currentYearCogs': currentYearCogs,
        if (currentYearCurrentAssets != null)
          r'currentYearCurrentAssets': currentYearCurrentAssets,
        if (currentYearCurrentLiabilities != null)
          r'currentYearCurrentLiabilities': currentYearCurrentLiabilities,
        if (currentYearGrossProfit != null)
          r'currentYearGrossProfit': currentYearGrossProfit,
        if (currentYearInstitutionalProducts != null)
          r'currentYearInstitutionalProducts': currentYearInstitutionalProducts,
        if (currentYearInstitutionalRevenue != null)
          r'currentYearInstitutionalRevenue': currentYearInstitutionalRevenue,
        if (currentYearLenderName != null)
          r'currentYearLenderName': currentYearLenderName,
        if (currentYearLiabilities != null)
          r'currentYearLiabilities': currentYearLiabilities,
        if (currentYearLoanAmount != null)
          r'currentYearLoanAmount': currentYearLoanAmount,
        if (currentYearMatchingGrant != null)
          r'currentYearMatchingGrant': currentYearMatchingGrant,
        if (currentYearNetProfit != null)
          r'currentYearNetProfit': currentYearNetProfit,
        if (currentYearOpeningInventory != null)
          r'currentYearOpeningInventory': currentYearOpeningInventory,
        if (currentYearProducts != null)
          r'currentYearProducts': currentYearProducts,
        if (currentYearProjectGrant != null)
          r'currentYearProjectGrant': currentYearProjectGrant,
        if (currentYearQuantityProcured != null)
          r'currentYearQuantityProcured': currentYearQuantityProcured,
        if (currentYearQuantityProducts != null)
          r'currentYearQuantityProducts': currentYearQuantityProducts,
        if (currentYearRetailProducts != null)
          r'currentYearRetailProducts': currentYearRetailProducts,
        if (currentYearRetailRevenue != null)
          r'currentYearRetailRevenue': currentYearRetailRevenue,
        if (currentYearRevenue != null)
          r'currentYearRevenue': currentYearRevenue,
        if (currentYearShareCapital != null)
          r'currentYearShareCapital': currentYearShareCapital,
        if (currentYearShareholders != null)
          r'currentYearShareholders': currentYearShareholders,
        if (currentYearWholesaleProducts != null)
          r'currentYearWholesaleProducts': currentYearWholesaleProducts,
        if (currentYearWholesaleRevenue != null)
          r'currentYearWholesaleRevenue': currentYearWholesaleRevenue,
        if (daysPayableReceivableDifference != null)
          r'daysPayableReceivableDifference': daysPayableReceivableDifference,
        if (grossNetProfitMarginDifference != null)
          r'grossNetProfitMarginDifference': grossNetProfitMarginDifference,
        if (institutionalLendingHistory != null)
          r'institutionalLendingHistory': institutionalLendingHistory,
        if (loanDetails != null) r'loanDetails': loanDetails,
        if (operatingMarginCurrentYear != null)
          r'operatingMarginCurrentYear': operatingMarginCurrentYear,
        if (previousYearAccountsPayable != null)
          r'previousYearAccountsPayable': previousYearAccountsPayable,
        if (previousYearAccountsReceivable != null)
          r'previousYearAccountsReceivable': previousYearAccountsReceivable,
        if (previousYearAssets != null)
          r'previousYearAssets': previousYearAssets,
        if (previousYearClosingInventory != null)
          r'previousYearClosingInventory': previousYearClosingInventory,
        if (previousYearCogs != null) r'previousYearCogs': previousYearCogs,
        if (previousYearCurrentAssets != null)
          r'previousYearCurrentAssets': previousYearCurrentAssets,
        if (previousYearCurrentLiabilities != null)
          r'previousYearCurrentLiabilities': previousYearCurrentLiabilities,
        if (previousYearGrossProfit != null)
          r'previousYearGrossProfit': previousYearGrossProfit,
        if (previousYearInstitutionalProducts != null)
          r'previousYearInstitutionalProducts':
              previousYearInstitutionalProducts,
        if (previousYearInstitutionalRevenue != null)
          r'previousYearInstitutionalRevenue': previousYearInstitutionalRevenue,
        if (previousYearLenderName != null)
          r'previousYearLenderName': previousYearLenderName,
        if (previousYearLiabilities != null)
          r'previousYearLiabilities': previousYearLiabilities,
        if (previousYearLoanAmount != null)
          r'previousYearLoanAmount': previousYearLoanAmount,
        if (previousYearMatchingGrant != null)
          r'previousYearMatchingGrant': previousYearMatchingGrant,
        if (previousYearNetProfit != null)
          r'previousYearNetProfit': previousYearNetProfit,
        if (previousYearOpeningInventory != null)
          r'previousYearOpeningInventory': previousYearOpeningInventory,
        if (previousYearProducts != null)
          r'previousYearProducts': previousYearProducts,
        if (previousYearProjectGrant != null)
          r'previousYearProjectGrant': previousYearProjectGrant,
        if (previousYearQuantityProcured != null)
          r'previousYearQuantityProcured': previousYearQuantityProcured,
        if (previousYearQuantityProducts != null)
          r'previousYearQuantityProducts': previousYearQuantityProducts,
        if (previousYearRetailProducts != null)
          r'previousYearRetailProducts': previousYearRetailProducts,
        if (previousYearRetailRevenue != null)
          r'previousYearRetailRevenue': previousYearRetailRevenue,
        if (previousYearRevenue != null)
          r'previousYearRevenue': previousYearRevenue,
        if (previousYearShareCapital != null)
          r'previousYearShareCapital': previousYearShareCapital,
        if (previousYearShareholders != null)
          r'previousYearShareholders': previousYearShareholders,
        if (previousYearWholesaleProducts != null)
          r'previousYearWholesaleProducts': previousYearWholesaleProducts,
        if (previousYearWholesaleRevenue != null)
          r'previousYearWholesaleRevenue': previousYearWholesaleRevenue,
        if (targetRevenue != null) r'targetRevenue': targetRevenue,
        if (totalDebtToday != null) r'totalDebtToday': totalDebtToday,
        if (twoYearsBackAccountsPayable != null)
          r'twoYearsBackAccountsPayable': twoYearsBackAccountsPayable,
        if (twoYearsBackAccountsReceivable != null)
          r'twoYearsBackAccountsReceivable': twoYearsBackAccountsReceivable,
        if (twoYearsBackAssets != null)
          r'twoYearsBackAssets': twoYearsBackAssets,
        if (twoYearsBackClosingInventory != null)
          r'twoYearsBackClosingInventory': twoYearsBackClosingInventory,
        if (twoYearsBackCogs != null) r'twoYearsBackCogs': twoYearsBackCogs,
        if (twoYearsBackCurrentAssets != null)
          r'twoYearsBackCurrentAssets': twoYearsBackCurrentAssets,
        if (twoYearsBackCurrentLiabilities != null)
          r'twoYearsBackCurrentLiabilities': twoYearsBackCurrentLiabilities,
        if (twoYearsBackGrossProfit != null)
          r'twoYearsBackGrossProfit': twoYearsBackGrossProfit,
        if (twoYearsBackInstitutionalProducts != null)
          r'twoYearsBackInstitutionalProducts':
              twoYearsBackInstitutionalProducts,
        if (twoYearsBackInstitutionalRevenue != null)
          r'twoYearsBackInstitutionalRevenue': twoYearsBackInstitutionalRevenue,
        if (twoYearsBackLenderName != null)
          r'twoYearsBackLenderName': twoYearsBackLenderName,
        if (twoYearsBackLiabilities != null)
          r'twoYearsBackLiabilities': twoYearsBackLiabilities,
        if (twoYearsBackLoanAmount != null)
          r'twoYearsBackLoanAmount': twoYearsBackLoanAmount,
        if (twoYearsBackMatchingGrant != null)
          r'twoYearsBackMatchingGrant': twoYearsBackMatchingGrant,
        if (twoYearsBackNetProfit != null)
          r'twoYearsBackNetProfit': twoYearsBackNetProfit,
        if (twoYearsBackOpeningInventory != null)
          r'twoYearsBackOpeningInventory': twoYearsBackOpeningInventory,
        if (twoYearsBackProducts != null)
          r'twoYearsBackProducts': twoYearsBackProducts,
        if (twoYearsBackProjectGrant != null)
          r'twoYearsBackProjectGrant': twoYearsBackProjectGrant,
        if (twoYearsBackQuantityProcured != null)
          r'twoYearsBackQuantityProcured': twoYearsBackQuantityProcured,
        if (twoYearsBackQuantityProducts != null)
          r'twoYearsBackQuantityProducts': twoYearsBackQuantityProducts,
        if (twoYearsBackRetailProducts != null)
          r'twoYearsBackRetailProducts': twoYearsBackRetailProducts,
        if (twoYearsBackRetailRevenue != null)
          r'twoYearsBackRetailRevenue': twoYearsBackRetailRevenue,
        if (twoYearsBackRevenue != null)
          r'twoYearsBackRevenue': twoYearsBackRevenue,
        if (twoYearsBackShareCapital != null)
          r'twoYearsBackShareCapital': twoYearsBackShareCapital,
        if (twoYearsBackShareholders != null)
          r'twoYearsBackShareholders': twoYearsBackShareholders,
        if (twoYearsBackWholesaleProducts != null)
          r'twoYearsBackWholesaleProducts': twoYearsBackWholesaleProducts,
        if (twoYearsBackWholesaleRevenue != null)
          r'twoYearsBackWholesaleRevenue': twoYearsBackWholesaleRevenue,
      });

  Input$FinancialDetailsSubmissionV2Input._(this._$data);

  factory Input$FinancialDetailsSubmissionV2Input.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('cashChequePercentage')) {
      final l$cashChequePercentage = data['cashChequePercentage'];
      result$data['cashChequePercentage'] = (l$cashChequePercentage as String?);
    }
    if (data.containsKey('creditDefaultAmount')) {
      final l$creditDefaultAmount = data['creditDefaultAmount'];
      result$data['creditDefaultAmount'] = (l$creditDefaultAmount as String?);
    }
    if (data.containsKey('creditDefaultLender')) {
      final l$creditDefaultLender = data['creditDefaultLender'];
      result$data['creditDefaultLender'] = (l$creditDefaultLender as String?);
    }
    if (data.containsKey('creditDefaultYear')) {
      final l$creditDefaultYear = data['creditDefaultYear'];
      result$data['creditDefaultYear'] = (l$creditDefaultYear as String?);
    }
    if (data.containsKey('currentYearAccountsPayable')) {
      final l$currentYearAccountsPayable = data['currentYearAccountsPayable'];
      result$data['currentYearAccountsPayable'] =
          (l$currentYearAccountsPayable as String?);
    }
    if (data.containsKey('currentYearAccountsReceivable')) {
      final l$currentYearAccountsReceivable =
          data['currentYearAccountsReceivable'];
      result$data['currentYearAccountsReceivable'] =
          (l$currentYearAccountsReceivable as String?);
    }
    if (data.containsKey('currentYearAssets')) {
      final l$currentYearAssets = data['currentYearAssets'];
      result$data['currentYearAssets'] = (l$currentYearAssets as String?);
    }
    if (data.containsKey('currentYearClosingInventory')) {
      final l$currentYearClosingInventory = data['currentYearClosingInventory'];
      result$data['currentYearClosingInventory'] =
          (l$currentYearClosingInventory as String?);
    }
    if (data.containsKey('currentYearCogs')) {
      final l$currentYearCogs = data['currentYearCogs'];
      result$data['currentYearCogs'] = (l$currentYearCogs as String?);
    }
    if (data.containsKey('currentYearCurrentAssets')) {
      final l$currentYearCurrentAssets = data['currentYearCurrentAssets'];
      result$data['currentYearCurrentAssets'] =
          (l$currentYearCurrentAssets as String?);
    }
    if (data.containsKey('currentYearCurrentLiabilities')) {
      final l$currentYearCurrentLiabilities =
          data['currentYearCurrentLiabilities'];
      result$data['currentYearCurrentLiabilities'] =
          (l$currentYearCurrentLiabilities as String?);
    }
    if (data.containsKey('currentYearGrossProfit')) {
      final l$currentYearGrossProfit = data['currentYearGrossProfit'];
      result$data['currentYearGrossProfit'] =
          (l$currentYearGrossProfit as String?);
    }
    if (data.containsKey('currentYearInstitutionalProducts')) {
      final l$currentYearInstitutionalProducts =
          data['currentYearInstitutionalProducts'];
      result$data['currentYearInstitutionalProducts'] =
          (l$currentYearInstitutionalProducts as String?);
    }
    if (data.containsKey('currentYearInstitutionalRevenue')) {
      final l$currentYearInstitutionalRevenue =
          data['currentYearInstitutionalRevenue'];
      result$data['currentYearInstitutionalRevenue'] =
          (l$currentYearInstitutionalRevenue as String?);
    }
    if (data.containsKey('currentYearLenderName')) {
      final l$currentYearLenderName = data['currentYearLenderName'];
      result$data['currentYearLenderName'] =
          (l$currentYearLenderName as String?);
    }
    if (data.containsKey('currentYearLiabilities')) {
      final l$currentYearLiabilities = data['currentYearLiabilities'];
      result$data['currentYearLiabilities'] =
          (l$currentYearLiabilities as String?);
    }
    if (data.containsKey('currentYearLoanAmount')) {
      final l$currentYearLoanAmount = data['currentYearLoanAmount'];
      result$data['currentYearLoanAmount'] =
          (l$currentYearLoanAmount as String?);
    }
    if (data.containsKey('currentYearMatchingGrant')) {
      final l$currentYearMatchingGrant = data['currentYearMatchingGrant'];
      result$data['currentYearMatchingGrant'] =
          (l$currentYearMatchingGrant as String?);
    }
    if (data.containsKey('currentYearNetProfit')) {
      final l$currentYearNetProfit = data['currentYearNetProfit'];
      result$data['currentYearNetProfit'] = (l$currentYearNetProfit as String?);
    }
    if (data.containsKey('currentYearOpeningInventory')) {
      final l$currentYearOpeningInventory = data['currentYearOpeningInventory'];
      result$data['currentYearOpeningInventory'] =
          (l$currentYearOpeningInventory as String?);
    }
    if (data.containsKey('currentYearProducts')) {
      final l$currentYearProducts = data['currentYearProducts'];
      result$data['currentYearProducts'] = (l$currentYearProducts as String?);
    }
    if (data.containsKey('currentYearProjectGrant')) {
      final l$currentYearProjectGrant = data['currentYearProjectGrant'];
      result$data['currentYearProjectGrant'] =
          (l$currentYearProjectGrant as String?);
    }
    if (data.containsKey('currentYearQuantityProcured')) {
      final l$currentYearQuantityProcured = data['currentYearQuantityProcured'];
      result$data['currentYearQuantityProcured'] =
          (l$currentYearQuantityProcured as String?);
    }
    if (data.containsKey('currentYearQuantityProducts')) {
      final l$currentYearQuantityProducts = data['currentYearQuantityProducts'];
      result$data['currentYearQuantityProducts'] =
          (l$currentYearQuantityProducts as String?);
    }
    if (data.containsKey('currentYearRetailProducts')) {
      final l$currentYearRetailProducts = data['currentYearRetailProducts'];
      result$data['currentYearRetailProducts'] =
          (l$currentYearRetailProducts as String?);
    }
    if (data.containsKey('currentYearRetailRevenue')) {
      final l$currentYearRetailRevenue = data['currentYearRetailRevenue'];
      result$data['currentYearRetailRevenue'] =
          (l$currentYearRetailRevenue as String?);
    }
    if (data.containsKey('currentYearRevenue')) {
      final l$currentYearRevenue = data['currentYearRevenue'];
      result$data['currentYearRevenue'] = (l$currentYearRevenue as String?);
    }
    if (data.containsKey('currentYearShareCapital')) {
      final l$currentYearShareCapital = data['currentYearShareCapital'];
      result$data['currentYearShareCapital'] =
          (l$currentYearShareCapital as String?);
    }
    if (data.containsKey('currentYearShareholders')) {
      final l$currentYearShareholders = data['currentYearShareholders'];
      result$data['currentYearShareholders'] =
          (l$currentYearShareholders as int?);
    }
    if (data.containsKey('currentYearWholesaleProducts')) {
      final l$currentYearWholesaleProducts =
          data['currentYearWholesaleProducts'];
      result$data['currentYearWholesaleProducts'] =
          (l$currentYearWholesaleProducts as String?);
    }
    if (data.containsKey('currentYearWholesaleRevenue')) {
      final l$currentYearWholesaleRevenue = data['currentYearWholesaleRevenue'];
      result$data['currentYearWholesaleRevenue'] =
          (l$currentYearWholesaleRevenue as String?);
    }
    if (data.containsKey('daysPayableReceivableDifference')) {
      final l$daysPayableReceivableDifference =
          data['daysPayableReceivableDifference'];
      result$data['daysPayableReceivableDifference'] =
          (l$daysPayableReceivableDifference as int?);
    }
    if (data.containsKey('grossNetProfitMarginDifference')) {
      final l$grossNetProfitMarginDifference =
          data['grossNetProfitMarginDifference'];
      result$data['grossNetProfitMarginDifference'] =
          (l$grossNetProfitMarginDifference as String?);
    }
    if (data.containsKey('institutionalLendingHistory')) {
      final l$institutionalLendingHistory = data['institutionalLendingHistory'];
      result$data['institutionalLendingHistory'] =
          (l$institutionalLendingHistory as String?);
    }
    if (data.containsKey('loanDetails')) {
      final l$loanDetails = data['loanDetails'];
      result$data['loanDetails'] = (l$loanDetails as String?);
    }
    if (data.containsKey('operatingMarginCurrentYear')) {
      final l$operatingMarginCurrentYear = data['operatingMarginCurrentYear'];
      result$data['operatingMarginCurrentYear'] =
          (l$operatingMarginCurrentYear as String?);
    }
    if (data.containsKey('previousYearAccountsPayable')) {
      final l$previousYearAccountsPayable = data['previousYearAccountsPayable'];
      result$data['previousYearAccountsPayable'] =
          (l$previousYearAccountsPayable as String?);
    }
    if (data.containsKey('previousYearAccountsReceivable')) {
      final l$previousYearAccountsReceivable =
          data['previousYearAccountsReceivable'];
      result$data['previousYearAccountsReceivable'] =
          (l$previousYearAccountsReceivable as String?);
    }
    if (data.containsKey('previousYearAssets')) {
      final l$previousYearAssets = data['previousYearAssets'];
      result$data['previousYearAssets'] = (l$previousYearAssets as String?);
    }
    if (data.containsKey('previousYearClosingInventory')) {
      final l$previousYearClosingInventory =
          data['previousYearClosingInventory'];
      result$data['previousYearClosingInventory'] =
          (l$previousYearClosingInventory as String?);
    }
    if (data.containsKey('previousYearCogs')) {
      final l$previousYearCogs = data['previousYearCogs'];
      result$data['previousYearCogs'] = (l$previousYearCogs as String?);
    }
    if (data.containsKey('previousYearCurrentAssets')) {
      final l$previousYearCurrentAssets = data['previousYearCurrentAssets'];
      result$data['previousYearCurrentAssets'] =
          (l$previousYearCurrentAssets as String?);
    }
    if (data.containsKey('previousYearCurrentLiabilities')) {
      final l$previousYearCurrentLiabilities =
          data['previousYearCurrentLiabilities'];
      result$data['previousYearCurrentLiabilities'] =
          (l$previousYearCurrentLiabilities as String?);
    }
    if (data.containsKey('previousYearGrossProfit')) {
      final l$previousYearGrossProfit = data['previousYearGrossProfit'];
      result$data['previousYearGrossProfit'] =
          (l$previousYearGrossProfit as String?);
    }
    if (data.containsKey('previousYearInstitutionalProducts')) {
      final l$previousYearInstitutionalProducts =
          data['previousYearInstitutionalProducts'];
      result$data['previousYearInstitutionalProducts'] =
          (l$previousYearInstitutionalProducts as String?);
    }
    if (data.containsKey('previousYearInstitutionalRevenue')) {
      final l$previousYearInstitutionalRevenue =
          data['previousYearInstitutionalRevenue'];
      result$data['previousYearInstitutionalRevenue'] =
          (l$previousYearInstitutionalRevenue as String?);
    }
    if (data.containsKey('previousYearLenderName')) {
      final l$previousYearLenderName = data['previousYearLenderName'];
      result$data['previousYearLenderName'] =
          (l$previousYearLenderName as String?);
    }
    if (data.containsKey('previousYearLiabilities')) {
      final l$previousYearLiabilities = data['previousYearLiabilities'];
      result$data['previousYearLiabilities'] =
          (l$previousYearLiabilities as String?);
    }
    if (data.containsKey('previousYearLoanAmount')) {
      final l$previousYearLoanAmount = data['previousYearLoanAmount'];
      result$data['previousYearLoanAmount'] =
          (l$previousYearLoanAmount as String?);
    }
    if (data.containsKey('previousYearMatchingGrant')) {
      final l$previousYearMatchingGrant = data['previousYearMatchingGrant'];
      result$data['previousYearMatchingGrant'] =
          (l$previousYearMatchingGrant as String?);
    }
    if (data.containsKey('previousYearNetProfit')) {
      final l$previousYearNetProfit = data['previousYearNetProfit'];
      result$data['previousYearNetProfit'] =
          (l$previousYearNetProfit as String?);
    }
    if (data.containsKey('previousYearOpeningInventory')) {
      final l$previousYearOpeningInventory =
          data['previousYearOpeningInventory'];
      result$data['previousYearOpeningInventory'] =
          (l$previousYearOpeningInventory as String?);
    }
    if (data.containsKey('previousYearProducts')) {
      final l$previousYearProducts = data['previousYearProducts'];
      result$data['previousYearProducts'] = (l$previousYearProducts as String?);
    }
    if (data.containsKey('previousYearProjectGrant')) {
      final l$previousYearProjectGrant = data['previousYearProjectGrant'];
      result$data['previousYearProjectGrant'] =
          (l$previousYearProjectGrant as String?);
    }
    if (data.containsKey('previousYearQuantityProcured')) {
      final l$previousYearQuantityProcured =
          data['previousYearQuantityProcured'];
      result$data['previousYearQuantityProcured'] =
          (l$previousYearQuantityProcured as String?);
    }
    if (data.containsKey('previousYearQuantityProducts')) {
      final l$previousYearQuantityProducts =
          data['previousYearQuantityProducts'];
      result$data['previousYearQuantityProducts'] =
          (l$previousYearQuantityProducts as String?);
    }
    if (data.containsKey('previousYearRetailProducts')) {
      final l$previousYearRetailProducts = data['previousYearRetailProducts'];
      result$data['previousYearRetailProducts'] =
          (l$previousYearRetailProducts as String?);
    }
    if (data.containsKey('previousYearRetailRevenue')) {
      final l$previousYearRetailRevenue = data['previousYearRetailRevenue'];
      result$data['previousYearRetailRevenue'] =
          (l$previousYearRetailRevenue as String?);
    }
    if (data.containsKey('previousYearRevenue')) {
      final l$previousYearRevenue = data['previousYearRevenue'];
      result$data['previousYearRevenue'] = (l$previousYearRevenue as String?);
    }
    if (data.containsKey('previousYearShareCapital')) {
      final l$previousYearShareCapital = data['previousYearShareCapital'];
      result$data['previousYearShareCapital'] =
          (l$previousYearShareCapital as String?);
    }
    if (data.containsKey('previousYearShareholders')) {
      final l$previousYearShareholders = data['previousYearShareholders'];
      result$data['previousYearShareholders'] =
          (l$previousYearShareholders as int?);
    }
    if (data.containsKey('previousYearWholesaleProducts')) {
      final l$previousYearWholesaleProducts =
          data['previousYearWholesaleProducts'];
      result$data['previousYearWholesaleProducts'] =
          (l$previousYearWholesaleProducts as String?);
    }
    if (data.containsKey('previousYearWholesaleRevenue')) {
      final l$previousYearWholesaleRevenue =
          data['previousYearWholesaleRevenue'];
      result$data['previousYearWholesaleRevenue'] =
          (l$previousYearWholesaleRevenue as String?);
    }
    if (data.containsKey('targetRevenue')) {
      final l$targetRevenue = data['targetRevenue'];
      result$data['targetRevenue'] = (l$targetRevenue as String?);
    }
    if (data.containsKey('totalDebtToday')) {
      final l$totalDebtToday = data['totalDebtToday'];
      result$data['totalDebtToday'] = (l$totalDebtToday as String?);
    }
    if (data.containsKey('twoYearsBackAccountsPayable')) {
      final l$twoYearsBackAccountsPayable = data['twoYearsBackAccountsPayable'];
      result$data['twoYearsBackAccountsPayable'] =
          (l$twoYearsBackAccountsPayable as String?);
    }
    if (data.containsKey('twoYearsBackAccountsReceivable')) {
      final l$twoYearsBackAccountsReceivable =
          data['twoYearsBackAccountsReceivable'];
      result$data['twoYearsBackAccountsReceivable'] =
          (l$twoYearsBackAccountsReceivable as String?);
    }
    if (data.containsKey('twoYearsBackAssets')) {
      final l$twoYearsBackAssets = data['twoYearsBackAssets'];
      result$data['twoYearsBackAssets'] = (l$twoYearsBackAssets as String?);
    }
    if (data.containsKey('twoYearsBackClosingInventory')) {
      final l$twoYearsBackClosingInventory =
          data['twoYearsBackClosingInventory'];
      result$data['twoYearsBackClosingInventory'] =
          (l$twoYearsBackClosingInventory as String?);
    }
    if (data.containsKey('twoYearsBackCogs')) {
      final l$twoYearsBackCogs = data['twoYearsBackCogs'];
      result$data['twoYearsBackCogs'] = (l$twoYearsBackCogs as String?);
    }
    if (data.containsKey('twoYearsBackCurrentAssets')) {
      final l$twoYearsBackCurrentAssets = data['twoYearsBackCurrentAssets'];
      result$data['twoYearsBackCurrentAssets'] =
          (l$twoYearsBackCurrentAssets as String?);
    }
    if (data.containsKey('twoYearsBackCurrentLiabilities')) {
      final l$twoYearsBackCurrentLiabilities =
          data['twoYearsBackCurrentLiabilities'];
      result$data['twoYearsBackCurrentLiabilities'] =
          (l$twoYearsBackCurrentLiabilities as String?);
    }
    if (data.containsKey('twoYearsBackGrossProfit')) {
      final l$twoYearsBackGrossProfit = data['twoYearsBackGrossProfit'];
      result$data['twoYearsBackGrossProfit'] =
          (l$twoYearsBackGrossProfit as String?);
    }
    if (data.containsKey('twoYearsBackInstitutionalProducts')) {
      final l$twoYearsBackInstitutionalProducts =
          data['twoYearsBackInstitutionalProducts'];
      result$data['twoYearsBackInstitutionalProducts'] =
          (l$twoYearsBackInstitutionalProducts as String?);
    }
    if (data.containsKey('twoYearsBackInstitutionalRevenue')) {
      final l$twoYearsBackInstitutionalRevenue =
          data['twoYearsBackInstitutionalRevenue'];
      result$data['twoYearsBackInstitutionalRevenue'] =
          (l$twoYearsBackInstitutionalRevenue as String?);
    }
    if (data.containsKey('twoYearsBackLenderName')) {
      final l$twoYearsBackLenderName = data['twoYearsBackLenderName'];
      result$data['twoYearsBackLenderName'] =
          (l$twoYearsBackLenderName as String?);
    }
    if (data.containsKey('twoYearsBackLiabilities')) {
      final l$twoYearsBackLiabilities = data['twoYearsBackLiabilities'];
      result$data['twoYearsBackLiabilities'] =
          (l$twoYearsBackLiabilities as String?);
    }
    if (data.containsKey('twoYearsBackLoanAmount')) {
      final l$twoYearsBackLoanAmount = data['twoYearsBackLoanAmount'];
      result$data['twoYearsBackLoanAmount'] =
          (l$twoYearsBackLoanAmount as String?);
    }
    if (data.containsKey('twoYearsBackMatchingGrant')) {
      final l$twoYearsBackMatchingGrant = data['twoYearsBackMatchingGrant'];
      result$data['twoYearsBackMatchingGrant'] =
          (l$twoYearsBackMatchingGrant as String?);
    }
    if (data.containsKey('twoYearsBackNetProfit')) {
      final l$twoYearsBackNetProfit = data['twoYearsBackNetProfit'];
      result$data['twoYearsBackNetProfit'] =
          (l$twoYearsBackNetProfit as String?);
    }
    if (data.containsKey('twoYearsBackOpeningInventory')) {
      final l$twoYearsBackOpeningInventory =
          data['twoYearsBackOpeningInventory'];
      result$data['twoYearsBackOpeningInventory'] =
          (l$twoYearsBackOpeningInventory as String?);
    }
    if (data.containsKey('twoYearsBackProducts')) {
      final l$twoYearsBackProducts = data['twoYearsBackProducts'];
      result$data['twoYearsBackProducts'] = (l$twoYearsBackProducts as String?);
    }
    if (data.containsKey('twoYearsBackProjectGrant')) {
      final l$twoYearsBackProjectGrant = data['twoYearsBackProjectGrant'];
      result$data['twoYearsBackProjectGrant'] =
          (l$twoYearsBackProjectGrant as String?);
    }
    if (data.containsKey('twoYearsBackQuantityProcured')) {
      final l$twoYearsBackQuantityProcured =
          data['twoYearsBackQuantityProcured'];
      result$data['twoYearsBackQuantityProcured'] =
          (l$twoYearsBackQuantityProcured as String?);
    }
    if (data.containsKey('twoYearsBackQuantityProducts')) {
      final l$twoYearsBackQuantityProducts =
          data['twoYearsBackQuantityProducts'];
      result$data['twoYearsBackQuantityProducts'] =
          (l$twoYearsBackQuantityProducts as String?);
    }
    if (data.containsKey('twoYearsBackRetailProducts')) {
      final l$twoYearsBackRetailProducts = data['twoYearsBackRetailProducts'];
      result$data['twoYearsBackRetailProducts'] =
          (l$twoYearsBackRetailProducts as String?);
    }
    if (data.containsKey('twoYearsBackRetailRevenue')) {
      final l$twoYearsBackRetailRevenue = data['twoYearsBackRetailRevenue'];
      result$data['twoYearsBackRetailRevenue'] =
          (l$twoYearsBackRetailRevenue as String?);
    }
    if (data.containsKey('twoYearsBackRevenue')) {
      final l$twoYearsBackRevenue = data['twoYearsBackRevenue'];
      result$data['twoYearsBackRevenue'] = (l$twoYearsBackRevenue as String?);
    }
    if (data.containsKey('twoYearsBackShareCapital')) {
      final l$twoYearsBackShareCapital = data['twoYearsBackShareCapital'];
      result$data['twoYearsBackShareCapital'] =
          (l$twoYearsBackShareCapital as String?);
    }
    if (data.containsKey('twoYearsBackShareholders')) {
      final l$twoYearsBackShareholders = data['twoYearsBackShareholders'];
      result$data['twoYearsBackShareholders'] =
          (l$twoYearsBackShareholders as int?);
    }
    if (data.containsKey('twoYearsBackWholesaleProducts')) {
      final l$twoYearsBackWholesaleProducts =
          data['twoYearsBackWholesaleProducts'];
      result$data['twoYearsBackWholesaleProducts'] =
          (l$twoYearsBackWholesaleProducts as String?);
    }
    if (data.containsKey('twoYearsBackWholesaleRevenue')) {
      final l$twoYearsBackWholesaleRevenue =
          data['twoYearsBackWholesaleRevenue'];
      result$data['twoYearsBackWholesaleRevenue'] =
          (l$twoYearsBackWholesaleRevenue as String?);
    }
    return Input$FinancialDetailsSubmissionV2Input._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get cashChequePercentage =>
      (_$data['cashChequePercentage'] as String?);

  String? get creditDefaultAmount => (_$data['creditDefaultAmount'] as String?);

  String? get creditDefaultLender => (_$data['creditDefaultLender'] as String?);

  String? get creditDefaultYear => (_$data['creditDefaultYear'] as String?);

  String? get currentYearAccountsPayable =>
      (_$data['currentYearAccountsPayable'] as String?);

  String? get currentYearAccountsReceivable =>
      (_$data['currentYearAccountsReceivable'] as String?);

  String? get currentYearAssets => (_$data['currentYearAssets'] as String?);

  String? get currentYearClosingInventory =>
      (_$data['currentYearClosingInventory'] as String?);

  String? get currentYearCogs => (_$data['currentYearCogs'] as String?);

  String? get currentYearCurrentAssets =>
      (_$data['currentYearCurrentAssets'] as String?);

  String? get currentYearCurrentLiabilities =>
      (_$data['currentYearCurrentLiabilities'] as String?);

  String? get currentYearGrossProfit =>
      (_$data['currentYearGrossProfit'] as String?);

  String? get currentYearInstitutionalProducts =>
      (_$data['currentYearInstitutionalProducts'] as String?);

  String? get currentYearInstitutionalRevenue =>
      (_$data['currentYearInstitutionalRevenue'] as String?);

  String? get currentYearLenderName =>
      (_$data['currentYearLenderName'] as String?);

  String? get currentYearLiabilities =>
      (_$data['currentYearLiabilities'] as String?);

  String? get currentYearLoanAmount =>
      (_$data['currentYearLoanAmount'] as String?);

  String? get currentYearMatchingGrant =>
      (_$data['currentYearMatchingGrant'] as String?);

  String? get currentYearNetProfit =>
      (_$data['currentYearNetProfit'] as String?);

  String? get currentYearOpeningInventory =>
      (_$data['currentYearOpeningInventory'] as String?);

  String? get currentYearProducts => (_$data['currentYearProducts'] as String?);

  String? get currentYearProjectGrant =>
      (_$data['currentYearProjectGrant'] as String?);

  String? get currentYearQuantityProcured =>
      (_$data['currentYearQuantityProcured'] as String?);

  String? get currentYearQuantityProducts =>
      (_$data['currentYearQuantityProducts'] as String?);

  String? get currentYearRetailProducts =>
      (_$data['currentYearRetailProducts'] as String?);

  String? get currentYearRetailRevenue =>
      (_$data['currentYearRetailRevenue'] as String?);

  String? get currentYearRevenue => (_$data['currentYearRevenue'] as String?);

  String? get currentYearShareCapital =>
      (_$data['currentYearShareCapital'] as String?);

  int? get currentYearShareholders =>
      (_$data['currentYearShareholders'] as int?);

  String? get currentYearWholesaleProducts =>
      (_$data['currentYearWholesaleProducts'] as String?);

  String? get currentYearWholesaleRevenue =>
      (_$data['currentYearWholesaleRevenue'] as String?);

  int? get daysPayableReceivableDifference =>
      (_$data['daysPayableReceivableDifference'] as int?);

  String? get grossNetProfitMarginDifference =>
      (_$data['grossNetProfitMarginDifference'] as String?);

  String? get institutionalLendingHistory =>
      (_$data['institutionalLendingHistory'] as String?);

  String? get loanDetails => (_$data['loanDetails'] as String?);

  String? get operatingMarginCurrentYear =>
      (_$data['operatingMarginCurrentYear'] as String?);

  String? get previousYearAccountsPayable =>
      (_$data['previousYearAccountsPayable'] as String?);

  String? get previousYearAccountsReceivable =>
      (_$data['previousYearAccountsReceivable'] as String?);

  String? get previousYearAssets => (_$data['previousYearAssets'] as String?);

  String? get previousYearClosingInventory =>
      (_$data['previousYearClosingInventory'] as String?);

  String? get previousYearCogs => (_$data['previousYearCogs'] as String?);

  String? get previousYearCurrentAssets =>
      (_$data['previousYearCurrentAssets'] as String?);

  String? get previousYearCurrentLiabilities =>
      (_$data['previousYearCurrentLiabilities'] as String?);

  String? get previousYearGrossProfit =>
      (_$data['previousYearGrossProfit'] as String?);

  String? get previousYearInstitutionalProducts =>
      (_$data['previousYearInstitutionalProducts'] as String?);

  String? get previousYearInstitutionalRevenue =>
      (_$data['previousYearInstitutionalRevenue'] as String?);

  String? get previousYearLenderName =>
      (_$data['previousYearLenderName'] as String?);

  String? get previousYearLiabilities =>
      (_$data['previousYearLiabilities'] as String?);

  String? get previousYearLoanAmount =>
      (_$data['previousYearLoanAmount'] as String?);

  String? get previousYearMatchingGrant =>
      (_$data['previousYearMatchingGrant'] as String?);

  String? get previousYearNetProfit =>
      (_$data['previousYearNetProfit'] as String?);

  String? get previousYearOpeningInventory =>
      (_$data['previousYearOpeningInventory'] as String?);

  String? get previousYearProducts =>
      (_$data['previousYearProducts'] as String?);

  String? get previousYearProjectGrant =>
      (_$data['previousYearProjectGrant'] as String?);

  String? get previousYearQuantityProcured =>
      (_$data['previousYearQuantityProcured'] as String?);

  String? get previousYearQuantityProducts =>
      (_$data['previousYearQuantityProducts'] as String?);

  String? get previousYearRetailProducts =>
      (_$data['previousYearRetailProducts'] as String?);

  String? get previousYearRetailRevenue =>
      (_$data['previousYearRetailRevenue'] as String?);

  String? get previousYearRevenue => (_$data['previousYearRevenue'] as String?);

  String? get previousYearShareCapital =>
      (_$data['previousYearShareCapital'] as String?);

  int? get previousYearShareholders =>
      (_$data['previousYearShareholders'] as int?);

  String? get previousYearWholesaleProducts =>
      (_$data['previousYearWholesaleProducts'] as String?);

  String? get previousYearWholesaleRevenue =>
      (_$data['previousYearWholesaleRevenue'] as String?);

  String? get targetRevenue => (_$data['targetRevenue'] as String?);

  String? get totalDebtToday => (_$data['totalDebtToday'] as String?);

  String? get twoYearsBackAccountsPayable =>
      (_$data['twoYearsBackAccountsPayable'] as String?);

  String? get twoYearsBackAccountsReceivable =>
      (_$data['twoYearsBackAccountsReceivable'] as String?);

  String? get twoYearsBackAssets => (_$data['twoYearsBackAssets'] as String?);

  String? get twoYearsBackClosingInventory =>
      (_$data['twoYearsBackClosingInventory'] as String?);

  String? get twoYearsBackCogs => (_$data['twoYearsBackCogs'] as String?);

  String? get twoYearsBackCurrentAssets =>
      (_$data['twoYearsBackCurrentAssets'] as String?);

  String? get twoYearsBackCurrentLiabilities =>
      (_$data['twoYearsBackCurrentLiabilities'] as String?);

  String? get twoYearsBackGrossProfit =>
      (_$data['twoYearsBackGrossProfit'] as String?);

  String? get twoYearsBackInstitutionalProducts =>
      (_$data['twoYearsBackInstitutionalProducts'] as String?);

  String? get twoYearsBackInstitutionalRevenue =>
      (_$data['twoYearsBackInstitutionalRevenue'] as String?);

  String? get twoYearsBackLenderName =>
      (_$data['twoYearsBackLenderName'] as String?);

  String? get twoYearsBackLiabilities =>
      (_$data['twoYearsBackLiabilities'] as String?);

  String? get twoYearsBackLoanAmount =>
      (_$data['twoYearsBackLoanAmount'] as String?);

  String? get twoYearsBackMatchingGrant =>
      (_$data['twoYearsBackMatchingGrant'] as String?);

  String? get twoYearsBackNetProfit =>
      (_$data['twoYearsBackNetProfit'] as String?);

  String? get twoYearsBackOpeningInventory =>
      (_$data['twoYearsBackOpeningInventory'] as String?);

  String? get twoYearsBackProducts =>
      (_$data['twoYearsBackProducts'] as String?);

  String? get twoYearsBackProjectGrant =>
      (_$data['twoYearsBackProjectGrant'] as String?);

  String? get twoYearsBackQuantityProcured =>
      (_$data['twoYearsBackQuantityProcured'] as String?);

  String? get twoYearsBackQuantityProducts =>
      (_$data['twoYearsBackQuantityProducts'] as String?);

  String? get twoYearsBackRetailProducts =>
      (_$data['twoYearsBackRetailProducts'] as String?);

  String? get twoYearsBackRetailRevenue =>
      (_$data['twoYearsBackRetailRevenue'] as String?);

  String? get twoYearsBackRevenue => (_$data['twoYearsBackRevenue'] as String?);

  String? get twoYearsBackShareCapital =>
      (_$data['twoYearsBackShareCapital'] as String?);

  int? get twoYearsBackShareholders =>
      (_$data['twoYearsBackShareholders'] as int?);

  String? get twoYearsBackWholesaleProducts =>
      (_$data['twoYearsBackWholesaleProducts'] as String?);

  String? get twoYearsBackWholesaleRevenue =>
      (_$data['twoYearsBackWholesaleRevenue'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('cashChequePercentage')) {
      final l$cashChequePercentage = cashChequePercentage;
      result$data['cashChequePercentage'] = l$cashChequePercentage;
    }
    if (_$data.containsKey('creditDefaultAmount')) {
      final l$creditDefaultAmount = creditDefaultAmount;
      result$data['creditDefaultAmount'] = l$creditDefaultAmount;
    }
    if (_$data.containsKey('creditDefaultLender')) {
      final l$creditDefaultLender = creditDefaultLender;
      result$data['creditDefaultLender'] = l$creditDefaultLender;
    }
    if (_$data.containsKey('creditDefaultYear')) {
      final l$creditDefaultYear = creditDefaultYear;
      result$data['creditDefaultYear'] = l$creditDefaultYear;
    }
    if (_$data.containsKey('currentYearAccountsPayable')) {
      final l$currentYearAccountsPayable = currentYearAccountsPayable;
      result$data['currentYearAccountsPayable'] = l$currentYearAccountsPayable;
    }
    if (_$data.containsKey('currentYearAccountsReceivable')) {
      final l$currentYearAccountsReceivable = currentYearAccountsReceivable;
      result$data['currentYearAccountsReceivable'] =
          l$currentYearAccountsReceivable;
    }
    if (_$data.containsKey('currentYearAssets')) {
      final l$currentYearAssets = currentYearAssets;
      result$data['currentYearAssets'] = l$currentYearAssets;
    }
    if (_$data.containsKey('currentYearClosingInventory')) {
      final l$currentYearClosingInventory = currentYearClosingInventory;
      result$data['currentYearClosingInventory'] =
          l$currentYearClosingInventory;
    }
    if (_$data.containsKey('currentYearCogs')) {
      final l$currentYearCogs = currentYearCogs;
      result$data['currentYearCogs'] = l$currentYearCogs;
    }
    if (_$data.containsKey('currentYearCurrentAssets')) {
      final l$currentYearCurrentAssets = currentYearCurrentAssets;
      result$data['currentYearCurrentAssets'] = l$currentYearCurrentAssets;
    }
    if (_$data.containsKey('currentYearCurrentLiabilities')) {
      final l$currentYearCurrentLiabilities = currentYearCurrentLiabilities;
      result$data['currentYearCurrentLiabilities'] =
          l$currentYearCurrentLiabilities;
    }
    if (_$data.containsKey('currentYearGrossProfit')) {
      final l$currentYearGrossProfit = currentYearGrossProfit;
      result$data['currentYearGrossProfit'] = l$currentYearGrossProfit;
    }
    if (_$data.containsKey('currentYearInstitutionalProducts')) {
      final l$currentYearInstitutionalProducts =
          currentYearInstitutionalProducts;
      result$data['currentYearInstitutionalProducts'] =
          l$currentYearInstitutionalProducts;
    }
    if (_$data.containsKey('currentYearInstitutionalRevenue')) {
      final l$currentYearInstitutionalRevenue = currentYearInstitutionalRevenue;
      result$data['currentYearInstitutionalRevenue'] =
          l$currentYearInstitutionalRevenue;
    }
    if (_$data.containsKey('currentYearLenderName')) {
      final l$currentYearLenderName = currentYearLenderName;
      result$data['currentYearLenderName'] = l$currentYearLenderName;
    }
    if (_$data.containsKey('currentYearLiabilities')) {
      final l$currentYearLiabilities = currentYearLiabilities;
      result$data['currentYearLiabilities'] = l$currentYearLiabilities;
    }
    if (_$data.containsKey('currentYearLoanAmount')) {
      final l$currentYearLoanAmount = currentYearLoanAmount;
      result$data['currentYearLoanAmount'] = l$currentYearLoanAmount;
    }
    if (_$data.containsKey('currentYearMatchingGrant')) {
      final l$currentYearMatchingGrant = currentYearMatchingGrant;
      result$data['currentYearMatchingGrant'] = l$currentYearMatchingGrant;
    }
    if (_$data.containsKey('currentYearNetProfit')) {
      final l$currentYearNetProfit = currentYearNetProfit;
      result$data['currentYearNetProfit'] = l$currentYearNetProfit;
    }
    if (_$data.containsKey('currentYearOpeningInventory')) {
      final l$currentYearOpeningInventory = currentYearOpeningInventory;
      result$data['currentYearOpeningInventory'] =
          l$currentYearOpeningInventory;
    }
    if (_$data.containsKey('currentYearProducts')) {
      final l$currentYearProducts = currentYearProducts;
      result$data['currentYearProducts'] = l$currentYearProducts;
    }
    if (_$data.containsKey('currentYearProjectGrant')) {
      final l$currentYearProjectGrant = currentYearProjectGrant;
      result$data['currentYearProjectGrant'] = l$currentYearProjectGrant;
    }
    if (_$data.containsKey('currentYearQuantityProcured')) {
      final l$currentYearQuantityProcured = currentYearQuantityProcured;
      result$data['currentYearQuantityProcured'] =
          l$currentYearQuantityProcured;
    }
    if (_$data.containsKey('currentYearQuantityProducts')) {
      final l$currentYearQuantityProducts = currentYearQuantityProducts;
      result$data['currentYearQuantityProducts'] =
          l$currentYearQuantityProducts;
    }
    if (_$data.containsKey('currentYearRetailProducts')) {
      final l$currentYearRetailProducts = currentYearRetailProducts;
      result$data['currentYearRetailProducts'] = l$currentYearRetailProducts;
    }
    if (_$data.containsKey('currentYearRetailRevenue')) {
      final l$currentYearRetailRevenue = currentYearRetailRevenue;
      result$data['currentYearRetailRevenue'] = l$currentYearRetailRevenue;
    }
    if (_$data.containsKey('currentYearRevenue')) {
      final l$currentYearRevenue = currentYearRevenue;
      result$data['currentYearRevenue'] = l$currentYearRevenue;
    }
    if (_$data.containsKey('currentYearShareCapital')) {
      final l$currentYearShareCapital = currentYearShareCapital;
      result$data['currentYearShareCapital'] = l$currentYearShareCapital;
    }
    if (_$data.containsKey('currentYearShareholders')) {
      final l$currentYearShareholders = currentYearShareholders;
      result$data['currentYearShareholders'] = l$currentYearShareholders;
    }
    if (_$data.containsKey('currentYearWholesaleProducts')) {
      final l$currentYearWholesaleProducts = currentYearWholesaleProducts;
      result$data['currentYearWholesaleProducts'] =
          l$currentYearWholesaleProducts;
    }
    if (_$data.containsKey('currentYearWholesaleRevenue')) {
      final l$currentYearWholesaleRevenue = currentYearWholesaleRevenue;
      result$data['currentYearWholesaleRevenue'] =
          l$currentYearWholesaleRevenue;
    }
    if (_$data.containsKey('daysPayableReceivableDifference')) {
      final l$daysPayableReceivableDifference = daysPayableReceivableDifference;
      result$data['daysPayableReceivableDifference'] =
          l$daysPayableReceivableDifference;
    }
    if (_$data.containsKey('grossNetProfitMarginDifference')) {
      final l$grossNetProfitMarginDifference = grossNetProfitMarginDifference;
      result$data['grossNetProfitMarginDifference'] =
          l$grossNetProfitMarginDifference;
    }
    if (_$data.containsKey('institutionalLendingHistory')) {
      final l$institutionalLendingHistory = institutionalLendingHistory;
      result$data['institutionalLendingHistory'] =
          l$institutionalLendingHistory;
    }
    if (_$data.containsKey('loanDetails')) {
      final l$loanDetails = loanDetails;
      result$data['loanDetails'] = l$loanDetails;
    }
    if (_$data.containsKey('operatingMarginCurrentYear')) {
      final l$operatingMarginCurrentYear = operatingMarginCurrentYear;
      result$data['operatingMarginCurrentYear'] = l$operatingMarginCurrentYear;
    }
    if (_$data.containsKey('previousYearAccountsPayable')) {
      final l$previousYearAccountsPayable = previousYearAccountsPayable;
      result$data['previousYearAccountsPayable'] =
          l$previousYearAccountsPayable;
    }
    if (_$data.containsKey('previousYearAccountsReceivable')) {
      final l$previousYearAccountsReceivable = previousYearAccountsReceivable;
      result$data['previousYearAccountsReceivable'] =
          l$previousYearAccountsReceivable;
    }
    if (_$data.containsKey('previousYearAssets')) {
      final l$previousYearAssets = previousYearAssets;
      result$data['previousYearAssets'] = l$previousYearAssets;
    }
    if (_$data.containsKey('previousYearClosingInventory')) {
      final l$previousYearClosingInventory = previousYearClosingInventory;
      result$data['previousYearClosingInventory'] =
          l$previousYearClosingInventory;
    }
    if (_$data.containsKey('previousYearCogs')) {
      final l$previousYearCogs = previousYearCogs;
      result$data['previousYearCogs'] = l$previousYearCogs;
    }
    if (_$data.containsKey('previousYearCurrentAssets')) {
      final l$previousYearCurrentAssets = previousYearCurrentAssets;
      result$data['previousYearCurrentAssets'] = l$previousYearCurrentAssets;
    }
    if (_$data.containsKey('previousYearCurrentLiabilities')) {
      final l$previousYearCurrentLiabilities = previousYearCurrentLiabilities;
      result$data['previousYearCurrentLiabilities'] =
          l$previousYearCurrentLiabilities;
    }
    if (_$data.containsKey('previousYearGrossProfit')) {
      final l$previousYearGrossProfit = previousYearGrossProfit;
      result$data['previousYearGrossProfit'] = l$previousYearGrossProfit;
    }
    if (_$data.containsKey('previousYearInstitutionalProducts')) {
      final l$previousYearInstitutionalProducts =
          previousYearInstitutionalProducts;
      result$data['previousYearInstitutionalProducts'] =
          l$previousYearInstitutionalProducts;
    }
    if (_$data.containsKey('previousYearInstitutionalRevenue')) {
      final l$previousYearInstitutionalRevenue =
          previousYearInstitutionalRevenue;
      result$data['previousYearInstitutionalRevenue'] =
          l$previousYearInstitutionalRevenue;
    }
    if (_$data.containsKey('previousYearLenderName')) {
      final l$previousYearLenderName = previousYearLenderName;
      result$data['previousYearLenderName'] = l$previousYearLenderName;
    }
    if (_$data.containsKey('previousYearLiabilities')) {
      final l$previousYearLiabilities = previousYearLiabilities;
      result$data['previousYearLiabilities'] = l$previousYearLiabilities;
    }
    if (_$data.containsKey('previousYearLoanAmount')) {
      final l$previousYearLoanAmount = previousYearLoanAmount;
      result$data['previousYearLoanAmount'] = l$previousYearLoanAmount;
    }
    if (_$data.containsKey('previousYearMatchingGrant')) {
      final l$previousYearMatchingGrant = previousYearMatchingGrant;
      result$data['previousYearMatchingGrant'] = l$previousYearMatchingGrant;
    }
    if (_$data.containsKey('previousYearNetProfit')) {
      final l$previousYearNetProfit = previousYearNetProfit;
      result$data['previousYearNetProfit'] = l$previousYearNetProfit;
    }
    if (_$data.containsKey('previousYearOpeningInventory')) {
      final l$previousYearOpeningInventory = previousYearOpeningInventory;
      result$data['previousYearOpeningInventory'] =
          l$previousYearOpeningInventory;
    }
    if (_$data.containsKey('previousYearProducts')) {
      final l$previousYearProducts = previousYearProducts;
      result$data['previousYearProducts'] = l$previousYearProducts;
    }
    if (_$data.containsKey('previousYearProjectGrant')) {
      final l$previousYearProjectGrant = previousYearProjectGrant;
      result$data['previousYearProjectGrant'] = l$previousYearProjectGrant;
    }
    if (_$data.containsKey('previousYearQuantityProcured')) {
      final l$previousYearQuantityProcured = previousYearQuantityProcured;
      result$data['previousYearQuantityProcured'] =
          l$previousYearQuantityProcured;
    }
    if (_$data.containsKey('previousYearQuantityProducts')) {
      final l$previousYearQuantityProducts = previousYearQuantityProducts;
      result$data['previousYearQuantityProducts'] =
          l$previousYearQuantityProducts;
    }
    if (_$data.containsKey('previousYearRetailProducts')) {
      final l$previousYearRetailProducts = previousYearRetailProducts;
      result$data['previousYearRetailProducts'] = l$previousYearRetailProducts;
    }
    if (_$data.containsKey('previousYearRetailRevenue')) {
      final l$previousYearRetailRevenue = previousYearRetailRevenue;
      result$data['previousYearRetailRevenue'] = l$previousYearRetailRevenue;
    }
    if (_$data.containsKey('previousYearRevenue')) {
      final l$previousYearRevenue = previousYearRevenue;
      result$data['previousYearRevenue'] = l$previousYearRevenue;
    }
    if (_$data.containsKey('previousYearShareCapital')) {
      final l$previousYearShareCapital = previousYearShareCapital;
      result$data['previousYearShareCapital'] = l$previousYearShareCapital;
    }
    if (_$data.containsKey('previousYearShareholders')) {
      final l$previousYearShareholders = previousYearShareholders;
      result$data['previousYearShareholders'] = l$previousYearShareholders;
    }
    if (_$data.containsKey('previousYearWholesaleProducts')) {
      final l$previousYearWholesaleProducts = previousYearWholesaleProducts;
      result$data['previousYearWholesaleProducts'] =
          l$previousYearWholesaleProducts;
    }
    if (_$data.containsKey('previousYearWholesaleRevenue')) {
      final l$previousYearWholesaleRevenue = previousYearWholesaleRevenue;
      result$data['previousYearWholesaleRevenue'] =
          l$previousYearWholesaleRevenue;
    }
    if (_$data.containsKey('targetRevenue')) {
      final l$targetRevenue = targetRevenue;
      result$data['targetRevenue'] = l$targetRevenue;
    }
    if (_$data.containsKey('totalDebtToday')) {
      final l$totalDebtToday = totalDebtToday;
      result$data['totalDebtToday'] = l$totalDebtToday;
    }
    if (_$data.containsKey('twoYearsBackAccountsPayable')) {
      final l$twoYearsBackAccountsPayable = twoYearsBackAccountsPayable;
      result$data['twoYearsBackAccountsPayable'] =
          l$twoYearsBackAccountsPayable;
    }
    if (_$data.containsKey('twoYearsBackAccountsReceivable')) {
      final l$twoYearsBackAccountsReceivable = twoYearsBackAccountsReceivable;
      result$data['twoYearsBackAccountsReceivable'] =
          l$twoYearsBackAccountsReceivable;
    }
    if (_$data.containsKey('twoYearsBackAssets')) {
      final l$twoYearsBackAssets = twoYearsBackAssets;
      result$data['twoYearsBackAssets'] = l$twoYearsBackAssets;
    }
    if (_$data.containsKey('twoYearsBackClosingInventory')) {
      final l$twoYearsBackClosingInventory = twoYearsBackClosingInventory;
      result$data['twoYearsBackClosingInventory'] =
          l$twoYearsBackClosingInventory;
    }
    if (_$data.containsKey('twoYearsBackCogs')) {
      final l$twoYearsBackCogs = twoYearsBackCogs;
      result$data['twoYearsBackCogs'] = l$twoYearsBackCogs;
    }
    if (_$data.containsKey('twoYearsBackCurrentAssets')) {
      final l$twoYearsBackCurrentAssets = twoYearsBackCurrentAssets;
      result$data['twoYearsBackCurrentAssets'] = l$twoYearsBackCurrentAssets;
    }
    if (_$data.containsKey('twoYearsBackCurrentLiabilities')) {
      final l$twoYearsBackCurrentLiabilities = twoYearsBackCurrentLiabilities;
      result$data['twoYearsBackCurrentLiabilities'] =
          l$twoYearsBackCurrentLiabilities;
    }
    if (_$data.containsKey('twoYearsBackGrossProfit')) {
      final l$twoYearsBackGrossProfit = twoYearsBackGrossProfit;
      result$data['twoYearsBackGrossProfit'] = l$twoYearsBackGrossProfit;
    }
    if (_$data.containsKey('twoYearsBackInstitutionalProducts')) {
      final l$twoYearsBackInstitutionalProducts =
          twoYearsBackInstitutionalProducts;
      result$data['twoYearsBackInstitutionalProducts'] =
          l$twoYearsBackInstitutionalProducts;
    }
    if (_$data.containsKey('twoYearsBackInstitutionalRevenue')) {
      final l$twoYearsBackInstitutionalRevenue =
          twoYearsBackInstitutionalRevenue;
      result$data['twoYearsBackInstitutionalRevenue'] =
          l$twoYearsBackInstitutionalRevenue;
    }
    if (_$data.containsKey('twoYearsBackLenderName')) {
      final l$twoYearsBackLenderName = twoYearsBackLenderName;
      result$data['twoYearsBackLenderName'] = l$twoYearsBackLenderName;
    }
    if (_$data.containsKey('twoYearsBackLiabilities')) {
      final l$twoYearsBackLiabilities = twoYearsBackLiabilities;
      result$data['twoYearsBackLiabilities'] = l$twoYearsBackLiabilities;
    }
    if (_$data.containsKey('twoYearsBackLoanAmount')) {
      final l$twoYearsBackLoanAmount = twoYearsBackLoanAmount;
      result$data['twoYearsBackLoanAmount'] = l$twoYearsBackLoanAmount;
    }
    if (_$data.containsKey('twoYearsBackMatchingGrant')) {
      final l$twoYearsBackMatchingGrant = twoYearsBackMatchingGrant;
      result$data['twoYearsBackMatchingGrant'] = l$twoYearsBackMatchingGrant;
    }
    if (_$data.containsKey('twoYearsBackNetProfit')) {
      final l$twoYearsBackNetProfit = twoYearsBackNetProfit;
      result$data['twoYearsBackNetProfit'] = l$twoYearsBackNetProfit;
    }
    if (_$data.containsKey('twoYearsBackOpeningInventory')) {
      final l$twoYearsBackOpeningInventory = twoYearsBackOpeningInventory;
      result$data['twoYearsBackOpeningInventory'] =
          l$twoYearsBackOpeningInventory;
    }
    if (_$data.containsKey('twoYearsBackProducts')) {
      final l$twoYearsBackProducts = twoYearsBackProducts;
      result$data['twoYearsBackProducts'] = l$twoYearsBackProducts;
    }
    if (_$data.containsKey('twoYearsBackProjectGrant')) {
      final l$twoYearsBackProjectGrant = twoYearsBackProjectGrant;
      result$data['twoYearsBackProjectGrant'] = l$twoYearsBackProjectGrant;
    }
    if (_$data.containsKey('twoYearsBackQuantityProcured')) {
      final l$twoYearsBackQuantityProcured = twoYearsBackQuantityProcured;
      result$data['twoYearsBackQuantityProcured'] =
          l$twoYearsBackQuantityProcured;
    }
    if (_$data.containsKey('twoYearsBackQuantityProducts')) {
      final l$twoYearsBackQuantityProducts = twoYearsBackQuantityProducts;
      result$data['twoYearsBackQuantityProducts'] =
          l$twoYearsBackQuantityProducts;
    }
    if (_$data.containsKey('twoYearsBackRetailProducts')) {
      final l$twoYearsBackRetailProducts = twoYearsBackRetailProducts;
      result$data['twoYearsBackRetailProducts'] = l$twoYearsBackRetailProducts;
    }
    if (_$data.containsKey('twoYearsBackRetailRevenue')) {
      final l$twoYearsBackRetailRevenue = twoYearsBackRetailRevenue;
      result$data['twoYearsBackRetailRevenue'] = l$twoYearsBackRetailRevenue;
    }
    if (_$data.containsKey('twoYearsBackRevenue')) {
      final l$twoYearsBackRevenue = twoYearsBackRevenue;
      result$data['twoYearsBackRevenue'] = l$twoYearsBackRevenue;
    }
    if (_$data.containsKey('twoYearsBackShareCapital')) {
      final l$twoYearsBackShareCapital = twoYearsBackShareCapital;
      result$data['twoYearsBackShareCapital'] = l$twoYearsBackShareCapital;
    }
    if (_$data.containsKey('twoYearsBackShareholders')) {
      final l$twoYearsBackShareholders = twoYearsBackShareholders;
      result$data['twoYearsBackShareholders'] = l$twoYearsBackShareholders;
    }
    if (_$data.containsKey('twoYearsBackWholesaleProducts')) {
      final l$twoYearsBackWholesaleProducts = twoYearsBackWholesaleProducts;
      result$data['twoYearsBackWholesaleProducts'] =
          l$twoYearsBackWholesaleProducts;
    }
    if (_$data.containsKey('twoYearsBackWholesaleRevenue')) {
      final l$twoYearsBackWholesaleRevenue = twoYearsBackWholesaleRevenue;
      result$data['twoYearsBackWholesaleRevenue'] =
          l$twoYearsBackWholesaleRevenue;
    }
    return result$data;
  }

  CopyWith$Input$FinancialDetailsSubmissionV2Input<
          Input$FinancialDetailsSubmissionV2Input>
      get copyWith => CopyWith$Input$FinancialDetailsSubmissionV2Input(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$FinancialDetailsSubmissionV2Input ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$cashChequePercentage = cashChequePercentage;
    final lOther$cashChequePercentage = other.cashChequePercentage;
    if (_$data.containsKey('cashChequePercentage') !=
        other._$data.containsKey('cashChequePercentage')) {
      return false;
    }
    if (l$cashChequePercentage != lOther$cashChequePercentage) {
      return false;
    }
    final l$creditDefaultAmount = creditDefaultAmount;
    final lOther$creditDefaultAmount = other.creditDefaultAmount;
    if (_$data.containsKey('creditDefaultAmount') !=
        other._$data.containsKey('creditDefaultAmount')) {
      return false;
    }
    if (l$creditDefaultAmount != lOther$creditDefaultAmount) {
      return false;
    }
    final l$creditDefaultLender = creditDefaultLender;
    final lOther$creditDefaultLender = other.creditDefaultLender;
    if (_$data.containsKey('creditDefaultLender') !=
        other._$data.containsKey('creditDefaultLender')) {
      return false;
    }
    if (l$creditDefaultLender != lOther$creditDefaultLender) {
      return false;
    }
    final l$creditDefaultYear = creditDefaultYear;
    final lOther$creditDefaultYear = other.creditDefaultYear;
    if (_$data.containsKey('creditDefaultYear') !=
        other._$data.containsKey('creditDefaultYear')) {
      return false;
    }
    if (l$creditDefaultYear != lOther$creditDefaultYear) {
      return false;
    }
    final l$currentYearAccountsPayable = currentYearAccountsPayable;
    final lOther$currentYearAccountsPayable = other.currentYearAccountsPayable;
    if (_$data.containsKey('currentYearAccountsPayable') !=
        other._$data.containsKey('currentYearAccountsPayable')) {
      return false;
    }
    if (l$currentYearAccountsPayable != lOther$currentYearAccountsPayable) {
      return false;
    }
    final l$currentYearAccountsReceivable = currentYearAccountsReceivable;
    final lOther$currentYearAccountsReceivable =
        other.currentYearAccountsReceivable;
    if (_$data.containsKey('currentYearAccountsReceivable') !=
        other._$data.containsKey('currentYearAccountsReceivable')) {
      return false;
    }
    if (l$currentYearAccountsReceivable !=
        lOther$currentYearAccountsReceivable) {
      return false;
    }
    final l$currentYearAssets = currentYearAssets;
    final lOther$currentYearAssets = other.currentYearAssets;
    if (_$data.containsKey('currentYearAssets') !=
        other._$data.containsKey('currentYearAssets')) {
      return false;
    }
    if (l$currentYearAssets != lOther$currentYearAssets) {
      return false;
    }
    final l$currentYearClosingInventory = currentYearClosingInventory;
    final lOther$currentYearClosingInventory =
        other.currentYearClosingInventory;
    if (_$data.containsKey('currentYearClosingInventory') !=
        other._$data.containsKey('currentYearClosingInventory')) {
      return false;
    }
    if (l$currentYearClosingInventory != lOther$currentYearClosingInventory) {
      return false;
    }
    final l$currentYearCogs = currentYearCogs;
    final lOther$currentYearCogs = other.currentYearCogs;
    if (_$data.containsKey('currentYearCogs') !=
        other._$data.containsKey('currentYearCogs')) {
      return false;
    }
    if (l$currentYearCogs != lOther$currentYearCogs) {
      return false;
    }
    final l$currentYearCurrentAssets = currentYearCurrentAssets;
    final lOther$currentYearCurrentAssets = other.currentYearCurrentAssets;
    if (_$data.containsKey('currentYearCurrentAssets') !=
        other._$data.containsKey('currentYearCurrentAssets')) {
      return false;
    }
    if (l$currentYearCurrentAssets != lOther$currentYearCurrentAssets) {
      return false;
    }
    final l$currentYearCurrentLiabilities = currentYearCurrentLiabilities;
    final lOther$currentYearCurrentLiabilities =
        other.currentYearCurrentLiabilities;
    if (_$data.containsKey('currentYearCurrentLiabilities') !=
        other._$data.containsKey('currentYearCurrentLiabilities')) {
      return false;
    }
    if (l$currentYearCurrentLiabilities !=
        lOther$currentYearCurrentLiabilities) {
      return false;
    }
    final l$currentYearGrossProfit = currentYearGrossProfit;
    final lOther$currentYearGrossProfit = other.currentYearGrossProfit;
    if (_$data.containsKey('currentYearGrossProfit') !=
        other._$data.containsKey('currentYearGrossProfit')) {
      return false;
    }
    if (l$currentYearGrossProfit != lOther$currentYearGrossProfit) {
      return false;
    }
    final l$currentYearInstitutionalProducts = currentYearInstitutionalProducts;
    final lOther$currentYearInstitutionalProducts =
        other.currentYearInstitutionalProducts;
    if (_$data.containsKey('currentYearInstitutionalProducts') !=
        other._$data.containsKey('currentYearInstitutionalProducts')) {
      return false;
    }
    if (l$currentYearInstitutionalProducts !=
        lOther$currentYearInstitutionalProducts) {
      return false;
    }
    final l$currentYearInstitutionalRevenue = currentYearInstitutionalRevenue;
    final lOther$currentYearInstitutionalRevenue =
        other.currentYearInstitutionalRevenue;
    if (_$data.containsKey('currentYearInstitutionalRevenue') !=
        other._$data.containsKey('currentYearInstitutionalRevenue')) {
      return false;
    }
    if (l$currentYearInstitutionalRevenue !=
        lOther$currentYearInstitutionalRevenue) {
      return false;
    }
    final l$currentYearLenderName = currentYearLenderName;
    final lOther$currentYearLenderName = other.currentYearLenderName;
    if (_$data.containsKey('currentYearLenderName') !=
        other._$data.containsKey('currentYearLenderName')) {
      return false;
    }
    if (l$currentYearLenderName != lOther$currentYearLenderName) {
      return false;
    }
    final l$currentYearLiabilities = currentYearLiabilities;
    final lOther$currentYearLiabilities = other.currentYearLiabilities;
    if (_$data.containsKey('currentYearLiabilities') !=
        other._$data.containsKey('currentYearLiabilities')) {
      return false;
    }
    if (l$currentYearLiabilities != lOther$currentYearLiabilities) {
      return false;
    }
    final l$currentYearLoanAmount = currentYearLoanAmount;
    final lOther$currentYearLoanAmount = other.currentYearLoanAmount;
    if (_$data.containsKey('currentYearLoanAmount') !=
        other._$data.containsKey('currentYearLoanAmount')) {
      return false;
    }
    if (l$currentYearLoanAmount != lOther$currentYearLoanAmount) {
      return false;
    }
    final l$currentYearMatchingGrant = currentYearMatchingGrant;
    final lOther$currentYearMatchingGrant = other.currentYearMatchingGrant;
    if (_$data.containsKey('currentYearMatchingGrant') !=
        other._$data.containsKey('currentYearMatchingGrant')) {
      return false;
    }
    if (l$currentYearMatchingGrant != lOther$currentYearMatchingGrant) {
      return false;
    }
    final l$currentYearNetProfit = currentYearNetProfit;
    final lOther$currentYearNetProfit = other.currentYearNetProfit;
    if (_$data.containsKey('currentYearNetProfit') !=
        other._$data.containsKey('currentYearNetProfit')) {
      return false;
    }
    if (l$currentYearNetProfit != lOther$currentYearNetProfit) {
      return false;
    }
    final l$currentYearOpeningInventory = currentYearOpeningInventory;
    final lOther$currentYearOpeningInventory =
        other.currentYearOpeningInventory;
    if (_$data.containsKey('currentYearOpeningInventory') !=
        other._$data.containsKey('currentYearOpeningInventory')) {
      return false;
    }
    if (l$currentYearOpeningInventory != lOther$currentYearOpeningInventory) {
      return false;
    }
    final l$currentYearProducts = currentYearProducts;
    final lOther$currentYearProducts = other.currentYearProducts;
    if (_$data.containsKey('currentYearProducts') !=
        other._$data.containsKey('currentYearProducts')) {
      return false;
    }
    if (l$currentYearProducts != lOther$currentYearProducts) {
      return false;
    }
    final l$currentYearProjectGrant = currentYearProjectGrant;
    final lOther$currentYearProjectGrant = other.currentYearProjectGrant;
    if (_$data.containsKey('currentYearProjectGrant') !=
        other._$data.containsKey('currentYearProjectGrant')) {
      return false;
    }
    if (l$currentYearProjectGrant != lOther$currentYearProjectGrant) {
      return false;
    }
    final l$currentYearQuantityProcured = currentYearQuantityProcured;
    final lOther$currentYearQuantityProcured =
        other.currentYearQuantityProcured;
    if (_$data.containsKey('currentYearQuantityProcured') !=
        other._$data.containsKey('currentYearQuantityProcured')) {
      return false;
    }
    if (l$currentYearQuantityProcured != lOther$currentYearQuantityProcured) {
      return false;
    }
    final l$currentYearQuantityProducts = currentYearQuantityProducts;
    final lOther$currentYearQuantityProducts =
        other.currentYearQuantityProducts;
    if (_$data.containsKey('currentYearQuantityProducts') !=
        other._$data.containsKey('currentYearQuantityProducts')) {
      return false;
    }
    if (l$currentYearQuantityProducts != lOther$currentYearQuantityProducts) {
      return false;
    }
    final l$currentYearRetailProducts = currentYearRetailProducts;
    final lOther$currentYearRetailProducts = other.currentYearRetailProducts;
    if (_$data.containsKey('currentYearRetailProducts') !=
        other._$data.containsKey('currentYearRetailProducts')) {
      return false;
    }
    if (l$currentYearRetailProducts != lOther$currentYearRetailProducts) {
      return false;
    }
    final l$currentYearRetailRevenue = currentYearRetailRevenue;
    final lOther$currentYearRetailRevenue = other.currentYearRetailRevenue;
    if (_$data.containsKey('currentYearRetailRevenue') !=
        other._$data.containsKey('currentYearRetailRevenue')) {
      return false;
    }
    if (l$currentYearRetailRevenue != lOther$currentYearRetailRevenue) {
      return false;
    }
    final l$currentYearRevenue = currentYearRevenue;
    final lOther$currentYearRevenue = other.currentYearRevenue;
    if (_$data.containsKey('currentYearRevenue') !=
        other._$data.containsKey('currentYearRevenue')) {
      return false;
    }
    if (l$currentYearRevenue != lOther$currentYearRevenue) {
      return false;
    }
    final l$currentYearShareCapital = currentYearShareCapital;
    final lOther$currentYearShareCapital = other.currentYearShareCapital;
    if (_$data.containsKey('currentYearShareCapital') !=
        other._$data.containsKey('currentYearShareCapital')) {
      return false;
    }
    if (l$currentYearShareCapital != lOther$currentYearShareCapital) {
      return false;
    }
    final l$currentYearShareholders = currentYearShareholders;
    final lOther$currentYearShareholders = other.currentYearShareholders;
    if (_$data.containsKey('currentYearShareholders') !=
        other._$data.containsKey('currentYearShareholders')) {
      return false;
    }
    if (l$currentYearShareholders != lOther$currentYearShareholders) {
      return false;
    }
    final l$currentYearWholesaleProducts = currentYearWholesaleProducts;
    final lOther$currentYearWholesaleProducts =
        other.currentYearWholesaleProducts;
    if (_$data.containsKey('currentYearWholesaleProducts') !=
        other._$data.containsKey('currentYearWholesaleProducts')) {
      return false;
    }
    if (l$currentYearWholesaleProducts != lOther$currentYearWholesaleProducts) {
      return false;
    }
    final l$currentYearWholesaleRevenue = currentYearWholesaleRevenue;
    final lOther$currentYearWholesaleRevenue =
        other.currentYearWholesaleRevenue;
    if (_$data.containsKey('currentYearWholesaleRevenue') !=
        other._$data.containsKey('currentYearWholesaleRevenue')) {
      return false;
    }
    if (l$currentYearWholesaleRevenue != lOther$currentYearWholesaleRevenue) {
      return false;
    }
    final l$daysPayableReceivableDifference = daysPayableReceivableDifference;
    final lOther$daysPayableReceivableDifference =
        other.daysPayableReceivableDifference;
    if (_$data.containsKey('daysPayableReceivableDifference') !=
        other._$data.containsKey('daysPayableReceivableDifference')) {
      return false;
    }
    if (l$daysPayableReceivableDifference !=
        lOther$daysPayableReceivableDifference) {
      return false;
    }
    final l$grossNetProfitMarginDifference = grossNetProfitMarginDifference;
    final lOther$grossNetProfitMarginDifference =
        other.grossNetProfitMarginDifference;
    if (_$data.containsKey('grossNetProfitMarginDifference') !=
        other._$data.containsKey('grossNetProfitMarginDifference')) {
      return false;
    }
    if (l$grossNetProfitMarginDifference !=
        lOther$grossNetProfitMarginDifference) {
      return false;
    }
    final l$institutionalLendingHistory = institutionalLendingHistory;
    final lOther$institutionalLendingHistory =
        other.institutionalLendingHistory;
    if (_$data.containsKey('institutionalLendingHistory') !=
        other._$data.containsKey('institutionalLendingHistory')) {
      return false;
    }
    if (l$institutionalLendingHistory != lOther$institutionalLendingHistory) {
      return false;
    }
    final l$loanDetails = loanDetails;
    final lOther$loanDetails = other.loanDetails;
    if (_$data.containsKey('loanDetails') !=
        other._$data.containsKey('loanDetails')) {
      return false;
    }
    if (l$loanDetails != lOther$loanDetails) {
      return false;
    }
    final l$operatingMarginCurrentYear = operatingMarginCurrentYear;
    final lOther$operatingMarginCurrentYear = other.operatingMarginCurrentYear;
    if (_$data.containsKey('operatingMarginCurrentYear') !=
        other._$data.containsKey('operatingMarginCurrentYear')) {
      return false;
    }
    if (l$operatingMarginCurrentYear != lOther$operatingMarginCurrentYear) {
      return false;
    }
    final l$previousYearAccountsPayable = previousYearAccountsPayable;
    final lOther$previousYearAccountsPayable =
        other.previousYearAccountsPayable;
    if (_$data.containsKey('previousYearAccountsPayable') !=
        other._$data.containsKey('previousYearAccountsPayable')) {
      return false;
    }
    if (l$previousYearAccountsPayable != lOther$previousYearAccountsPayable) {
      return false;
    }
    final l$previousYearAccountsReceivable = previousYearAccountsReceivable;
    final lOther$previousYearAccountsReceivable =
        other.previousYearAccountsReceivable;
    if (_$data.containsKey('previousYearAccountsReceivable') !=
        other._$data.containsKey('previousYearAccountsReceivable')) {
      return false;
    }
    if (l$previousYearAccountsReceivable !=
        lOther$previousYearAccountsReceivable) {
      return false;
    }
    final l$previousYearAssets = previousYearAssets;
    final lOther$previousYearAssets = other.previousYearAssets;
    if (_$data.containsKey('previousYearAssets') !=
        other._$data.containsKey('previousYearAssets')) {
      return false;
    }
    if (l$previousYearAssets != lOther$previousYearAssets) {
      return false;
    }
    final l$previousYearClosingInventory = previousYearClosingInventory;
    final lOther$previousYearClosingInventory =
        other.previousYearClosingInventory;
    if (_$data.containsKey('previousYearClosingInventory') !=
        other._$data.containsKey('previousYearClosingInventory')) {
      return false;
    }
    if (l$previousYearClosingInventory != lOther$previousYearClosingInventory) {
      return false;
    }
    final l$previousYearCogs = previousYearCogs;
    final lOther$previousYearCogs = other.previousYearCogs;
    if (_$data.containsKey('previousYearCogs') !=
        other._$data.containsKey('previousYearCogs')) {
      return false;
    }
    if (l$previousYearCogs != lOther$previousYearCogs) {
      return false;
    }
    final l$previousYearCurrentAssets = previousYearCurrentAssets;
    final lOther$previousYearCurrentAssets = other.previousYearCurrentAssets;
    if (_$data.containsKey('previousYearCurrentAssets') !=
        other._$data.containsKey('previousYearCurrentAssets')) {
      return false;
    }
    if (l$previousYearCurrentAssets != lOther$previousYearCurrentAssets) {
      return false;
    }
    final l$previousYearCurrentLiabilities = previousYearCurrentLiabilities;
    final lOther$previousYearCurrentLiabilities =
        other.previousYearCurrentLiabilities;
    if (_$data.containsKey('previousYearCurrentLiabilities') !=
        other._$data.containsKey('previousYearCurrentLiabilities')) {
      return false;
    }
    if (l$previousYearCurrentLiabilities !=
        lOther$previousYearCurrentLiabilities) {
      return false;
    }
    final l$previousYearGrossProfit = previousYearGrossProfit;
    final lOther$previousYearGrossProfit = other.previousYearGrossProfit;
    if (_$data.containsKey('previousYearGrossProfit') !=
        other._$data.containsKey('previousYearGrossProfit')) {
      return false;
    }
    if (l$previousYearGrossProfit != lOther$previousYearGrossProfit) {
      return false;
    }
    final l$previousYearInstitutionalProducts =
        previousYearInstitutionalProducts;
    final lOther$previousYearInstitutionalProducts =
        other.previousYearInstitutionalProducts;
    if (_$data.containsKey('previousYearInstitutionalProducts') !=
        other._$data.containsKey('previousYearInstitutionalProducts')) {
      return false;
    }
    if (l$previousYearInstitutionalProducts !=
        lOther$previousYearInstitutionalProducts) {
      return false;
    }
    final l$previousYearInstitutionalRevenue = previousYearInstitutionalRevenue;
    final lOther$previousYearInstitutionalRevenue =
        other.previousYearInstitutionalRevenue;
    if (_$data.containsKey('previousYearInstitutionalRevenue') !=
        other._$data.containsKey('previousYearInstitutionalRevenue')) {
      return false;
    }
    if (l$previousYearInstitutionalRevenue !=
        lOther$previousYearInstitutionalRevenue) {
      return false;
    }
    final l$previousYearLenderName = previousYearLenderName;
    final lOther$previousYearLenderName = other.previousYearLenderName;
    if (_$data.containsKey('previousYearLenderName') !=
        other._$data.containsKey('previousYearLenderName')) {
      return false;
    }
    if (l$previousYearLenderName != lOther$previousYearLenderName) {
      return false;
    }
    final l$previousYearLiabilities = previousYearLiabilities;
    final lOther$previousYearLiabilities = other.previousYearLiabilities;
    if (_$data.containsKey('previousYearLiabilities') !=
        other._$data.containsKey('previousYearLiabilities')) {
      return false;
    }
    if (l$previousYearLiabilities != lOther$previousYearLiabilities) {
      return false;
    }
    final l$previousYearLoanAmount = previousYearLoanAmount;
    final lOther$previousYearLoanAmount = other.previousYearLoanAmount;
    if (_$data.containsKey('previousYearLoanAmount') !=
        other._$data.containsKey('previousYearLoanAmount')) {
      return false;
    }
    if (l$previousYearLoanAmount != lOther$previousYearLoanAmount) {
      return false;
    }
    final l$previousYearMatchingGrant = previousYearMatchingGrant;
    final lOther$previousYearMatchingGrant = other.previousYearMatchingGrant;
    if (_$data.containsKey('previousYearMatchingGrant') !=
        other._$data.containsKey('previousYearMatchingGrant')) {
      return false;
    }
    if (l$previousYearMatchingGrant != lOther$previousYearMatchingGrant) {
      return false;
    }
    final l$previousYearNetProfit = previousYearNetProfit;
    final lOther$previousYearNetProfit = other.previousYearNetProfit;
    if (_$data.containsKey('previousYearNetProfit') !=
        other._$data.containsKey('previousYearNetProfit')) {
      return false;
    }
    if (l$previousYearNetProfit != lOther$previousYearNetProfit) {
      return false;
    }
    final l$previousYearOpeningInventory = previousYearOpeningInventory;
    final lOther$previousYearOpeningInventory =
        other.previousYearOpeningInventory;
    if (_$data.containsKey('previousYearOpeningInventory') !=
        other._$data.containsKey('previousYearOpeningInventory')) {
      return false;
    }
    if (l$previousYearOpeningInventory != lOther$previousYearOpeningInventory) {
      return false;
    }
    final l$previousYearProducts = previousYearProducts;
    final lOther$previousYearProducts = other.previousYearProducts;
    if (_$data.containsKey('previousYearProducts') !=
        other._$data.containsKey('previousYearProducts')) {
      return false;
    }
    if (l$previousYearProducts != lOther$previousYearProducts) {
      return false;
    }
    final l$previousYearProjectGrant = previousYearProjectGrant;
    final lOther$previousYearProjectGrant = other.previousYearProjectGrant;
    if (_$data.containsKey('previousYearProjectGrant') !=
        other._$data.containsKey('previousYearProjectGrant')) {
      return false;
    }
    if (l$previousYearProjectGrant != lOther$previousYearProjectGrant) {
      return false;
    }
    final l$previousYearQuantityProcured = previousYearQuantityProcured;
    final lOther$previousYearQuantityProcured =
        other.previousYearQuantityProcured;
    if (_$data.containsKey('previousYearQuantityProcured') !=
        other._$data.containsKey('previousYearQuantityProcured')) {
      return false;
    }
    if (l$previousYearQuantityProcured != lOther$previousYearQuantityProcured) {
      return false;
    }
    final l$previousYearQuantityProducts = previousYearQuantityProducts;
    final lOther$previousYearQuantityProducts =
        other.previousYearQuantityProducts;
    if (_$data.containsKey('previousYearQuantityProducts') !=
        other._$data.containsKey('previousYearQuantityProducts')) {
      return false;
    }
    if (l$previousYearQuantityProducts != lOther$previousYearQuantityProducts) {
      return false;
    }
    final l$previousYearRetailProducts = previousYearRetailProducts;
    final lOther$previousYearRetailProducts = other.previousYearRetailProducts;
    if (_$data.containsKey('previousYearRetailProducts') !=
        other._$data.containsKey('previousYearRetailProducts')) {
      return false;
    }
    if (l$previousYearRetailProducts != lOther$previousYearRetailProducts) {
      return false;
    }
    final l$previousYearRetailRevenue = previousYearRetailRevenue;
    final lOther$previousYearRetailRevenue = other.previousYearRetailRevenue;
    if (_$data.containsKey('previousYearRetailRevenue') !=
        other._$data.containsKey('previousYearRetailRevenue')) {
      return false;
    }
    if (l$previousYearRetailRevenue != lOther$previousYearRetailRevenue) {
      return false;
    }
    final l$previousYearRevenue = previousYearRevenue;
    final lOther$previousYearRevenue = other.previousYearRevenue;
    if (_$data.containsKey('previousYearRevenue') !=
        other._$data.containsKey('previousYearRevenue')) {
      return false;
    }
    if (l$previousYearRevenue != lOther$previousYearRevenue) {
      return false;
    }
    final l$previousYearShareCapital = previousYearShareCapital;
    final lOther$previousYearShareCapital = other.previousYearShareCapital;
    if (_$data.containsKey('previousYearShareCapital') !=
        other._$data.containsKey('previousYearShareCapital')) {
      return false;
    }
    if (l$previousYearShareCapital != lOther$previousYearShareCapital) {
      return false;
    }
    final l$previousYearShareholders = previousYearShareholders;
    final lOther$previousYearShareholders = other.previousYearShareholders;
    if (_$data.containsKey('previousYearShareholders') !=
        other._$data.containsKey('previousYearShareholders')) {
      return false;
    }
    if (l$previousYearShareholders != lOther$previousYearShareholders) {
      return false;
    }
    final l$previousYearWholesaleProducts = previousYearWholesaleProducts;
    final lOther$previousYearWholesaleProducts =
        other.previousYearWholesaleProducts;
    if (_$data.containsKey('previousYearWholesaleProducts') !=
        other._$data.containsKey('previousYearWholesaleProducts')) {
      return false;
    }
    if (l$previousYearWholesaleProducts !=
        lOther$previousYearWholesaleProducts) {
      return false;
    }
    final l$previousYearWholesaleRevenue = previousYearWholesaleRevenue;
    final lOther$previousYearWholesaleRevenue =
        other.previousYearWholesaleRevenue;
    if (_$data.containsKey('previousYearWholesaleRevenue') !=
        other._$data.containsKey('previousYearWholesaleRevenue')) {
      return false;
    }
    if (l$previousYearWholesaleRevenue != lOther$previousYearWholesaleRevenue) {
      return false;
    }
    final l$targetRevenue = targetRevenue;
    final lOther$targetRevenue = other.targetRevenue;
    if (_$data.containsKey('targetRevenue') !=
        other._$data.containsKey('targetRevenue')) {
      return false;
    }
    if (l$targetRevenue != lOther$targetRevenue) {
      return false;
    }
    final l$totalDebtToday = totalDebtToday;
    final lOther$totalDebtToday = other.totalDebtToday;
    if (_$data.containsKey('totalDebtToday') !=
        other._$data.containsKey('totalDebtToday')) {
      return false;
    }
    if (l$totalDebtToday != lOther$totalDebtToday) {
      return false;
    }
    final l$twoYearsBackAccountsPayable = twoYearsBackAccountsPayable;
    final lOther$twoYearsBackAccountsPayable =
        other.twoYearsBackAccountsPayable;
    if (_$data.containsKey('twoYearsBackAccountsPayable') !=
        other._$data.containsKey('twoYearsBackAccountsPayable')) {
      return false;
    }
    if (l$twoYearsBackAccountsPayable != lOther$twoYearsBackAccountsPayable) {
      return false;
    }
    final l$twoYearsBackAccountsReceivable = twoYearsBackAccountsReceivable;
    final lOther$twoYearsBackAccountsReceivable =
        other.twoYearsBackAccountsReceivable;
    if (_$data.containsKey('twoYearsBackAccountsReceivable') !=
        other._$data.containsKey('twoYearsBackAccountsReceivable')) {
      return false;
    }
    if (l$twoYearsBackAccountsReceivable !=
        lOther$twoYearsBackAccountsReceivable) {
      return false;
    }
    final l$twoYearsBackAssets = twoYearsBackAssets;
    final lOther$twoYearsBackAssets = other.twoYearsBackAssets;
    if (_$data.containsKey('twoYearsBackAssets') !=
        other._$data.containsKey('twoYearsBackAssets')) {
      return false;
    }
    if (l$twoYearsBackAssets != lOther$twoYearsBackAssets) {
      return false;
    }
    final l$twoYearsBackClosingInventory = twoYearsBackClosingInventory;
    final lOther$twoYearsBackClosingInventory =
        other.twoYearsBackClosingInventory;
    if (_$data.containsKey('twoYearsBackClosingInventory') !=
        other._$data.containsKey('twoYearsBackClosingInventory')) {
      return false;
    }
    if (l$twoYearsBackClosingInventory != lOther$twoYearsBackClosingInventory) {
      return false;
    }
    final l$twoYearsBackCogs = twoYearsBackCogs;
    final lOther$twoYearsBackCogs = other.twoYearsBackCogs;
    if (_$data.containsKey('twoYearsBackCogs') !=
        other._$data.containsKey('twoYearsBackCogs')) {
      return false;
    }
    if (l$twoYearsBackCogs != lOther$twoYearsBackCogs) {
      return false;
    }
    final l$twoYearsBackCurrentAssets = twoYearsBackCurrentAssets;
    final lOther$twoYearsBackCurrentAssets = other.twoYearsBackCurrentAssets;
    if (_$data.containsKey('twoYearsBackCurrentAssets') !=
        other._$data.containsKey('twoYearsBackCurrentAssets')) {
      return false;
    }
    if (l$twoYearsBackCurrentAssets != lOther$twoYearsBackCurrentAssets) {
      return false;
    }
    final l$twoYearsBackCurrentLiabilities = twoYearsBackCurrentLiabilities;
    final lOther$twoYearsBackCurrentLiabilities =
        other.twoYearsBackCurrentLiabilities;
    if (_$data.containsKey('twoYearsBackCurrentLiabilities') !=
        other._$data.containsKey('twoYearsBackCurrentLiabilities')) {
      return false;
    }
    if (l$twoYearsBackCurrentLiabilities !=
        lOther$twoYearsBackCurrentLiabilities) {
      return false;
    }
    final l$twoYearsBackGrossProfit = twoYearsBackGrossProfit;
    final lOther$twoYearsBackGrossProfit = other.twoYearsBackGrossProfit;
    if (_$data.containsKey('twoYearsBackGrossProfit') !=
        other._$data.containsKey('twoYearsBackGrossProfit')) {
      return false;
    }
    if (l$twoYearsBackGrossProfit != lOther$twoYearsBackGrossProfit) {
      return false;
    }
    final l$twoYearsBackInstitutionalProducts =
        twoYearsBackInstitutionalProducts;
    final lOther$twoYearsBackInstitutionalProducts =
        other.twoYearsBackInstitutionalProducts;
    if (_$data.containsKey('twoYearsBackInstitutionalProducts') !=
        other._$data.containsKey('twoYearsBackInstitutionalProducts')) {
      return false;
    }
    if (l$twoYearsBackInstitutionalProducts !=
        lOther$twoYearsBackInstitutionalProducts) {
      return false;
    }
    final l$twoYearsBackInstitutionalRevenue = twoYearsBackInstitutionalRevenue;
    final lOther$twoYearsBackInstitutionalRevenue =
        other.twoYearsBackInstitutionalRevenue;
    if (_$data.containsKey('twoYearsBackInstitutionalRevenue') !=
        other._$data.containsKey('twoYearsBackInstitutionalRevenue')) {
      return false;
    }
    if (l$twoYearsBackInstitutionalRevenue !=
        lOther$twoYearsBackInstitutionalRevenue) {
      return false;
    }
    final l$twoYearsBackLenderName = twoYearsBackLenderName;
    final lOther$twoYearsBackLenderName = other.twoYearsBackLenderName;
    if (_$data.containsKey('twoYearsBackLenderName') !=
        other._$data.containsKey('twoYearsBackLenderName')) {
      return false;
    }
    if (l$twoYearsBackLenderName != lOther$twoYearsBackLenderName) {
      return false;
    }
    final l$twoYearsBackLiabilities = twoYearsBackLiabilities;
    final lOther$twoYearsBackLiabilities = other.twoYearsBackLiabilities;
    if (_$data.containsKey('twoYearsBackLiabilities') !=
        other._$data.containsKey('twoYearsBackLiabilities')) {
      return false;
    }
    if (l$twoYearsBackLiabilities != lOther$twoYearsBackLiabilities) {
      return false;
    }
    final l$twoYearsBackLoanAmount = twoYearsBackLoanAmount;
    final lOther$twoYearsBackLoanAmount = other.twoYearsBackLoanAmount;
    if (_$data.containsKey('twoYearsBackLoanAmount') !=
        other._$data.containsKey('twoYearsBackLoanAmount')) {
      return false;
    }
    if (l$twoYearsBackLoanAmount != lOther$twoYearsBackLoanAmount) {
      return false;
    }
    final l$twoYearsBackMatchingGrant = twoYearsBackMatchingGrant;
    final lOther$twoYearsBackMatchingGrant = other.twoYearsBackMatchingGrant;
    if (_$data.containsKey('twoYearsBackMatchingGrant') !=
        other._$data.containsKey('twoYearsBackMatchingGrant')) {
      return false;
    }
    if (l$twoYearsBackMatchingGrant != lOther$twoYearsBackMatchingGrant) {
      return false;
    }
    final l$twoYearsBackNetProfit = twoYearsBackNetProfit;
    final lOther$twoYearsBackNetProfit = other.twoYearsBackNetProfit;
    if (_$data.containsKey('twoYearsBackNetProfit') !=
        other._$data.containsKey('twoYearsBackNetProfit')) {
      return false;
    }
    if (l$twoYearsBackNetProfit != lOther$twoYearsBackNetProfit) {
      return false;
    }
    final l$twoYearsBackOpeningInventory = twoYearsBackOpeningInventory;
    final lOther$twoYearsBackOpeningInventory =
        other.twoYearsBackOpeningInventory;
    if (_$data.containsKey('twoYearsBackOpeningInventory') !=
        other._$data.containsKey('twoYearsBackOpeningInventory')) {
      return false;
    }
    if (l$twoYearsBackOpeningInventory != lOther$twoYearsBackOpeningInventory) {
      return false;
    }
    final l$twoYearsBackProducts = twoYearsBackProducts;
    final lOther$twoYearsBackProducts = other.twoYearsBackProducts;
    if (_$data.containsKey('twoYearsBackProducts') !=
        other._$data.containsKey('twoYearsBackProducts')) {
      return false;
    }
    if (l$twoYearsBackProducts != lOther$twoYearsBackProducts) {
      return false;
    }
    final l$twoYearsBackProjectGrant = twoYearsBackProjectGrant;
    final lOther$twoYearsBackProjectGrant = other.twoYearsBackProjectGrant;
    if (_$data.containsKey('twoYearsBackProjectGrant') !=
        other._$data.containsKey('twoYearsBackProjectGrant')) {
      return false;
    }
    if (l$twoYearsBackProjectGrant != lOther$twoYearsBackProjectGrant) {
      return false;
    }
    final l$twoYearsBackQuantityProcured = twoYearsBackQuantityProcured;
    final lOther$twoYearsBackQuantityProcured =
        other.twoYearsBackQuantityProcured;
    if (_$data.containsKey('twoYearsBackQuantityProcured') !=
        other._$data.containsKey('twoYearsBackQuantityProcured')) {
      return false;
    }
    if (l$twoYearsBackQuantityProcured != lOther$twoYearsBackQuantityProcured) {
      return false;
    }
    final l$twoYearsBackQuantityProducts = twoYearsBackQuantityProducts;
    final lOther$twoYearsBackQuantityProducts =
        other.twoYearsBackQuantityProducts;
    if (_$data.containsKey('twoYearsBackQuantityProducts') !=
        other._$data.containsKey('twoYearsBackQuantityProducts')) {
      return false;
    }
    if (l$twoYearsBackQuantityProducts != lOther$twoYearsBackQuantityProducts) {
      return false;
    }
    final l$twoYearsBackRetailProducts = twoYearsBackRetailProducts;
    final lOther$twoYearsBackRetailProducts = other.twoYearsBackRetailProducts;
    if (_$data.containsKey('twoYearsBackRetailProducts') !=
        other._$data.containsKey('twoYearsBackRetailProducts')) {
      return false;
    }
    if (l$twoYearsBackRetailProducts != lOther$twoYearsBackRetailProducts) {
      return false;
    }
    final l$twoYearsBackRetailRevenue = twoYearsBackRetailRevenue;
    final lOther$twoYearsBackRetailRevenue = other.twoYearsBackRetailRevenue;
    if (_$data.containsKey('twoYearsBackRetailRevenue') !=
        other._$data.containsKey('twoYearsBackRetailRevenue')) {
      return false;
    }
    if (l$twoYearsBackRetailRevenue != lOther$twoYearsBackRetailRevenue) {
      return false;
    }
    final l$twoYearsBackRevenue = twoYearsBackRevenue;
    final lOther$twoYearsBackRevenue = other.twoYearsBackRevenue;
    if (_$data.containsKey('twoYearsBackRevenue') !=
        other._$data.containsKey('twoYearsBackRevenue')) {
      return false;
    }
    if (l$twoYearsBackRevenue != lOther$twoYearsBackRevenue) {
      return false;
    }
    final l$twoYearsBackShareCapital = twoYearsBackShareCapital;
    final lOther$twoYearsBackShareCapital = other.twoYearsBackShareCapital;
    if (_$data.containsKey('twoYearsBackShareCapital') !=
        other._$data.containsKey('twoYearsBackShareCapital')) {
      return false;
    }
    if (l$twoYearsBackShareCapital != lOther$twoYearsBackShareCapital) {
      return false;
    }
    final l$twoYearsBackShareholders = twoYearsBackShareholders;
    final lOther$twoYearsBackShareholders = other.twoYearsBackShareholders;
    if (_$data.containsKey('twoYearsBackShareholders') !=
        other._$data.containsKey('twoYearsBackShareholders')) {
      return false;
    }
    if (l$twoYearsBackShareholders != lOther$twoYearsBackShareholders) {
      return false;
    }
    final l$twoYearsBackWholesaleProducts = twoYearsBackWholesaleProducts;
    final lOther$twoYearsBackWholesaleProducts =
        other.twoYearsBackWholesaleProducts;
    if (_$data.containsKey('twoYearsBackWholesaleProducts') !=
        other._$data.containsKey('twoYearsBackWholesaleProducts')) {
      return false;
    }
    if (l$twoYearsBackWholesaleProducts !=
        lOther$twoYearsBackWholesaleProducts) {
      return false;
    }
    final l$twoYearsBackWholesaleRevenue = twoYearsBackWholesaleRevenue;
    final lOther$twoYearsBackWholesaleRevenue =
        other.twoYearsBackWholesaleRevenue;
    if (_$data.containsKey('twoYearsBackWholesaleRevenue') !=
        other._$data.containsKey('twoYearsBackWholesaleRevenue')) {
      return false;
    }
    if (l$twoYearsBackWholesaleRevenue != lOther$twoYearsBackWholesaleRevenue) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$cashChequePercentage = cashChequePercentage;
    final l$creditDefaultAmount = creditDefaultAmount;
    final l$creditDefaultLender = creditDefaultLender;
    final l$creditDefaultYear = creditDefaultYear;
    final l$currentYearAccountsPayable = currentYearAccountsPayable;
    final l$currentYearAccountsReceivable = currentYearAccountsReceivable;
    final l$currentYearAssets = currentYearAssets;
    final l$currentYearClosingInventory = currentYearClosingInventory;
    final l$currentYearCogs = currentYearCogs;
    final l$currentYearCurrentAssets = currentYearCurrentAssets;
    final l$currentYearCurrentLiabilities = currentYearCurrentLiabilities;
    final l$currentYearGrossProfit = currentYearGrossProfit;
    final l$currentYearInstitutionalProducts = currentYearInstitutionalProducts;
    final l$currentYearInstitutionalRevenue = currentYearInstitutionalRevenue;
    final l$currentYearLenderName = currentYearLenderName;
    final l$currentYearLiabilities = currentYearLiabilities;
    final l$currentYearLoanAmount = currentYearLoanAmount;
    final l$currentYearMatchingGrant = currentYearMatchingGrant;
    final l$currentYearNetProfit = currentYearNetProfit;
    final l$currentYearOpeningInventory = currentYearOpeningInventory;
    final l$currentYearProducts = currentYearProducts;
    final l$currentYearProjectGrant = currentYearProjectGrant;
    final l$currentYearQuantityProcured = currentYearQuantityProcured;
    final l$currentYearQuantityProducts = currentYearQuantityProducts;
    final l$currentYearRetailProducts = currentYearRetailProducts;
    final l$currentYearRetailRevenue = currentYearRetailRevenue;
    final l$currentYearRevenue = currentYearRevenue;
    final l$currentYearShareCapital = currentYearShareCapital;
    final l$currentYearShareholders = currentYearShareholders;
    final l$currentYearWholesaleProducts = currentYearWholesaleProducts;
    final l$currentYearWholesaleRevenue = currentYearWholesaleRevenue;
    final l$daysPayableReceivableDifference = daysPayableReceivableDifference;
    final l$grossNetProfitMarginDifference = grossNetProfitMarginDifference;
    final l$institutionalLendingHistory = institutionalLendingHistory;
    final l$loanDetails = loanDetails;
    final l$operatingMarginCurrentYear = operatingMarginCurrentYear;
    final l$previousYearAccountsPayable = previousYearAccountsPayable;
    final l$previousYearAccountsReceivable = previousYearAccountsReceivable;
    final l$previousYearAssets = previousYearAssets;
    final l$previousYearClosingInventory = previousYearClosingInventory;
    final l$previousYearCogs = previousYearCogs;
    final l$previousYearCurrentAssets = previousYearCurrentAssets;
    final l$previousYearCurrentLiabilities = previousYearCurrentLiabilities;
    final l$previousYearGrossProfit = previousYearGrossProfit;
    final l$previousYearInstitutionalProducts =
        previousYearInstitutionalProducts;
    final l$previousYearInstitutionalRevenue = previousYearInstitutionalRevenue;
    final l$previousYearLenderName = previousYearLenderName;
    final l$previousYearLiabilities = previousYearLiabilities;
    final l$previousYearLoanAmount = previousYearLoanAmount;
    final l$previousYearMatchingGrant = previousYearMatchingGrant;
    final l$previousYearNetProfit = previousYearNetProfit;
    final l$previousYearOpeningInventory = previousYearOpeningInventory;
    final l$previousYearProducts = previousYearProducts;
    final l$previousYearProjectGrant = previousYearProjectGrant;
    final l$previousYearQuantityProcured = previousYearQuantityProcured;
    final l$previousYearQuantityProducts = previousYearQuantityProducts;
    final l$previousYearRetailProducts = previousYearRetailProducts;
    final l$previousYearRetailRevenue = previousYearRetailRevenue;
    final l$previousYearRevenue = previousYearRevenue;
    final l$previousYearShareCapital = previousYearShareCapital;
    final l$previousYearShareholders = previousYearShareholders;
    final l$previousYearWholesaleProducts = previousYearWholesaleProducts;
    final l$previousYearWholesaleRevenue = previousYearWholesaleRevenue;
    final l$targetRevenue = targetRevenue;
    final l$totalDebtToday = totalDebtToday;
    final l$twoYearsBackAccountsPayable = twoYearsBackAccountsPayable;
    final l$twoYearsBackAccountsReceivable = twoYearsBackAccountsReceivable;
    final l$twoYearsBackAssets = twoYearsBackAssets;
    final l$twoYearsBackClosingInventory = twoYearsBackClosingInventory;
    final l$twoYearsBackCogs = twoYearsBackCogs;
    final l$twoYearsBackCurrentAssets = twoYearsBackCurrentAssets;
    final l$twoYearsBackCurrentLiabilities = twoYearsBackCurrentLiabilities;
    final l$twoYearsBackGrossProfit = twoYearsBackGrossProfit;
    final l$twoYearsBackInstitutionalProducts =
        twoYearsBackInstitutionalProducts;
    final l$twoYearsBackInstitutionalRevenue = twoYearsBackInstitutionalRevenue;
    final l$twoYearsBackLenderName = twoYearsBackLenderName;
    final l$twoYearsBackLiabilities = twoYearsBackLiabilities;
    final l$twoYearsBackLoanAmount = twoYearsBackLoanAmount;
    final l$twoYearsBackMatchingGrant = twoYearsBackMatchingGrant;
    final l$twoYearsBackNetProfit = twoYearsBackNetProfit;
    final l$twoYearsBackOpeningInventory = twoYearsBackOpeningInventory;
    final l$twoYearsBackProducts = twoYearsBackProducts;
    final l$twoYearsBackProjectGrant = twoYearsBackProjectGrant;
    final l$twoYearsBackQuantityProcured = twoYearsBackQuantityProcured;
    final l$twoYearsBackQuantityProducts = twoYearsBackQuantityProducts;
    final l$twoYearsBackRetailProducts = twoYearsBackRetailProducts;
    final l$twoYearsBackRetailRevenue = twoYearsBackRetailRevenue;
    final l$twoYearsBackRevenue = twoYearsBackRevenue;
    final l$twoYearsBackShareCapital = twoYearsBackShareCapital;
    final l$twoYearsBackShareholders = twoYearsBackShareholders;
    final l$twoYearsBackWholesaleProducts = twoYearsBackWholesaleProducts;
    final l$twoYearsBackWholesaleRevenue = twoYearsBackWholesaleRevenue;
    return Object.hashAll([
      _$data.containsKey('cashChequePercentage')
          ? l$cashChequePercentage
          : const {},
      _$data.containsKey('creditDefaultAmount')
          ? l$creditDefaultAmount
          : const {},
      _$data.containsKey('creditDefaultLender')
          ? l$creditDefaultLender
          : const {},
      _$data.containsKey('creditDefaultYear') ? l$creditDefaultYear : const {},
      _$data.containsKey('currentYearAccountsPayable')
          ? l$currentYearAccountsPayable
          : const {},
      _$data.containsKey('currentYearAccountsReceivable')
          ? l$currentYearAccountsReceivable
          : const {},
      _$data.containsKey('currentYearAssets') ? l$currentYearAssets : const {},
      _$data.containsKey('currentYearClosingInventory')
          ? l$currentYearClosingInventory
          : const {},
      _$data.containsKey('currentYearCogs') ? l$currentYearCogs : const {},
      _$data.containsKey('currentYearCurrentAssets')
          ? l$currentYearCurrentAssets
          : const {},
      _$data.containsKey('currentYearCurrentLiabilities')
          ? l$currentYearCurrentLiabilities
          : const {},
      _$data.containsKey('currentYearGrossProfit')
          ? l$currentYearGrossProfit
          : const {},
      _$data.containsKey('currentYearInstitutionalProducts')
          ? l$currentYearInstitutionalProducts
          : const {},
      _$data.containsKey('currentYearInstitutionalRevenue')
          ? l$currentYearInstitutionalRevenue
          : const {},
      _$data.containsKey('currentYearLenderName')
          ? l$currentYearLenderName
          : const {},
      _$data.containsKey('currentYearLiabilities')
          ? l$currentYearLiabilities
          : const {},
      _$data.containsKey('currentYearLoanAmount')
          ? l$currentYearLoanAmount
          : const {},
      _$data.containsKey('currentYearMatchingGrant')
          ? l$currentYearMatchingGrant
          : const {},
      _$data.containsKey('currentYearNetProfit')
          ? l$currentYearNetProfit
          : const {},
      _$data.containsKey('currentYearOpeningInventory')
          ? l$currentYearOpeningInventory
          : const {},
      _$data.containsKey('currentYearProducts')
          ? l$currentYearProducts
          : const {},
      _$data.containsKey('currentYearProjectGrant')
          ? l$currentYearProjectGrant
          : const {},
      _$data.containsKey('currentYearQuantityProcured')
          ? l$currentYearQuantityProcured
          : const {},
      _$data.containsKey('currentYearQuantityProducts')
          ? l$currentYearQuantityProducts
          : const {},
      _$data.containsKey('currentYearRetailProducts')
          ? l$currentYearRetailProducts
          : const {},
      _$data.containsKey('currentYearRetailRevenue')
          ? l$currentYearRetailRevenue
          : const {},
      _$data.containsKey('currentYearRevenue')
          ? l$currentYearRevenue
          : const {},
      _$data.containsKey('currentYearShareCapital')
          ? l$currentYearShareCapital
          : const {},
      _$data.containsKey('currentYearShareholders')
          ? l$currentYearShareholders
          : const {},
      _$data.containsKey('currentYearWholesaleProducts')
          ? l$currentYearWholesaleProducts
          : const {},
      _$data.containsKey('currentYearWholesaleRevenue')
          ? l$currentYearWholesaleRevenue
          : const {},
      _$data.containsKey('daysPayableReceivableDifference')
          ? l$daysPayableReceivableDifference
          : const {},
      _$data.containsKey('grossNetProfitMarginDifference')
          ? l$grossNetProfitMarginDifference
          : const {},
      _$data.containsKey('institutionalLendingHistory')
          ? l$institutionalLendingHistory
          : const {},
      _$data.containsKey('loanDetails') ? l$loanDetails : const {},
      _$data.containsKey('operatingMarginCurrentYear')
          ? l$operatingMarginCurrentYear
          : const {},
      _$data.containsKey('previousYearAccountsPayable')
          ? l$previousYearAccountsPayable
          : const {},
      _$data.containsKey('previousYearAccountsReceivable')
          ? l$previousYearAccountsReceivable
          : const {},
      _$data.containsKey('previousYearAssets')
          ? l$previousYearAssets
          : const {},
      _$data.containsKey('previousYearClosingInventory')
          ? l$previousYearClosingInventory
          : const {},
      _$data.containsKey('previousYearCogs') ? l$previousYearCogs : const {},
      _$data.containsKey('previousYearCurrentAssets')
          ? l$previousYearCurrentAssets
          : const {},
      _$data.containsKey('previousYearCurrentLiabilities')
          ? l$previousYearCurrentLiabilities
          : const {},
      _$data.containsKey('previousYearGrossProfit')
          ? l$previousYearGrossProfit
          : const {},
      _$data.containsKey('previousYearInstitutionalProducts')
          ? l$previousYearInstitutionalProducts
          : const {},
      _$data.containsKey('previousYearInstitutionalRevenue')
          ? l$previousYearInstitutionalRevenue
          : const {},
      _$data.containsKey('previousYearLenderName')
          ? l$previousYearLenderName
          : const {},
      _$data.containsKey('previousYearLiabilities')
          ? l$previousYearLiabilities
          : const {},
      _$data.containsKey('previousYearLoanAmount')
          ? l$previousYearLoanAmount
          : const {},
      _$data.containsKey('previousYearMatchingGrant')
          ? l$previousYearMatchingGrant
          : const {},
      _$data.containsKey('previousYearNetProfit')
          ? l$previousYearNetProfit
          : const {},
      _$data.containsKey('previousYearOpeningInventory')
          ? l$previousYearOpeningInventory
          : const {},
      _$data.containsKey('previousYearProducts')
          ? l$previousYearProducts
          : const {},
      _$data.containsKey('previousYearProjectGrant')
          ? l$previousYearProjectGrant
          : const {},
      _$data.containsKey('previousYearQuantityProcured')
          ? l$previousYearQuantityProcured
          : const {},
      _$data.containsKey('previousYearQuantityProducts')
          ? l$previousYearQuantityProducts
          : const {},
      _$data.containsKey('previousYearRetailProducts')
          ? l$previousYearRetailProducts
          : const {},
      _$data.containsKey('previousYearRetailRevenue')
          ? l$previousYearRetailRevenue
          : const {},
      _$data.containsKey('previousYearRevenue')
          ? l$previousYearRevenue
          : const {},
      _$data.containsKey('previousYearShareCapital')
          ? l$previousYearShareCapital
          : const {},
      _$data.containsKey('previousYearShareholders')
          ? l$previousYearShareholders
          : const {},
      _$data.containsKey('previousYearWholesaleProducts')
          ? l$previousYearWholesaleProducts
          : const {},
      _$data.containsKey('previousYearWholesaleRevenue')
          ? l$previousYearWholesaleRevenue
          : const {},
      _$data.containsKey('targetRevenue') ? l$targetRevenue : const {},
      _$data.containsKey('totalDebtToday') ? l$totalDebtToday : const {},
      _$data.containsKey('twoYearsBackAccountsPayable')
          ? l$twoYearsBackAccountsPayable
          : const {},
      _$data.containsKey('twoYearsBackAccountsReceivable')
          ? l$twoYearsBackAccountsReceivable
          : const {},
      _$data.containsKey('twoYearsBackAssets')
          ? l$twoYearsBackAssets
          : const {},
      _$data.containsKey('twoYearsBackClosingInventory')
          ? l$twoYearsBackClosingInventory
          : const {},
      _$data.containsKey('twoYearsBackCogs') ? l$twoYearsBackCogs : const {},
      _$data.containsKey('twoYearsBackCurrentAssets')
          ? l$twoYearsBackCurrentAssets
          : const {},
      _$data.containsKey('twoYearsBackCurrentLiabilities')
          ? l$twoYearsBackCurrentLiabilities
          : const {},
      _$data.containsKey('twoYearsBackGrossProfit')
          ? l$twoYearsBackGrossProfit
          : const {},
      _$data.containsKey('twoYearsBackInstitutionalProducts')
          ? l$twoYearsBackInstitutionalProducts
          : const {},
      _$data.containsKey('twoYearsBackInstitutionalRevenue')
          ? l$twoYearsBackInstitutionalRevenue
          : const {},
      _$data.containsKey('twoYearsBackLenderName')
          ? l$twoYearsBackLenderName
          : const {},
      _$data.containsKey('twoYearsBackLiabilities')
          ? l$twoYearsBackLiabilities
          : const {},
      _$data.containsKey('twoYearsBackLoanAmount')
          ? l$twoYearsBackLoanAmount
          : const {},
      _$data.containsKey('twoYearsBackMatchingGrant')
          ? l$twoYearsBackMatchingGrant
          : const {},
      _$data.containsKey('twoYearsBackNetProfit')
          ? l$twoYearsBackNetProfit
          : const {},
      _$data.containsKey('twoYearsBackOpeningInventory')
          ? l$twoYearsBackOpeningInventory
          : const {},
      _$data.containsKey('twoYearsBackProducts')
          ? l$twoYearsBackProducts
          : const {},
      _$data.containsKey('twoYearsBackProjectGrant')
          ? l$twoYearsBackProjectGrant
          : const {},
      _$data.containsKey('twoYearsBackQuantityProcured')
          ? l$twoYearsBackQuantityProcured
          : const {},
      _$data.containsKey('twoYearsBackQuantityProducts')
          ? l$twoYearsBackQuantityProducts
          : const {},
      _$data.containsKey('twoYearsBackRetailProducts')
          ? l$twoYearsBackRetailProducts
          : const {},
      _$data.containsKey('twoYearsBackRetailRevenue')
          ? l$twoYearsBackRetailRevenue
          : const {},
      _$data.containsKey('twoYearsBackRevenue')
          ? l$twoYearsBackRevenue
          : const {},
      _$data.containsKey('twoYearsBackShareCapital')
          ? l$twoYearsBackShareCapital
          : const {},
      _$data.containsKey('twoYearsBackShareholders')
          ? l$twoYearsBackShareholders
          : const {},
      _$data.containsKey('twoYearsBackWholesaleProducts')
          ? l$twoYearsBackWholesaleProducts
          : const {},
      _$data.containsKey('twoYearsBackWholesaleRevenue')
          ? l$twoYearsBackWholesaleRevenue
          : const {},
    ]);
  }
}

abstract class CopyWith$Input$FinancialDetailsSubmissionV2Input<TRes> {
  factory CopyWith$Input$FinancialDetailsSubmissionV2Input(
    Input$FinancialDetailsSubmissionV2Input instance,
    TRes Function(Input$FinancialDetailsSubmissionV2Input) then,
  ) = _CopyWithImpl$Input$FinancialDetailsSubmissionV2Input;

  factory CopyWith$Input$FinancialDetailsSubmissionV2Input.stub(TRes res) =
      _CopyWithStubImpl$Input$FinancialDetailsSubmissionV2Input;

  TRes call({
    String? cashChequePercentage,
    String? creditDefaultAmount,
    String? creditDefaultLender,
    String? creditDefaultYear,
    String? currentYearAccountsPayable,
    String? currentYearAccountsReceivable,
    String? currentYearAssets,
    String? currentYearClosingInventory,
    String? currentYearCogs,
    String? currentYearCurrentAssets,
    String? currentYearCurrentLiabilities,
    String? currentYearGrossProfit,
    String? currentYearInstitutionalProducts,
    String? currentYearInstitutionalRevenue,
    String? currentYearLenderName,
    String? currentYearLiabilities,
    String? currentYearLoanAmount,
    String? currentYearMatchingGrant,
    String? currentYearNetProfit,
    String? currentYearOpeningInventory,
    String? currentYearProducts,
    String? currentYearProjectGrant,
    String? currentYearQuantityProcured,
    String? currentYearQuantityProducts,
    String? currentYearRetailProducts,
    String? currentYearRetailRevenue,
    String? currentYearRevenue,
    String? currentYearShareCapital,
    int? currentYearShareholders,
    String? currentYearWholesaleProducts,
    String? currentYearWholesaleRevenue,
    int? daysPayableReceivableDifference,
    String? grossNetProfitMarginDifference,
    String? institutionalLendingHistory,
    String? loanDetails,
    String? operatingMarginCurrentYear,
    String? previousYearAccountsPayable,
    String? previousYearAccountsReceivable,
    String? previousYearAssets,
    String? previousYearClosingInventory,
    String? previousYearCogs,
    String? previousYearCurrentAssets,
    String? previousYearCurrentLiabilities,
    String? previousYearGrossProfit,
    String? previousYearInstitutionalProducts,
    String? previousYearInstitutionalRevenue,
    String? previousYearLenderName,
    String? previousYearLiabilities,
    String? previousYearLoanAmount,
    String? previousYearMatchingGrant,
    String? previousYearNetProfit,
    String? previousYearOpeningInventory,
    String? previousYearProducts,
    String? previousYearProjectGrant,
    String? previousYearQuantityProcured,
    String? previousYearQuantityProducts,
    String? previousYearRetailProducts,
    String? previousYearRetailRevenue,
    String? previousYearRevenue,
    String? previousYearShareCapital,
    int? previousYearShareholders,
    String? previousYearWholesaleProducts,
    String? previousYearWholesaleRevenue,
    String? targetRevenue,
    String? totalDebtToday,
    String? twoYearsBackAccountsPayable,
    String? twoYearsBackAccountsReceivable,
    String? twoYearsBackAssets,
    String? twoYearsBackClosingInventory,
    String? twoYearsBackCogs,
    String? twoYearsBackCurrentAssets,
    String? twoYearsBackCurrentLiabilities,
    String? twoYearsBackGrossProfit,
    String? twoYearsBackInstitutionalProducts,
    String? twoYearsBackInstitutionalRevenue,
    String? twoYearsBackLenderName,
    String? twoYearsBackLiabilities,
    String? twoYearsBackLoanAmount,
    String? twoYearsBackMatchingGrant,
    String? twoYearsBackNetProfit,
    String? twoYearsBackOpeningInventory,
    String? twoYearsBackProducts,
    String? twoYearsBackProjectGrant,
    String? twoYearsBackQuantityProcured,
    String? twoYearsBackQuantityProducts,
    String? twoYearsBackRetailProducts,
    String? twoYearsBackRetailRevenue,
    String? twoYearsBackRevenue,
    String? twoYearsBackShareCapital,
    int? twoYearsBackShareholders,
    String? twoYearsBackWholesaleProducts,
    String? twoYearsBackWholesaleRevenue,
  });
}

class _CopyWithImpl$Input$FinancialDetailsSubmissionV2Input<TRes>
    implements CopyWith$Input$FinancialDetailsSubmissionV2Input<TRes> {
  _CopyWithImpl$Input$FinancialDetailsSubmissionV2Input(
    this._instance,
    this._then,
  );

  final Input$FinancialDetailsSubmissionV2Input _instance;

  final TRes Function(Input$FinancialDetailsSubmissionV2Input) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? cashChequePercentage = _undefined,
    Object? creditDefaultAmount = _undefined,
    Object? creditDefaultLender = _undefined,
    Object? creditDefaultYear = _undefined,
    Object? currentYearAccountsPayable = _undefined,
    Object? currentYearAccountsReceivable = _undefined,
    Object? currentYearAssets = _undefined,
    Object? currentYearClosingInventory = _undefined,
    Object? currentYearCogs = _undefined,
    Object? currentYearCurrentAssets = _undefined,
    Object? currentYearCurrentLiabilities = _undefined,
    Object? currentYearGrossProfit = _undefined,
    Object? currentYearInstitutionalProducts = _undefined,
    Object? currentYearInstitutionalRevenue = _undefined,
    Object? currentYearLenderName = _undefined,
    Object? currentYearLiabilities = _undefined,
    Object? currentYearLoanAmount = _undefined,
    Object? currentYearMatchingGrant = _undefined,
    Object? currentYearNetProfit = _undefined,
    Object? currentYearOpeningInventory = _undefined,
    Object? currentYearProducts = _undefined,
    Object? currentYearProjectGrant = _undefined,
    Object? currentYearQuantityProcured = _undefined,
    Object? currentYearQuantityProducts = _undefined,
    Object? currentYearRetailProducts = _undefined,
    Object? currentYearRetailRevenue = _undefined,
    Object? currentYearRevenue = _undefined,
    Object? currentYearShareCapital = _undefined,
    Object? currentYearShareholders = _undefined,
    Object? currentYearWholesaleProducts = _undefined,
    Object? currentYearWholesaleRevenue = _undefined,
    Object? daysPayableReceivableDifference = _undefined,
    Object? grossNetProfitMarginDifference = _undefined,
    Object? institutionalLendingHistory = _undefined,
    Object? loanDetails = _undefined,
    Object? operatingMarginCurrentYear = _undefined,
    Object? previousYearAccountsPayable = _undefined,
    Object? previousYearAccountsReceivable = _undefined,
    Object? previousYearAssets = _undefined,
    Object? previousYearClosingInventory = _undefined,
    Object? previousYearCogs = _undefined,
    Object? previousYearCurrentAssets = _undefined,
    Object? previousYearCurrentLiabilities = _undefined,
    Object? previousYearGrossProfit = _undefined,
    Object? previousYearInstitutionalProducts = _undefined,
    Object? previousYearInstitutionalRevenue = _undefined,
    Object? previousYearLenderName = _undefined,
    Object? previousYearLiabilities = _undefined,
    Object? previousYearLoanAmount = _undefined,
    Object? previousYearMatchingGrant = _undefined,
    Object? previousYearNetProfit = _undefined,
    Object? previousYearOpeningInventory = _undefined,
    Object? previousYearProducts = _undefined,
    Object? previousYearProjectGrant = _undefined,
    Object? previousYearQuantityProcured = _undefined,
    Object? previousYearQuantityProducts = _undefined,
    Object? previousYearRetailProducts = _undefined,
    Object? previousYearRetailRevenue = _undefined,
    Object? previousYearRevenue = _undefined,
    Object? previousYearShareCapital = _undefined,
    Object? previousYearShareholders = _undefined,
    Object? previousYearWholesaleProducts = _undefined,
    Object? previousYearWholesaleRevenue = _undefined,
    Object? targetRevenue = _undefined,
    Object? totalDebtToday = _undefined,
    Object? twoYearsBackAccountsPayable = _undefined,
    Object? twoYearsBackAccountsReceivable = _undefined,
    Object? twoYearsBackAssets = _undefined,
    Object? twoYearsBackClosingInventory = _undefined,
    Object? twoYearsBackCogs = _undefined,
    Object? twoYearsBackCurrentAssets = _undefined,
    Object? twoYearsBackCurrentLiabilities = _undefined,
    Object? twoYearsBackGrossProfit = _undefined,
    Object? twoYearsBackInstitutionalProducts = _undefined,
    Object? twoYearsBackInstitutionalRevenue = _undefined,
    Object? twoYearsBackLenderName = _undefined,
    Object? twoYearsBackLiabilities = _undefined,
    Object? twoYearsBackLoanAmount = _undefined,
    Object? twoYearsBackMatchingGrant = _undefined,
    Object? twoYearsBackNetProfit = _undefined,
    Object? twoYearsBackOpeningInventory = _undefined,
    Object? twoYearsBackProducts = _undefined,
    Object? twoYearsBackProjectGrant = _undefined,
    Object? twoYearsBackQuantityProcured = _undefined,
    Object? twoYearsBackQuantityProducts = _undefined,
    Object? twoYearsBackRetailProducts = _undefined,
    Object? twoYearsBackRetailRevenue = _undefined,
    Object? twoYearsBackRevenue = _undefined,
    Object? twoYearsBackShareCapital = _undefined,
    Object? twoYearsBackShareholders = _undefined,
    Object? twoYearsBackWholesaleProducts = _undefined,
    Object? twoYearsBackWholesaleRevenue = _undefined,
  }) =>
      _then(Input$FinancialDetailsSubmissionV2Input._({
        ..._instance._$data,
        if (cashChequePercentage != _undefined)
          'cashChequePercentage': (cashChequePercentage as String?),
        if (creditDefaultAmount != _undefined)
          'creditDefaultAmount': (creditDefaultAmount as String?),
        if (creditDefaultLender != _undefined)
          'creditDefaultLender': (creditDefaultLender as String?),
        if (creditDefaultYear != _undefined)
          'creditDefaultYear': (creditDefaultYear as String?),
        if (currentYearAccountsPayable != _undefined)
          'currentYearAccountsPayable': (currentYearAccountsPayable as String?),
        if (currentYearAccountsReceivable != _undefined)
          'currentYearAccountsReceivable':
              (currentYearAccountsReceivable as String?),
        if (currentYearAssets != _undefined)
          'currentYearAssets': (currentYearAssets as String?),
        if (currentYearClosingInventory != _undefined)
          'currentYearClosingInventory':
              (currentYearClosingInventory as String?),
        if (currentYearCogs != _undefined)
          'currentYearCogs': (currentYearCogs as String?),
        if (currentYearCurrentAssets != _undefined)
          'currentYearCurrentAssets': (currentYearCurrentAssets as String?),
        if (currentYearCurrentLiabilities != _undefined)
          'currentYearCurrentLiabilities':
              (currentYearCurrentLiabilities as String?),
        if (currentYearGrossProfit != _undefined)
          'currentYearGrossProfit': (currentYearGrossProfit as String?),
        if (currentYearInstitutionalProducts != _undefined)
          'currentYearInstitutionalProducts':
              (currentYearInstitutionalProducts as String?),
        if (currentYearInstitutionalRevenue != _undefined)
          'currentYearInstitutionalRevenue':
              (currentYearInstitutionalRevenue as String?),
        if (currentYearLenderName != _undefined)
          'currentYearLenderName': (currentYearLenderName as String?),
        if (currentYearLiabilities != _undefined)
          'currentYearLiabilities': (currentYearLiabilities as String?),
        if (currentYearLoanAmount != _undefined)
          'currentYearLoanAmount': (currentYearLoanAmount as String?),
        if (currentYearMatchingGrant != _undefined)
          'currentYearMatchingGrant': (currentYearMatchingGrant as String?),
        if (currentYearNetProfit != _undefined)
          'currentYearNetProfit': (currentYearNetProfit as String?),
        if (currentYearOpeningInventory != _undefined)
          'currentYearOpeningInventory':
              (currentYearOpeningInventory as String?),
        if (currentYearProducts != _undefined)
          'currentYearProducts': (currentYearProducts as String?),
        if (currentYearProjectGrant != _undefined)
          'currentYearProjectGrant': (currentYearProjectGrant as String?),
        if (currentYearQuantityProcured != _undefined)
          'currentYearQuantityProcured':
              (currentYearQuantityProcured as String?),
        if (currentYearQuantityProducts != _undefined)
          'currentYearQuantityProducts':
              (currentYearQuantityProducts as String?),
        if (currentYearRetailProducts != _undefined)
          'currentYearRetailProducts': (currentYearRetailProducts as String?),
        if (currentYearRetailRevenue != _undefined)
          'currentYearRetailRevenue': (currentYearRetailRevenue as String?),
        if (currentYearRevenue != _undefined)
          'currentYearRevenue': (currentYearRevenue as String?),
        if (currentYearShareCapital != _undefined)
          'currentYearShareCapital': (currentYearShareCapital as String?),
        if (currentYearShareholders != _undefined)
          'currentYearShareholders': (currentYearShareholders as int?),
        if (currentYearWholesaleProducts != _undefined)
          'currentYearWholesaleProducts':
              (currentYearWholesaleProducts as String?),
        if (currentYearWholesaleRevenue != _undefined)
          'currentYearWholesaleRevenue':
              (currentYearWholesaleRevenue as String?),
        if (daysPayableReceivableDifference != _undefined)
          'daysPayableReceivableDifference':
              (daysPayableReceivableDifference as int?),
        if (grossNetProfitMarginDifference != _undefined)
          'grossNetProfitMarginDifference':
              (grossNetProfitMarginDifference as String?),
        if (institutionalLendingHistory != _undefined)
          'institutionalLendingHistory':
              (institutionalLendingHistory as String?),
        if (loanDetails != _undefined) 'loanDetails': (loanDetails as String?),
        if (operatingMarginCurrentYear != _undefined)
          'operatingMarginCurrentYear': (operatingMarginCurrentYear as String?),
        if (previousYearAccountsPayable != _undefined)
          'previousYearAccountsPayable':
              (previousYearAccountsPayable as String?),
        if (previousYearAccountsReceivable != _undefined)
          'previousYearAccountsReceivable':
              (previousYearAccountsReceivable as String?),
        if (previousYearAssets != _undefined)
          'previousYearAssets': (previousYearAssets as String?),
        if (previousYearClosingInventory != _undefined)
          'previousYearClosingInventory':
              (previousYearClosingInventory as String?),
        if (previousYearCogs != _undefined)
          'previousYearCogs': (previousYearCogs as String?),
        if (previousYearCurrentAssets != _undefined)
          'previousYearCurrentAssets': (previousYearCurrentAssets as String?),
        if (previousYearCurrentLiabilities != _undefined)
          'previousYearCurrentLiabilities':
              (previousYearCurrentLiabilities as String?),
        if (previousYearGrossProfit != _undefined)
          'previousYearGrossProfit': (previousYearGrossProfit as String?),
        if (previousYearInstitutionalProducts != _undefined)
          'previousYearInstitutionalProducts':
              (previousYearInstitutionalProducts as String?),
        if (previousYearInstitutionalRevenue != _undefined)
          'previousYearInstitutionalRevenue':
              (previousYearInstitutionalRevenue as String?),
        if (previousYearLenderName != _undefined)
          'previousYearLenderName': (previousYearLenderName as String?),
        if (previousYearLiabilities != _undefined)
          'previousYearLiabilities': (previousYearLiabilities as String?),
        if (previousYearLoanAmount != _undefined)
          'previousYearLoanAmount': (previousYearLoanAmount as String?),
        if (previousYearMatchingGrant != _undefined)
          'previousYearMatchingGrant': (previousYearMatchingGrant as String?),
        if (previousYearNetProfit != _undefined)
          'previousYearNetProfit': (previousYearNetProfit as String?),
        if (previousYearOpeningInventory != _undefined)
          'previousYearOpeningInventory':
              (previousYearOpeningInventory as String?),
        if (previousYearProducts != _undefined)
          'previousYearProducts': (previousYearProducts as String?),
        if (previousYearProjectGrant != _undefined)
          'previousYearProjectGrant': (previousYearProjectGrant as String?),
        if (previousYearQuantityProcured != _undefined)
          'previousYearQuantityProcured':
              (previousYearQuantityProcured as String?),
        if (previousYearQuantityProducts != _undefined)
          'previousYearQuantityProducts':
              (previousYearQuantityProducts as String?),
        if (previousYearRetailProducts != _undefined)
          'previousYearRetailProducts': (previousYearRetailProducts as String?),
        if (previousYearRetailRevenue != _undefined)
          'previousYearRetailRevenue': (previousYearRetailRevenue as String?),
        if (previousYearRevenue != _undefined)
          'previousYearRevenue': (previousYearRevenue as String?),
        if (previousYearShareCapital != _undefined)
          'previousYearShareCapital': (previousYearShareCapital as String?),
        if (previousYearShareholders != _undefined)
          'previousYearShareholders': (previousYearShareholders as int?),
        if (previousYearWholesaleProducts != _undefined)
          'previousYearWholesaleProducts':
              (previousYearWholesaleProducts as String?),
        if (previousYearWholesaleRevenue != _undefined)
          'previousYearWholesaleRevenue':
              (previousYearWholesaleRevenue as String?),
        if (targetRevenue != _undefined)
          'targetRevenue': (targetRevenue as String?),
        if (totalDebtToday != _undefined)
          'totalDebtToday': (totalDebtToday as String?),
        if (twoYearsBackAccountsPayable != _undefined)
          'twoYearsBackAccountsPayable':
              (twoYearsBackAccountsPayable as String?),
        if (twoYearsBackAccountsReceivable != _undefined)
          'twoYearsBackAccountsReceivable':
              (twoYearsBackAccountsReceivable as String?),
        if (twoYearsBackAssets != _undefined)
          'twoYearsBackAssets': (twoYearsBackAssets as String?),
        if (twoYearsBackClosingInventory != _undefined)
          'twoYearsBackClosingInventory':
              (twoYearsBackClosingInventory as String?),
        if (twoYearsBackCogs != _undefined)
          'twoYearsBackCogs': (twoYearsBackCogs as String?),
        if (twoYearsBackCurrentAssets != _undefined)
          'twoYearsBackCurrentAssets': (twoYearsBackCurrentAssets as String?),
        if (twoYearsBackCurrentLiabilities != _undefined)
          'twoYearsBackCurrentLiabilities':
              (twoYearsBackCurrentLiabilities as String?),
        if (twoYearsBackGrossProfit != _undefined)
          'twoYearsBackGrossProfit': (twoYearsBackGrossProfit as String?),
        if (twoYearsBackInstitutionalProducts != _undefined)
          'twoYearsBackInstitutionalProducts':
              (twoYearsBackInstitutionalProducts as String?),
        if (twoYearsBackInstitutionalRevenue != _undefined)
          'twoYearsBackInstitutionalRevenue':
              (twoYearsBackInstitutionalRevenue as String?),
        if (twoYearsBackLenderName != _undefined)
          'twoYearsBackLenderName': (twoYearsBackLenderName as String?),
        if (twoYearsBackLiabilities != _undefined)
          'twoYearsBackLiabilities': (twoYearsBackLiabilities as String?),
        if (twoYearsBackLoanAmount != _undefined)
          'twoYearsBackLoanAmount': (twoYearsBackLoanAmount as String?),
        if (twoYearsBackMatchingGrant != _undefined)
          'twoYearsBackMatchingGrant': (twoYearsBackMatchingGrant as String?),
        if (twoYearsBackNetProfit != _undefined)
          'twoYearsBackNetProfit': (twoYearsBackNetProfit as String?),
        if (twoYearsBackOpeningInventory != _undefined)
          'twoYearsBackOpeningInventory':
              (twoYearsBackOpeningInventory as String?),
        if (twoYearsBackProducts != _undefined)
          'twoYearsBackProducts': (twoYearsBackProducts as String?),
        if (twoYearsBackProjectGrant != _undefined)
          'twoYearsBackProjectGrant': (twoYearsBackProjectGrant as String?),
        if (twoYearsBackQuantityProcured != _undefined)
          'twoYearsBackQuantityProcured':
              (twoYearsBackQuantityProcured as String?),
        if (twoYearsBackQuantityProducts != _undefined)
          'twoYearsBackQuantityProducts':
              (twoYearsBackQuantityProducts as String?),
        if (twoYearsBackRetailProducts != _undefined)
          'twoYearsBackRetailProducts': (twoYearsBackRetailProducts as String?),
        if (twoYearsBackRetailRevenue != _undefined)
          'twoYearsBackRetailRevenue': (twoYearsBackRetailRevenue as String?),
        if (twoYearsBackRevenue != _undefined)
          'twoYearsBackRevenue': (twoYearsBackRevenue as String?),
        if (twoYearsBackShareCapital != _undefined)
          'twoYearsBackShareCapital': (twoYearsBackShareCapital as String?),
        if (twoYearsBackShareholders != _undefined)
          'twoYearsBackShareholders': (twoYearsBackShareholders as int?),
        if (twoYearsBackWholesaleProducts != _undefined)
          'twoYearsBackWholesaleProducts':
              (twoYearsBackWholesaleProducts as String?),
        if (twoYearsBackWholesaleRevenue != _undefined)
          'twoYearsBackWholesaleRevenue':
              (twoYearsBackWholesaleRevenue as String?),
      }));
}

class _CopyWithStubImpl$Input$FinancialDetailsSubmissionV2Input<TRes>
    implements CopyWith$Input$FinancialDetailsSubmissionV2Input<TRes> {
  _CopyWithStubImpl$Input$FinancialDetailsSubmissionV2Input(this._res);

  TRes _res;

  call({
    String? cashChequePercentage,
    String? creditDefaultAmount,
    String? creditDefaultLender,
    String? creditDefaultYear,
    String? currentYearAccountsPayable,
    String? currentYearAccountsReceivable,
    String? currentYearAssets,
    String? currentYearClosingInventory,
    String? currentYearCogs,
    String? currentYearCurrentAssets,
    String? currentYearCurrentLiabilities,
    String? currentYearGrossProfit,
    String? currentYearInstitutionalProducts,
    String? currentYearInstitutionalRevenue,
    String? currentYearLenderName,
    String? currentYearLiabilities,
    String? currentYearLoanAmount,
    String? currentYearMatchingGrant,
    String? currentYearNetProfit,
    String? currentYearOpeningInventory,
    String? currentYearProducts,
    String? currentYearProjectGrant,
    String? currentYearQuantityProcured,
    String? currentYearQuantityProducts,
    String? currentYearRetailProducts,
    String? currentYearRetailRevenue,
    String? currentYearRevenue,
    String? currentYearShareCapital,
    int? currentYearShareholders,
    String? currentYearWholesaleProducts,
    String? currentYearWholesaleRevenue,
    int? daysPayableReceivableDifference,
    String? grossNetProfitMarginDifference,
    String? institutionalLendingHistory,
    String? loanDetails,
    String? operatingMarginCurrentYear,
    String? previousYearAccountsPayable,
    String? previousYearAccountsReceivable,
    String? previousYearAssets,
    String? previousYearClosingInventory,
    String? previousYearCogs,
    String? previousYearCurrentAssets,
    String? previousYearCurrentLiabilities,
    String? previousYearGrossProfit,
    String? previousYearInstitutionalProducts,
    String? previousYearInstitutionalRevenue,
    String? previousYearLenderName,
    String? previousYearLiabilities,
    String? previousYearLoanAmount,
    String? previousYearMatchingGrant,
    String? previousYearNetProfit,
    String? previousYearOpeningInventory,
    String? previousYearProducts,
    String? previousYearProjectGrant,
    String? previousYearQuantityProcured,
    String? previousYearQuantityProducts,
    String? previousYearRetailProducts,
    String? previousYearRetailRevenue,
    String? previousYearRevenue,
    String? previousYearShareCapital,
    int? previousYearShareholders,
    String? previousYearWholesaleProducts,
    String? previousYearWholesaleRevenue,
    String? targetRevenue,
    String? totalDebtToday,
    String? twoYearsBackAccountsPayable,
    String? twoYearsBackAccountsReceivable,
    String? twoYearsBackAssets,
    String? twoYearsBackClosingInventory,
    String? twoYearsBackCogs,
    String? twoYearsBackCurrentAssets,
    String? twoYearsBackCurrentLiabilities,
    String? twoYearsBackGrossProfit,
    String? twoYearsBackInstitutionalProducts,
    String? twoYearsBackInstitutionalRevenue,
    String? twoYearsBackLenderName,
    String? twoYearsBackLiabilities,
    String? twoYearsBackLoanAmount,
    String? twoYearsBackMatchingGrant,
    String? twoYearsBackNetProfit,
    String? twoYearsBackOpeningInventory,
    String? twoYearsBackProducts,
    String? twoYearsBackProjectGrant,
    String? twoYearsBackQuantityProcured,
    String? twoYearsBackQuantityProducts,
    String? twoYearsBackRetailProducts,
    String? twoYearsBackRetailRevenue,
    String? twoYearsBackRevenue,
    String? twoYearsBackShareCapital,
    int? twoYearsBackShareholders,
    String? twoYearsBackWholesaleProducts,
    String? twoYearsBackWholesaleRevenue,
  }) =>
      _res;
}

class Input$GovernanceSubmissionInput {
  factory Input$GovernanceSubmissionInput({
    int? annualGeneralBodyMeetings,
    int? bodMeetingsLastFinancialYear,
    Enum$MinutesMaintenanceTypeEnum? minutesMaintenance,
    int? numBods,
    int? numWomenBods,
    Enum$SecondLineManagementTypeEnum? secondLineManagement,
  }) =>
      Input$GovernanceSubmissionInput._({
        if (annualGeneralBodyMeetings != null)
          r'annualGeneralBodyMeetings': annualGeneralBodyMeetings,
        if (bodMeetingsLastFinancialYear != null)
          r'bodMeetingsLastFinancialYear': bodMeetingsLastFinancialYear,
        if (minutesMaintenance != null)
          r'minutesMaintenance': minutesMaintenance,
        if (numBods != null) r'numBods': numBods,
        if (numWomenBods != null) r'numWomenBods': numWomenBods,
        if (secondLineManagement != null)
          r'secondLineManagement': secondLineManagement,
      });

  Input$GovernanceSubmissionInput._(this._$data);

  factory Input$GovernanceSubmissionInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('annualGeneralBodyMeetings')) {
      final l$annualGeneralBodyMeetings = data['annualGeneralBodyMeetings'];
      result$data['annualGeneralBodyMeetings'] =
          (l$annualGeneralBodyMeetings as int?);
    }
    if (data.containsKey('bodMeetingsLastFinancialYear')) {
      final l$bodMeetingsLastFinancialYear =
          data['bodMeetingsLastFinancialYear'];
      result$data['bodMeetingsLastFinancialYear'] =
          (l$bodMeetingsLastFinancialYear as int?);
    }
    if (data.containsKey('minutesMaintenance')) {
      final l$minutesMaintenance = data['minutesMaintenance'];
      result$data['minutesMaintenance'] = l$minutesMaintenance == null
          ? null
          : fromJson$Enum$MinutesMaintenanceTypeEnum(
              (l$minutesMaintenance as String));
    }
    if (data.containsKey('numBods')) {
      final l$numBods = data['numBods'];
      result$data['numBods'] = (l$numBods as int?);
    }
    if (data.containsKey('numWomenBods')) {
      final l$numWomenBods = data['numWomenBods'];
      result$data['numWomenBods'] = (l$numWomenBods as int?);
    }
    if (data.containsKey('secondLineManagement')) {
      final l$secondLineManagement = data['secondLineManagement'];
      result$data['secondLineManagement'] = l$secondLineManagement == null
          ? null
          : fromJson$Enum$SecondLineManagementTypeEnum(
              (l$secondLineManagement as String));
    }
    return Input$GovernanceSubmissionInput._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get annualGeneralBodyMeetings =>
      (_$data['annualGeneralBodyMeetings'] as int?);

  int? get bodMeetingsLastFinancialYear =>
      (_$data['bodMeetingsLastFinancialYear'] as int?);

  Enum$MinutesMaintenanceTypeEnum? get minutesMaintenance =>
      (_$data['minutesMaintenance'] as Enum$MinutesMaintenanceTypeEnum?);

  int? get numBods => (_$data['numBods'] as int?);

  int? get numWomenBods => (_$data['numWomenBods'] as int?);

  Enum$SecondLineManagementTypeEnum? get secondLineManagement =>
      (_$data['secondLineManagement'] as Enum$SecondLineManagementTypeEnum?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('annualGeneralBodyMeetings')) {
      final l$annualGeneralBodyMeetings = annualGeneralBodyMeetings;
      result$data['annualGeneralBodyMeetings'] = l$annualGeneralBodyMeetings;
    }
    if (_$data.containsKey('bodMeetingsLastFinancialYear')) {
      final l$bodMeetingsLastFinancialYear = bodMeetingsLastFinancialYear;
      result$data['bodMeetingsLastFinancialYear'] =
          l$bodMeetingsLastFinancialYear;
    }
    if (_$data.containsKey('minutesMaintenance')) {
      final l$minutesMaintenance = minutesMaintenance;
      result$data['minutesMaintenance'] = l$minutesMaintenance == null
          ? null
          : toJson$Enum$MinutesMaintenanceTypeEnum(l$minutesMaintenance);
    }
    if (_$data.containsKey('numBods')) {
      final l$numBods = numBods;
      result$data['numBods'] = l$numBods;
    }
    if (_$data.containsKey('numWomenBods')) {
      final l$numWomenBods = numWomenBods;
      result$data['numWomenBods'] = l$numWomenBods;
    }
    if (_$data.containsKey('secondLineManagement')) {
      final l$secondLineManagement = secondLineManagement;
      result$data['secondLineManagement'] = l$secondLineManagement == null
          ? null
          : toJson$Enum$SecondLineManagementTypeEnum(l$secondLineManagement);
    }
    return result$data;
  }

  CopyWith$Input$GovernanceSubmissionInput<Input$GovernanceSubmissionInput>
      get copyWith => CopyWith$Input$GovernanceSubmissionInput(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$GovernanceSubmissionInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$annualGeneralBodyMeetings = annualGeneralBodyMeetings;
    final lOther$annualGeneralBodyMeetings = other.annualGeneralBodyMeetings;
    if (_$data.containsKey('annualGeneralBodyMeetings') !=
        other._$data.containsKey('annualGeneralBodyMeetings')) {
      return false;
    }
    if (l$annualGeneralBodyMeetings != lOther$annualGeneralBodyMeetings) {
      return false;
    }
    final l$bodMeetingsLastFinancialYear = bodMeetingsLastFinancialYear;
    final lOther$bodMeetingsLastFinancialYear =
        other.bodMeetingsLastFinancialYear;
    if (_$data.containsKey('bodMeetingsLastFinancialYear') !=
        other._$data.containsKey('bodMeetingsLastFinancialYear')) {
      return false;
    }
    if (l$bodMeetingsLastFinancialYear != lOther$bodMeetingsLastFinancialYear) {
      return false;
    }
    final l$minutesMaintenance = minutesMaintenance;
    final lOther$minutesMaintenance = other.minutesMaintenance;
    if (_$data.containsKey('minutesMaintenance') !=
        other._$data.containsKey('minutesMaintenance')) {
      return false;
    }
    if (l$minutesMaintenance != lOther$minutesMaintenance) {
      return false;
    }
    final l$numBods = numBods;
    final lOther$numBods = other.numBods;
    if (_$data.containsKey('numBods') != other._$data.containsKey('numBods')) {
      return false;
    }
    if (l$numBods != lOther$numBods) {
      return false;
    }
    final l$numWomenBods = numWomenBods;
    final lOther$numWomenBods = other.numWomenBods;
    if (_$data.containsKey('numWomenBods') !=
        other._$data.containsKey('numWomenBods')) {
      return false;
    }
    if (l$numWomenBods != lOther$numWomenBods) {
      return false;
    }
    final l$secondLineManagement = secondLineManagement;
    final lOther$secondLineManagement = other.secondLineManagement;
    if (_$data.containsKey('secondLineManagement') !=
        other._$data.containsKey('secondLineManagement')) {
      return false;
    }
    if (l$secondLineManagement != lOther$secondLineManagement) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$annualGeneralBodyMeetings = annualGeneralBodyMeetings;
    final l$bodMeetingsLastFinancialYear = bodMeetingsLastFinancialYear;
    final l$minutesMaintenance = minutesMaintenance;
    final l$numBods = numBods;
    final l$numWomenBods = numWomenBods;
    final l$secondLineManagement = secondLineManagement;
    return Object.hashAll([
      _$data.containsKey('annualGeneralBodyMeetings')
          ? l$annualGeneralBodyMeetings
          : const {},
      _$data.containsKey('bodMeetingsLastFinancialYear')
          ? l$bodMeetingsLastFinancialYear
          : const {},
      _$data.containsKey('minutesMaintenance')
          ? l$minutesMaintenance
          : const {},
      _$data.containsKey('numBods') ? l$numBods : const {},
      _$data.containsKey('numWomenBods') ? l$numWomenBods : const {},
      _$data.containsKey('secondLineManagement')
          ? l$secondLineManagement
          : const {},
    ]);
  }
}

abstract class CopyWith$Input$GovernanceSubmissionInput<TRes> {
  factory CopyWith$Input$GovernanceSubmissionInput(
    Input$GovernanceSubmissionInput instance,
    TRes Function(Input$GovernanceSubmissionInput) then,
  ) = _CopyWithImpl$Input$GovernanceSubmissionInput;

  factory CopyWith$Input$GovernanceSubmissionInput.stub(TRes res) =
      _CopyWithStubImpl$Input$GovernanceSubmissionInput;

  TRes call({
    int? annualGeneralBodyMeetings,
    int? bodMeetingsLastFinancialYear,
    Enum$MinutesMaintenanceTypeEnum? minutesMaintenance,
    int? numBods,
    int? numWomenBods,
    Enum$SecondLineManagementTypeEnum? secondLineManagement,
  });
}

class _CopyWithImpl$Input$GovernanceSubmissionInput<TRes>
    implements CopyWith$Input$GovernanceSubmissionInput<TRes> {
  _CopyWithImpl$Input$GovernanceSubmissionInput(
    this._instance,
    this._then,
  );

  final Input$GovernanceSubmissionInput _instance;

  final TRes Function(Input$GovernanceSubmissionInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? annualGeneralBodyMeetings = _undefined,
    Object? bodMeetingsLastFinancialYear = _undefined,
    Object? minutesMaintenance = _undefined,
    Object? numBods = _undefined,
    Object? numWomenBods = _undefined,
    Object? secondLineManagement = _undefined,
  }) =>
      _then(Input$GovernanceSubmissionInput._({
        ..._instance._$data,
        if (annualGeneralBodyMeetings != _undefined)
          'annualGeneralBodyMeetings': (annualGeneralBodyMeetings as int?),
        if (bodMeetingsLastFinancialYear != _undefined)
          'bodMeetingsLastFinancialYear':
              (bodMeetingsLastFinancialYear as int?),
        if (minutesMaintenance != _undefined)
          'minutesMaintenance':
              (minutesMaintenance as Enum$MinutesMaintenanceTypeEnum?),
        if (numBods != _undefined) 'numBods': (numBods as int?),
        if (numWomenBods != _undefined) 'numWomenBods': (numWomenBods as int?),
        if (secondLineManagement != _undefined)
          'secondLineManagement':
              (secondLineManagement as Enum$SecondLineManagementTypeEnum?),
      }));
}

class _CopyWithStubImpl$Input$GovernanceSubmissionInput<TRes>
    implements CopyWith$Input$GovernanceSubmissionInput<TRes> {
  _CopyWithStubImpl$Input$GovernanceSubmissionInput(this._res);

  TRes _res;

  call({
    int? annualGeneralBodyMeetings,
    int? bodMeetingsLastFinancialYear,
    Enum$MinutesMaintenanceTypeEnum? minutesMaintenance,
    int? numBods,
    int? numWomenBods,
    Enum$SecondLineManagementTypeEnum? secondLineManagement,
  }) =>
      _res;
}

class Input$ProcessesSystemsSubmissionInput {
  factory Input$ProcessesSystemsSubmissionInput({
    Enum$AccountsMISTypeEnum? accountsAndMis,
    Enum$BooksRecordsTypeEnum? booksAndRecordsUpToDate,
    Enum$CreditRecordTypeEnum? creditRecordOfFpo,
    Enum$InsuranceStockTypeEnum? insuranceOfStock,
    bool? penaltiesLeviedBoardMeeting,
    Enum$ReconciliationStocksTypeEnum? reconciliationOfStocks,
    Enum$StatutoryFillingsTypeEnum? statutoryFillings,
  }) =>
      Input$ProcessesSystemsSubmissionInput._({
        if (accountsAndMis != null) r'accountsAndMis': accountsAndMis,
        if (booksAndRecordsUpToDate != null)
          r'booksAndRecordsUpToDate': booksAndRecordsUpToDate,
        if (creditRecordOfFpo != null) r'creditRecordOfFpo': creditRecordOfFpo,
        if (insuranceOfStock != null) r'insuranceOfStock': insuranceOfStock,
        if (penaltiesLeviedBoardMeeting != null)
          r'penaltiesLeviedBoardMeeting': penaltiesLeviedBoardMeeting,
        if (reconciliationOfStocks != null)
          r'reconciliationOfStocks': reconciliationOfStocks,
        if (statutoryFillings != null) r'statutoryFillings': statutoryFillings,
      });

  Input$ProcessesSystemsSubmissionInput._(this._$data);

  factory Input$ProcessesSystemsSubmissionInput.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('accountsAndMis')) {
      final l$accountsAndMis = data['accountsAndMis'];
      result$data['accountsAndMis'] = l$accountsAndMis == null
          ? null
          : fromJson$Enum$AccountsMISTypeEnum((l$accountsAndMis as String));
    }
    if (data.containsKey('booksAndRecordsUpToDate')) {
      final l$booksAndRecordsUpToDate = data['booksAndRecordsUpToDate'];
      result$data['booksAndRecordsUpToDate'] = l$booksAndRecordsUpToDate == null
          ? null
          : fromJson$Enum$BooksRecordsTypeEnum(
              (l$booksAndRecordsUpToDate as String));
    }
    if (data.containsKey('creditRecordOfFpo')) {
      final l$creditRecordOfFpo = data['creditRecordOfFpo'];
      result$data['creditRecordOfFpo'] = l$creditRecordOfFpo == null
          ? null
          : fromJson$Enum$CreditRecordTypeEnum((l$creditRecordOfFpo as String));
    }
    if (data.containsKey('insuranceOfStock')) {
      final l$insuranceOfStock = data['insuranceOfStock'];
      result$data['insuranceOfStock'] = l$insuranceOfStock == null
          ? null
          : fromJson$Enum$InsuranceStockTypeEnum(
              (l$insuranceOfStock as String));
    }
    if (data.containsKey('penaltiesLeviedBoardMeeting')) {
      final l$penaltiesLeviedBoardMeeting = data['penaltiesLeviedBoardMeeting'];
      result$data['penaltiesLeviedBoardMeeting'] =
          (l$penaltiesLeviedBoardMeeting as bool?);
    }
    if (data.containsKey('reconciliationOfStocks')) {
      final l$reconciliationOfStocks = data['reconciliationOfStocks'];
      result$data['reconciliationOfStocks'] = l$reconciliationOfStocks == null
          ? null
          : fromJson$Enum$ReconciliationStocksTypeEnum(
              (l$reconciliationOfStocks as String));
    }
    if (data.containsKey('statutoryFillings')) {
      final l$statutoryFillings = data['statutoryFillings'];
      result$data['statutoryFillings'] = l$statutoryFillings == null
          ? null
          : fromJson$Enum$StatutoryFillingsTypeEnum(
              (l$statutoryFillings as String));
    }
    return Input$ProcessesSystemsSubmissionInput._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$AccountsMISTypeEnum? get accountsAndMis =>
      (_$data['accountsAndMis'] as Enum$AccountsMISTypeEnum?);

  Enum$BooksRecordsTypeEnum? get booksAndRecordsUpToDate =>
      (_$data['booksAndRecordsUpToDate'] as Enum$BooksRecordsTypeEnum?);

  Enum$CreditRecordTypeEnum? get creditRecordOfFpo =>
      (_$data['creditRecordOfFpo'] as Enum$CreditRecordTypeEnum?);

  Enum$InsuranceStockTypeEnum? get insuranceOfStock =>
      (_$data['insuranceOfStock'] as Enum$InsuranceStockTypeEnum?);

  bool? get penaltiesLeviedBoardMeeting =>
      (_$data['penaltiesLeviedBoardMeeting'] as bool?);

  Enum$ReconciliationStocksTypeEnum? get reconciliationOfStocks =>
      (_$data['reconciliationOfStocks'] as Enum$ReconciliationStocksTypeEnum?);

  Enum$StatutoryFillingsTypeEnum? get statutoryFillings =>
      (_$data['statutoryFillings'] as Enum$StatutoryFillingsTypeEnum?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('accountsAndMis')) {
      final l$accountsAndMis = accountsAndMis;
      result$data['accountsAndMis'] = l$accountsAndMis == null
          ? null
          : toJson$Enum$AccountsMISTypeEnum(l$accountsAndMis);
    }
    if (_$data.containsKey('booksAndRecordsUpToDate')) {
      final l$booksAndRecordsUpToDate = booksAndRecordsUpToDate;
      result$data['booksAndRecordsUpToDate'] = l$booksAndRecordsUpToDate == null
          ? null
          : toJson$Enum$BooksRecordsTypeEnum(l$booksAndRecordsUpToDate);
    }
    if (_$data.containsKey('creditRecordOfFpo')) {
      final l$creditRecordOfFpo = creditRecordOfFpo;
      result$data['creditRecordOfFpo'] = l$creditRecordOfFpo == null
          ? null
          : toJson$Enum$CreditRecordTypeEnum(l$creditRecordOfFpo);
    }
    if (_$data.containsKey('insuranceOfStock')) {
      final l$insuranceOfStock = insuranceOfStock;
      result$data['insuranceOfStock'] = l$insuranceOfStock == null
          ? null
          : toJson$Enum$InsuranceStockTypeEnum(l$insuranceOfStock);
    }
    if (_$data.containsKey('penaltiesLeviedBoardMeeting')) {
      final l$penaltiesLeviedBoardMeeting = penaltiesLeviedBoardMeeting;
      result$data['penaltiesLeviedBoardMeeting'] =
          l$penaltiesLeviedBoardMeeting;
    }
    if (_$data.containsKey('reconciliationOfStocks')) {
      final l$reconciliationOfStocks = reconciliationOfStocks;
      result$data['reconciliationOfStocks'] = l$reconciliationOfStocks == null
          ? null
          : toJson$Enum$ReconciliationStocksTypeEnum(l$reconciliationOfStocks);
    }
    if (_$data.containsKey('statutoryFillings')) {
      final l$statutoryFillings = statutoryFillings;
      result$data['statutoryFillings'] = l$statutoryFillings == null
          ? null
          : toJson$Enum$StatutoryFillingsTypeEnum(l$statutoryFillings);
    }
    return result$data;
  }

  CopyWith$Input$ProcessesSystemsSubmissionInput<
          Input$ProcessesSystemsSubmissionInput>
      get copyWith => CopyWith$Input$ProcessesSystemsSubmissionInput(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$ProcessesSystemsSubmissionInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$accountsAndMis = accountsAndMis;
    final lOther$accountsAndMis = other.accountsAndMis;
    if (_$data.containsKey('accountsAndMis') !=
        other._$data.containsKey('accountsAndMis')) {
      return false;
    }
    if (l$accountsAndMis != lOther$accountsAndMis) {
      return false;
    }
    final l$booksAndRecordsUpToDate = booksAndRecordsUpToDate;
    final lOther$booksAndRecordsUpToDate = other.booksAndRecordsUpToDate;
    if (_$data.containsKey('booksAndRecordsUpToDate') !=
        other._$data.containsKey('booksAndRecordsUpToDate')) {
      return false;
    }
    if (l$booksAndRecordsUpToDate != lOther$booksAndRecordsUpToDate) {
      return false;
    }
    final l$creditRecordOfFpo = creditRecordOfFpo;
    final lOther$creditRecordOfFpo = other.creditRecordOfFpo;
    if (_$data.containsKey('creditRecordOfFpo') !=
        other._$data.containsKey('creditRecordOfFpo')) {
      return false;
    }
    if (l$creditRecordOfFpo != lOther$creditRecordOfFpo) {
      return false;
    }
    final l$insuranceOfStock = insuranceOfStock;
    final lOther$insuranceOfStock = other.insuranceOfStock;
    if (_$data.containsKey('insuranceOfStock') !=
        other._$data.containsKey('insuranceOfStock')) {
      return false;
    }
    if (l$insuranceOfStock != lOther$insuranceOfStock) {
      return false;
    }
    final l$penaltiesLeviedBoardMeeting = penaltiesLeviedBoardMeeting;
    final lOther$penaltiesLeviedBoardMeeting =
        other.penaltiesLeviedBoardMeeting;
    if (_$data.containsKey('penaltiesLeviedBoardMeeting') !=
        other._$data.containsKey('penaltiesLeviedBoardMeeting')) {
      return false;
    }
    if (l$penaltiesLeviedBoardMeeting != lOther$penaltiesLeviedBoardMeeting) {
      return false;
    }
    final l$reconciliationOfStocks = reconciliationOfStocks;
    final lOther$reconciliationOfStocks = other.reconciliationOfStocks;
    if (_$data.containsKey('reconciliationOfStocks') !=
        other._$data.containsKey('reconciliationOfStocks')) {
      return false;
    }
    if (l$reconciliationOfStocks != lOther$reconciliationOfStocks) {
      return false;
    }
    final l$statutoryFillings = statutoryFillings;
    final lOther$statutoryFillings = other.statutoryFillings;
    if (_$data.containsKey('statutoryFillings') !=
        other._$data.containsKey('statutoryFillings')) {
      return false;
    }
    if (l$statutoryFillings != lOther$statutoryFillings) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$accountsAndMis = accountsAndMis;
    final l$booksAndRecordsUpToDate = booksAndRecordsUpToDate;
    final l$creditRecordOfFpo = creditRecordOfFpo;
    final l$insuranceOfStock = insuranceOfStock;
    final l$penaltiesLeviedBoardMeeting = penaltiesLeviedBoardMeeting;
    final l$reconciliationOfStocks = reconciliationOfStocks;
    final l$statutoryFillings = statutoryFillings;
    return Object.hashAll([
      _$data.containsKey('accountsAndMis') ? l$accountsAndMis : const {},
      _$data.containsKey('booksAndRecordsUpToDate')
          ? l$booksAndRecordsUpToDate
          : const {},
      _$data.containsKey('creditRecordOfFpo') ? l$creditRecordOfFpo : const {},
      _$data.containsKey('insuranceOfStock') ? l$insuranceOfStock : const {},
      _$data.containsKey('penaltiesLeviedBoardMeeting')
          ? l$penaltiesLeviedBoardMeeting
          : const {},
      _$data.containsKey('reconciliationOfStocks')
          ? l$reconciliationOfStocks
          : const {},
      _$data.containsKey('statutoryFillings') ? l$statutoryFillings : const {},
    ]);
  }
}

abstract class CopyWith$Input$ProcessesSystemsSubmissionInput<TRes> {
  factory CopyWith$Input$ProcessesSystemsSubmissionInput(
    Input$ProcessesSystemsSubmissionInput instance,
    TRes Function(Input$ProcessesSystemsSubmissionInput) then,
  ) = _CopyWithImpl$Input$ProcessesSystemsSubmissionInput;

  factory CopyWith$Input$ProcessesSystemsSubmissionInput.stub(TRes res) =
      _CopyWithStubImpl$Input$ProcessesSystemsSubmissionInput;

  TRes call({
    Enum$AccountsMISTypeEnum? accountsAndMis,
    Enum$BooksRecordsTypeEnum? booksAndRecordsUpToDate,
    Enum$CreditRecordTypeEnum? creditRecordOfFpo,
    Enum$InsuranceStockTypeEnum? insuranceOfStock,
    bool? penaltiesLeviedBoardMeeting,
    Enum$ReconciliationStocksTypeEnum? reconciliationOfStocks,
    Enum$StatutoryFillingsTypeEnum? statutoryFillings,
  });
}

class _CopyWithImpl$Input$ProcessesSystemsSubmissionInput<TRes>
    implements CopyWith$Input$ProcessesSystemsSubmissionInput<TRes> {
  _CopyWithImpl$Input$ProcessesSystemsSubmissionInput(
    this._instance,
    this._then,
  );

  final Input$ProcessesSystemsSubmissionInput _instance;

  final TRes Function(Input$ProcessesSystemsSubmissionInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? accountsAndMis = _undefined,
    Object? booksAndRecordsUpToDate = _undefined,
    Object? creditRecordOfFpo = _undefined,
    Object? insuranceOfStock = _undefined,
    Object? penaltiesLeviedBoardMeeting = _undefined,
    Object? reconciliationOfStocks = _undefined,
    Object? statutoryFillings = _undefined,
  }) =>
      _then(Input$ProcessesSystemsSubmissionInput._({
        ..._instance._$data,
        if (accountsAndMis != _undefined)
          'accountsAndMis': (accountsAndMis as Enum$AccountsMISTypeEnum?),
        if (booksAndRecordsUpToDate != _undefined)
          'booksAndRecordsUpToDate':
              (booksAndRecordsUpToDate as Enum$BooksRecordsTypeEnum?),
        if (creditRecordOfFpo != _undefined)
          'creditRecordOfFpo':
              (creditRecordOfFpo as Enum$CreditRecordTypeEnum?),
        if (insuranceOfStock != _undefined)
          'insuranceOfStock':
              (insuranceOfStock as Enum$InsuranceStockTypeEnum?),
        if (penaltiesLeviedBoardMeeting != _undefined)
          'penaltiesLeviedBoardMeeting': (penaltiesLeviedBoardMeeting as bool?),
        if (reconciliationOfStocks != _undefined)
          'reconciliationOfStocks':
              (reconciliationOfStocks as Enum$ReconciliationStocksTypeEnum?),
        if (statutoryFillings != _undefined)
          'statutoryFillings':
              (statutoryFillings as Enum$StatutoryFillingsTypeEnum?),
      }));
}

class _CopyWithStubImpl$Input$ProcessesSystemsSubmissionInput<TRes>
    implements CopyWith$Input$ProcessesSystemsSubmissionInput<TRes> {
  _CopyWithStubImpl$Input$ProcessesSystemsSubmissionInput(this._res);

  TRes _res;

  call({
    Enum$AccountsMISTypeEnum? accountsAndMis,
    Enum$BooksRecordsTypeEnum? booksAndRecordsUpToDate,
    Enum$CreditRecordTypeEnum? creditRecordOfFpo,
    Enum$InsuranceStockTypeEnum? insuranceOfStock,
    bool? penaltiesLeviedBoardMeeting,
    Enum$ReconciliationStocksTypeEnum? reconciliationOfStocks,
    Enum$StatutoryFillingsTypeEnum? statutoryFillings,
  }) =>
      _res;
}

class Input$SustainableActivitiesSubmissionInput {
  factory Input$SustainableActivitiesSubmissionInput({
    bool? climateResilientSeedsToFarmers,
    bool? compostingUnitsAtFpoLevel,
    bool? dripSprinklerIrrigationToFarmers,
    bool? establishmentOfRainwaterHarvestingAtFpoLevel,
    bool? organicBioManureFertilizersToFarmers,
    bool? pestDiseaseAlertsToFarmers,
    bool? solarPanelsAtFpoLevel,
    bool? supplyingAgriculturalResidueToBioCngGasPlants,
    bool? trainingOnOrganicFarmingToFarmers,
    bool? weatherAdvisoriesToFarmers,
  }) =>
      Input$SustainableActivitiesSubmissionInput._({
        if (climateResilientSeedsToFarmers != null)
          r'climateResilientSeedsToFarmers': climateResilientSeedsToFarmers,
        if (compostingUnitsAtFpoLevel != null)
          r'compostingUnitsAtFpoLevel': compostingUnitsAtFpoLevel,
        if (dripSprinklerIrrigationToFarmers != null)
          r'dripSprinklerIrrigationToFarmers': dripSprinklerIrrigationToFarmers,
        if (establishmentOfRainwaterHarvestingAtFpoLevel != null)
          r'establishmentOfRainwaterHarvestingAtFpoLevel':
              establishmentOfRainwaterHarvestingAtFpoLevel,
        if (organicBioManureFertilizersToFarmers != null)
          r'organicBioManureFertilizersToFarmers':
              organicBioManureFertilizersToFarmers,
        if (pestDiseaseAlertsToFarmers != null)
          r'pestDiseaseAlertsToFarmers': pestDiseaseAlertsToFarmers,
        if (solarPanelsAtFpoLevel != null)
          r'solarPanelsAtFpoLevel': solarPanelsAtFpoLevel,
        if (supplyingAgriculturalResidueToBioCngGasPlants != null)
          r'supplyingAgriculturalResidueToBioCngGasPlants':
              supplyingAgriculturalResidueToBioCngGasPlants,
        if (trainingOnOrganicFarmingToFarmers != null)
          r'trainingOnOrganicFarmingToFarmers':
              trainingOnOrganicFarmingToFarmers,
        if (weatherAdvisoriesToFarmers != null)
          r'weatherAdvisoriesToFarmers': weatherAdvisoriesToFarmers,
      });

  Input$SustainableActivitiesSubmissionInput._(this._$data);

  factory Input$SustainableActivitiesSubmissionInput.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('climateResilientSeedsToFarmers')) {
      final l$climateResilientSeedsToFarmers =
          data['climateResilientSeedsToFarmers'];
      result$data['climateResilientSeedsToFarmers'] =
          (l$climateResilientSeedsToFarmers as bool?);
    }
    if (data.containsKey('compostingUnitsAtFpoLevel')) {
      final l$compostingUnitsAtFpoLevel = data['compostingUnitsAtFpoLevel'];
      result$data['compostingUnitsAtFpoLevel'] =
          (l$compostingUnitsAtFpoLevel as bool?);
    }
    if (data.containsKey('dripSprinklerIrrigationToFarmers')) {
      final l$dripSprinklerIrrigationToFarmers =
          data['dripSprinklerIrrigationToFarmers'];
      result$data['dripSprinklerIrrigationToFarmers'] =
          (l$dripSprinklerIrrigationToFarmers as bool?);
    }
    if (data.containsKey('establishmentOfRainwaterHarvestingAtFpoLevel')) {
      final l$establishmentOfRainwaterHarvestingAtFpoLevel =
          data['establishmentOfRainwaterHarvestingAtFpoLevel'];
      result$data['establishmentOfRainwaterHarvestingAtFpoLevel'] =
          (l$establishmentOfRainwaterHarvestingAtFpoLevel as bool?);
    }
    if (data.containsKey('organicBioManureFertilizersToFarmers')) {
      final l$organicBioManureFertilizersToFarmers =
          data['organicBioManureFertilizersToFarmers'];
      result$data['organicBioManureFertilizersToFarmers'] =
          (l$organicBioManureFertilizersToFarmers as bool?);
    }
    if (data.containsKey('pestDiseaseAlertsToFarmers')) {
      final l$pestDiseaseAlertsToFarmers = data['pestDiseaseAlertsToFarmers'];
      result$data['pestDiseaseAlertsToFarmers'] =
          (l$pestDiseaseAlertsToFarmers as bool?);
    }
    if (data.containsKey('solarPanelsAtFpoLevel')) {
      final l$solarPanelsAtFpoLevel = data['solarPanelsAtFpoLevel'];
      result$data['solarPanelsAtFpoLevel'] = (l$solarPanelsAtFpoLevel as bool?);
    }
    if (data.containsKey('supplyingAgriculturalResidueToBioCngGasPlants')) {
      final l$supplyingAgriculturalResidueToBioCngGasPlants =
          data['supplyingAgriculturalResidueToBioCngGasPlants'];
      result$data['supplyingAgriculturalResidueToBioCngGasPlants'] =
          (l$supplyingAgriculturalResidueToBioCngGasPlants as bool?);
    }
    if (data.containsKey('trainingOnOrganicFarmingToFarmers')) {
      final l$trainingOnOrganicFarmingToFarmers =
          data['trainingOnOrganicFarmingToFarmers'];
      result$data['trainingOnOrganicFarmingToFarmers'] =
          (l$trainingOnOrganicFarmingToFarmers as bool?);
    }
    if (data.containsKey('weatherAdvisoriesToFarmers')) {
      final l$weatherAdvisoriesToFarmers = data['weatherAdvisoriesToFarmers'];
      result$data['weatherAdvisoriesToFarmers'] =
          (l$weatherAdvisoriesToFarmers as bool?);
    }
    return Input$SustainableActivitiesSubmissionInput._(result$data);
  }

  Map<String, dynamic> _$data;

  bool? get climateResilientSeedsToFarmers =>
      (_$data['climateResilientSeedsToFarmers'] as bool?);

  bool? get compostingUnitsAtFpoLevel =>
      (_$data['compostingUnitsAtFpoLevel'] as bool?);

  bool? get dripSprinklerIrrigationToFarmers =>
      (_$data['dripSprinklerIrrigationToFarmers'] as bool?);

  bool? get establishmentOfRainwaterHarvestingAtFpoLevel =>
      (_$data['establishmentOfRainwaterHarvestingAtFpoLevel'] as bool?);

  bool? get organicBioManureFertilizersToFarmers =>
      (_$data['organicBioManureFertilizersToFarmers'] as bool?);

  bool? get pestDiseaseAlertsToFarmers =>
      (_$data['pestDiseaseAlertsToFarmers'] as bool?);

  bool? get solarPanelsAtFpoLevel => (_$data['solarPanelsAtFpoLevel'] as bool?);

  bool? get supplyingAgriculturalResidueToBioCngGasPlants =>
      (_$data['supplyingAgriculturalResidueToBioCngGasPlants'] as bool?);

  bool? get trainingOnOrganicFarmingToFarmers =>
      (_$data['trainingOnOrganicFarmingToFarmers'] as bool?);

  bool? get weatherAdvisoriesToFarmers =>
      (_$data['weatherAdvisoriesToFarmers'] as bool?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('climateResilientSeedsToFarmers')) {
      final l$climateResilientSeedsToFarmers = climateResilientSeedsToFarmers;
      result$data['climateResilientSeedsToFarmers'] =
          l$climateResilientSeedsToFarmers;
    }
    if (_$data.containsKey('compostingUnitsAtFpoLevel')) {
      final l$compostingUnitsAtFpoLevel = compostingUnitsAtFpoLevel;
      result$data['compostingUnitsAtFpoLevel'] = l$compostingUnitsAtFpoLevel;
    }
    if (_$data.containsKey('dripSprinklerIrrigationToFarmers')) {
      final l$dripSprinklerIrrigationToFarmers =
          dripSprinklerIrrigationToFarmers;
      result$data['dripSprinklerIrrigationToFarmers'] =
          l$dripSprinklerIrrigationToFarmers;
    }
    if (_$data.containsKey('establishmentOfRainwaterHarvestingAtFpoLevel')) {
      final l$establishmentOfRainwaterHarvestingAtFpoLevel =
          establishmentOfRainwaterHarvestingAtFpoLevel;
      result$data['establishmentOfRainwaterHarvestingAtFpoLevel'] =
          l$establishmentOfRainwaterHarvestingAtFpoLevel;
    }
    if (_$data.containsKey('organicBioManureFertilizersToFarmers')) {
      final l$organicBioManureFertilizersToFarmers =
          organicBioManureFertilizersToFarmers;
      result$data['organicBioManureFertilizersToFarmers'] =
          l$organicBioManureFertilizersToFarmers;
    }
    if (_$data.containsKey('pestDiseaseAlertsToFarmers')) {
      final l$pestDiseaseAlertsToFarmers = pestDiseaseAlertsToFarmers;
      result$data['pestDiseaseAlertsToFarmers'] = l$pestDiseaseAlertsToFarmers;
    }
    if (_$data.containsKey('solarPanelsAtFpoLevel')) {
      final l$solarPanelsAtFpoLevel = solarPanelsAtFpoLevel;
      result$data['solarPanelsAtFpoLevel'] = l$solarPanelsAtFpoLevel;
    }
    if (_$data.containsKey('supplyingAgriculturalResidueToBioCngGasPlants')) {
      final l$supplyingAgriculturalResidueToBioCngGasPlants =
          supplyingAgriculturalResidueToBioCngGasPlants;
      result$data['supplyingAgriculturalResidueToBioCngGasPlants'] =
          l$supplyingAgriculturalResidueToBioCngGasPlants;
    }
    if (_$data.containsKey('trainingOnOrganicFarmingToFarmers')) {
      final l$trainingOnOrganicFarmingToFarmers =
          trainingOnOrganicFarmingToFarmers;
      result$data['trainingOnOrganicFarmingToFarmers'] =
          l$trainingOnOrganicFarmingToFarmers;
    }
    if (_$data.containsKey('weatherAdvisoriesToFarmers')) {
      final l$weatherAdvisoriesToFarmers = weatherAdvisoriesToFarmers;
      result$data['weatherAdvisoriesToFarmers'] = l$weatherAdvisoriesToFarmers;
    }
    return result$data;
  }

  CopyWith$Input$SustainableActivitiesSubmissionInput<
          Input$SustainableActivitiesSubmissionInput>
      get copyWith => CopyWith$Input$SustainableActivitiesSubmissionInput(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$SustainableActivitiesSubmissionInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$climateResilientSeedsToFarmers = climateResilientSeedsToFarmers;
    final lOther$climateResilientSeedsToFarmers =
        other.climateResilientSeedsToFarmers;
    if (_$data.containsKey('climateResilientSeedsToFarmers') !=
        other._$data.containsKey('climateResilientSeedsToFarmers')) {
      return false;
    }
    if (l$climateResilientSeedsToFarmers !=
        lOther$climateResilientSeedsToFarmers) {
      return false;
    }
    final l$compostingUnitsAtFpoLevel = compostingUnitsAtFpoLevel;
    final lOther$compostingUnitsAtFpoLevel = other.compostingUnitsAtFpoLevel;
    if (_$data.containsKey('compostingUnitsAtFpoLevel') !=
        other._$data.containsKey('compostingUnitsAtFpoLevel')) {
      return false;
    }
    if (l$compostingUnitsAtFpoLevel != lOther$compostingUnitsAtFpoLevel) {
      return false;
    }
    final l$dripSprinklerIrrigationToFarmers = dripSprinklerIrrigationToFarmers;
    final lOther$dripSprinklerIrrigationToFarmers =
        other.dripSprinklerIrrigationToFarmers;
    if (_$data.containsKey('dripSprinklerIrrigationToFarmers') !=
        other._$data.containsKey('dripSprinklerIrrigationToFarmers')) {
      return false;
    }
    if (l$dripSprinklerIrrigationToFarmers !=
        lOther$dripSprinklerIrrigationToFarmers) {
      return false;
    }
    final l$establishmentOfRainwaterHarvestingAtFpoLevel =
        establishmentOfRainwaterHarvestingAtFpoLevel;
    final lOther$establishmentOfRainwaterHarvestingAtFpoLevel =
        other.establishmentOfRainwaterHarvestingAtFpoLevel;
    if (_$data.containsKey('establishmentOfRainwaterHarvestingAtFpoLevel') !=
        other._$data
            .containsKey('establishmentOfRainwaterHarvestingAtFpoLevel')) {
      return false;
    }
    if (l$establishmentOfRainwaterHarvestingAtFpoLevel !=
        lOther$establishmentOfRainwaterHarvestingAtFpoLevel) {
      return false;
    }
    final l$organicBioManureFertilizersToFarmers =
        organicBioManureFertilizersToFarmers;
    final lOther$organicBioManureFertilizersToFarmers =
        other.organicBioManureFertilizersToFarmers;
    if (_$data.containsKey('organicBioManureFertilizersToFarmers') !=
        other._$data.containsKey('organicBioManureFertilizersToFarmers')) {
      return false;
    }
    if (l$organicBioManureFertilizersToFarmers !=
        lOther$organicBioManureFertilizersToFarmers) {
      return false;
    }
    final l$pestDiseaseAlertsToFarmers = pestDiseaseAlertsToFarmers;
    final lOther$pestDiseaseAlertsToFarmers = other.pestDiseaseAlertsToFarmers;
    if (_$data.containsKey('pestDiseaseAlertsToFarmers') !=
        other._$data.containsKey('pestDiseaseAlertsToFarmers')) {
      return false;
    }
    if (l$pestDiseaseAlertsToFarmers != lOther$pestDiseaseAlertsToFarmers) {
      return false;
    }
    final l$solarPanelsAtFpoLevel = solarPanelsAtFpoLevel;
    final lOther$solarPanelsAtFpoLevel = other.solarPanelsAtFpoLevel;
    if (_$data.containsKey('solarPanelsAtFpoLevel') !=
        other._$data.containsKey('solarPanelsAtFpoLevel')) {
      return false;
    }
    if (l$solarPanelsAtFpoLevel != lOther$solarPanelsAtFpoLevel) {
      return false;
    }
    final l$supplyingAgriculturalResidueToBioCngGasPlants =
        supplyingAgriculturalResidueToBioCngGasPlants;
    final lOther$supplyingAgriculturalResidueToBioCngGasPlants =
        other.supplyingAgriculturalResidueToBioCngGasPlants;
    if (_$data.containsKey('supplyingAgriculturalResidueToBioCngGasPlants') !=
        other._$data
            .containsKey('supplyingAgriculturalResidueToBioCngGasPlants')) {
      return false;
    }
    if (l$supplyingAgriculturalResidueToBioCngGasPlants !=
        lOther$supplyingAgriculturalResidueToBioCngGasPlants) {
      return false;
    }
    final l$trainingOnOrganicFarmingToFarmers =
        trainingOnOrganicFarmingToFarmers;
    final lOther$trainingOnOrganicFarmingToFarmers =
        other.trainingOnOrganicFarmingToFarmers;
    if (_$data.containsKey('trainingOnOrganicFarmingToFarmers') !=
        other._$data.containsKey('trainingOnOrganicFarmingToFarmers')) {
      return false;
    }
    if (l$trainingOnOrganicFarmingToFarmers !=
        lOther$trainingOnOrganicFarmingToFarmers) {
      return false;
    }
    final l$weatherAdvisoriesToFarmers = weatherAdvisoriesToFarmers;
    final lOther$weatherAdvisoriesToFarmers = other.weatherAdvisoriesToFarmers;
    if (_$data.containsKey('weatherAdvisoriesToFarmers') !=
        other._$data.containsKey('weatherAdvisoriesToFarmers')) {
      return false;
    }
    if (l$weatherAdvisoriesToFarmers != lOther$weatherAdvisoriesToFarmers) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$climateResilientSeedsToFarmers = climateResilientSeedsToFarmers;
    final l$compostingUnitsAtFpoLevel = compostingUnitsAtFpoLevel;
    final l$dripSprinklerIrrigationToFarmers = dripSprinklerIrrigationToFarmers;
    final l$establishmentOfRainwaterHarvestingAtFpoLevel =
        establishmentOfRainwaterHarvestingAtFpoLevel;
    final l$organicBioManureFertilizersToFarmers =
        organicBioManureFertilizersToFarmers;
    final l$pestDiseaseAlertsToFarmers = pestDiseaseAlertsToFarmers;
    final l$solarPanelsAtFpoLevel = solarPanelsAtFpoLevel;
    final l$supplyingAgriculturalResidueToBioCngGasPlants =
        supplyingAgriculturalResidueToBioCngGasPlants;
    final l$trainingOnOrganicFarmingToFarmers =
        trainingOnOrganicFarmingToFarmers;
    final l$weatherAdvisoriesToFarmers = weatherAdvisoriesToFarmers;
    return Object.hashAll([
      _$data.containsKey('climateResilientSeedsToFarmers')
          ? l$climateResilientSeedsToFarmers
          : const {},
      _$data.containsKey('compostingUnitsAtFpoLevel')
          ? l$compostingUnitsAtFpoLevel
          : const {},
      _$data.containsKey('dripSprinklerIrrigationToFarmers')
          ? l$dripSprinklerIrrigationToFarmers
          : const {},
      _$data.containsKey('establishmentOfRainwaterHarvestingAtFpoLevel')
          ? l$establishmentOfRainwaterHarvestingAtFpoLevel
          : const {},
      _$data.containsKey('organicBioManureFertilizersToFarmers')
          ? l$organicBioManureFertilizersToFarmers
          : const {},
      _$data.containsKey('pestDiseaseAlertsToFarmers')
          ? l$pestDiseaseAlertsToFarmers
          : const {},
      _$data.containsKey('solarPanelsAtFpoLevel')
          ? l$solarPanelsAtFpoLevel
          : const {},
      _$data.containsKey('supplyingAgriculturalResidueToBioCngGasPlants')
          ? l$supplyingAgriculturalResidueToBioCngGasPlants
          : const {},
      _$data.containsKey('trainingOnOrganicFarmingToFarmers')
          ? l$trainingOnOrganicFarmingToFarmers
          : const {},
      _$data.containsKey('weatherAdvisoriesToFarmers')
          ? l$weatherAdvisoriesToFarmers
          : const {},
    ]);
  }
}

abstract class CopyWith$Input$SustainableActivitiesSubmissionInput<TRes> {
  factory CopyWith$Input$SustainableActivitiesSubmissionInput(
    Input$SustainableActivitiesSubmissionInput instance,
    TRes Function(Input$SustainableActivitiesSubmissionInput) then,
  ) = _CopyWithImpl$Input$SustainableActivitiesSubmissionInput;

  factory CopyWith$Input$SustainableActivitiesSubmissionInput.stub(TRes res) =
      _CopyWithStubImpl$Input$SustainableActivitiesSubmissionInput;

  TRes call({
    bool? climateResilientSeedsToFarmers,
    bool? compostingUnitsAtFpoLevel,
    bool? dripSprinklerIrrigationToFarmers,
    bool? establishmentOfRainwaterHarvestingAtFpoLevel,
    bool? organicBioManureFertilizersToFarmers,
    bool? pestDiseaseAlertsToFarmers,
    bool? solarPanelsAtFpoLevel,
    bool? supplyingAgriculturalResidueToBioCngGasPlants,
    bool? trainingOnOrganicFarmingToFarmers,
    bool? weatherAdvisoriesToFarmers,
  });
}

class _CopyWithImpl$Input$SustainableActivitiesSubmissionInput<TRes>
    implements CopyWith$Input$SustainableActivitiesSubmissionInput<TRes> {
  _CopyWithImpl$Input$SustainableActivitiesSubmissionInput(
    this._instance,
    this._then,
  );

  final Input$SustainableActivitiesSubmissionInput _instance;

  final TRes Function(Input$SustainableActivitiesSubmissionInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? climateResilientSeedsToFarmers = _undefined,
    Object? compostingUnitsAtFpoLevel = _undefined,
    Object? dripSprinklerIrrigationToFarmers = _undefined,
    Object? establishmentOfRainwaterHarvestingAtFpoLevel = _undefined,
    Object? organicBioManureFertilizersToFarmers = _undefined,
    Object? pestDiseaseAlertsToFarmers = _undefined,
    Object? solarPanelsAtFpoLevel = _undefined,
    Object? supplyingAgriculturalResidueToBioCngGasPlants = _undefined,
    Object? trainingOnOrganicFarmingToFarmers = _undefined,
    Object? weatherAdvisoriesToFarmers = _undefined,
  }) =>
      _then(Input$SustainableActivitiesSubmissionInput._({
        ..._instance._$data,
        if (climateResilientSeedsToFarmers != _undefined)
          'climateResilientSeedsToFarmers':
              (climateResilientSeedsToFarmers as bool?),
        if (compostingUnitsAtFpoLevel != _undefined)
          'compostingUnitsAtFpoLevel': (compostingUnitsAtFpoLevel as bool?),
        if (dripSprinklerIrrigationToFarmers != _undefined)
          'dripSprinklerIrrigationToFarmers':
              (dripSprinklerIrrigationToFarmers as bool?),
        if (establishmentOfRainwaterHarvestingAtFpoLevel != _undefined)
          'establishmentOfRainwaterHarvestingAtFpoLevel':
              (establishmentOfRainwaterHarvestingAtFpoLevel as bool?),
        if (organicBioManureFertilizersToFarmers != _undefined)
          'organicBioManureFertilizersToFarmers':
              (organicBioManureFertilizersToFarmers as bool?),
        if (pestDiseaseAlertsToFarmers != _undefined)
          'pestDiseaseAlertsToFarmers': (pestDiseaseAlertsToFarmers as bool?),
        if (solarPanelsAtFpoLevel != _undefined)
          'solarPanelsAtFpoLevel': (solarPanelsAtFpoLevel as bool?),
        if (supplyingAgriculturalResidueToBioCngGasPlants != _undefined)
          'supplyingAgriculturalResidueToBioCngGasPlants':
              (supplyingAgriculturalResidueToBioCngGasPlants as bool?),
        if (trainingOnOrganicFarmingToFarmers != _undefined)
          'trainingOnOrganicFarmingToFarmers':
              (trainingOnOrganicFarmingToFarmers as bool?),
        if (weatherAdvisoriesToFarmers != _undefined)
          'weatherAdvisoriesToFarmers': (weatherAdvisoriesToFarmers as bool?),
      }));
}

class _CopyWithStubImpl$Input$SustainableActivitiesSubmissionInput<TRes>
    implements CopyWith$Input$SustainableActivitiesSubmissionInput<TRes> {
  _CopyWithStubImpl$Input$SustainableActivitiesSubmissionInput(this._res);

  TRes _res;

  call({
    bool? climateResilientSeedsToFarmers,
    bool? compostingUnitsAtFpoLevel,
    bool? dripSprinklerIrrigationToFarmers,
    bool? establishmentOfRainwaterHarvestingAtFpoLevel,
    bool? organicBioManureFertilizersToFarmers,
    bool? pestDiseaseAlertsToFarmers,
    bool? solarPanelsAtFpoLevel,
    bool? supplyingAgriculturalResidueToBioCngGasPlants,
    bool? trainingOnOrganicFarmingToFarmers,
    bool? weatherAdvisoriesToFarmers,
  }) =>
      _res;
}

enum Enum$AccountsMISTypeEnum {
  MS_OFFICE_TOOLS,
  NO_MIS,
  SOFTWARE_DIGITAL,
  TALLY_NO_DIGITAL,
  $unknown;

  factory Enum$AccountsMISTypeEnum.fromJson(String value) =>
      fromJson$Enum$AccountsMISTypeEnum(value);

  String toJson() => toJson$Enum$AccountsMISTypeEnum(this);
}

String toJson$Enum$AccountsMISTypeEnum(Enum$AccountsMISTypeEnum e) {
  switch (e) {
    case Enum$AccountsMISTypeEnum.MS_OFFICE_TOOLS:
      return r'MS_OFFICE_TOOLS';
    case Enum$AccountsMISTypeEnum.NO_MIS:
      return r'NO_MIS';
    case Enum$AccountsMISTypeEnum.SOFTWARE_DIGITAL:
      return r'SOFTWARE_DIGITAL';
    case Enum$AccountsMISTypeEnum.TALLY_NO_DIGITAL:
      return r'TALLY_NO_DIGITAL';
    case Enum$AccountsMISTypeEnum.$unknown:
      return r'$unknown';
  }
}

Enum$AccountsMISTypeEnum fromJson$Enum$AccountsMISTypeEnum(String value) {
  switch (value) {
    case r'MS_OFFICE_TOOLS':
      return Enum$AccountsMISTypeEnum.MS_OFFICE_TOOLS;
    case r'NO_MIS':
      return Enum$AccountsMISTypeEnum.NO_MIS;
    case r'SOFTWARE_DIGITAL':
      return Enum$AccountsMISTypeEnum.SOFTWARE_DIGITAL;
    case r'TALLY_NO_DIGITAL':
      return Enum$AccountsMISTypeEnum.TALLY_NO_DIGITAL;
    default:
      return Enum$AccountsMISTypeEnum.$unknown;
  }
}

enum Enum$ActRegisteredTypeEnum {
  COMPANY_ACT,
  COOPERATIVE_SOCIETIES_ACT,
  OTHER,
  $unknown;

  factory Enum$ActRegisteredTypeEnum.fromJson(String value) =>
      fromJson$Enum$ActRegisteredTypeEnum(value);

  String toJson() => toJson$Enum$ActRegisteredTypeEnum(this);
}

String toJson$Enum$ActRegisteredTypeEnum(Enum$ActRegisteredTypeEnum e) {
  switch (e) {
    case Enum$ActRegisteredTypeEnum.COMPANY_ACT:
      return r'COMPANY_ACT';
    case Enum$ActRegisteredTypeEnum.COOPERATIVE_SOCIETIES_ACT:
      return r'COOPERATIVE_SOCIETIES_ACT';
    case Enum$ActRegisteredTypeEnum.OTHER:
      return r'OTHER';
    case Enum$ActRegisteredTypeEnum.$unknown:
      return r'$unknown';
  }
}

Enum$ActRegisteredTypeEnum fromJson$Enum$ActRegisteredTypeEnum(String value) {
  switch (value) {
    case r'COMPANY_ACT':
      return Enum$ActRegisteredTypeEnum.COMPANY_ACT;
    case r'COOPERATIVE_SOCIETIES_ACT':
      return Enum$ActRegisteredTypeEnum.COOPERATIVE_SOCIETIES_ACT;
    case r'OTHER':
      return Enum$ActRegisteredTypeEnum.OTHER;
    default:
      return Enum$ActRegisteredTypeEnum.$unknown;
  }
}

enum Enum$BoardExperienceTypeEnum {
  AGRICULTURAL_COOPERATIVES,
  ANY_OTHER,
  FARMER_OWNED_ENTERPRISES,
  FARM_MANAGEMENT,
  GOVERNMENT_AGRICULTURE,
  NGO_AGRICULTURE,
  SELF_HELP_GROUPS,
  VILLAGE_COUNCILS,
  $unknown;

  factory Enum$BoardExperienceTypeEnum.fromJson(String value) =>
      fromJson$Enum$BoardExperienceTypeEnum(value);

  String toJson() => toJson$Enum$BoardExperienceTypeEnum(this);
}

String toJson$Enum$BoardExperienceTypeEnum(Enum$BoardExperienceTypeEnum e) {
  switch (e) {
    case Enum$BoardExperienceTypeEnum.AGRICULTURAL_COOPERATIVES:
      return r'AGRICULTURAL_COOPERATIVES';
    case Enum$BoardExperienceTypeEnum.ANY_OTHER:
      return r'ANY_OTHER';
    case Enum$BoardExperienceTypeEnum.FARMER_OWNED_ENTERPRISES:
      return r'FARMER_OWNED_ENTERPRISES';
    case Enum$BoardExperienceTypeEnum.FARM_MANAGEMENT:
      return r'FARM_MANAGEMENT';
    case Enum$BoardExperienceTypeEnum.GOVERNMENT_AGRICULTURE:
      return r'GOVERNMENT_AGRICULTURE';
    case Enum$BoardExperienceTypeEnum.NGO_AGRICULTURE:
      return r'NGO_AGRICULTURE';
    case Enum$BoardExperienceTypeEnum.SELF_HELP_GROUPS:
      return r'SELF_HELP_GROUPS';
    case Enum$BoardExperienceTypeEnum.VILLAGE_COUNCILS:
      return r'VILLAGE_COUNCILS';
    case Enum$BoardExperienceTypeEnum.$unknown:
      return r'$unknown';
  }
}

Enum$BoardExperienceTypeEnum fromJson$Enum$BoardExperienceTypeEnum(
    String value) {
  switch (value) {
    case r'AGRICULTURAL_COOPERATIVES':
      return Enum$BoardExperienceTypeEnum.AGRICULTURAL_COOPERATIVES;
    case r'ANY_OTHER':
      return Enum$BoardExperienceTypeEnum.ANY_OTHER;
    case r'FARMER_OWNED_ENTERPRISES':
      return Enum$BoardExperienceTypeEnum.FARMER_OWNED_ENTERPRISES;
    case r'FARM_MANAGEMENT':
      return Enum$BoardExperienceTypeEnum.FARM_MANAGEMENT;
    case r'GOVERNMENT_AGRICULTURE':
      return Enum$BoardExperienceTypeEnum.GOVERNMENT_AGRICULTURE;
    case r'NGO_AGRICULTURE':
      return Enum$BoardExperienceTypeEnum.NGO_AGRICULTURE;
    case r'SELF_HELP_GROUPS':
      return Enum$BoardExperienceTypeEnum.SELF_HELP_GROUPS;
    case r'VILLAGE_COUNCILS':
      return Enum$BoardExperienceTypeEnum.VILLAGE_COUNCILS;
    default:
      return Enum$BoardExperienceTypeEnum.$unknown;
  }
}

enum Enum$BooksRecordsTypeEnum {
  CURRENT,
  LAG_2_3_DAYS,
  PROCESSES_SYSTEMS,
  WEEKLY_UPDATED,
  $unknown;

  factory Enum$BooksRecordsTypeEnum.fromJson(String value) =>
      fromJson$Enum$BooksRecordsTypeEnum(value);

  String toJson() => toJson$Enum$BooksRecordsTypeEnum(this);
}

String toJson$Enum$BooksRecordsTypeEnum(Enum$BooksRecordsTypeEnum e) {
  switch (e) {
    case Enum$BooksRecordsTypeEnum.CURRENT:
      return r'CURRENT';
    case Enum$BooksRecordsTypeEnum.LAG_2_3_DAYS:
      return r'LAG_2_3_DAYS';
    case Enum$BooksRecordsTypeEnum.PROCESSES_SYSTEMS:
      return r'PROCESSES_SYSTEMS';
    case Enum$BooksRecordsTypeEnum.WEEKLY_UPDATED:
      return r'WEEKLY_UPDATED';
    case Enum$BooksRecordsTypeEnum.$unknown:
      return r'$unknown';
  }
}

Enum$BooksRecordsTypeEnum fromJson$Enum$BooksRecordsTypeEnum(String value) {
  switch (value) {
    case r'CURRENT':
      return Enum$BooksRecordsTypeEnum.CURRENT;
    case r'LAG_2_3_DAYS':
      return Enum$BooksRecordsTypeEnum.LAG_2_3_DAYS;
    case r'PROCESSES_SYSTEMS':
      return Enum$BooksRecordsTypeEnum.PROCESSES_SYSTEMS;
    case r'WEEKLY_UPDATED':
      return Enum$BooksRecordsTypeEnum.WEEKLY_UPDATED;
    default:
      return Enum$BooksRecordsTypeEnum.$unknown;
  }
}

enum Enum$CreditRecordTypeEnum {
  MULTIPLE_DELAYS,
  NO_CREDIT_HISTORY,
  NO_DELAYS,
  ONE_DELAY,
  $unknown;

  factory Enum$CreditRecordTypeEnum.fromJson(String value) =>
      fromJson$Enum$CreditRecordTypeEnum(value);

  String toJson() => toJson$Enum$CreditRecordTypeEnum(this);
}

String toJson$Enum$CreditRecordTypeEnum(Enum$CreditRecordTypeEnum e) {
  switch (e) {
    case Enum$CreditRecordTypeEnum.MULTIPLE_DELAYS:
      return r'MULTIPLE_DELAYS';
    case Enum$CreditRecordTypeEnum.NO_CREDIT_HISTORY:
      return r'NO_CREDIT_HISTORY';
    case Enum$CreditRecordTypeEnum.NO_DELAYS:
      return r'NO_DELAYS';
    case Enum$CreditRecordTypeEnum.ONE_DELAY:
      return r'ONE_DELAY';
    case Enum$CreditRecordTypeEnum.$unknown:
      return r'$unknown';
  }
}

Enum$CreditRecordTypeEnum fromJson$Enum$CreditRecordTypeEnum(String value) {
  switch (value) {
    case r'MULTIPLE_DELAYS':
      return Enum$CreditRecordTypeEnum.MULTIPLE_DELAYS;
    case r'NO_CREDIT_HISTORY':
      return Enum$CreditRecordTypeEnum.NO_CREDIT_HISTORY;
    case r'NO_DELAYS':
      return Enum$CreditRecordTypeEnum.NO_DELAYS;
    case r'ONE_DELAY':
      return Enum$CreditRecordTypeEnum.ONE_DELAY;
    default:
      return Enum$CreditRecordTypeEnum.$unknown;
  }
}

enum Enum$DistanceAvailabilityTypeEnum {
  NOT_APPLICABLE,
  NOT_WITHIN_TEN_KM,
  SIX_KM,
  TEN_KM,
  THREE_KM,
  $unknown;

  factory Enum$DistanceAvailabilityTypeEnum.fromJson(String value) =>
      fromJson$Enum$DistanceAvailabilityTypeEnum(value);

  String toJson() => toJson$Enum$DistanceAvailabilityTypeEnum(this);
}

String toJson$Enum$DistanceAvailabilityTypeEnum(
    Enum$DistanceAvailabilityTypeEnum e) {
  switch (e) {
    case Enum$DistanceAvailabilityTypeEnum.NOT_APPLICABLE:
      return r'NOT_APPLICABLE';
    case Enum$DistanceAvailabilityTypeEnum.NOT_WITHIN_TEN_KM:
      return r'NOT_WITHIN_TEN_KM';
    case Enum$DistanceAvailabilityTypeEnum.SIX_KM:
      return r'SIX_KM';
    case Enum$DistanceAvailabilityTypeEnum.TEN_KM:
      return r'TEN_KM';
    case Enum$DistanceAvailabilityTypeEnum.THREE_KM:
      return r'THREE_KM';
    case Enum$DistanceAvailabilityTypeEnum.$unknown:
      return r'$unknown';
  }
}

Enum$DistanceAvailabilityTypeEnum fromJson$Enum$DistanceAvailabilityTypeEnum(
    String value) {
  switch (value) {
    case r'NOT_APPLICABLE':
      return Enum$DistanceAvailabilityTypeEnum.NOT_APPLICABLE;
    case r'NOT_WITHIN_TEN_KM':
      return Enum$DistanceAvailabilityTypeEnum.NOT_WITHIN_TEN_KM;
    case r'SIX_KM':
      return Enum$DistanceAvailabilityTypeEnum.SIX_KM;
    case r'TEN_KM':
      return Enum$DistanceAvailabilityTypeEnum.TEN_KM;
    case r'THREE_KM':
      return Enum$DistanceAvailabilityTypeEnum.THREE_KM;
    default:
      return Enum$DistanceAvailabilityTypeEnum.$unknown;
  }
}

enum Enum$ExperienceTypeEnum {
  AGRICULTURAL_COOPERATIVES,
  ANY_OTHER,
  BUSINESS_FUNCTIONS,
  FARMER_OWNED_ENTERPRISES,
  FARM_MANAGEMENT,
  GOVERNMENT_AGRICULTURE,
  NGO_AGRICULTURE,
  SELF_HELP_GROUPS,
  VILLAGE_COUNCILS,
  $unknown;

  factory Enum$ExperienceTypeEnum.fromJson(String value) =>
      fromJson$Enum$ExperienceTypeEnum(value);

  String toJson() => toJson$Enum$ExperienceTypeEnum(this);
}

String toJson$Enum$ExperienceTypeEnum(Enum$ExperienceTypeEnum e) {
  switch (e) {
    case Enum$ExperienceTypeEnum.AGRICULTURAL_COOPERATIVES:
      return r'AGRICULTURAL_COOPERATIVES';
    case Enum$ExperienceTypeEnum.ANY_OTHER:
      return r'ANY_OTHER';
    case Enum$ExperienceTypeEnum.BUSINESS_FUNCTIONS:
      return r'BUSINESS_FUNCTIONS';
    case Enum$ExperienceTypeEnum.FARMER_OWNED_ENTERPRISES:
      return r'FARMER_OWNED_ENTERPRISES';
    case Enum$ExperienceTypeEnum.FARM_MANAGEMENT:
      return r'FARM_MANAGEMENT';
    case Enum$ExperienceTypeEnum.GOVERNMENT_AGRICULTURE:
      return r'GOVERNMENT_AGRICULTURE';
    case Enum$ExperienceTypeEnum.NGO_AGRICULTURE:
      return r'NGO_AGRICULTURE';
    case Enum$ExperienceTypeEnum.SELF_HELP_GROUPS:
      return r'SELF_HELP_GROUPS';
    case Enum$ExperienceTypeEnum.VILLAGE_COUNCILS:
      return r'VILLAGE_COUNCILS';
    case Enum$ExperienceTypeEnum.$unknown:
      return r'$unknown';
  }
}

Enum$ExperienceTypeEnum fromJson$Enum$ExperienceTypeEnum(String value) {
  switch (value) {
    case r'AGRICULTURAL_COOPERATIVES':
      return Enum$ExperienceTypeEnum.AGRICULTURAL_COOPERATIVES;
    case r'ANY_OTHER':
      return Enum$ExperienceTypeEnum.ANY_OTHER;
    case r'BUSINESS_FUNCTIONS':
      return Enum$ExperienceTypeEnum.BUSINESS_FUNCTIONS;
    case r'FARMER_OWNED_ENTERPRISES':
      return Enum$ExperienceTypeEnum.FARMER_OWNED_ENTERPRISES;
    case r'FARM_MANAGEMENT':
      return Enum$ExperienceTypeEnum.FARM_MANAGEMENT;
    case r'GOVERNMENT_AGRICULTURE':
      return Enum$ExperienceTypeEnum.GOVERNMENT_AGRICULTURE;
    case r'NGO_AGRICULTURE':
      return Enum$ExperienceTypeEnum.NGO_AGRICULTURE;
    case r'SELF_HELP_GROUPS':
      return Enum$ExperienceTypeEnum.SELF_HELP_GROUPS;
    case r'VILLAGE_COUNCILS':
      return Enum$ExperienceTypeEnum.VILLAGE_COUNCILS;
    default:
      return Enum$ExperienceTypeEnum.$unknown;
  }
}

enum Enum$FPOTypeEnum {
  HIGH_CAPACITY,
  INPUTS_AND_OUTPUT,
  INPUTS_OR_OUTPUT,
  LOW_CAPACITY,
  $unknown;

  factory Enum$FPOTypeEnum.fromJson(String value) =>
      fromJson$Enum$FPOTypeEnum(value);

  String toJson() => toJson$Enum$FPOTypeEnum(this);
}

String toJson$Enum$FPOTypeEnum(Enum$FPOTypeEnum e) {
  switch (e) {
    case Enum$FPOTypeEnum.HIGH_CAPACITY:
      return r'HIGH_CAPACITY';
    case Enum$FPOTypeEnum.INPUTS_AND_OUTPUT:
      return r'INPUTS_AND_OUTPUT';
    case Enum$FPOTypeEnum.INPUTS_OR_OUTPUT:
      return r'INPUTS_OR_OUTPUT';
    case Enum$FPOTypeEnum.LOW_CAPACITY:
      return r'LOW_CAPACITY';
    case Enum$FPOTypeEnum.$unknown:
      return r'$unknown';
  }
}

Enum$FPOTypeEnum fromJson$Enum$FPOTypeEnum(String value) {
  switch (value) {
    case r'HIGH_CAPACITY':
      return Enum$FPOTypeEnum.HIGH_CAPACITY;
    case r'INPUTS_AND_OUTPUT':
      return Enum$FPOTypeEnum.INPUTS_AND_OUTPUT;
    case r'INPUTS_OR_OUTPUT':
      return Enum$FPOTypeEnum.INPUTS_OR_OUTPUT;
    case r'LOW_CAPACITY':
      return Enum$FPOTypeEnum.LOW_CAPACITY;
    default:
      return Enum$FPOTypeEnum.$unknown;
  }
}

enum Enum$FpoBoardDirectorProfileTypeOfExperienceChoices {
  AGRICULTURAL_COOPERATIVES,
  ANY_OTHER,
  FARMER_OWNED_ENTERPRISES,
  FARM_MANAGEMENT,
  GOVERNMENT_AGRICULTURE,
  NGO_AGRICULTURE,
  SELF_HELP_GROUPS,
  VILLAGE_COUNCILS,
  $unknown;

  factory Enum$FpoBoardDirectorProfileTypeOfExperienceChoices.fromJson(
          String value) =>
      fromJson$Enum$FpoBoardDirectorProfileTypeOfExperienceChoices(value);

  String toJson() =>
      toJson$Enum$FpoBoardDirectorProfileTypeOfExperienceChoices(this);
}

String toJson$Enum$FpoBoardDirectorProfileTypeOfExperienceChoices(
    Enum$FpoBoardDirectorProfileTypeOfExperienceChoices e) {
  switch (e) {
    case Enum$FpoBoardDirectorProfileTypeOfExperienceChoices
          .AGRICULTURAL_COOPERATIVES:
      return r'AGRICULTURAL_COOPERATIVES';
    case Enum$FpoBoardDirectorProfileTypeOfExperienceChoices.ANY_OTHER:
      return r'ANY_OTHER';
    case Enum$FpoBoardDirectorProfileTypeOfExperienceChoices
          .FARMER_OWNED_ENTERPRISES:
      return r'FARMER_OWNED_ENTERPRISES';
    case Enum$FpoBoardDirectorProfileTypeOfExperienceChoices.FARM_MANAGEMENT:
      return r'FARM_MANAGEMENT';
    case Enum$FpoBoardDirectorProfileTypeOfExperienceChoices
          .GOVERNMENT_AGRICULTURE:
      return r'GOVERNMENT_AGRICULTURE';
    case Enum$FpoBoardDirectorProfileTypeOfExperienceChoices.NGO_AGRICULTURE:
      return r'NGO_AGRICULTURE';
    case Enum$FpoBoardDirectorProfileTypeOfExperienceChoices.SELF_HELP_GROUPS:
      return r'SELF_HELP_GROUPS';
    case Enum$FpoBoardDirectorProfileTypeOfExperienceChoices.VILLAGE_COUNCILS:
      return r'VILLAGE_COUNCILS';
    case Enum$FpoBoardDirectorProfileTypeOfExperienceChoices.$unknown:
      return r'$unknown';
  }
}

Enum$FpoBoardDirectorProfileTypeOfExperienceChoices
    fromJson$Enum$FpoBoardDirectorProfileTypeOfExperienceChoices(String value) {
  switch (value) {
    case r'AGRICULTURAL_COOPERATIVES':
      return Enum$FpoBoardDirectorProfileTypeOfExperienceChoices
          .AGRICULTURAL_COOPERATIVES;
    case r'ANY_OTHER':
      return Enum$FpoBoardDirectorProfileTypeOfExperienceChoices.ANY_OTHER;
    case r'FARMER_OWNED_ENTERPRISES':
      return Enum$FpoBoardDirectorProfileTypeOfExperienceChoices
          .FARMER_OWNED_ENTERPRISES;
    case r'FARM_MANAGEMENT':
      return Enum$FpoBoardDirectorProfileTypeOfExperienceChoices
          .FARM_MANAGEMENT;
    case r'GOVERNMENT_AGRICULTURE':
      return Enum$FpoBoardDirectorProfileTypeOfExperienceChoices
          .GOVERNMENT_AGRICULTURE;
    case r'NGO_AGRICULTURE':
      return Enum$FpoBoardDirectorProfileTypeOfExperienceChoices
          .NGO_AGRICULTURE;
    case r'SELF_HELP_GROUPS':
      return Enum$FpoBoardDirectorProfileTypeOfExperienceChoices
          .SELF_HELP_GROUPS;
    case r'VILLAGE_COUNCILS':
      return Enum$FpoBoardDirectorProfileTypeOfExperienceChoices
          .VILLAGE_COUNCILS;
    default:
      return Enum$FpoBoardDirectorProfileTypeOfExperienceChoices.$unknown;
  }
}

enum Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPlaceChoices {
  A_10_KM_AVAILABLE,
  A_3_KM_AVAILABLE,
  A_6_KM_AVAILABLE,
  NOT_APPLICABLE,
  NOT_WITHIN_10_KM,
  $unknown;

  factory Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPlaceChoices.fromJson(
          String value) =>
      fromJson$Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPlaceChoices(
          value);

  String toJson() =>
      toJson$Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPlaceChoices(
          this);
}

String
    toJson$Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPlaceChoices(
        Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPlaceChoices
            e) {
  switch (e) {
    case Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPlaceChoices
          .A_10_KM_AVAILABLE:
      return r'A_10_KM_AVAILABLE';
    case Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPlaceChoices
          .A_3_KM_AVAILABLE:
      return r'A_3_KM_AVAILABLE';
    case Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPlaceChoices
          .A_6_KM_AVAILABLE:
      return r'A_6_KM_AVAILABLE';
    case Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPlaceChoices
          .NOT_APPLICABLE:
      return r'NOT_APPLICABLE';
    case Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPlaceChoices
          .NOT_WITHIN_10_KM:
      return r'NOT_WITHIN_10_KM';
    case Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPlaceChoices
          .$unknown:
      return r'$unknown';
  }
}

Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPlaceChoices
    fromJson$Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPlaceChoices(
        String value) {
  switch (value) {
    case r'A_10_KM_AVAILABLE':
      return Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPlaceChoices
          .A_10_KM_AVAILABLE;
    case r'A_3_KM_AVAILABLE':
      return Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPlaceChoices
          .A_3_KM_AVAILABLE;
    case r'A_6_KM_AVAILABLE':
      return Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPlaceChoices
          .A_6_KM_AVAILABLE;
    case r'NOT_APPLICABLE':
      return Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPlaceChoices
          .NOT_APPLICABLE;
    case r'NOT_WITHIN_10_KM':
      return Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPlaceChoices
          .NOT_WITHIN_10_KM;
    default:
      return Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPlaceChoices
          .$unknown;
  }
}

enum Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPriceAffordabilityChoices {
  A_10_15_PERCENT_LESS,
  A_1_3_PERCENT_LESS,
  A_3_5_PERCENT_LESS,
  A_5_10_PERCENT_LESS,
  NOT_APPLICABLE,
  $unknown;

  factory Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPriceAffordabilityChoices.fromJson(
          String value) =>
      fromJson$Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPriceAffordabilityChoices(
          value);

  String toJson() =>
      toJson$Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPriceAffordabilityChoices(
          this);
}

String toJson$Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPriceAffordabilityChoices(
    Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPriceAffordabilityChoices
        e) {
  switch (e) {
    case Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPriceAffordabilityChoices
          .A_10_15_PERCENT_LESS:
      return r'A_10_15_PERCENT_LESS';
    case Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPriceAffordabilityChoices
          .A_1_3_PERCENT_LESS:
      return r'A_1_3_PERCENT_LESS';
    case Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPriceAffordabilityChoices
          .A_3_5_PERCENT_LESS:
      return r'A_3_5_PERCENT_LESS';
    case Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPriceAffordabilityChoices
          .A_5_10_PERCENT_LESS:
      return r'A_5_10_PERCENT_LESS';
    case Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPriceAffordabilityChoices
          .NOT_APPLICABLE:
      return r'NOT_APPLICABLE';
    case Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPriceAffordabilityChoices
          .$unknown:
      return r'$unknown';
  }
}

Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPriceAffordabilityChoices
    fromJson$Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPriceAffordabilityChoices(
        String value) {
  switch (value) {
    case r'A_10_15_PERCENT_LESS':
      return Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPriceAffordabilityChoices
          .A_10_15_PERCENT_LESS;
    case r'A_1_3_PERCENT_LESS':
      return Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPriceAffordabilityChoices
          .A_1_3_PERCENT_LESS;
    case r'A_3_5_PERCENT_LESS':
      return Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPriceAffordabilityChoices
          .A_3_5_PERCENT_LESS;
    case r'A_5_10_PERCENT_LESS':
      return Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPriceAffordabilityChoices
          .A_5_10_PERCENT_LESS;
    case r'NOT_APPLICABLE':
      return Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPriceAffordabilityChoices
          .NOT_APPLICABLE;
    default:
      return Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPriceAffordabilityChoices
          .$unknown;
  }
}

enum Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsTimelinessChoices {
  A_15_DAYS_PRIOR,
  A_20_DAYS_PRIOR,
  A_30_DAYS_PRIOR,
  A_7_DAYS_PRIOR,
  NOT_APPLICABLE,
  $unknown;

  factory Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsTimelinessChoices.fromJson(
          String value) =>
      fromJson$Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsTimelinessChoices(
          value);

  String toJson() =>
      toJson$Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsTimelinessChoices(
          this);
}

String
    toJson$Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsTimelinessChoices(
        Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsTimelinessChoices
            e) {
  switch (e) {
    case Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsTimelinessChoices
          .A_15_DAYS_PRIOR:
      return r'A_15_DAYS_PRIOR';
    case Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsTimelinessChoices
          .A_20_DAYS_PRIOR:
      return r'A_20_DAYS_PRIOR';
    case Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsTimelinessChoices
          .A_30_DAYS_PRIOR:
      return r'A_30_DAYS_PRIOR';
    case Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsTimelinessChoices
          .A_7_DAYS_PRIOR:
      return r'A_7_DAYS_PRIOR';
    case Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsTimelinessChoices
          .NOT_APPLICABLE:
      return r'NOT_APPLICABLE';
    case Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsTimelinessChoices
          .$unknown:
      return r'$unknown';
  }
}

Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsTimelinessChoices
    fromJson$Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsTimelinessChoices(
        String value) {
  switch (value) {
    case r'A_15_DAYS_PRIOR':
      return Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsTimelinessChoices
          .A_15_DAYS_PRIOR;
    case r'A_20_DAYS_PRIOR':
      return Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsTimelinessChoices
          .A_20_DAYS_PRIOR;
    case r'A_30_DAYS_PRIOR':
      return Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsTimelinessChoices
          .A_30_DAYS_PRIOR;
    case r'A_7_DAYS_PRIOR':
      return Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsTimelinessChoices
          .A_7_DAYS_PRIOR;
    case r'NOT_APPLICABLE':
      return Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsTimelinessChoices
          .NOT_APPLICABLE;
    default:
      return Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsTimelinessChoices
          .$unknown;
  }
}

enum Enum$FpoBusinessOperationsSubmissionPriceVolatilityOfProductsChoices {
  HIGHLY_VOLATILE_FPO_RISK,
  MSP_FPO_RISK,
  NOT_APPLICABLE,
  PARTIAL_HEDGE,
  WELL_HEDGED,
  $unknown;

  factory Enum$FpoBusinessOperationsSubmissionPriceVolatilityOfProductsChoices.fromJson(
          String value) =>
      fromJson$Enum$FpoBusinessOperationsSubmissionPriceVolatilityOfProductsChoices(
          value);

  String toJson() =>
      toJson$Enum$FpoBusinessOperationsSubmissionPriceVolatilityOfProductsChoices(
          this);
}

String
    toJson$Enum$FpoBusinessOperationsSubmissionPriceVolatilityOfProductsChoices(
        Enum$FpoBusinessOperationsSubmissionPriceVolatilityOfProductsChoices
            e) {
  switch (e) {
    case Enum$FpoBusinessOperationsSubmissionPriceVolatilityOfProductsChoices
          .HIGHLY_VOLATILE_FPO_RISK:
      return r'HIGHLY_VOLATILE_FPO_RISK';
    case Enum$FpoBusinessOperationsSubmissionPriceVolatilityOfProductsChoices
          .MSP_FPO_RISK:
      return r'MSP_FPO_RISK';
    case Enum$FpoBusinessOperationsSubmissionPriceVolatilityOfProductsChoices
          .NOT_APPLICABLE:
      return r'NOT_APPLICABLE';
    case Enum$FpoBusinessOperationsSubmissionPriceVolatilityOfProductsChoices
          .PARTIAL_HEDGE:
      return r'PARTIAL_HEDGE';
    case Enum$FpoBusinessOperationsSubmissionPriceVolatilityOfProductsChoices
          .WELL_HEDGED:
      return r'WELL_HEDGED';
    case Enum$FpoBusinessOperationsSubmissionPriceVolatilityOfProductsChoices
          .$unknown:
      return r'$unknown';
  }
}

Enum$FpoBusinessOperationsSubmissionPriceVolatilityOfProductsChoices
    fromJson$Enum$FpoBusinessOperationsSubmissionPriceVolatilityOfProductsChoices(
        String value) {
  switch (value) {
    case r'HIGHLY_VOLATILE_FPO_RISK':
      return Enum$FpoBusinessOperationsSubmissionPriceVolatilityOfProductsChoices
          .HIGHLY_VOLATILE_FPO_RISK;
    case r'MSP_FPO_RISK':
      return Enum$FpoBusinessOperationsSubmissionPriceVolatilityOfProductsChoices
          .MSP_FPO_RISK;
    case r'NOT_APPLICABLE':
      return Enum$FpoBusinessOperationsSubmissionPriceVolatilityOfProductsChoices
          .NOT_APPLICABLE;
    case r'PARTIAL_HEDGE':
      return Enum$FpoBusinessOperationsSubmissionPriceVolatilityOfProductsChoices
          .PARTIAL_HEDGE;
    case r'WELL_HEDGED':
      return Enum$FpoBusinessOperationsSubmissionPriceVolatilityOfProductsChoices
          .WELL_HEDGED;
    default:
      return Enum$FpoBusinessOperationsSubmissionPriceVolatilityOfProductsChoices
          .$unknown;
  }
}

enum Enum$FpoCEOProfileSubmissionTypeOfExperienceChoices {
  AGRICULTURAL_COOPERATIVES,
  ANY_OTHER,
  BUSINESS_FUNCTIONS,
  FARMER_OWNED_ENTERPRISES,
  FARM_MANAGEMENT,
  GOVERNMENT_AGRICULTURE,
  NGO_AGRICULTURE,
  SELF_HELP_GROUPS,
  VILLAGE_COUNCILS,
  $unknown;

  factory Enum$FpoCEOProfileSubmissionTypeOfExperienceChoices.fromJson(
          String value) =>
      fromJson$Enum$FpoCEOProfileSubmissionTypeOfExperienceChoices(value);

  String toJson() =>
      toJson$Enum$FpoCEOProfileSubmissionTypeOfExperienceChoices(this);
}

String toJson$Enum$FpoCEOProfileSubmissionTypeOfExperienceChoices(
    Enum$FpoCEOProfileSubmissionTypeOfExperienceChoices e) {
  switch (e) {
    case Enum$FpoCEOProfileSubmissionTypeOfExperienceChoices
          .AGRICULTURAL_COOPERATIVES:
      return r'AGRICULTURAL_COOPERATIVES';
    case Enum$FpoCEOProfileSubmissionTypeOfExperienceChoices.ANY_OTHER:
      return r'ANY_OTHER';
    case Enum$FpoCEOProfileSubmissionTypeOfExperienceChoices.BUSINESS_FUNCTIONS:
      return r'BUSINESS_FUNCTIONS';
    case Enum$FpoCEOProfileSubmissionTypeOfExperienceChoices
          .FARMER_OWNED_ENTERPRISES:
      return r'FARMER_OWNED_ENTERPRISES';
    case Enum$FpoCEOProfileSubmissionTypeOfExperienceChoices.FARM_MANAGEMENT:
      return r'FARM_MANAGEMENT';
    case Enum$FpoCEOProfileSubmissionTypeOfExperienceChoices
          .GOVERNMENT_AGRICULTURE:
      return r'GOVERNMENT_AGRICULTURE';
    case Enum$FpoCEOProfileSubmissionTypeOfExperienceChoices.NGO_AGRICULTURE:
      return r'NGO_AGRICULTURE';
    case Enum$FpoCEOProfileSubmissionTypeOfExperienceChoices.SELF_HELP_GROUPS:
      return r'SELF_HELP_GROUPS';
    case Enum$FpoCEOProfileSubmissionTypeOfExperienceChoices.VILLAGE_COUNCILS:
      return r'VILLAGE_COUNCILS';
    case Enum$FpoCEOProfileSubmissionTypeOfExperienceChoices.$unknown:
      return r'$unknown';
  }
}

Enum$FpoCEOProfileSubmissionTypeOfExperienceChoices
    fromJson$Enum$FpoCEOProfileSubmissionTypeOfExperienceChoices(String value) {
  switch (value) {
    case r'AGRICULTURAL_COOPERATIVES':
      return Enum$FpoCEOProfileSubmissionTypeOfExperienceChoices
          .AGRICULTURAL_COOPERATIVES;
    case r'ANY_OTHER':
      return Enum$FpoCEOProfileSubmissionTypeOfExperienceChoices.ANY_OTHER;
    case r'BUSINESS_FUNCTIONS':
      return Enum$FpoCEOProfileSubmissionTypeOfExperienceChoices
          .BUSINESS_FUNCTIONS;
    case r'FARMER_OWNED_ENTERPRISES':
      return Enum$FpoCEOProfileSubmissionTypeOfExperienceChoices
          .FARMER_OWNED_ENTERPRISES;
    case r'FARM_MANAGEMENT':
      return Enum$FpoCEOProfileSubmissionTypeOfExperienceChoices
          .FARM_MANAGEMENT;
    case r'GOVERNMENT_AGRICULTURE':
      return Enum$FpoCEOProfileSubmissionTypeOfExperienceChoices
          .GOVERNMENT_AGRICULTURE;
    case r'NGO_AGRICULTURE':
      return Enum$FpoCEOProfileSubmissionTypeOfExperienceChoices
          .NGO_AGRICULTURE;
    case r'SELF_HELP_GROUPS':
      return Enum$FpoCEOProfileSubmissionTypeOfExperienceChoices
          .SELF_HELP_GROUPS;
    case r'VILLAGE_COUNCILS':
      return Enum$FpoCEOProfileSubmissionTypeOfExperienceChoices
          .VILLAGE_COUNCILS;
    default:
      return Enum$FpoCEOProfileSubmissionTypeOfExperienceChoices.$unknown;
  }
}

enum Enum$FpoComplianceDetailsSubmissionActUnderRegisteredChoices {
  COMPANY_ACT,
  COOPERATIVE_SOCIETIES_ACT,
  OTHER,
  $unknown;

  factory Enum$FpoComplianceDetailsSubmissionActUnderRegisteredChoices.fromJson(
          String value) =>
      fromJson$Enum$FpoComplianceDetailsSubmissionActUnderRegisteredChoices(
          value);

  String toJson() =>
      toJson$Enum$FpoComplianceDetailsSubmissionActUnderRegisteredChoices(this);
}

String toJson$Enum$FpoComplianceDetailsSubmissionActUnderRegisteredChoices(
    Enum$FpoComplianceDetailsSubmissionActUnderRegisteredChoices e) {
  switch (e) {
    case Enum$FpoComplianceDetailsSubmissionActUnderRegisteredChoices
          .COMPANY_ACT:
      return r'COMPANY_ACT';
    case Enum$FpoComplianceDetailsSubmissionActUnderRegisteredChoices
          .COOPERATIVE_SOCIETIES_ACT:
      return r'COOPERATIVE_SOCIETIES_ACT';
    case Enum$FpoComplianceDetailsSubmissionActUnderRegisteredChoices.OTHER:
      return r'OTHER';
    case Enum$FpoComplianceDetailsSubmissionActUnderRegisteredChoices.$unknown:
      return r'$unknown';
  }
}

Enum$FpoComplianceDetailsSubmissionActUnderRegisteredChoices
    fromJson$Enum$FpoComplianceDetailsSubmissionActUnderRegisteredChoices(
        String value) {
  switch (value) {
    case r'COMPANY_ACT':
      return Enum$FpoComplianceDetailsSubmissionActUnderRegisteredChoices
          .COMPANY_ACT;
    case r'COOPERATIVE_SOCIETIES_ACT':
      return Enum$FpoComplianceDetailsSubmissionActUnderRegisteredChoices
          .COOPERATIVE_SOCIETIES_ACT;
    case r'OTHER':
      return Enum$FpoComplianceDetailsSubmissionActUnderRegisteredChoices.OTHER;
    default:
      return Enum$FpoComplianceDetailsSubmissionActUnderRegisteredChoices
          .$unknown;
  }
}

enum Enum$FpoFPODetailsSubmissionTypeOfFpoChoices {
  HIGH_CAPACITY,
  INPUTS_AND_OUTPUT,
  INPUTS_OR_OUTPUT,
  LOW_CAPACITY,
  $unknown;

  factory Enum$FpoFPODetailsSubmissionTypeOfFpoChoices.fromJson(String value) =>
      fromJson$Enum$FpoFPODetailsSubmissionTypeOfFpoChoices(value);

  String toJson() => toJson$Enum$FpoFPODetailsSubmissionTypeOfFpoChoices(this);
}

String toJson$Enum$FpoFPODetailsSubmissionTypeOfFpoChoices(
    Enum$FpoFPODetailsSubmissionTypeOfFpoChoices e) {
  switch (e) {
    case Enum$FpoFPODetailsSubmissionTypeOfFpoChoices.HIGH_CAPACITY:
      return r'HIGH_CAPACITY';
    case Enum$FpoFPODetailsSubmissionTypeOfFpoChoices.INPUTS_AND_OUTPUT:
      return r'INPUTS_AND_OUTPUT';
    case Enum$FpoFPODetailsSubmissionTypeOfFpoChoices.INPUTS_OR_OUTPUT:
      return r'INPUTS_OR_OUTPUT';
    case Enum$FpoFPODetailsSubmissionTypeOfFpoChoices.LOW_CAPACITY:
      return r'LOW_CAPACITY';
    case Enum$FpoFPODetailsSubmissionTypeOfFpoChoices.$unknown:
      return r'$unknown';
  }
}

Enum$FpoFPODetailsSubmissionTypeOfFpoChoices
    fromJson$Enum$FpoFPODetailsSubmissionTypeOfFpoChoices(String value) {
  switch (value) {
    case r'HIGH_CAPACITY':
      return Enum$FpoFPODetailsSubmissionTypeOfFpoChoices.HIGH_CAPACITY;
    case r'INPUTS_AND_OUTPUT':
      return Enum$FpoFPODetailsSubmissionTypeOfFpoChoices.INPUTS_AND_OUTPUT;
    case r'INPUTS_OR_OUTPUT':
      return Enum$FpoFPODetailsSubmissionTypeOfFpoChoices.INPUTS_OR_OUTPUT;
    case r'LOW_CAPACITY':
      return Enum$FpoFPODetailsSubmissionTypeOfFpoChoices.LOW_CAPACITY;
    default:
      return Enum$FpoFPODetailsSubmissionTypeOfFpoChoices.$unknown;
  }
}

enum Enum$FpoFPODetailsSubmissionTypeOfProducerOrganizationChoices {
  CO_OPERATIVE_SOCIETY,
  NON_PROFIT_SOCIETY,
  PRODUCER_COMPANY,
  SECTION_8_COMPANY,
  TRUST,
  $unknown;

  factory Enum$FpoFPODetailsSubmissionTypeOfProducerOrganizationChoices.fromJson(
          String value) =>
      fromJson$Enum$FpoFPODetailsSubmissionTypeOfProducerOrganizationChoices(
          value);

  String toJson() =>
      toJson$Enum$FpoFPODetailsSubmissionTypeOfProducerOrganizationChoices(
          this);
}

String toJson$Enum$FpoFPODetailsSubmissionTypeOfProducerOrganizationChoices(
    Enum$FpoFPODetailsSubmissionTypeOfProducerOrganizationChoices e) {
  switch (e) {
    case Enum$FpoFPODetailsSubmissionTypeOfProducerOrganizationChoices
          .CO_OPERATIVE_SOCIETY:
      return r'CO_OPERATIVE_SOCIETY';
    case Enum$FpoFPODetailsSubmissionTypeOfProducerOrganizationChoices
          .NON_PROFIT_SOCIETY:
      return r'NON_PROFIT_SOCIETY';
    case Enum$FpoFPODetailsSubmissionTypeOfProducerOrganizationChoices
          .PRODUCER_COMPANY:
      return r'PRODUCER_COMPANY';
    case Enum$FpoFPODetailsSubmissionTypeOfProducerOrganizationChoices
          .SECTION_8_COMPANY:
      return r'SECTION_8_COMPANY';
    case Enum$FpoFPODetailsSubmissionTypeOfProducerOrganizationChoices.TRUST:
      return r'TRUST';
    case Enum$FpoFPODetailsSubmissionTypeOfProducerOrganizationChoices.$unknown:
      return r'$unknown';
  }
}

Enum$FpoFPODetailsSubmissionTypeOfProducerOrganizationChoices
    fromJson$Enum$FpoFPODetailsSubmissionTypeOfProducerOrganizationChoices(
        String value) {
  switch (value) {
    case r'CO_OPERATIVE_SOCIETY':
      return Enum$FpoFPODetailsSubmissionTypeOfProducerOrganizationChoices
          .CO_OPERATIVE_SOCIETY;
    case r'NON_PROFIT_SOCIETY':
      return Enum$FpoFPODetailsSubmissionTypeOfProducerOrganizationChoices
          .NON_PROFIT_SOCIETY;
    case r'PRODUCER_COMPANY':
      return Enum$FpoFPODetailsSubmissionTypeOfProducerOrganizationChoices
          .PRODUCER_COMPANY;
    case r'SECTION_8_COMPANY':
      return Enum$FpoFPODetailsSubmissionTypeOfProducerOrganizationChoices
          .SECTION_8_COMPANY;
    case r'TRUST':
      return Enum$FpoFPODetailsSubmissionTypeOfProducerOrganizationChoices
          .TRUST;
    default:
      return Enum$FpoFPODetailsSubmissionTypeOfProducerOrganizationChoices
          .$unknown;
  }
}

enum Enum$FpoFPODetailsSubmissionTypeOfPromotingAgencyChoices {
  BIG_FARMER_COMPANIES,
  COMMODITY_BOARDS,
  COOPERATIVES,
  CORPORATE_WINGS,
  FARMER_FEDERATIONS,
  KVKS,
  NGO,
  OTHERS,
  STATE_GOVT,
  TRUSTS,
  $unknown;

  factory Enum$FpoFPODetailsSubmissionTypeOfPromotingAgencyChoices.fromJson(
          String value) =>
      fromJson$Enum$FpoFPODetailsSubmissionTypeOfPromotingAgencyChoices(value);

  String toJson() =>
      toJson$Enum$FpoFPODetailsSubmissionTypeOfPromotingAgencyChoices(this);
}

String toJson$Enum$FpoFPODetailsSubmissionTypeOfPromotingAgencyChoices(
    Enum$FpoFPODetailsSubmissionTypeOfPromotingAgencyChoices e) {
  switch (e) {
    case Enum$FpoFPODetailsSubmissionTypeOfPromotingAgencyChoices
          .BIG_FARMER_COMPANIES:
      return r'BIG_FARMER_COMPANIES';
    case Enum$FpoFPODetailsSubmissionTypeOfPromotingAgencyChoices
          .COMMODITY_BOARDS:
      return r'COMMODITY_BOARDS';
    case Enum$FpoFPODetailsSubmissionTypeOfPromotingAgencyChoices.COOPERATIVES:
      return r'COOPERATIVES';
    case Enum$FpoFPODetailsSubmissionTypeOfPromotingAgencyChoices
          .CORPORATE_WINGS:
      return r'CORPORATE_WINGS';
    case Enum$FpoFPODetailsSubmissionTypeOfPromotingAgencyChoices
          .FARMER_FEDERATIONS:
      return r'FARMER_FEDERATIONS';
    case Enum$FpoFPODetailsSubmissionTypeOfPromotingAgencyChoices.KVKS:
      return r'KVKS';
    case Enum$FpoFPODetailsSubmissionTypeOfPromotingAgencyChoices.NGO:
      return r'NGO';
    case Enum$FpoFPODetailsSubmissionTypeOfPromotingAgencyChoices.OTHERS:
      return r'OTHERS';
    case Enum$FpoFPODetailsSubmissionTypeOfPromotingAgencyChoices.STATE_GOVT:
      return r'STATE_GOVT';
    case Enum$FpoFPODetailsSubmissionTypeOfPromotingAgencyChoices.TRUSTS:
      return r'TRUSTS';
    case Enum$FpoFPODetailsSubmissionTypeOfPromotingAgencyChoices.$unknown:
      return r'$unknown';
  }
}

Enum$FpoFPODetailsSubmissionTypeOfPromotingAgencyChoices
    fromJson$Enum$FpoFPODetailsSubmissionTypeOfPromotingAgencyChoices(
        String value) {
  switch (value) {
    case r'BIG_FARMER_COMPANIES':
      return Enum$FpoFPODetailsSubmissionTypeOfPromotingAgencyChoices
          .BIG_FARMER_COMPANIES;
    case r'COMMODITY_BOARDS':
      return Enum$FpoFPODetailsSubmissionTypeOfPromotingAgencyChoices
          .COMMODITY_BOARDS;
    case r'COOPERATIVES':
      return Enum$FpoFPODetailsSubmissionTypeOfPromotingAgencyChoices
          .COOPERATIVES;
    case r'CORPORATE_WINGS':
      return Enum$FpoFPODetailsSubmissionTypeOfPromotingAgencyChoices
          .CORPORATE_WINGS;
    case r'FARMER_FEDERATIONS':
      return Enum$FpoFPODetailsSubmissionTypeOfPromotingAgencyChoices
          .FARMER_FEDERATIONS;
    case r'KVKS':
      return Enum$FpoFPODetailsSubmissionTypeOfPromotingAgencyChoices.KVKS;
    case r'NGO':
      return Enum$FpoFPODetailsSubmissionTypeOfPromotingAgencyChoices.NGO;
    case r'OTHERS':
      return Enum$FpoFPODetailsSubmissionTypeOfPromotingAgencyChoices.OTHERS;
    case r'STATE_GOVT':
      return Enum$FpoFPODetailsSubmissionTypeOfPromotingAgencyChoices
          .STATE_GOVT;
    case r'TRUSTS':
      return Enum$FpoFPODetailsSubmissionTypeOfPromotingAgencyChoices.TRUSTS;
    default:
      return Enum$FpoFPODetailsSubmissionTypeOfPromotingAgencyChoices.$unknown;
  }
}

enum Enum$FpoGovernanceSubmissionMinutesMaintenanceChoices {
  DETAILED_COMPLIANT,
  DETAILED_NOT_UPDATED,
  NOT_MAINTAINED,
  SKETCHY_QUALITY,
  $unknown;

  factory Enum$FpoGovernanceSubmissionMinutesMaintenanceChoices.fromJson(
          String value) =>
      fromJson$Enum$FpoGovernanceSubmissionMinutesMaintenanceChoices(value);

  String toJson() =>
      toJson$Enum$FpoGovernanceSubmissionMinutesMaintenanceChoices(this);
}

String toJson$Enum$FpoGovernanceSubmissionMinutesMaintenanceChoices(
    Enum$FpoGovernanceSubmissionMinutesMaintenanceChoices e) {
  switch (e) {
    case Enum$FpoGovernanceSubmissionMinutesMaintenanceChoices
          .DETAILED_COMPLIANT:
      return r'DETAILED_COMPLIANT';
    case Enum$FpoGovernanceSubmissionMinutesMaintenanceChoices
          .DETAILED_NOT_UPDATED:
      return r'DETAILED_NOT_UPDATED';
    case Enum$FpoGovernanceSubmissionMinutesMaintenanceChoices.NOT_MAINTAINED:
      return r'NOT_MAINTAINED';
    case Enum$FpoGovernanceSubmissionMinutesMaintenanceChoices.SKETCHY_QUALITY:
      return r'SKETCHY_QUALITY';
    case Enum$FpoGovernanceSubmissionMinutesMaintenanceChoices.$unknown:
      return r'$unknown';
  }
}

Enum$FpoGovernanceSubmissionMinutesMaintenanceChoices
    fromJson$Enum$FpoGovernanceSubmissionMinutesMaintenanceChoices(
        String value) {
  switch (value) {
    case r'DETAILED_COMPLIANT':
      return Enum$FpoGovernanceSubmissionMinutesMaintenanceChoices
          .DETAILED_COMPLIANT;
    case r'DETAILED_NOT_UPDATED':
      return Enum$FpoGovernanceSubmissionMinutesMaintenanceChoices
          .DETAILED_NOT_UPDATED;
    case r'NOT_MAINTAINED':
      return Enum$FpoGovernanceSubmissionMinutesMaintenanceChoices
          .NOT_MAINTAINED;
    case r'SKETCHY_QUALITY':
      return Enum$FpoGovernanceSubmissionMinutesMaintenanceChoices
          .SKETCHY_QUALITY;
    default:
      return Enum$FpoGovernanceSubmissionMinutesMaintenanceChoices.$unknown;
  }
}

enum Enum$FpoGovernanceSubmissionSecondLineManagementChoices {
  CEO_ACCOUNTS_ONE_MANAGER,
  CEO_ACCOUNTS_TWO_MANAGERS,
  CEO_WITH_ACCOUNTS,
  NO_CEO,
  ONLY_CEO,
  $unknown;

  factory Enum$FpoGovernanceSubmissionSecondLineManagementChoices.fromJson(
          String value) =>
      fromJson$Enum$FpoGovernanceSubmissionSecondLineManagementChoices(value);

  String toJson() =>
      toJson$Enum$FpoGovernanceSubmissionSecondLineManagementChoices(this);
}

String toJson$Enum$FpoGovernanceSubmissionSecondLineManagementChoices(
    Enum$FpoGovernanceSubmissionSecondLineManagementChoices e) {
  switch (e) {
    case Enum$FpoGovernanceSubmissionSecondLineManagementChoices
          .CEO_ACCOUNTS_ONE_MANAGER:
      return r'CEO_ACCOUNTS_ONE_MANAGER';
    case Enum$FpoGovernanceSubmissionSecondLineManagementChoices
          .CEO_ACCOUNTS_TWO_MANAGERS:
      return r'CEO_ACCOUNTS_TWO_MANAGERS';
    case Enum$FpoGovernanceSubmissionSecondLineManagementChoices
          .CEO_WITH_ACCOUNTS:
      return r'CEO_WITH_ACCOUNTS';
    case Enum$FpoGovernanceSubmissionSecondLineManagementChoices.NO_CEO:
      return r'NO_CEO';
    case Enum$FpoGovernanceSubmissionSecondLineManagementChoices.ONLY_CEO:
      return r'ONLY_CEO';
    case Enum$FpoGovernanceSubmissionSecondLineManagementChoices.$unknown:
      return r'$unknown';
  }
}

Enum$FpoGovernanceSubmissionSecondLineManagementChoices
    fromJson$Enum$FpoGovernanceSubmissionSecondLineManagementChoices(
        String value) {
  switch (value) {
    case r'CEO_ACCOUNTS_ONE_MANAGER':
      return Enum$FpoGovernanceSubmissionSecondLineManagementChoices
          .CEO_ACCOUNTS_ONE_MANAGER;
    case r'CEO_ACCOUNTS_TWO_MANAGERS':
      return Enum$FpoGovernanceSubmissionSecondLineManagementChoices
          .CEO_ACCOUNTS_TWO_MANAGERS;
    case r'CEO_WITH_ACCOUNTS':
      return Enum$FpoGovernanceSubmissionSecondLineManagementChoices
          .CEO_WITH_ACCOUNTS;
    case r'NO_CEO':
      return Enum$FpoGovernanceSubmissionSecondLineManagementChoices.NO_CEO;
    case r'ONLY_CEO':
      return Enum$FpoGovernanceSubmissionSecondLineManagementChoices.ONLY_CEO;
    default:
      return Enum$FpoGovernanceSubmissionSecondLineManagementChoices.$unknown;
  }
}

enum Enum$FpoProcessesSystemsSubmissionAccountsAndMisChoices {
  MS_OFFICE_TOOLS,
  NO_MIS,
  SOFTWARE_DIGITAL,
  TALLY_NO_DIGITAL,
  $unknown;

  factory Enum$FpoProcessesSystemsSubmissionAccountsAndMisChoices.fromJson(
          String value) =>
      fromJson$Enum$FpoProcessesSystemsSubmissionAccountsAndMisChoices(value);

  String toJson() =>
      toJson$Enum$FpoProcessesSystemsSubmissionAccountsAndMisChoices(this);
}

String toJson$Enum$FpoProcessesSystemsSubmissionAccountsAndMisChoices(
    Enum$FpoProcessesSystemsSubmissionAccountsAndMisChoices e) {
  switch (e) {
    case Enum$FpoProcessesSystemsSubmissionAccountsAndMisChoices
          .MS_OFFICE_TOOLS:
      return r'MS_OFFICE_TOOLS';
    case Enum$FpoProcessesSystemsSubmissionAccountsAndMisChoices.NO_MIS:
      return r'NO_MIS';
    case Enum$FpoProcessesSystemsSubmissionAccountsAndMisChoices
          .SOFTWARE_DIGITAL:
      return r'SOFTWARE_DIGITAL';
    case Enum$FpoProcessesSystemsSubmissionAccountsAndMisChoices
          .TALLY_NO_DIGITAL:
      return r'TALLY_NO_DIGITAL';
    case Enum$FpoProcessesSystemsSubmissionAccountsAndMisChoices.$unknown:
      return r'$unknown';
  }
}

Enum$FpoProcessesSystemsSubmissionAccountsAndMisChoices
    fromJson$Enum$FpoProcessesSystemsSubmissionAccountsAndMisChoices(
        String value) {
  switch (value) {
    case r'MS_OFFICE_TOOLS':
      return Enum$FpoProcessesSystemsSubmissionAccountsAndMisChoices
          .MS_OFFICE_TOOLS;
    case r'NO_MIS':
      return Enum$FpoProcessesSystemsSubmissionAccountsAndMisChoices.NO_MIS;
    case r'SOFTWARE_DIGITAL':
      return Enum$FpoProcessesSystemsSubmissionAccountsAndMisChoices
          .SOFTWARE_DIGITAL;
    case r'TALLY_NO_DIGITAL':
      return Enum$FpoProcessesSystemsSubmissionAccountsAndMisChoices
          .TALLY_NO_DIGITAL;
    default:
      return Enum$FpoProcessesSystemsSubmissionAccountsAndMisChoices.$unknown;
  }
}

enum Enum$FpoProcessesSystemsSubmissionBooksAndRecordsUpToDateChoices {
  CURRENT,
  LAG_2_3_DAYS,
  MONTHLY_OR_MORE,
  PROCESSES_SYSTEMS,
  WEEKLY_UPDATED,
  $unknown;

  factory Enum$FpoProcessesSystemsSubmissionBooksAndRecordsUpToDateChoices.fromJson(
          String value) =>
      fromJson$Enum$FpoProcessesSystemsSubmissionBooksAndRecordsUpToDateChoices(
          value);

  String toJson() =>
      toJson$Enum$FpoProcessesSystemsSubmissionBooksAndRecordsUpToDateChoices(
          this);
}

String toJson$Enum$FpoProcessesSystemsSubmissionBooksAndRecordsUpToDateChoices(
    Enum$FpoProcessesSystemsSubmissionBooksAndRecordsUpToDateChoices e) {
  switch (e) {
    case Enum$FpoProcessesSystemsSubmissionBooksAndRecordsUpToDateChoices
          .CURRENT:
      return r'CURRENT';
    case Enum$FpoProcessesSystemsSubmissionBooksAndRecordsUpToDateChoices
          .LAG_2_3_DAYS:
      return r'LAG_2_3_DAYS';
    case Enum$FpoProcessesSystemsSubmissionBooksAndRecordsUpToDateChoices
          .MONTHLY_OR_MORE:
      return r'MONTHLY_OR_MORE';
    case Enum$FpoProcessesSystemsSubmissionBooksAndRecordsUpToDateChoices
          .PROCESSES_SYSTEMS:
      return r'PROCESSES_SYSTEMS';
    case Enum$FpoProcessesSystemsSubmissionBooksAndRecordsUpToDateChoices
          .WEEKLY_UPDATED:
      return r'WEEKLY_UPDATED';
    case Enum$FpoProcessesSystemsSubmissionBooksAndRecordsUpToDateChoices
          .$unknown:
      return r'$unknown';
  }
}

Enum$FpoProcessesSystemsSubmissionBooksAndRecordsUpToDateChoices
    fromJson$Enum$FpoProcessesSystemsSubmissionBooksAndRecordsUpToDateChoices(
        String value) {
  switch (value) {
    case r'CURRENT':
      return Enum$FpoProcessesSystemsSubmissionBooksAndRecordsUpToDateChoices
          .CURRENT;
    case r'LAG_2_3_DAYS':
      return Enum$FpoProcessesSystemsSubmissionBooksAndRecordsUpToDateChoices
          .LAG_2_3_DAYS;
    case r'MONTHLY_OR_MORE':
      return Enum$FpoProcessesSystemsSubmissionBooksAndRecordsUpToDateChoices
          .MONTHLY_OR_MORE;
    case r'PROCESSES_SYSTEMS':
      return Enum$FpoProcessesSystemsSubmissionBooksAndRecordsUpToDateChoices
          .PROCESSES_SYSTEMS;
    case r'WEEKLY_UPDATED':
      return Enum$FpoProcessesSystemsSubmissionBooksAndRecordsUpToDateChoices
          .WEEKLY_UPDATED;
    default:
      return Enum$FpoProcessesSystemsSubmissionBooksAndRecordsUpToDateChoices
          .$unknown;
  }
}

enum Enum$FpoProcessesSystemsSubmissionCreditRecordOfFpoChoices {
  MULTIPLE_DELAYS,
  NO_CREDIT_HISTORY,
  NO_DELAYS,
  ONE_DELAY,
  $unknown;

  factory Enum$FpoProcessesSystemsSubmissionCreditRecordOfFpoChoices.fromJson(
          String value) =>
      fromJson$Enum$FpoProcessesSystemsSubmissionCreditRecordOfFpoChoices(
          value);

  String toJson() =>
      toJson$Enum$FpoProcessesSystemsSubmissionCreditRecordOfFpoChoices(this);
}

String toJson$Enum$FpoProcessesSystemsSubmissionCreditRecordOfFpoChoices(
    Enum$FpoProcessesSystemsSubmissionCreditRecordOfFpoChoices e) {
  switch (e) {
    case Enum$FpoProcessesSystemsSubmissionCreditRecordOfFpoChoices
          .MULTIPLE_DELAYS:
      return r'MULTIPLE_DELAYS';
    case Enum$FpoProcessesSystemsSubmissionCreditRecordOfFpoChoices
          .NO_CREDIT_HISTORY:
      return r'NO_CREDIT_HISTORY';
    case Enum$FpoProcessesSystemsSubmissionCreditRecordOfFpoChoices.NO_DELAYS:
      return r'NO_DELAYS';
    case Enum$FpoProcessesSystemsSubmissionCreditRecordOfFpoChoices.ONE_DELAY:
      return r'ONE_DELAY';
    case Enum$FpoProcessesSystemsSubmissionCreditRecordOfFpoChoices.$unknown:
      return r'$unknown';
  }
}

Enum$FpoProcessesSystemsSubmissionCreditRecordOfFpoChoices
    fromJson$Enum$FpoProcessesSystemsSubmissionCreditRecordOfFpoChoices(
        String value) {
  switch (value) {
    case r'MULTIPLE_DELAYS':
      return Enum$FpoProcessesSystemsSubmissionCreditRecordOfFpoChoices
          .MULTIPLE_DELAYS;
    case r'NO_CREDIT_HISTORY':
      return Enum$FpoProcessesSystemsSubmissionCreditRecordOfFpoChoices
          .NO_CREDIT_HISTORY;
    case r'NO_DELAYS':
      return Enum$FpoProcessesSystemsSubmissionCreditRecordOfFpoChoices
          .NO_DELAYS;
    case r'ONE_DELAY':
      return Enum$FpoProcessesSystemsSubmissionCreditRecordOfFpoChoices
          .ONE_DELAY;
    default:
      return Enum$FpoProcessesSystemsSubmissionCreditRecordOfFpoChoices
          .$unknown;
  }
}

enum Enum$FpoProcessesSystemsSubmissionInsuranceOfStockChoices {
  A_100_FIRE_THEFT,
  A_50_FIRE_THEFT,
  LESS_THAN_50_FIRE,
  NO_INSURANCE,
  $unknown;

  factory Enum$FpoProcessesSystemsSubmissionInsuranceOfStockChoices.fromJson(
          String value) =>
      fromJson$Enum$FpoProcessesSystemsSubmissionInsuranceOfStockChoices(value);

  String toJson() =>
      toJson$Enum$FpoProcessesSystemsSubmissionInsuranceOfStockChoices(this);
}

String toJson$Enum$FpoProcessesSystemsSubmissionInsuranceOfStockChoices(
    Enum$FpoProcessesSystemsSubmissionInsuranceOfStockChoices e) {
  switch (e) {
    case Enum$FpoProcessesSystemsSubmissionInsuranceOfStockChoices
          .A_100_FIRE_THEFT:
      return r'A_100_FIRE_THEFT';
    case Enum$FpoProcessesSystemsSubmissionInsuranceOfStockChoices
          .A_50_FIRE_THEFT:
      return r'A_50_FIRE_THEFT';
    case Enum$FpoProcessesSystemsSubmissionInsuranceOfStockChoices
          .LESS_THAN_50_FIRE:
      return r'LESS_THAN_50_FIRE';
    case Enum$FpoProcessesSystemsSubmissionInsuranceOfStockChoices.NO_INSURANCE:
      return r'NO_INSURANCE';
    case Enum$FpoProcessesSystemsSubmissionInsuranceOfStockChoices.$unknown:
      return r'$unknown';
  }
}

Enum$FpoProcessesSystemsSubmissionInsuranceOfStockChoices
    fromJson$Enum$FpoProcessesSystemsSubmissionInsuranceOfStockChoices(
        String value) {
  switch (value) {
    case r'A_100_FIRE_THEFT':
      return Enum$FpoProcessesSystemsSubmissionInsuranceOfStockChoices
          .A_100_FIRE_THEFT;
    case r'A_50_FIRE_THEFT':
      return Enum$FpoProcessesSystemsSubmissionInsuranceOfStockChoices
          .A_50_FIRE_THEFT;
    case r'LESS_THAN_50_FIRE':
      return Enum$FpoProcessesSystemsSubmissionInsuranceOfStockChoices
          .LESS_THAN_50_FIRE;
    case r'NO_INSURANCE':
      return Enum$FpoProcessesSystemsSubmissionInsuranceOfStockChoices
          .NO_INSURANCE;
    default:
      return Enum$FpoProcessesSystemsSubmissionInsuranceOfStockChoices.$unknown;
  }
}

enum Enum$FpoProcessesSystemsSubmissionReconciliationOfStocksChoices {
  ABSENT_ANNUAL,
  A_2_4_TIMES_YEAR,
  EVERY_15_DAYS,
  MONTHLY,
  $unknown;

  factory Enum$FpoProcessesSystemsSubmissionReconciliationOfStocksChoices.fromJson(
          String value) =>
      fromJson$Enum$FpoProcessesSystemsSubmissionReconciliationOfStocksChoices(
          value);

  String toJson() =>
      toJson$Enum$FpoProcessesSystemsSubmissionReconciliationOfStocksChoices(
          this);
}

String toJson$Enum$FpoProcessesSystemsSubmissionReconciliationOfStocksChoices(
    Enum$FpoProcessesSystemsSubmissionReconciliationOfStocksChoices e) {
  switch (e) {
    case Enum$FpoProcessesSystemsSubmissionReconciliationOfStocksChoices
          .ABSENT_ANNUAL:
      return r'ABSENT_ANNUAL';
    case Enum$FpoProcessesSystemsSubmissionReconciliationOfStocksChoices
          .A_2_4_TIMES_YEAR:
      return r'A_2_4_TIMES_YEAR';
    case Enum$FpoProcessesSystemsSubmissionReconciliationOfStocksChoices
          .EVERY_15_DAYS:
      return r'EVERY_15_DAYS';
    case Enum$FpoProcessesSystemsSubmissionReconciliationOfStocksChoices
          .MONTHLY:
      return r'MONTHLY';
    case Enum$FpoProcessesSystemsSubmissionReconciliationOfStocksChoices
          .$unknown:
      return r'$unknown';
  }
}

Enum$FpoProcessesSystemsSubmissionReconciliationOfStocksChoices
    fromJson$Enum$FpoProcessesSystemsSubmissionReconciliationOfStocksChoices(
        String value) {
  switch (value) {
    case r'ABSENT_ANNUAL':
      return Enum$FpoProcessesSystemsSubmissionReconciliationOfStocksChoices
          .ABSENT_ANNUAL;
    case r'A_2_4_TIMES_YEAR':
      return Enum$FpoProcessesSystemsSubmissionReconciliationOfStocksChoices
          .A_2_4_TIMES_YEAR;
    case r'EVERY_15_DAYS':
      return Enum$FpoProcessesSystemsSubmissionReconciliationOfStocksChoices
          .EVERY_15_DAYS;
    case r'MONTHLY':
      return Enum$FpoProcessesSystemsSubmissionReconciliationOfStocksChoices
          .MONTHLY;
    default:
      return Enum$FpoProcessesSystemsSubmissionReconciliationOfStocksChoices
          .$unknown;
  }
}

enum Enum$FpoProcessesSystemsSubmissionStatutoryFillingsChoices {
  DELAYS_NOT_FILLED,
  FEW_DELAYS_FILLED,
  MULTIPLE_DELAYS_FILLED,
  NO_DELAYS,
  $unknown;

  factory Enum$FpoProcessesSystemsSubmissionStatutoryFillingsChoices.fromJson(
          String value) =>
      fromJson$Enum$FpoProcessesSystemsSubmissionStatutoryFillingsChoices(
          value);

  String toJson() =>
      toJson$Enum$FpoProcessesSystemsSubmissionStatutoryFillingsChoices(this);
}

String toJson$Enum$FpoProcessesSystemsSubmissionStatutoryFillingsChoices(
    Enum$FpoProcessesSystemsSubmissionStatutoryFillingsChoices e) {
  switch (e) {
    case Enum$FpoProcessesSystemsSubmissionStatutoryFillingsChoices
          .DELAYS_NOT_FILLED:
      return r'DELAYS_NOT_FILLED';
    case Enum$FpoProcessesSystemsSubmissionStatutoryFillingsChoices
          .FEW_DELAYS_FILLED:
      return r'FEW_DELAYS_FILLED';
    case Enum$FpoProcessesSystemsSubmissionStatutoryFillingsChoices
          .MULTIPLE_DELAYS_FILLED:
      return r'MULTIPLE_DELAYS_FILLED';
    case Enum$FpoProcessesSystemsSubmissionStatutoryFillingsChoices.NO_DELAYS:
      return r'NO_DELAYS';
    case Enum$FpoProcessesSystemsSubmissionStatutoryFillingsChoices.$unknown:
      return r'$unknown';
  }
}

Enum$FpoProcessesSystemsSubmissionStatutoryFillingsChoices
    fromJson$Enum$FpoProcessesSystemsSubmissionStatutoryFillingsChoices(
        String value) {
  switch (value) {
    case r'DELAYS_NOT_FILLED':
      return Enum$FpoProcessesSystemsSubmissionStatutoryFillingsChoices
          .DELAYS_NOT_FILLED;
    case r'FEW_DELAYS_FILLED':
      return Enum$FpoProcessesSystemsSubmissionStatutoryFillingsChoices
          .FEW_DELAYS_FILLED;
    case r'MULTIPLE_DELAYS_FILLED':
      return Enum$FpoProcessesSystemsSubmissionStatutoryFillingsChoices
          .MULTIPLE_DELAYS_FILLED;
    case r'NO_DELAYS':
      return Enum$FpoProcessesSystemsSubmissionStatutoryFillingsChoices
          .NO_DELAYS;
    default:
      return Enum$FpoProcessesSystemsSubmissionStatutoryFillingsChoices
          .$unknown;
  }
}

enum Enum$FpoYearlySubmissionStatusChoices {
  APPROVED,
  DRAFT,
  REJECTED,
  REVISION_REQUIRED,
  SUBMITTED,
  UNDER_REVIEW,
  $unknown;

  factory Enum$FpoYearlySubmissionStatusChoices.fromJson(String value) =>
      fromJson$Enum$FpoYearlySubmissionStatusChoices(value);

  String toJson() => toJson$Enum$FpoYearlySubmissionStatusChoices(this);
}

String toJson$Enum$FpoYearlySubmissionStatusChoices(
    Enum$FpoYearlySubmissionStatusChoices e) {
  switch (e) {
    case Enum$FpoYearlySubmissionStatusChoices.APPROVED:
      return r'APPROVED';
    case Enum$FpoYearlySubmissionStatusChoices.DRAFT:
      return r'DRAFT';
    case Enum$FpoYearlySubmissionStatusChoices.REJECTED:
      return r'REJECTED';
    case Enum$FpoYearlySubmissionStatusChoices.REVISION_REQUIRED:
      return r'REVISION_REQUIRED';
    case Enum$FpoYearlySubmissionStatusChoices.SUBMITTED:
      return r'SUBMITTED';
    case Enum$FpoYearlySubmissionStatusChoices.UNDER_REVIEW:
      return r'UNDER_REVIEW';
    case Enum$FpoYearlySubmissionStatusChoices.$unknown:
      return r'$unknown';
  }
}

Enum$FpoYearlySubmissionStatusChoices
    fromJson$Enum$FpoYearlySubmissionStatusChoices(String value) {
  switch (value) {
    case r'APPROVED':
      return Enum$FpoYearlySubmissionStatusChoices.APPROVED;
    case r'DRAFT':
      return Enum$FpoYearlySubmissionStatusChoices.DRAFT;
    case r'REJECTED':
      return Enum$FpoYearlySubmissionStatusChoices.REJECTED;
    case r'REVISION_REQUIRED':
      return Enum$FpoYearlySubmissionStatusChoices.REVISION_REQUIRED;
    case r'SUBMITTED':
      return Enum$FpoYearlySubmissionStatusChoices.SUBMITTED;
    case r'UNDER_REVIEW':
      return Enum$FpoYearlySubmissionStatusChoices.UNDER_REVIEW;
    default:
      return Enum$FpoYearlySubmissionStatusChoices.$unknown;
  }
}

enum Enum$InputTimelinessTypeEnum {
  FIFTEEN_DAYS,
  NOT_APPLICABLE,
  SEVEN_DAYS,
  THIRTY_DAYS,
  TWENTY_DAYS,
  $unknown;

  factory Enum$InputTimelinessTypeEnum.fromJson(String value) =>
      fromJson$Enum$InputTimelinessTypeEnum(value);

  String toJson() => toJson$Enum$InputTimelinessTypeEnum(this);
}

String toJson$Enum$InputTimelinessTypeEnum(Enum$InputTimelinessTypeEnum e) {
  switch (e) {
    case Enum$InputTimelinessTypeEnum.FIFTEEN_DAYS:
      return r'FIFTEEN_DAYS';
    case Enum$InputTimelinessTypeEnum.NOT_APPLICABLE:
      return r'NOT_APPLICABLE';
    case Enum$InputTimelinessTypeEnum.SEVEN_DAYS:
      return r'SEVEN_DAYS';
    case Enum$InputTimelinessTypeEnum.THIRTY_DAYS:
      return r'THIRTY_DAYS';
    case Enum$InputTimelinessTypeEnum.TWENTY_DAYS:
      return r'TWENTY_DAYS';
    case Enum$InputTimelinessTypeEnum.$unknown:
      return r'$unknown';
  }
}

Enum$InputTimelinessTypeEnum fromJson$Enum$InputTimelinessTypeEnum(
    String value) {
  switch (value) {
    case r'FIFTEEN_DAYS':
      return Enum$InputTimelinessTypeEnum.FIFTEEN_DAYS;
    case r'NOT_APPLICABLE':
      return Enum$InputTimelinessTypeEnum.NOT_APPLICABLE;
    case r'SEVEN_DAYS':
      return Enum$InputTimelinessTypeEnum.SEVEN_DAYS;
    case r'THIRTY_DAYS':
      return Enum$InputTimelinessTypeEnum.THIRTY_DAYS;
    case r'TWENTY_DAYS':
      return Enum$InputTimelinessTypeEnum.TWENTY_DAYS;
    default:
      return Enum$InputTimelinessTypeEnum.$unknown;
  }
}

enum Enum$InsuranceStockTypeEnum {
  FIFTY_PERCENT_FIRE_THEFT,
  HUNDRED_PERCENT_FIRE_THEFT,
  LESS_THAN_50_FIRE,
  NO_INSURANCE,
  $unknown;

  factory Enum$InsuranceStockTypeEnum.fromJson(String value) =>
      fromJson$Enum$InsuranceStockTypeEnum(value);

  String toJson() => toJson$Enum$InsuranceStockTypeEnum(this);
}

String toJson$Enum$InsuranceStockTypeEnum(Enum$InsuranceStockTypeEnum e) {
  switch (e) {
    case Enum$InsuranceStockTypeEnum.FIFTY_PERCENT_FIRE_THEFT:
      return r'FIFTY_PERCENT_FIRE_THEFT';
    case Enum$InsuranceStockTypeEnum.HUNDRED_PERCENT_FIRE_THEFT:
      return r'HUNDRED_PERCENT_FIRE_THEFT';
    case Enum$InsuranceStockTypeEnum.LESS_THAN_50_FIRE:
      return r'LESS_THAN_50_FIRE';
    case Enum$InsuranceStockTypeEnum.NO_INSURANCE:
      return r'NO_INSURANCE';
    case Enum$InsuranceStockTypeEnum.$unknown:
      return r'$unknown';
  }
}

Enum$InsuranceStockTypeEnum fromJson$Enum$InsuranceStockTypeEnum(String value) {
  switch (value) {
    case r'FIFTY_PERCENT_FIRE_THEFT':
      return Enum$InsuranceStockTypeEnum.FIFTY_PERCENT_FIRE_THEFT;
    case r'HUNDRED_PERCENT_FIRE_THEFT':
      return Enum$InsuranceStockTypeEnum.HUNDRED_PERCENT_FIRE_THEFT;
    case r'LESS_THAN_50_FIRE':
      return Enum$InsuranceStockTypeEnum.LESS_THAN_50_FIRE;
    case r'NO_INSURANCE':
      return Enum$InsuranceStockTypeEnum.NO_INSURANCE;
    default:
      return Enum$InsuranceStockTypeEnum.$unknown;
  }
}

enum Enum$MinutesMaintenanceTypeEnum {
  DETAILED_COMPLIANT,
  DETAILED_NOT_UPDATED,
  NOT_MAINTAINED,
  SKETCHY_QUALITY,
  $unknown;

  factory Enum$MinutesMaintenanceTypeEnum.fromJson(String value) =>
      fromJson$Enum$MinutesMaintenanceTypeEnum(value);

  String toJson() => toJson$Enum$MinutesMaintenanceTypeEnum(this);
}

String toJson$Enum$MinutesMaintenanceTypeEnum(
    Enum$MinutesMaintenanceTypeEnum e) {
  switch (e) {
    case Enum$MinutesMaintenanceTypeEnum.DETAILED_COMPLIANT:
      return r'DETAILED_COMPLIANT';
    case Enum$MinutesMaintenanceTypeEnum.DETAILED_NOT_UPDATED:
      return r'DETAILED_NOT_UPDATED';
    case Enum$MinutesMaintenanceTypeEnum.NOT_MAINTAINED:
      return r'NOT_MAINTAINED';
    case Enum$MinutesMaintenanceTypeEnum.SKETCHY_QUALITY:
      return r'SKETCHY_QUALITY';
    case Enum$MinutesMaintenanceTypeEnum.$unknown:
      return r'$unknown';
  }
}

Enum$MinutesMaintenanceTypeEnum fromJson$Enum$MinutesMaintenanceTypeEnum(
    String value) {
  switch (value) {
    case r'DETAILED_COMPLIANT':
      return Enum$MinutesMaintenanceTypeEnum.DETAILED_COMPLIANT;
    case r'DETAILED_NOT_UPDATED':
      return Enum$MinutesMaintenanceTypeEnum.DETAILED_NOT_UPDATED;
    case r'NOT_MAINTAINED':
      return Enum$MinutesMaintenanceTypeEnum.NOT_MAINTAINED;
    case r'SKETCHY_QUALITY':
      return Enum$MinutesMaintenanceTypeEnum.SKETCHY_QUALITY;
    default:
      return Enum$MinutesMaintenanceTypeEnum.$unknown;
  }
}

enum Enum$PriceAffordabilityTypeEnum {
  FIVE_TO_TEN_PERCENT,
  NOT_APPLICABLE,
  ONE_TO_THREE_PERCENT,
  TEN_TO_FIFTEEN_PERCENT,
  THREE_TO_FIVE_PERCENT,
  $unknown;

  factory Enum$PriceAffordabilityTypeEnum.fromJson(String value) =>
      fromJson$Enum$PriceAffordabilityTypeEnum(value);

  String toJson() => toJson$Enum$PriceAffordabilityTypeEnum(this);
}

String toJson$Enum$PriceAffordabilityTypeEnum(
    Enum$PriceAffordabilityTypeEnum e) {
  switch (e) {
    case Enum$PriceAffordabilityTypeEnum.FIVE_TO_TEN_PERCENT:
      return r'FIVE_TO_TEN_PERCENT';
    case Enum$PriceAffordabilityTypeEnum.NOT_APPLICABLE:
      return r'NOT_APPLICABLE';
    case Enum$PriceAffordabilityTypeEnum.ONE_TO_THREE_PERCENT:
      return r'ONE_TO_THREE_PERCENT';
    case Enum$PriceAffordabilityTypeEnum.TEN_TO_FIFTEEN_PERCENT:
      return r'TEN_TO_FIFTEEN_PERCENT';
    case Enum$PriceAffordabilityTypeEnum.THREE_TO_FIVE_PERCENT:
      return r'THREE_TO_FIVE_PERCENT';
    case Enum$PriceAffordabilityTypeEnum.$unknown:
      return r'$unknown';
  }
}

Enum$PriceAffordabilityTypeEnum fromJson$Enum$PriceAffordabilityTypeEnum(
    String value) {
  switch (value) {
    case r'FIVE_TO_TEN_PERCENT':
      return Enum$PriceAffordabilityTypeEnum.FIVE_TO_TEN_PERCENT;
    case r'NOT_APPLICABLE':
      return Enum$PriceAffordabilityTypeEnum.NOT_APPLICABLE;
    case r'ONE_TO_THREE_PERCENT':
      return Enum$PriceAffordabilityTypeEnum.ONE_TO_THREE_PERCENT;
    case r'TEN_TO_FIFTEEN_PERCENT':
      return Enum$PriceAffordabilityTypeEnum.TEN_TO_FIFTEEN_PERCENT;
    case r'THREE_TO_FIVE_PERCENT':
      return Enum$PriceAffordabilityTypeEnum.THREE_TO_FIVE_PERCENT;
    default:
      return Enum$PriceAffordabilityTypeEnum.$unknown;
  }
}

enum Enum$PriceVolatilityTypeEnum {
  HIGHLY_VOLATILE_FPO_RISK,
  MSP_FPO_RISK,
  NOT_APPLICABLE,
  PARTIAL_HEDGE,
  WELL_HEDGED,
  $unknown;

  factory Enum$PriceVolatilityTypeEnum.fromJson(String value) =>
      fromJson$Enum$PriceVolatilityTypeEnum(value);

  String toJson() => toJson$Enum$PriceVolatilityTypeEnum(this);
}

String toJson$Enum$PriceVolatilityTypeEnum(Enum$PriceVolatilityTypeEnum e) {
  switch (e) {
    case Enum$PriceVolatilityTypeEnum.HIGHLY_VOLATILE_FPO_RISK:
      return r'HIGHLY_VOLATILE_FPO_RISK';
    case Enum$PriceVolatilityTypeEnum.MSP_FPO_RISK:
      return r'MSP_FPO_RISK';
    case Enum$PriceVolatilityTypeEnum.NOT_APPLICABLE:
      return r'NOT_APPLICABLE';
    case Enum$PriceVolatilityTypeEnum.PARTIAL_HEDGE:
      return r'PARTIAL_HEDGE';
    case Enum$PriceVolatilityTypeEnum.WELL_HEDGED:
      return r'WELL_HEDGED';
    case Enum$PriceVolatilityTypeEnum.$unknown:
      return r'$unknown';
  }
}

Enum$PriceVolatilityTypeEnum fromJson$Enum$PriceVolatilityTypeEnum(
    String value) {
  switch (value) {
    case r'HIGHLY_VOLATILE_FPO_RISK':
      return Enum$PriceVolatilityTypeEnum.HIGHLY_VOLATILE_FPO_RISK;
    case r'MSP_FPO_RISK':
      return Enum$PriceVolatilityTypeEnum.MSP_FPO_RISK;
    case r'NOT_APPLICABLE':
      return Enum$PriceVolatilityTypeEnum.NOT_APPLICABLE;
    case r'PARTIAL_HEDGE':
      return Enum$PriceVolatilityTypeEnum.PARTIAL_HEDGE;
    case r'WELL_HEDGED':
      return Enum$PriceVolatilityTypeEnum.WELL_HEDGED;
    default:
      return Enum$PriceVolatilityTypeEnum.$unknown;
  }
}

enum Enum$ProducerOrgTypeEnum {
  CO_OPERATIVE_SOCIETY,
  NON_PROFIT_SOCIETY,
  PRODUCER_COMPANY,
  SECTION_8_COMPANY,
  TRUST,
  $unknown;

  factory Enum$ProducerOrgTypeEnum.fromJson(String value) =>
      fromJson$Enum$ProducerOrgTypeEnum(value);

  String toJson() => toJson$Enum$ProducerOrgTypeEnum(this);
}

String toJson$Enum$ProducerOrgTypeEnum(Enum$ProducerOrgTypeEnum e) {
  switch (e) {
    case Enum$ProducerOrgTypeEnum.CO_OPERATIVE_SOCIETY:
      return r'CO_OPERATIVE_SOCIETY';
    case Enum$ProducerOrgTypeEnum.NON_PROFIT_SOCIETY:
      return r'NON_PROFIT_SOCIETY';
    case Enum$ProducerOrgTypeEnum.PRODUCER_COMPANY:
      return r'PRODUCER_COMPANY';
    case Enum$ProducerOrgTypeEnum.SECTION_8_COMPANY:
      return r'SECTION_8_COMPANY';
    case Enum$ProducerOrgTypeEnum.TRUST:
      return r'TRUST';
    case Enum$ProducerOrgTypeEnum.$unknown:
      return r'$unknown';
  }
}

Enum$ProducerOrgTypeEnum fromJson$Enum$ProducerOrgTypeEnum(String value) {
  switch (value) {
    case r'CO_OPERATIVE_SOCIETY':
      return Enum$ProducerOrgTypeEnum.CO_OPERATIVE_SOCIETY;
    case r'NON_PROFIT_SOCIETY':
      return Enum$ProducerOrgTypeEnum.NON_PROFIT_SOCIETY;
    case r'PRODUCER_COMPANY':
      return Enum$ProducerOrgTypeEnum.PRODUCER_COMPANY;
    case r'SECTION_8_COMPANY':
      return Enum$ProducerOrgTypeEnum.SECTION_8_COMPANY;
    case r'TRUST':
      return Enum$ProducerOrgTypeEnum.TRUST;
    default:
      return Enum$ProducerOrgTypeEnum.$unknown;
  }
}

enum Enum$PromotingAgencyTypeEnum {
  BIG_FARMER_COMPANIES,
  COMMODITY_BOARDS,
  COOPERATIVES,
  CORPORATE_WINGS,
  FARMER_FEDERATIONS,
  KVKS,
  NGO,
  OTHERS,
  STATE_GOVT,
  TRUSTS,
  $unknown;

  factory Enum$PromotingAgencyTypeEnum.fromJson(String value) =>
      fromJson$Enum$PromotingAgencyTypeEnum(value);

  String toJson() => toJson$Enum$PromotingAgencyTypeEnum(this);
}

String toJson$Enum$PromotingAgencyTypeEnum(Enum$PromotingAgencyTypeEnum e) {
  switch (e) {
    case Enum$PromotingAgencyTypeEnum.BIG_FARMER_COMPANIES:
      return r'BIG_FARMER_COMPANIES';
    case Enum$PromotingAgencyTypeEnum.COMMODITY_BOARDS:
      return r'COMMODITY_BOARDS';
    case Enum$PromotingAgencyTypeEnum.COOPERATIVES:
      return r'COOPERATIVES';
    case Enum$PromotingAgencyTypeEnum.CORPORATE_WINGS:
      return r'CORPORATE_WINGS';
    case Enum$PromotingAgencyTypeEnum.FARMER_FEDERATIONS:
      return r'FARMER_FEDERATIONS';
    case Enum$PromotingAgencyTypeEnum.KVKS:
      return r'KVKS';
    case Enum$PromotingAgencyTypeEnum.NGO:
      return r'NGO';
    case Enum$PromotingAgencyTypeEnum.OTHERS:
      return r'OTHERS';
    case Enum$PromotingAgencyTypeEnum.STATE_GOVT:
      return r'STATE_GOVT';
    case Enum$PromotingAgencyTypeEnum.TRUSTS:
      return r'TRUSTS';
    case Enum$PromotingAgencyTypeEnum.$unknown:
      return r'$unknown';
  }
}

Enum$PromotingAgencyTypeEnum fromJson$Enum$PromotingAgencyTypeEnum(
    String value) {
  switch (value) {
    case r'BIG_FARMER_COMPANIES':
      return Enum$PromotingAgencyTypeEnum.BIG_FARMER_COMPANIES;
    case r'COMMODITY_BOARDS':
      return Enum$PromotingAgencyTypeEnum.COMMODITY_BOARDS;
    case r'COOPERATIVES':
      return Enum$PromotingAgencyTypeEnum.COOPERATIVES;
    case r'CORPORATE_WINGS':
      return Enum$PromotingAgencyTypeEnum.CORPORATE_WINGS;
    case r'FARMER_FEDERATIONS':
      return Enum$PromotingAgencyTypeEnum.FARMER_FEDERATIONS;
    case r'KVKS':
      return Enum$PromotingAgencyTypeEnum.KVKS;
    case r'NGO':
      return Enum$PromotingAgencyTypeEnum.NGO;
    case r'OTHERS':
      return Enum$PromotingAgencyTypeEnum.OTHERS;
    case r'STATE_GOVT':
      return Enum$PromotingAgencyTypeEnum.STATE_GOVT;
    case r'TRUSTS':
      return Enum$PromotingAgencyTypeEnum.TRUSTS;
    default:
      return Enum$PromotingAgencyTypeEnum.$unknown;
  }
}

enum Enum$ReconciliationStocksTypeEnum {
  ABSENT_ANNUAL,
  EVERY_15_DAYS,
  MONTHLY,
  TWO_TO_FOUR_TIMES,
  $unknown;

  factory Enum$ReconciliationStocksTypeEnum.fromJson(String value) =>
      fromJson$Enum$ReconciliationStocksTypeEnum(value);

  String toJson() => toJson$Enum$ReconciliationStocksTypeEnum(this);
}

String toJson$Enum$ReconciliationStocksTypeEnum(
    Enum$ReconciliationStocksTypeEnum e) {
  switch (e) {
    case Enum$ReconciliationStocksTypeEnum.ABSENT_ANNUAL:
      return r'ABSENT_ANNUAL';
    case Enum$ReconciliationStocksTypeEnum.EVERY_15_DAYS:
      return r'EVERY_15_DAYS';
    case Enum$ReconciliationStocksTypeEnum.MONTHLY:
      return r'MONTHLY';
    case Enum$ReconciliationStocksTypeEnum.TWO_TO_FOUR_TIMES:
      return r'TWO_TO_FOUR_TIMES';
    case Enum$ReconciliationStocksTypeEnum.$unknown:
      return r'$unknown';
  }
}

Enum$ReconciliationStocksTypeEnum fromJson$Enum$ReconciliationStocksTypeEnum(
    String value) {
  switch (value) {
    case r'ABSENT_ANNUAL':
      return Enum$ReconciliationStocksTypeEnum.ABSENT_ANNUAL;
    case r'EVERY_15_DAYS':
      return Enum$ReconciliationStocksTypeEnum.EVERY_15_DAYS;
    case r'MONTHLY':
      return Enum$ReconciliationStocksTypeEnum.MONTHLY;
    case r'TWO_TO_FOUR_TIMES':
      return Enum$ReconciliationStocksTypeEnum.TWO_TO_FOUR_TIMES;
    default:
      return Enum$ReconciliationStocksTypeEnum.$unknown;
  }
}

enum Enum$SecondLineManagementTypeEnum {
  CEO_WITH_ACCOUNTS,
  CEO_WITH_ACCOUNTS_ONE_MANAGER,
  CEO_WITH_ACCOUNTS_TWO_MANAGERS,
  NO_CEO,
  ONLY_CEO,
  $unknown;

  factory Enum$SecondLineManagementTypeEnum.fromJson(String value) =>
      fromJson$Enum$SecondLineManagementTypeEnum(value);

  String toJson() => toJson$Enum$SecondLineManagementTypeEnum(this);
}

String toJson$Enum$SecondLineManagementTypeEnum(
    Enum$SecondLineManagementTypeEnum e) {
  switch (e) {
    case Enum$SecondLineManagementTypeEnum.CEO_WITH_ACCOUNTS:
      return r'CEO_WITH_ACCOUNTS';
    case Enum$SecondLineManagementTypeEnum.CEO_WITH_ACCOUNTS_ONE_MANAGER:
      return r'CEO_WITH_ACCOUNTS_ONE_MANAGER';
    case Enum$SecondLineManagementTypeEnum.CEO_WITH_ACCOUNTS_TWO_MANAGERS:
      return r'CEO_WITH_ACCOUNTS_TWO_MANAGERS';
    case Enum$SecondLineManagementTypeEnum.NO_CEO:
      return r'NO_CEO';
    case Enum$SecondLineManagementTypeEnum.ONLY_CEO:
      return r'ONLY_CEO';
    case Enum$SecondLineManagementTypeEnum.$unknown:
      return r'$unknown';
  }
}

Enum$SecondLineManagementTypeEnum fromJson$Enum$SecondLineManagementTypeEnum(
    String value) {
  switch (value) {
    case r'CEO_WITH_ACCOUNTS':
      return Enum$SecondLineManagementTypeEnum.CEO_WITH_ACCOUNTS;
    case r'CEO_WITH_ACCOUNTS_ONE_MANAGER':
      return Enum$SecondLineManagementTypeEnum.CEO_WITH_ACCOUNTS_ONE_MANAGER;
    case r'CEO_WITH_ACCOUNTS_TWO_MANAGERS':
      return Enum$SecondLineManagementTypeEnum.CEO_WITH_ACCOUNTS_TWO_MANAGERS;
    case r'NO_CEO':
      return Enum$SecondLineManagementTypeEnum.NO_CEO;
    case r'ONLY_CEO':
      return Enum$SecondLineManagementTypeEnum.ONLY_CEO;
    default:
      return Enum$SecondLineManagementTypeEnum.$unknown;
  }
}

enum Enum$StatutoryFillingsTypeEnum {
  DELAYS_NOT_FILLED,
  FEW_DELAYS_FILLED,
  MULTIPLE_DELAYS_FILLED,
  NO_DELAYS,
  $unknown;

  factory Enum$StatutoryFillingsTypeEnum.fromJson(String value) =>
      fromJson$Enum$StatutoryFillingsTypeEnum(value);

  String toJson() => toJson$Enum$StatutoryFillingsTypeEnum(this);
}

String toJson$Enum$StatutoryFillingsTypeEnum(Enum$StatutoryFillingsTypeEnum e) {
  switch (e) {
    case Enum$StatutoryFillingsTypeEnum.DELAYS_NOT_FILLED:
      return r'DELAYS_NOT_FILLED';
    case Enum$StatutoryFillingsTypeEnum.FEW_DELAYS_FILLED:
      return r'FEW_DELAYS_FILLED';
    case Enum$StatutoryFillingsTypeEnum.MULTIPLE_DELAYS_FILLED:
      return r'MULTIPLE_DELAYS_FILLED';
    case Enum$StatutoryFillingsTypeEnum.NO_DELAYS:
      return r'NO_DELAYS';
    case Enum$StatutoryFillingsTypeEnum.$unknown:
      return r'$unknown';
  }
}

Enum$StatutoryFillingsTypeEnum fromJson$Enum$StatutoryFillingsTypeEnum(
    String value) {
  switch (value) {
    case r'DELAYS_NOT_FILLED':
      return Enum$StatutoryFillingsTypeEnum.DELAYS_NOT_FILLED;
    case r'FEW_DELAYS_FILLED':
      return Enum$StatutoryFillingsTypeEnum.FEW_DELAYS_FILLED;
    case r'MULTIPLE_DELAYS_FILLED':
      return Enum$StatutoryFillingsTypeEnum.MULTIPLE_DELAYS_FILLED;
    case r'NO_DELAYS':
      return Enum$StatutoryFillingsTypeEnum.NO_DELAYS;
    default:
      return Enum$StatutoryFillingsTypeEnum.$unknown;
  }
}

enum Enum$SurveyOptionConditionConditionTypeChoices {
  CONTAINS,
  EQUALS,
  GREATER_THAN,
  IN,
  IS_EMPTY,
  IS_NOT_EMPTY,
  LESS_THAN,
  NOT_CONTAINS,
  NOT_EQUALS,
  NOT_IN,
  $unknown;

  factory Enum$SurveyOptionConditionConditionTypeChoices.fromJson(
          String value) =>
      fromJson$Enum$SurveyOptionConditionConditionTypeChoices(value);

  String toJson() =>
      toJson$Enum$SurveyOptionConditionConditionTypeChoices(this);
}

String toJson$Enum$SurveyOptionConditionConditionTypeChoices(
    Enum$SurveyOptionConditionConditionTypeChoices e) {
  switch (e) {
    case Enum$SurveyOptionConditionConditionTypeChoices.CONTAINS:
      return r'CONTAINS';
    case Enum$SurveyOptionConditionConditionTypeChoices.EQUALS:
      return r'EQUALS';
    case Enum$SurveyOptionConditionConditionTypeChoices.GREATER_THAN:
      return r'GREATER_THAN';
    case Enum$SurveyOptionConditionConditionTypeChoices.IN:
      return r'IN';
    case Enum$SurveyOptionConditionConditionTypeChoices.IS_EMPTY:
      return r'IS_EMPTY';
    case Enum$SurveyOptionConditionConditionTypeChoices.IS_NOT_EMPTY:
      return r'IS_NOT_EMPTY';
    case Enum$SurveyOptionConditionConditionTypeChoices.LESS_THAN:
      return r'LESS_THAN';
    case Enum$SurveyOptionConditionConditionTypeChoices.NOT_CONTAINS:
      return r'NOT_CONTAINS';
    case Enum$SurveyOptionConditionConditionTypeChoices.NOT_EQUALS:
      return r'NOT_EQUALS';
    case Enum$SurveyOptionConditionConditionTypeChoices.NOT_IN:
      return r'NOT_IN';
    case Enum$SurveyOptionConditionConditionTypeChoices.$unknown:
      return r'$unknown';
  }
}

Enum$SurveyOptionConditionConditionTypeChoices
    fromJson$Enum$SurveyOptionConditionConditionTypeChoices(String value) {
  switch (value) {
    case r'CONTAINS':
      return Enum$SurveyOptionConditionConditionTypeChoices.CONTAINS;
    case r'EQUALS':
      return Enum$SurveyOptionConditionConditionTypeChoices.EQUALS;
    case r'GREATER_THAN':
      return Enum$SurveyOptionConditionConditionTypeChoices.GREATER_THAN;
    case r'IN':
      return Enum$SurveyOptionConditionConditionTypeChoices.IN;
    case r'IS_EMPTY':
      return Enum$SurveyOptionConditionConditionTypeChoices.IS_EMPTY;
    case r'IS_NOT_EMPTY':
      return Enum$SurveyOptionConditionConditionTypeChoices.IS_NOT_EMPTY;
    case r'LESS_THAN':
      return Enum$SurveyOptionConditionConditionTypeChoices.LESS_THAN;
    case r'NOT_CONTAINS':
      return Enum$SurveyOptionConditionConditionTypeChoices.NOT_CONTAINS;
    case r'NOT_EQUALS':
      return Enum$SurveyOptionConditionConditionTypeChoices.NOT_EQUALS;
    case r'NOT_IN':
      return Enum$SurveyOptionConditionConditionTypeChoices.NOT_IN;
    default:
      return Enum$SurveyOptionConditionConditionTypeChoices.$unknown;
  }
}

enum Enum$SurveyOptionConditionLogicOperatorChoices {
  AND,
  OR,
  $unknown;

  factory Enum$SurveyOptionConditionLogicOperatorChoices.fromJson(
          String value) =>
      fromJson$Enum$SurveyOptionConditionLogicOperatorChoices(value);

  String toJson() =>
      toJson$Enum$SurveyOptionConditionLogicOperatorChoices(this);
}

String toJson$Enum$SurveyOptionConditionLogicOperatorChoices(
    Enum$SurveyOptionConditionLogicOperatorChoices e) {
  switch (e) {
    case Enum$SurveyOptionConditionLogicOperatorChoices.AND:
      return r'AND';
    case Enum$SurveyOptionConditionLogicOperatorChoices.OR:
      return r'OR';
    case Enum$SurveyOptionConditionLogicOperatorChoices.$unknown:
      return r'$unknown';
  }
}

Enum$SurveyOptionConditionLogicOperatorChoices
    fromJson$Enum$SurveyOptionConditionLogicOperatorChoices(String value) {
  switch (value) {
    case r'AND':
      return Enum$SurveyOptionConditionLogicOperatorChoices.AND;
    case r'OR':
      return Enum$SurveyOptionConditionLogicOperatorChoices.OR;
    default:
      return Enum$SurveyOptionConditionLogicOperatorChoices.$unknown;
  }
}

enum Enum$SurveyOptionWarningTranslationLanguageChoices {
  AS,
  BN,
  BRX,
  DOI,
  EN,
  GU,
  HI,
  KN,
  KOK,
  KS,
  MAI,
  ML,
  MNI,
  MR,
  NE,
  OR,
  PA,
  SA,
  SAT,
  SD,
  TA,
  TE,
  UR,
  $unknown;

  factory Enum$SurveyOptionWarningTranslationLanguageChoices.fromJson(
          String value) =>
      fromJson$Enum$SurveyOptionWarningTranslationLanguageChoices(value);

  String toJson() =>
      toJson$Enum$SurveyOptionWarningTranslationLanguageChoices(this);
}

String toJson$Enum$SurveyOptionWarningTranslationLanguageChoices(
    Enum$SurveyOptionWarningTranslationLanguageChoices e) {
  switch (e) {
    case Enum$SurveyOptionWarningTranslationLanguageChoices.AS:
      return r'AS';
    case Enum$SurveyOptionWarningTranslationLanguageChoices.BN:
      return r'BN';
    case Enum$SurveyOptionWarningTranslationLanguageChoices.BRX:
      return r'BRX';
    case Enum$SurveyOptionWarningTranslationLanguageChoices.DOI:
      return r'DOI';
    case Enum$SurveyOptionWarningTranslationLanguageChoices.EN:
      return r'EN';
    case Enum$SurveyOptionWarningTranslationLanguageChoices.GU:
      return r'GU';
    case Enum$SurveyOptionWarningTranslationLanguageChoices.HI:
      return r'HI';
    case Enum$SurveyOptionWarningTranslationLanguageChoices.KN:
      return r'KN';
    case Enum$SurveyOptionWarningTranslationLanguageChoices.KOK:
      return r'KOK';
    case Enum$SurveyOptionWarningTranslationLanguageChoices.KS:
      return r'KS';
    case Enum$SurveyOptionWarningTranslationLanguageChoices.MAI:
      return r'MAI';
    case Enum$SurveyOptionWarningTranslationLanguageChoices.ML:
      return r'ML';
    case Enum$SurveyOptionWarningTranslationLanguageChoices.MNI:
      return r'MNI';
    case Enum$SurveyOptionWarningTranslationLanguageChoices.MR:
      return r'MR';
    case Enum$SurveyOptionWarningTranslationLanguageChoices.NE:
      return r'NE';
    case Enum$SurveyOptionWarningTranslationLanguageChoices.OR:
      return r'OR';
    case Enum$SurveyOptionWarningTranslationLanguageChoices.PA:
      return r'PA';
    case Enum$SurveyOptionWarningTranslationLanguageChoices.SA:
      return r'SA';
    case Enum$SurveyOptionWarningTranslationLanguageChoices.SAT:
      return r'SAT';
    case Enum$SurveyOptionWarningTranslationLanguageChoices.SD:
      return r'SD';
    case Enum$SurveyOptionWarningTranslationLanguageChoices.TA:
      return r'TA';
    case Enum$SurveyOptionWarningTranslationLanguageChoices.TE:
      return r'TE';
    case Enum$SurveyOptionWarningTranslationLanguageChoices.UR:
      return r'UR';
    case Enum$SurveyOptionWarningTranslationLanguageChoices.$unknown:
      return r'$unknown';
  }
}

Enum$SurveyOptionWarningTranslationLanguageChoices
    fromJson$Enum$SurveyOptionWarningTranslationLanguageChoices(String value) {
  switch (value) {
    case r'AS':
      return Enum$SurveyOptionWarningTranslationLanguageChoices.AS;
    case r'BN':
      return Enum$SurveyOptionWarningTranslationLanguageChoices.BN;
    case r'BRX':
      return Enum$SurveyOptionWarningTranslationLanguageChoices.BRX;
    case r'DOI':
      return Enum$SurveyOptionWarningTranslationLanguageChoices.DOI;
    case r'EN':
      return Enum$SurveyOptionWarningTranslationLanguageChoices.EN;
    case r'GU':
      return Enum$SurveyOptionWarningTranslationLanguageChoices.GU;
    case r'HI':
      return Enum$SurveyOptionWarningTranslationLanguageChoices.HI;
    case r'KN':
      return Enum$SurveyOptionWarningTranslationLanguageChoices.KN;
    case r'KOK':
      return Enum$SurveyOptionWarningTranslationLanguageChoices.KOK;
    case r'KS':
      return Enum$SurveyOptionWarningTranslationLanguageChoices.KS;
    case r'MAI':
      return Enum$SurveyOptionWarningTranslationLanguageChoices.MAI;
    case r'ML':
      return Enum$SurveyOptionWarningTranslationLanguageChoices.ML;
    case r'MNI':
      return Enum$SurveyOptionWarningTranslationLanguageChoices.MNI;
    case r'MR':
      return Enum$SurveyOptionWarningTranslationLanguageChoices.MR;
    case r'NE':
      return Enum$SurveyOptionWarningTranslationLanguageChoices.NE;
    case r'OR':
      return Enum$SurveyOptionWarningTranslationLanguageChoices.OR;
    case r'PA':
      return Enum$SurveyOptionWarningTranslationLanguageChoices.PA;
    case r'SA':
      return Enum$SurveyOptionWarningTranslationLanguageChoices.SA;
    case r'SAT':
      return Enum$SurveyOptionWarningTranslationLanguageChoices.SAT;
    case r'SD':
      return Enum$SurveyOptionWarningTranslationLanguageChoices.SD;
    case r'TA':
      return Enum$SurveyOptionWarningTranslationLanguageChoices.TA;
    case r'TE':
      return Enum$SurveyOptionWarningTranslationLanguageChoices.TE;
    case r'UR':
      return Enum$SurveyOptionWarningTranslationLanguageChoices.UR;
    default:
      return Enum$SurveyOptionWarningTranslationLanguageChoices.$unknown;
  }
}

enum Enum$SurveyOptionWarningTranslationWarningTypeChoices {
  NOT_SELECTED,
  SELECTED,
  $unknown;

  factory Enum$SurveyOptionWarningTranslationWarningTypeChoices.fromJson(
          String value) =>
      fromJson$Enum$SurveyOptionWarningTranslationWarningTypeChoices(value);

  String toJson() =>
      toJson$Enum$SurveyOptionWarningTranslationWarningTypeChoices(this);
}

String toJson$Enum$SurveyOptionWarningTranslationWarningTypeChoices(
    Enum$SurveyOptionWarningTranslationWarningTypeChoices e) {
  switch (e) {
    case Enum$SurveyOptionWarningTranslationWarningTypeChoices.NOT_SELECTED:
      return r'NOT_SELECTED';
    case Enum$SurveyOptionWarningTranslationWarningTypeChoices.SELECTED:
      return r'SELECTED';
    case Enum$SurveyOptionWarningTranslationWarningTypeChoices.$unknown:
      return r'$unknown';
  }
}

Enum$SurveyOptionWarningTranslationWarningTypeChoices
    fromJson$Enum$SurveyOptionWarningTranslationWarningTypeChoices(
        String value) {
  switch (value) {
    case r'NOT_SELECTED':
      return Enum$SurveyOptionWarningTranslationWarningTypeChoices.NOT_SELECTED;
    case r'SELECTED':
      return Enum$SurveyOptionWarningTranslationWarningTypeChoices.SELECTED;
    default:
      return Enum$SurveyOptionWarningTranslationWarningTypeChoices.$unknown;
  }
}

enum Enum$SurveyQuestionConditionConditionTypeChoices {
  CONTAINS,
  EQUALS,
  GREATER_THAN,
  IN,
  IS_EMPTY,
  IS_NOT_EMPTY,
  LESS_THAN,
  NOT_CONTAINS,
  NOT_EQUALS,
  NOT_IN,
  $unknown;

  factory Enum$SurveyQuestionConditionConditionTypeChoices.fromJson(
          String value) =>
      fromJson$Enum$SurveyQuestionConditionConditionTypeChoices(value);

  String toJson() =>
      toJson$Enum$SurveyQuestionConditionConditionTypeChoices(this);
}

String toJson$Enum$SurveyQuestionConditionConditionTypeChoices(
    Enum$SurveyQuestionConditionConditionTypeChoices e) {
  switch (e) {
    case Enum$SurveyQuestionConditionConditionTypeChoices.CONTAINS:
      return r'CONTAINS';
    case Enum$SurveyQuestionConditionConditionTypeChoices.EQUALS:
      return r'EQUALS';
    case Enum$SurveyQuestionConditionConditionTypeChoices.GREATER_THAN:
      return r'GREATER_THAN';
    case Enum$SurveyQuestionConditionConditionTypeChoices.IN:
      return r'IN';
    case Enum$SurveyQuestionConditionConditionTypeChoices.IS_EMPTY:
      return r'IS_EMPTY';
    case Enum$SurveyQuestionConditionConditionTypeChoices.IS_NOT_EMPTY:
      return r'IS_NOT_EMPTY';
    case Enum$SurveyQuestionConditionConditionTypeChoices.LESS_THAN:
      return r'LESS_THAN';
    case Enum$SurveyQuestionConditionConditionTypeChoices.NOT_CONTAINS:
      return r'NOT_CONTAINS';
    case Enum$SurveyQuestionConditionConditionTypeChoices.NOT_EQUALS:
      return r'NOT_EQUALS';
    case Enum$SurveyQuestionConditionConditionTypeChoices.NOT_IN:
      return r'NOT_IN';
    case Enum$SurveyQuestionConditionConditionTypeChoices.$unknown:
      return r'$unknown';
  }
}

Enum$SurveyQuestionConditionConditionTypeChoices
    fromJson$Enum$SurveyQuestionConditionConditionTypeChoices(String value) {
  switch (value) {
    case r'CONTAINS':
      return Enum$SurveyQuestionConditionConditionTypeChoices.CONTAINS;
    case r'EQUALS':
      return Enum$SurveyQuestionConditionConditionTypeChoices.EQUALS;
    case r'GREATER_THAN':
      return Enum$SurveyQuestionConditionConditionTypeChoices.GREATER_THAN;
    case r'IN':
      return Enum$SurveyQuestionConditionConditionTypeChoices.IN;
    case r'IS_EMPTY':
      return Enum$SurveyQuestionConditionConditionTypeChoices.IS_EMPTY;
    case r'IS_NOT_EMPTY':
      return Enum$SurveyQuestionConditionConditionTypeChoices.IS_NOT_EMPTY;
    case r'LESS_THAN':
      return Enum$SurveyQuestionConditionConditionTypeChoices.LESS_THAN;
    case r'NOT_CONTAINS':
      return Enum$SurveyQuestionConditionConditionTypeChoices.NOT_CONTAINS;
    case r'NOT_EQUALS':
      return Enum$SurveyQuestionConditionConditionTypeChoices.NOT_EQUALS;
    case r'NOT_IN':
      return Enum$SurveyQuestionConditionConditionTypeChoices.NOT_IN;
    default:
      return Enum$SurveyQuestionConditionConditionTypeChoices.$unknown;
  }
}

enum Enum$SurveyQuestionConditionLogicOperatorChoices {
  AND,
  OR,
  $unknown;

  factory Enum$SurveyQuestionConditionLogicOperatorChoices.fromJson(
          String value) =>
      fromJson$Enum$SurveyQuestionConditionLogicOperatorChoices(value);

  String toJson() =>
      toJson$Enum$SurveyQuestionConditionLogicOperatorChoices(this);
}

String toJson$Enum$SurveyQuestionConditionLogicOperatorChoices(
    Enum$SurveyQuestionConditionLogicOperatorChoices e) {
  switch (e) {
    case Enum$SurveyQuestionConditionLogicOperatorChoices.AND:
      return r'AND';
    case Enum$SurveyQuestionConditionLogicOperatorChoices.OR:
      return r'OR';
    case Enum$SurveyQuestionConditionLogicOperatorChoices.$unknown:
      return r'$unknown';
  }
}

Enum$SurveyQuestionConditionLogicOperatorChoices
    fromJson$Enum$SurveyQuestionConditionLogicOperatorChoices(String value) {
  switch (value) {
    case r'AND':
      return Enum$SurveyQuestionConditionLogicOperatorChoices.AND;
    case r'OR':
      return Enum$SurveyQuestionConditionLogicOperatorChoices.OR;
    default:
      return Enum$SurveyQuestionConditionLogicOperatorChoices.$unknown;
  }
}

enum Enum$SurveyQuestionQuestionTypeChoices {
  CHECKBOX,
  CONSENT,
  DATE,
  DATETIME,
  DROPDOWN,
  EMAIL,
  NOTE,
  NUMBER,
  RADIO,
  TEXT,
  TEXTAREA,
  TIME,
  $unknown;

  factory Enum$SurveyQuestionQuestionTypeChoices.fromJson(String value) =>
      fromJson$Enum$SurveyQuestionQuestionTypeChoices(value);

  String toJson() => toJson$Enum$SurveyQuestionQuestionTypeChoices(this);
}

String toJson$Enum$SurveyQuestionQuestionTypeChoices(
    Enum$SurveyQuestionQuestionTypeChoices e) {
  switch (e) {
    case Enum$SurveyQuestionQuestionTypeChoices.CHECKBOX:
      return r'CHECKBOX';
    case Enum$SurveyQuestionQuestionTypeChoices.CONSENT:
      return r'CONSENT';
    case Enum$SurveyQuestionQuestionTypeChoices.DATE:
      return r'DATE';
    case Enum$SurveyQuestionQuestionTypeChoices.DATETIME:
      return r'DATETIME';
    case Enum$SurveyQuestionQuestionTypeChoices.DROPDOWN:
      return r'DROPDOWN';
    case Enum$SurveyQuestionQuestionTypeChoices.EMAIL:
      return r'EMAIL';
    case Enum$SurveyQuestionQuestionTypeChoices.NOTE:
      return r'NOTE';
    case Enum$SurveyQuestionQuestionTypeChoices.NUMBER:
      return r'NUMBER';
    case Enum$SurveyQuestionQuestionTypeChoices.RADIO:
      return r'RADIO';
    case Enum$SurveyQuestionQuestionTypeChoices.TEXT:
      return r'TEXT';
    case Enum$SurveyQuestionQuestionTypeChoices.TEXTAREA:
      return r'TEXTAREA';
    case Enum$SurveyQuestionQuestionTypeChoices.TIME:
      return r'TIME';
    case Enum$SurveyQuestionQuestionTypeChoices.$unknown:
      return r'$unknown';
  }
}

Enum$SurveyQuestionQuestionTypeChoices
    fromJson$Enum$SurveyQuestionQuestionTypeChoices(String value) {
  switch (value) {
    case r'CHECKBOX':
      return Enum$SurveyQuestionQuestionTypeChoices.CHECKBOX;
    case r'CONSENT':
      return Enum$SurveyQuestionQuestionTypeChoices.CONSENT;
    case r'DATE':
      return Enum$SurveyQuestionQuestionTypeChoices.DATE;
    case r'DATETIME':
      return Enum$SurveyQuestionQuestionTypeChoices.DATETIME;
    case r'DROPDOWN':
      return Enum$SurveyQuestionQuestionTypeChoices.DROPDOWN;
    case r'EMAIL':
      return Enum$SurveyQuestionQuestionTypeChoices.EMAIL;
    case r'NOTE':
      return Enum$SurveyQuestionQuestionTypeChoices.NOTE;
    case r'NUMBER':
      return Enum$SurveyQuestionQuestionTypeChoices.NUMBER;
    case r'RADIO':
      return Enum$SurveyQuestionQuestionTypeChoices.RADIO;
    case r'TEXT':
      return Enum$SurveyQuestionQuestionTypeChoices.TEXT;
    case r'TEXTAREA':
      return Enum$SurveyQuestionQuestionTypeChoices.TEXTAREA;
    case r'TIME':
      return Enum$SurveyQuestionQuestionTypeChoices.TIME;
    default:
      return Enum$SurveyQuestionQuestionTypeChoices.$unknown;
  }
}

enum Enum$SurveySubmissionStatusChoices {
  COMPLETED,
  DRAFT,
  PENDING,
  $unknown;

  factory Enum$SurveySubmissionStatusChoices.fromJson(String value) =>
      fromJson$Enum$SurveySubmissionStatusChoices(value);

  String toJson() => toJson$Enum$SurveySubmissionStatusChoices(this);
}

String toJson$Enum$SurveySubmissionStatusChoices(
    Enum$SurveySubmissionStatusChoices e) {
  switch (e) {
    case Enum$SurveySubmissionStatusChoices.COMPLETED:
      return r'COMPLETED';
    case Enum$SurveySubmissionStatusChoices.DRAFT:
      return r'DRAFT';
    case Enum$SurveySubmissionStatusChoices.PENDING:
      return r'PENDING';
    case Enum$SurveySubmissionStatusChoices.$unknown:
      return r'$unknown';
  }
}

Enum$SurveySubmissionStatusChoices fromJson$Enum$SurveySubmissionStatusChoices(
    String value) {
  switch (value) {
    case r'COMPLETED':
      return Enum$SurveySubmissionStatusChoices.COMPLETED;
    case r'DRAFT':
      return Enum$SurveySubmissionStatusChoices.DRAFT;
    case r'PENDING':
      return Enum$SurveySubmissionStatusChoices.PENDING;
    default:
      return Enum$SurveySubmissionStatusChoices.$unknown;
  }
}

enum Enum$SurveySurveyConsentTranslationLanguageChoices {
  AS,
  BN,
  BRX,
  DOI,
  EN,
  GU,
  HI,
  KN,
  KOK,
  KS,
  MAI,
  ML,
  MNI,
  MR,
  NE,
  OR,
  PA,
  SA,
  SAT,
  SD,
  TA,
  TE,
  UR,
  $unknown;

  factory Enum$SurveySurveyConsentTranslationLanguageChoices.fromJson(
          String value) =>
      fromJson$Enum$SurveySurveyConsentTranslationLanguageChoices(value);

  String toJson() =>
      toJson$Enum$SurveySurveyConsentTranslationLanguageChoices(this);
}

String toJson$Enum$SurveySurveyConsentTranslationLanguageChoices(
    Enum$SurveySurveyConsentTranslationLanguageChoices e) {
  switch (e) {
    case Enum$SurveySurveyConsentTranslationLanguageChoices.AS:
      return r'AS';
    case Enum$SurveySurveyConsentTranslationLanguageChoices.BN:
      return r'BN';
    case Enum$SurveySurveyConsentTranslationLanguageChoices.BRX:
      return r'BRX';
    case Enum$SurveySurveyConsentTranslationLanguageChoices.DOI:
      return r'DOI';
    case Enum$SurveySurveyConsentTranslationLanguageChoices.EN:
      return r'EN';
    case Enum$SurveySurveyConsentTranslationLanguageChoices.GU:
      return r'GU';
    case Enum$SurveySurveyConsentTranslationLanguageChoices.HI:
      return r'HI';
    case Enum$SurveySurveyConsentTranslationLanguageChoices.KN:
      return r'KN';
    case Enum$SurveySurveyConsentTranslationLanguageChoices.KOK:
      return r'KOK';
    case Enum$SurveySurveyConsentTranslationLanguageChoices.KS:
      return r'KS';
    case Enum$SurveySurveyConsentTranslationLanguageChoices.MAI:
      return r'MAI';
    case Enum$SurveySurveyConsentTranslationLanguageChoices.ML:
      return r'ML';
    case Enum$SurveySurveyConsentTranslationLanguageChoices.MNI:
      return r'MNI';
    case Enum$SurveySurveyConsentTranslationLanguageChoices.MR:
      return r'MR';
    case Enum$SurveySurveyConsentTranslationLanguageChoices.NE:
      return r'NE';
    case Enum$SurveySurveyConsentTranslationLanguageChoices.OR:
      return r'OR';
    case Enum$SurveySurveyConsentTranslationLanguageChoices.PA:
      return r'PA';
    case Enum$SurveySurveyConsentTranslationLanguageChoices.SA:
      return r'SA';
    case Enum$SurveySurveyConsentTranslationLanguageChoices.SAT:
      return r'SAT';
    case Enum$SurveySurveyConsentTranslationLanguageChoices.SD:
      return r'SD';
    case Enum$SurveySurveyConsentTranslationLanguageChoices.TA:
      return r'TA';
    case Enum$SurveySurveyConsentTranslationLanguageChoices.TE:
      return r'TE';
    case Enum$SurveySurveyConsentTranslationLanguageChoices.UR:
      return r'UR';
    case Enum$SurveySurveyConsentTranslationLanguageChoices.$unknown:
      return r'$unknown';
  }
}

Enum$SurveySurveyConsentTranslationLanguageChoices
    fromJson$Enum$SurveySurveyConsentTranslationLanguageChoices(String value) {
  switch (value) {
    case r'AS':
      return Enum$SurveySurveyConsentTranslationLanguageChoices.AS;
    case r'BN':
      return Enum$SurveySurveyConsentTranslationLanguageChoices.BN;
    case r'BRX':
      return Enum$SurveySurveyConsentTranslationLanguageChoices.BRX;
    case r'DOI':
      return Enum$SurveySurveyConsentTranslationLanguageChoices.DOI;
    case r'EN':
      return Enum$SurveySurveyConsentTranslationLanguageChoices.EN;
    case r'GU':
      return Enum$SurveySurveyConsentTranslationLanguageChoices.GU;
    case r'HI':
      return Enum$SurveySurveyConsentTranslationLanguageChoices.HI;
    case r'KN':
      return Enum$SurveySurveyConsentTranslationLanguageChoices.KN;
    case r'KOK':
      return Enum$SurveySurveyConsentTranslationLanguageChoices.KOK;
    case r'KS':
      return Enum$SurveySurveyConsentTranslationLanguageChoices.KS;
    case r'MAI':
      return Enum$SurveySurveyConsentTranslationLanguageChoices.MAI;
    case r'ML':
      return Enum$SurveySurveyConsentTranslationLanguageChoices.ML;
    case r'MNI':
      return Enum$SurveySurveyConsentTranslationLanguageChoices.MNI;
    case r'MR':
      return Enum$SurveySurveyConsentTranslationLanguageChoices.MR;
    case r'NE':
      return Enum$SurveySurveyConsentTranslationLanguageChoices.NE;
    case r'OR':
      return Enum$SurveySurveyConsentTranslationLanguageChoices.OR;
    case r'PA':
      return Enum$SurveySurveyConsentTranslationLanguageChoices.PA;
    case r'SA':
      return Enum$SurveySurveyConsentTranslationLanguageChoices.SA;
    case r'SAT':
      return Enum$SurveySurveyConsentTranslationLanguageChoices.SAT;
    case r'SD':
      return Enum$SurveySurveyConsentTranslationLanguageChoices.SD;
    case r'TA':
      return Enum$SurveySurveyConsentTranslationLanguageChoices.TA;
    case r'TE':
      return Enum$SurveySurveyConsentTranslationLanguageChoices.TE;
    case r'UR':
      return Enum$SurveySurveyConsentTranslationLanguageChoices.UR;
    default:
      return Enum$SurveySurveyConsentTranslationLanguageChoices.$unknown;
  }
}

enum Enum$SurveySurveyDefaultLanguageChoices {
  AS,
  BN,
  BRX,
  DOI,
  EN,
  GU,
  HI,
  KN,
  KOK,
  KS,
  MAI,
  ML,
  MNI,
  MR,
  NE,
  OR,
  PA,
  SA,
  SAT,
  SD,
  TA,
  TE,
  UR,
  $unknown;

  factory Enum$SurveySurveyDefaultLanguageChoices.fromJson(String value) =>
      fromJson$Enum$SurveySurveyDefaultLanguageChoices(value);

  String toJson() => toJson$Enum$SurveySurveyDefaultLanguageChoices(this);
}

String toJson$Enum$SurveySurveyDefaultLanguageChoices(
    Enum$SurveySurveyDefaultLanguageChoices e) {
  switch (e) {
    case Enum$SurveySurveyDefaultLanguageChoices.AS:
      return r'AS';
    case Enum$SurveySurveyDefaultLanguageChoices.BN:
      return r'BN';
    case Enum$SurveySurveyDefaultLanguageChoices.BRX:
      return r'BRX';
    case Enum$SurveySurveyDefaultLanguageChoices.DOI:
      return r'DOI';
    case Enum$SurveySurveyDefaultLanguageChoices.EN:
      return r'EN';
    case Enum$SurveySurveyDefaultLanguageChoices.GU:
      return r'GU';
    case Enum$SurveySurveyDefaultLanguageChoices.HI:
      return r'HI';
    case Enum$SurveySurveyDefaultLanguageChoices.KN:
      return r'KN';
    case Enum$SurveySurveyDefaultLanguageChoices.KOK:
      return r'KOK';
    case Enum$SurveySurveyDefaultLanguageChoices.KS:
      return r'KS';
    case Enum$SurveySurveyDefaultLanguageChoices.MAI:
      return r'MAI';
    case Enum$SurveySurveyDefaultLanguageChoices.ML:
      return r'ML';
    case Enum$SurveySurveyDefaultLanguageChoices.MNI:
      return r'MNI';
    case Enum$SurveySurveyDefaultLanguageChoices.MR:
      return r'MR';
    case Enum$SurveySurveyDefaultLanguageChoices.NE:
      return r'NE';
    case Enum$SurveySurveyDefaultLanguageChoices.OR:
      return r'OR';
    case Enum$SurveySurveyDefaultLanguageChoices.PA:
      return r'PA';
    case Enum$SurveySurveyDefaultLanguageChoices.SA:
      return r'SA';
    case Enum$SurveySurveyDefaultLanguageChoices.SAT:
      return r'SAT';
    case Enum$SurveySurveyDefaultLanguageChoices.SD:
      return r'SD';
    case Enum$SurveySurveyDefaultLanguageChoices.TA:
      return r'TA';
    case Enum$SurveySurveyDefaultLanguageChoices.TE:
      return r'TE';
    case Enum$SurveySurveyDefaultLanguageChoices.UR:
      return r'UR';
    case Enum$SurveySurveyDefaultLanguageChoices.$unknown:
      return r'$unknown';
  }
}

Enum$SurveySurveyDefaultLanguageChoices
    fromJson$Enum$SurveySurveyDefaultLanguageChoices(String value) {
  switch (value) {
    case r'AS':
      return Enum$SurveySurveyDefaultLanguageChoices.AS;
    case r'BN':
      return Enum$SurveySurveyDefaultLanguageChoices.BN;
    case r'BRX':
      return Enum$SurveySurveyDefaultLanguageChoices.BRX;
    case r'DOI':
      return Enum$SurveySurveyDefaultLanguageChoices.DOI;
    case r'EN':
      return Enum$SurveySurveyDefaultLanguageChoices.EN;
    case r'GU':
      return Enum$SurveySurveyDefaultLanguageChoices.GU;
    case r'HI':
      return Enum$SurveySurveyDefaultLanguageChoices.HI;
    case r'KN':
      return Enum$SurveySurveyDefaultLanguageChoices.KN;
    case r'KOK':
      return Enum$SurveySurveyDefaultLanguageChoices.KOK;
    case r'KS':
      return Enum$SurveySurveyDefaultLanguageChoices.KS;
    case r'MAI':
      return Enum$SurveySurveyDefaultLanguageChoices.MAI;
    case r'ML':
      return Enum$SurveySurveyDefaultLanguageChoices.ML;
    case r'MNI':
      return Enum$SurveySurveyDefaultLanguageChoices.MNI;
    case r'MR':
      return Enum$SurveySurveyDefaultLanguageChoices.MR;
    case r'NE':
      return Enum$SurveySurveyDefaultLanguageChoices.NE;
    case r'OR':
      return Enum$SurveySurveyDefaultLanguageChoices.OR;
    case r'PA':
      return Enum$SurveySurveyDefaultLanguageChoices.PA;
    case r'SA':
      return Enum$SurveySurveyDefaultLanguageChoices.SA;
    case r'SAT':
      return Enum$SurveySurveyDefaultLanguageChoices.SAT;
    case r'SD':
      return Enum$SurveySurveyDefaultLanguageChoices.SD;
    case r'TA':
      return Enum$SurveySurveyDefaultLanguageChoices.TA;
    case r'TE':
      return Enum$SurveySurveyDefaultLanguageChoices.TE;
    case r'UR':
      return Enum$SurveySurveyDefaultLanguageChoices.UR;
    default:
      return Enum$SurveySurveyDefaultLanguageChoices.$unknown;
  }
}

enum Enum$SurveySurveyDisplayModeChoices {
  PAGE_WISE,
  QUESTION_PER_PAGE,
  $unknown;

  factory Enum$SurveySurveyDisplayModeChoices.fromJson(String value) =>
      fromJson$Enum$SurveySurveyDisplayModeChoices(value);

  String toJson() => toJson$Enum$SurveySurveyDisplayModeChoices(this);
}

String toJson$Enum$SurveySurveyDisplayModeChoices(
    Enum$SurveySurveyDisplayModeChoices e) {
  switch (e) {
    case Enum$SurveySurveyDisplayModeChoices.PAGE_WISE:
      return r'PAGE_WISE';
    case Enum$SurveySurveyDisplayModeChoices.QUESTION_PER_PAGE:
      return r'QUESTION_PER_PAGE';
    case Enum$SurveySurveyDisplayModeChoices.$unknown:
      return r'$unknown';
  }
}

Enum$SurveySurveyDisplayModeChoices
    fromJson$Enum$SurveySurveyDisplayModeChoices(String value) {
  switch (value) {
    case r'PAGE_WISE':
      return Enum$SurveySurveyDisplayModeChoices.PAGE_WISE;
    case r'QUESTION_PER_PAGE':
      return Enum$SurveySurveyDisplayModeChoices.QUESTION_PER_PAGE;
    default:
      return Enum$SurveySurveyDisplayModeChoices.$unknown;
  }
}

enum Enum$SurveySurveyVisibilityChoices {
  PRIVATE,
  PUBLIC,
  $unknown;

  factory Enum$SurveySurveyVisibilityChoices.fromJson(String value) =>
      fromJson$Enum$SurveySurveyVisibilityChoices(value);

  String toJson() => toJson$Enum$SurveySurveyVisibilityChoices(this);
}

String toJson$Enum$SurveySurveyVisibilityChoices(
    Enum$SurveySurveyVisibilityChoices e) {
  switch (e) {
    case Enum$SurveySurveyVisibilityChoices.PRIVATE:
      return r'PRIVATE';
    case Enum$SurveySurveyVisibilityChoices.PUBLIC:
      return r'PUBLIC';
    case Enum$SurveySurveyVisibilityChoices.$unknown:
      return r'$unknown';
  }
}

Enum$SurveySurveyVisibilityChoices fromJson$Enum$SurveySurveyVisibilityChoices(
    String value) {
  switch (value) {
    case r'PRIVATE':
      return Enum$SurveySurveyVisibilityChoices.PRIVATE;
    case r'PUBLIC':
      return Enum$SurveySurveyVisibilityChoices.PUBLIC;
    default:
      return Enum$SurveySurveyVisibilityChoices.$unknown;
  }
}

enum Enum$__TypeKind {
  SCALAR,
  OBJECT,
  INTERFACE,
  UNION,
  ENUM,
  INPUT_OBJECT,
  LIST,
  NON_NULL,
  $unknown;

  factory Enum$__TypeKind.fromJson(String value) =>
      fromJson$Enum$__TypeKind(value);

  String toJson() => toJson$Enum$__TypeKind(this);
}

String toJson$Enum$__TypeKind(Enum$__TypeKind e) {
  switch (e) {
    case Enum$__TypeKind.SCALAR:
      return r'SCALAR';
    case Enum$__TypeKind.OBJECT:
      return r'OBJECT';
    case Enum$__TypeKind.INTERFACE:
      return r'INTERFACE';
    case Enum$__TypeKind.UNION:
      return r'UNION';
    case Enum$__TypeKind.ENUM:
      return r'ENUM';
    case Enum$__TypeKind.INPUT_OBJECT:
      return r'INPUT_OBJECT';
    case Enum$__TypeKind.LIST:
      return r'LIST';
    case Enum$__TypeKind.NON_NULL:
      return r'NON_NULL';
    case Enum$__TypeKind.$unknown:
      return r'$unknown';
  }
}

Enum$__TypeKind fromJson$Enum$__TypeKind(String value) {
  switch (value) {
    case r'SCALAR':
      return Enum$__TypeKind.SCALAR;
    case r'OBJECT':
      return Enum$__TypeKind.OBJECT;
    case r'INTERFACE':
      return Enum$__TypeKind.INTERFACE;
    case r'UNION':
      return Enum$__TypeKind.UNION;
    case r'ENUM':
      return Enum$__TypeKind.ENUM;
    case r'INPUT_OBJECT':
      return Enum$__TypeKind.INPUT_OBJECT;
    case r'LIST':
      return Enum$__TypeKind.LIST;
    case r'NON_NULL':
      return Enum$__TypeKind.NON_NULL;
    default:
      return Enum$__TypeKind.$unknown;
  }
}

enum Enum$__DirectiveLocation {
  QUERY,
  MUTATION,
  SUBSCRIPTION,
  FIELD,
  FRAGMENT_DEFINITION,
  FRAGMENT_SPREAD,
  INLINE_FRAGMENT,
  VARIABLE_DEFINITION,
  SCHEMA,
  SCALAR,
  OBJECT,
  FIELD_DEFINITION,
  ARGUMENT_DEFINITION,
  INTERFACE,
  UNION,
  ENUM,
  ENUM_VALUE,
  INPUT_OBJECT,
  INPUT_FIELD_DEFINITION,
  $unknown;

  factory Enum$__DirectiveLocation.fromJson(String value) =>
      fromJson$Enum$__DirectiveLocation(value);

  String toJson() => toJson$Enum$__DirectiveLocation(this);
}

String toJson$Enum$__DirectiveLocation(Enum$__DirectiveLocation e) {
  switch (e) {
    case Enum$__DirectiveLocation.QUERY:
      return r'QUERY';
    case Enum$__DirectiveLocation.MUTATION:
      return r'MUTATION';
    case Enum$__DirectiveLocation.SUBSCRIPTION:
      return r'SUBSCRIPTION';
    case Enum$__DirectiveLocation.FIELD:
      return r'FIELD';
    case Enum$__DirectiveLocation.FRAGMENT_DEFINITION:
      return r'FRAGMENT_DEFINITION';
    case Enum$__DirectiveLocation.FRAGMENT_SPREAD:
      return r'FRAGMENT_SPREAD';
    case Enum$__DirectiveLocation.INLINE_FRAGMENT:
      return r'INLINE_FRAGMENT';
    case Enum$__DirectiveLocation.VARIABLE_DEFINITION:
      return r'VARIABLE_DEFINITION';
    case Enum$__DirectiveLocation.SCHEMA:
      return r'SCHEMA';
    case Enum$__DirectiveLocation.SCALAR:
      return r'SCALAR';
    case Enum$__DirectiveLocation.OBJECT:
      return r'OBJECT';
    case Enum$__DirectiveLocation.FIELD_DEFINITION:
      return r'FIELD_DEFINITION';
    case Enum$__DirectiveLocation.ARGUMENT_DEFINITION:
      return r'ARGUMENT_DEFINITION';
    case Enum$__DirectiveLocation.INTERFACE:
      return r'INTERFACE';
    case Enum$__DirectiveLocation.UNION:
      return r'UNION';
    case Enum$__DirectiveLocation.ENUM:
      return r'ENUM';
    case Enum$__DirectiveLocation.ENUM_VALUE:
      return r'ENUM_VALUE';
    case Enum$__DirectiveLocation.INPUT_OBJECT:
      return r'INPUT_OBJECT';
    case Enum$__DirectiveLocation.INPUT_FIELD_DEFINITION:
      return r'INPUT_FIELD_DEFINITION';
    case Enum$__DirectiveLocation.$unknown:
      return r'$unknown';
  }
}

Enum$__DirectiveLocation fromJson$Enum$__DirectiveLocation(String value) {
  switch (value) {
    case r'QUERY':
      return Enum$__DirectiveLocation.QUERY;
    case r'MUTATION':
      return Enum$__DirectiveLocation.MUTATION;
    case r'SUBSCRIPTION':
      return Enum$__DirectiveLocation.SUBSCRIPTION;
    case r'FIELD':
      return Enum$__DirectiveLocation.FIELD;
    case r'FRAGMENT_DEFINITION':
      return Enum$__DirectiveLocation.FRAGMENT_DEFINITION;
    case r'FRAGMENT_SPREAD':
      return Enum$__DirectiveLocation.FRAGMENT_SPREAD;
    case r'INLINE_FRAGMENT':
      return Enum$__DirectiveLocation.INLINE_FRAGMENT;
    case r'VARIABLE_DEFINITION':
      return Enum$__DirectiveLocation.VARIABLE_DEFINITION;
    case r'SCHEMA':
      return Enum$__DirectiveLocation.SCHEMA;
    case r'SCALAR':
      return Enum$__DirectiveLocation.SCALAR;
    case r'OBJECT':
      return Enum$__DirectiveLocation.OBJECT;
    case r'FIELD_DEFINITION':
      return Enum$__DirectiveLocation.FIELD_DEFINITION;
    case r'ARGUMENT_DEFINITION':
      return Enum$__DirectiveLocation.ARGUMENT_DEFINITION;
    case r'INTERFACE':
      return Enum$__DirectiveLocation.INTERFACE;
    case r'UNION':
      return Enum$__DirectiveLocation.UNION;
    case r'ENUM':
      return Enum$__DirectiveLocation.ENUM;
    case r'ENUM_VALUE':
      return Enum$__DirectiveLocation.ENUM_VALUE;
    case r'INPUT_OBJECT':
      return Enum$__DirectiveLocation.INPUT_OBJECT;
    case r'INPUT_FIELD_DEFINITION':
      return Enum$__DirectiveLocation.INPUT_FIELD_DEFINITION;
    default:
      return Enum$__DirectiveLocation.$unknown;
  }
}

const possibleTypesMap = <String, Set<String>>{
  'Node': {
    'BoardDirectorProfileNode',
    'BusinessOperationsSubmissionNode',
    'CEOProfileSubmissionNode',
    'ComplianceDetailsSubmissionNode',
    'FPODetailsSubmissionNode',
    'FPONode',
    'FinancialDetailsSubmissionV2Node',
    'GovernanceSubmissionNode',
    'OptionConditionNode',
    'OptionWarningTranslationNode',
    'ProcessesSystemsSubmissionNode',
    'QuestionConditionNode',
    'QuestionNode',
    'QuestionOptionNode',
    'SubmissionAnswerNode',
    'SubmissionNode',
    'SurveyConsentTranslationNode',
    'SurveyNode',
    'SurveyPageNode',
    'SustainableActivitiesSubmissionNode',
    'UserNode',
    'YearlySubmissionNode',
  }
};
