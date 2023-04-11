// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cancel_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CancelResponse _$CancelResponseFromJson(Map<String, dynamic> json) {
  return _CancelResponse.fromJson(json);
}

/// @nodoc
mixin _$CancelResponse {
  int? get status => throw _privateConstructorUsedError;
  List<CancelledClass>? get cancelledClasses =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CancelResponseCopyWith<CancelResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CancelResponseCopyWith<$Res> {
  factory $CancelResponseCopyWith(
          CancelResponse value, $Res Function(CancelResponse) then) =
      _$CancelResponseCopyWithImpl<$Res, CancelResponse>;
  @useResult
  $Res call({int? status, List<CancelledClass>? cancelledClasses});
}

/// @nodoc
class _$CancelResponseCopyWithImpl<$Res, $Val extends CancelResponse>
    implements $CancelResponseCopyWith<$Res> {
  _$CancelResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? cancelledClasses = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      cancelledClasses: freezed == cancelledClasses
          ? _value.cancelledClasses
          : cancelledClasses // ignore: cast_nullable_to_non_nullable
              as List<CancelledClass>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CancelResponseCopyWith<$Res>
    implements $CancelResponseCopyWith<$Res> {
  factory _$$_CancelResponseCopyWith(
          _$_CancelResponse value, $Res Function(_$_CancelResponse) then) =
      __$$_CancelResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? status, List<CancelledClass>? cancelledClasses});
}

