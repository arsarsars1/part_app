// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trainer_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TrainerRequest _$TrainerRequestFromJson(Map<String, dynamic> json) {
  return _TrainerRequest.fromJson(json);
}

/// @nodoc
mixin _$TrainerRequest {
  String? get name => throw _privateConstructorUsedError;
  String? get mobileNo => throw _privateConstructorUsedError;
  int? get countryCode => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  String? get dob => throw _privateConstructorUsedError;
  String? get doj => throw _privateConstructorUsedError;
  String? get whatsappNo => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get salaryType => throw _privateConstructorUsedError;
  String? get expertise => throw _privateConstructorUsedError;
  int? get salaryDate => throw _privateConstructorUsedError;
  String? get salaryAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "branch_id[]")
  dynamic get branchId => throw _privateConstructorUsedError;
  String? get upiId => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;

  /// Serializes this TrainerRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TrainerRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TrainerRequestCopyWith<TrainerRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrainerRequestCopyWith<$Res> {
  factory $TrainerRequestCopyWith(
          TrainerRequest value, $Res Function(TrainerRequest) then) =
      _$TrainerRequestCopyWithImpl<$Res, TrainerRequest>;
  @useResult
  $Res call(
      {String? name,
      String? mobileNo,
      int? countryCode,
      String? gender,
      String? dob,
      String? doj,
      String? whatsappNo,
      String? email,
      String? salaryType,
      String? expertise,
      int? salaryDate,
      String? salaryAmount,
      @JsonKey(name: "branch_id[]") dynamic branchId,
      String? upiId,
      String? address});
}

/// @nodoc
class _$TrainerRequestCopyWithImpl<$Res, $Val extends TrainerRequest>
    implements $TrainerRequestCopyWith<$Res> {
  _$TrainerRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TrainerRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? mobileNo = freezed,
    Object? countryCode = freezed,
    Object? gender = freezed,
    Object? dob = freezed,
    Object? doj = freezed,
    Object? whatsappNo = freezed,
    Object? email = freezed,
    Object? salaryType = freezed,
    Object? expertise = freezed,
    Object? salaryDate = freezed,
    Object? salaryAmount = freezed,
    Object? branchId = freezed,
    Object? upiId = freezed,
    Object? address = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNo: freezed == mobileNo
          ? _value.mobileNo
          : mobileNo // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as int?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String?,
      doj: freezed == doj
          ? _value.doj
          : doj // ignore: cast_nullable_to_non_nullable
              as String?,
      whatsappNo: freezed == whatsappNo
          ? _value.whatsappNo
          : whatsappNo // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      salaryType: freezed == salaryType
          ? _value.salaryType
          : salaryType // ignore: cast_nullable_to_non_nullable
              as String?,
      expertise: freezed == expertise
          ? _value.expertise
          : expertise // ignore: cast_nullable_to_non_nullable
              as String?,
      salaryDate: freezed == salaryDate
          ? _value.salaryDate
          : salaryDate // ignore: cast_nullable_to_non_nullable
              as int?,
      salaryAmount: freezed == salaryAmount
          ? _value.salaryAmount
          : salaryAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      upiId: freezed == upiId
          ? _value.upiId
          : upiId // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TrainerRequestImplCopyWith<$Res>
    implements $TrainerRequestCopyWith<$Res> {
  factory _$$TrainerRequestImplCopyWith(_$TrainerRequestImpl value,
          $Res Function(_$TrainerRequestImpl) then) =
      __$$TrainerRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      String? mobileNo,
      int? countryCode,
      String? gender,
      String? dob,
      String? doj,
      String? whatsappNo,
      String? email,
      String? salaryType,
      String? expertise,
      int? salaryDate,
      String? salaryAmount,
      @JsonKey(name: "branch_id[]") dynamic branchId,
      String? upiId,
      String? address});
}

/// @nodoc
class __$$TrainerRequestImplCopyWithImpl<$Res>
    extends _$TrainerRequestCopyWithImpl<$Res, _$TrainerRequestImpl>
    implements _$$TrainerRequestImplCopyWith<$Res> {
  __$$TrainerRequestImplCopyWithImpl(
      _$TrainerRequestImpl _value, $Res Function(_$TrainerRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of TrainerRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? mobileNo = freezed,
    Object? countryCode = freezed,
    Object? gender = freezed,
    Object? dob = freezed,
    Object? doj = freezed,
    Object? whatsappNo = freezed,
    Object? email = freezed,
    Object? salaryType = freezed,
    Object? expertise = freezed,
    Object? salaryDate = freezed,
    Object? salaryAmount = freezed,
    Object? branchId = freezed,
    Object? upiId = freezed,
    Object? address = freezed,
  }) {
    return _then(_$TrainerRequestImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNo: freezed == mobileNo
          ? _value.mobileNo
          : mobileNo // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as int?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String?,
      doj: freezed == doj
          ? _value.doj
          : doj // ignore: cast_nullable_to_non_nullable
              as String?,
      whatsappNo: freezed == whatsappNo
          ? _value.whatsappNo
          : whatsappNo // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      salaryType: freezed == salaryType
          ? _value.salaryType
          : salaryType // ignore: cast_nullable_to_non_nullable
              as String?,
      expertise: freezed == expertise
          ? _value.expertise
          : expertise // ignore: cast_nullable_to_non_nullable
              as String?,
      salaryDate: freezed == salaryDate
          ? _value.salaryDate
          : salaryDate // ignore: cast_nullable_to_non_nullable
              as int?,
      salaryAmount: freezed == salaryAmount
          ? _value.salaryAmount
          : salaryAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      upiId: freezed == upiId
          ? _value.upiId
          : upiId // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$TrainerRequestImpl implements _TrainerRequest {
  const _$TrainerRequestImpl(
      {this.name,
      this.mobileNo,
      this.countryCode,
      this.gender,
      this.dob,
      this.doj,
      this.whatsappNo,
      this.email,
      this.salaryType,
      this.expertise,
      this.salaryDate,
      this.salaryAmount,
      @JsonKey(name: "branch_id[]") this.branchId,
      this.upiId,
      this.address});

  factory _$TrainerRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrainerRequestImplFromJson(json);

  @override
  final String? name;
  @override
  final String? mobileNo;
  @override
  final int? countryCode;
  @override
  final String? gender;
  @override
  final String? dob;
  @override
  final String? doj;
  @override
  final String? whatsappNo;
  @override
  final String? email;
  @override
  final String? salaryType;
  @override
  final String? expertise;
  @override
  final int? salaryDate;
  @override
  final String? salaryAmount;
  @override
  @JsonKey(name: "branch_id[]")
  final dynamic branchId;
  @override
  final String? upiId;
  @override
  final String? address;

  @override
  String toString() {
    return 'TrainerRequest(name: $name, mobileNo: $mobileNo, countryCode: $countryCode, gender: $gender, dob: $dob, doj: $doj, whatsappNo: $whatsappNo, email: $email, salaryType: $salaryType, expertise: $expertise, salaryDate: $salaryDate, salaryAmount: $salaryAmount, branchId: $branchId, upiId: $upiId, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrainerRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.mobileNo, mobileNo) ||
                other.mobileNo == mobileNo) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            (identical(other.doj, doj) || other.doj == doj) &&
            (identical(other.whatsappNo, whatsappNo) ||
                other.whatsappNo == whatsappNo) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.salaryType, salaryType) ||
                other.salaryType == salaryType) &&
            (identical(other.expertise, expertise) ||
                other.expertise == expertise) &&
            (identical(other.salaryDate, salaryDate) ||
                other.salaryDate == salaryDate) &&
            (identical(other.salaryAmount, salaryAmount) ||
                other.salaryAmount == salaryAmount) &&
            const DeepCollectionEquality().equals(other.branchId, branchId) &&
            (identical(other.upiId, upiId) || other.upiId == upiId) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      mobileNo,
      countryCode,
      gender,
      dob,
      doj,
      whatsappNo,
      email,
      salaryType,
      expertise,
      salaryDate,
      salaryAmount,
      const DeepCollectionEquality().hash(branchId),
      upiId,
      address);

  /// Create a copy of TrainerRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TrainerRequestImplCopyWith<_$TrainerRequestImpl> get copyWith =>
      __$$TrainerRequestImplCopyWithImpl<_$TrainerRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrainerRequestImplToJson(
      this,
    );
  }
}

abstract class _TrainerRequest implements TrainerRequest {
  const factory _TrainerRequest(
      {final String? name,
      final String? mobileNo,
      final int? countryCode,
      final String? gender,
      final String? dob,
      final String? doj,
      final String? whatsappNo,
      final String? email,
      final String? salaryType,
      final String? expertise,
      final int? salaryDate,
      final String? salaryAmount,
      @JsonKey(name: "branch_id[]") final dynamic branchId,
      final String? upiId,
      final String? address}) = _$TrainerRequestImpl;

  factory _TrainerRequest.fromJson(Map<String, dynamic> json) =
      _$TrainerRequestImpl.fromJson;

  @override
  String? get name;
  @override
  String? get mobileNo;
  @override
  int? get countryCode;
  @override
  String? get gender;
  @override
  String? get dob;
  @override
  String? get doj;
  @override
  String? get whatsappNo;
  @override
  String? get email;
  @override
  String? get salaryType;
  @override
  String? get expertise;
  @override
  int? get salaryDate;
  @override
  String? get salaryAmount;
  @override
  @JsonKey(name: "branch_id[]")
  dynamic get branchId;
  @override
  String? get upiId;
  @override
  String? get address;

  /// Create a copy of TrainerRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TrainerRequestImplCopyWith<_$TrainerRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