/// @nodoc
class __$$_CancelResponseCopyWithImpl<$Res>
    extends _$CancelResponseCopyWithImpl<$Res, _$_CancelResponse>
    implements _$$_CancelResponseCopyWith<$Res> {
  __$$_CancelResponseCopyWithImpl(
      _$_CancelResponse _value, $Res Function(_$_CancelResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? cancelledClasses = freezed,
  }) {
    return _then(_$_CancelResponse(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      cancelledClasses: freezed == cancelledClasses
          ? _value._cancelledClasses
          : cancelledClasses // ignore: cast_nullable_to_non_nullable
              as List<CancelledClass>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_CancelResponse implements _CancelResponse {
  const _$_CancelResponse(
      {this.status, final List<CancelledClass>? cancelledClasses})
      : _cancelledClasses = cancelledClasses;

  factory _$_CancelResponse.fromJson(Map<String, dynamic> json) =>
      _$$_CancelResponseFromJson(json);

  @override
  final int? status;
  final List<CancelledClass>? _cancelledClasses;
  @override
  List<CancelledClass>? get cancelledClasses {
    final value = _cancelledClasses;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CancelResponse(status: $status, cancelledClasses: $cancelledClasses)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CancelResponse &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._cancelledClasses, _cancelledClasses));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(_cancelledClasses));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CancelResponseCopyWith<_$_CancelResponse> get copyWith =>
      __$$_CancelResponseCopyWithImpl<_$_CancelResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CancelResponseToJson(
      this,
    );
  }
}

abstract class _CancelResponse implements CancelResponse {
  const factory _CancelResponse(
      {final int? status,
      final List<CancelledClass>? cancelledClasses}) = _$_CancelResponse;

  factory _CancelResponse.fromJson(Map<String, dynamic> json) =
      _$_CancelResponse.fromJson;

  @override
  int? get status;
  @override
  List<CancelledClass>? get cancelledClasses;
  @override
  @JsonKey(ignore: true)
  _$$_CancelResponseCopyWith<_$_CancelResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

CancelledClass _$CancelledClassFromJson(Map<String, dynamic> json) {
  return _CancelledClass.fromJson(json);
}

/// @nodoc
mixin _$CancelledClass {
  int? get id => throw _privateConstructorUsedError;
  int? get batchId => throw _privateConstructorUsedError;
  DateTime? get classDate => throw _privateConstructorUsedError;
  String? get startTime => throw _privateConstructorUsedError;
  String? get endTime => throw _privateConstructorUsedError;
  String? get reason => throw _privateConstructorUsedError;
  String? get cancelledByType => throw _privateConstructorUsedError;
  int? get cancelledById => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  CancelledBy? get cancelledBy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CancelledClassCopyWith<CancelledClass> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CancelledClassCopyWith<$Res> {
  factory $CancelledClassCopyWith(
          CancelledClass value, $Res Function(CancelledClass) then) =
      _$CancelledClassCopyWithImpl<$Res, CancelledClass>;
  @useResult
  $Res call(
      {int? id,
      int? batchId,
      DateTime? classDate,
      String? startTime,
      String? endTime,
      String? reason,
      String? cancelledByType,
      int? cancelledById,
      DateTime? createdAt,
      DateTime? updatedAt,
      CancelledBy? cancelledBy});

  $CancelledByCopyWith<$Res>? get cancelledBy;
}

/// @nodoc
class _$CancelledClassCopyWithImpl<$Res, $Val extends CancelledClass>
    implements $CancelledClassCopyWith<$Res> {
  _$CancelledClassCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? batchId = freezed,
    Object? classDate = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? reason = freezed,
    Object? cancelledByType = freezed,
    Object? cancelledById = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? cancelledBy = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      batchId: freezed == batchId
          ? _value.batchId
          : batchId // ignore: cast_nullable_to_non_nullable
              as int?,
      classDate: freezed == classDate
          ? _value.classDate
          : classDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      cancelledByType: freezed == cancelledByType
          ? _value.cancelledByType
          : cancelledByType // ignore: cast_nullable_to_non_nullable
              as String?,
      cancelledById: freezed == cancelledById
          ? _value.cancelledById
          : cancelledById // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      cancelledBy: freezed == cancelledBy
          ? _value.cancelledBy
          : cancelledBy // ignore: cast_nullable_to_non_nullable
              as CancelledBy?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CancelledByCopyWith<$Res>? get cancelledBy {
    if (_value.cancelledBy == null) {
      return null;
    }

    return $CancelledByCopyWith<$Res>(_value.cancelledBy!, (value) {
      return _then(_value.copyWith(cancelledBy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CancelledClassCopyWith<$Res>
    implements $CancelledClassCopyWith<$Res> {
  factory _$$_CancelledClassCopyWith(
          _$_CancelledClass value, $Res Function(_$_CancelledClass) then) =
      __$$_CancelledClassCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? batchId,
      DateTime? classDate,
      String? startTime,
      String? endTime,
      String? reason,
      String? cancelledByType,
      int? cancelledById,
      DateTime? createdAt,
      DateTime? updatedAt,
      CancelledBy? cancelledBy});

  @override
  $CancelledByCopyWith<$Res>? get cancelledBy;
}

/// @nodoc
class __$$_CancelledClassCopyWithImpl<$Res>
    extends _$CancelledClassCopyWithImpl<$Res, _$_CancelledClass>
    implements _$$_CancelledClassCopyWith<$Res> {
  __$$_CancelledClassCopyWithImpl(
      _$_CancelledClass _value, $Res Function(_$_CancelledClass) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? batchId = freezed,
    Object? classDate = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? reason = freezed,
    Object? cancelledByType = freezed,
    Object? cancelledById = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? cancelledBy = freezed,
  }) {
    return _then(_$_CancelledClass(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      batchId: freezed == batchId
          ? _value.batchId
          : batchId // ignore: cast_nullable_to_non_nullable
              as int?,
      classDate: freezed == classDate
          ? _value.classDate
          : classDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      cancelledByType: freezed == cancelledByType
          ? _value.cancelledByType
          : cancelledByType // ignore: cast_nullable_to_non_nullable
              as String?,
      cancelledById: freezed == cancelledById
          ? _value.cancelledById
          : cancelledById // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      cancelledBy: freezed == cancelledBy
          ? _value.cancelledBy
          : cancelledBy // ignore: cast_nullable_to_non_nullable
              as CancelledBy?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_CancelledClass implements _CancelledClass {
  const _$_CancelledClass(
      {this.id,
      this.batchId,
      this.classDate,
      this.startTime,
      this.endTime,
      this.reason,
      this.cancelledByType,
      this.cancelledById,
      this.createdAt,
      this.updatedAt,
      this.cancelledBy});

  factory _$_CancelledClass.fromJson(Map<String, dynamic> json) =>
      _$$_CancelledClassFromJson(json);

  @override
  final int? id;
  @override
  final int? batchId;
  @override
  final DateTime? classDate;
  @override
  final String? startTime;
  @override
  final String? endTime;
  @override
  final String? reason;
  @override
  final String? cancelledByType;
  @override
  final int? cancelledById;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final CancelledBy? cancelledBy;

  @override
  String toString() {
    return 'CancelledClass(id: $id, batchId: $batchId, classDate: $classDate, startTime: $startTime, endTime: $endTime, reason: $reason, cancelledByType: $cancelledByType, cancelledById: $cancelledById, createdAt: $createdAt, updatedAt: $updatedAt, cancelledBy: $cancelledBy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CancelledClass &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.batchId, batchId) || other.batchId == batchId) &&
            (identical(other.classDate, classDate) ||
                other.classDate == classDate) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.cancelledByType, cancelledByType) ||
                other.cancelledByType == cancelledByType) &&
            (identical(other.cancelledById, cancelledById) ||
                other.cancelledById == cancelledById) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.cancelledBy, cancelledBy) ||
                other.cancelledBy == cancelledBy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      batchId,
      classDate,
      startTime,
      endTime,
      reason,
      cancelledByType,
      cancelledById,
      createdAt,
      updatedAt,
      cancelledBy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CancelledClassCopyWith<_$_CancelledClass> get copyWith =>
      __$$_CancelledClassCopyWithImpl<_$_CancelledClass>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CancelledClassToJson(
      this,
    );
  }
}

abstract class _CancelledClass implements CancelledClass {
  const factory _CancelledClass(
      {final int? id,
      final int? batchId,
      final DateTime? classDate,
      final String? startTime,
      final String? endTime,
      final String? reason,
      final String? cancelledByType,
      final int? cancelledById,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      final CancelledBy? cancelledBy}) = _$_CancelledClass;

  factory _CancelledClass.fromJson(Map<String, dynamic> json) =
      _$_CancelledClass.fromJson;

  @override
  int? get id;
  @override
  int? get batchId;
  @override
  DateTime? get classDate;
  @override
  String? get startTime;
  @override
  String? get endTime;
  @override
  String? get reason;
  @override
  String? get cancelledByType;
  @override
  int? get cancelledById;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  CancelledBy? get cancelledBy;
  @override
  @JsonKey(ignore: true)
  _$$_CancelledClassCopyWith<_$_CancelledClass> get copyWith =>
      throw _privateConstructorUsedError;
}

CancelledBy _$CancelledByFromJson(Map<String, dynamic> json) {
  return _CancelledBy.fromJson(json);
}

/// @nodoc
mixin _$CancelledBy {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  int? get userId => throw _privateConstructorUsedError;
  String? get whatsappNo => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  DateTime? get dob => throw _privateConstructorUsedError;
  DateTime? get doj => throw _privateConstructorUsedError;
  String? get profilePic => throw _privateConstructorUsedError;
  int? get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CancelledByCopyWith<CancelledBy> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CancelledByCopyWith<$Res> {
  factory $CancelledByCopyWith(
          CancelledBy value, $Res Function(CancelledBy) then) =
      _$CancelledByCopyWithImpl<$Res, CancelledBy>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      int? userId,
      String? whatsappNo,
      String? email,
      String? gender,
      DateTime? dob,
      DateTime? doj,
      String? profilePic,
      int? isActive});
}

/// @nodoc
class _$CancelledByCopyWithImpl<$Res, $Val extends CancelledBy>
    implements $CancelledByCopyWith<$Res> {
  _$CancelledByCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? userId = freezed,
    Object? whatsappNo = freezed,
    Object? email = freezed,
    Object? gender = freezed,
    Object? dob = freezed,
    Object? doj = freezed,
    Object? profilePic = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      whatsappNo: freezed == whatsappNo
          ? _value.whatsappNo
          : whatsappNo // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      doj: freezed == doj
          ? _value.doj
          : doj // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      profilePic: freezed == profilePic
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CancelledByCopyWith<$Res>
    implements $CancelledByCopyWith<$Res> {
  factory _$$_CancelledByCopyWith(
          _$_CancelledBy value, $Res Function(_$_CancelledBy) then) =
      __$$_CancelledByCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      int? userId,
      String? whatsappNo,
      String? email,
      String? gender,
      DateTime? dob,
      DateTime? doj,
      String? profilePic,
      int? isActive});
}

/// @nodoc
class __$$_CancelledByCopyWithImpl<$Res>
    extends _$CancelledByCopyWithImpl<$Res, _$_CancelledBy>
    implements _$$_CancelledByCopyWith<$Res> {
  __$$_CancelledByCopyWithImpl(
      _$_CancelledBy _value, $Res Function(_$_CancelledBy) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? userId = freezed,
    Object? whatsappNo = freezed,
    Object? email = freezed,
    Object? gender = freezed,
    Object? dob = freezed,
    Object? doj = freezed,
    Object? profilePic = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_$_CancelledBy(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      whatsappNo: freezed == whatsappNo
          ? _value.whatsappNo
          : whatsappNo // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      doj: freezed == doj
          ? _value.doj
          : doj // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      profilePic: freezed == profilePic
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_CancelledBy implements _CancelledBy {
  const _$_CancelledBy(
      {this.id,
      this.name,
      this.userId,
      this.whatsappNo,
      this.email,
      this.gender,
      this.dob,
      this.doj,
      this.profilePic,
      this.isActive});

  factory _$_CancelledBy.fromJson(Map<String, dynamic> json) =>
      _$$_CancelledByFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final int? userId;
  @override
  final String? whatsappNo;
  @override
  final String? email;
  @override
  final String? gender;
  @override
  final DateTime? dob;
  @override
  final DateTime? doj;
  @override
  final String? profilePic;
  @override
  final int? isActive;

  @override
  String toString() {
    return 'CancelledBy(id: $id, name: $name, userId: $userId, whatsappNo: $whatsappNo, email: $email, gender: $gender, dob: $dob, doj: $doj, profilePic: $profilePic, isActive: $isActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CancelledBy &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.whatsappNo, whatsappNo) ||
                other.whatsappNo == whatsappNo) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            (identical(other.doj, doj) || other.doj == doj) &&
            (identical(other.profilePic, profilePic) ||
                other.profilePic == profilePic) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, userId, whatsappNo,
      email, gender, dob, doj, profilePic, isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CancelledByCopyWith<_$_CancelledBy> get copyWith =>
      __$$_CancelledByCopyWithImpl<_$_CancelledBy>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CancelledByToJson(
      this,
    );
  }
}

abstract class _CancelledBy implements CancelledBy {
  const factory _CancelledBy(
      {final int? id,
      final String? name,
      final int? userId,
      final String? whatsappNo,
      final String? email,
      final String? gender,
      final DateTime? dob,
      final DateTime? doj,
      final String? profilePic,
      final int? isActive}) = _$_CancelledBy;

  factory _CancelledBy.fromJson(Map<String, dynamic> json) =
      _$_CancelledBy.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  int? get userId;
  @override
  String? get whatsappNo;
  @override
  String? get email;
  @override
  String? get gender;
  @override
  DateTime? get dob;
  @override
  DateTime? get doj;
  @override
  String? get profilePic;
  @override
  int? get isActive;
  @override
  @JsonKey(ignore: true)
  _$$_CancelledByCopyWith<_$_CancelledBy> get copyWith =>
      throw _privateConstructorUsedError;
}
