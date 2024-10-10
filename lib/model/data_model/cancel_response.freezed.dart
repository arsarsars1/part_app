// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cancel_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CancelResponse _$CancelResponseFromJson(Map<String, dynamic> json) {
  return _CancelResponse.fromJson(json);
}

/// @nodoc
mixin _$CancelResponse {
  int? get status => throw _privateConstructorUsedError;
  List<CancelledClass>? get cancelledClasses =>
      throw _privateConstructorUsedError;

  /// Serializes this CancelResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CancelResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of CancelResponse
  /// with the given fields replaced by the non-null parameter values.
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
abstract class _$$CancelResponseImplCopyWith<$Res>
    implements $CancelResponseCopyWith<$Res> {
  factory _$$CancelResponseImplCopyWith(_$CancelResponseImpl value,
          $Res Function(_$CancelResponseImpl) then) =
      __$$CancelResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? status, List<CancelledClass>? cancelledClasses});
}

/// @nodoc
class __$$CancelResponseImplCopyWithImpl<$Res>
    extends _$CancelResponseCopyWithImpl<$Res, _$CancelResponseImpl>
    implements _$$CancelResponseImplCopyWith<$Res> {
  __$$CancelResponseImplCopyWithImpl(
      _$CancelResponseImpl _value, $Res Function(_$CancelResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of CancelResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? cancelledClasses = freezed,
  }) {
    return _then(_$CancelResponseImpl(
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
class _$CancelResponseImpl implements _CancelResponse {
  const _$CancelResponseImpl(
      {this.status, final List<CancelledClass>? cancelledClasses})
      : _cancelledClasses = cancelledClasses;

  factory _$CancelResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CancelResponseImplFromJson(json);

  @override
  final int? status;
  final List<CancelledClass>? _cancelledClasses;
  @override
  List<CancelledClass>? get cancelledClasses {
    final value = _cancelledClasses;
    if (value == null) return null;
    if (_cancelledClasses is EqualUnmodifiableListView)
      return _cancelledClasses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CancelResponse(status: $status, cancelledClasses: $cancelledClasses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CancelResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._cancelledClasses, _cancelledClasses));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(_cancelledClasses));

  /// Create a copy of CancelResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CancelResponseImplCopyWith<_$CancelResponseImpl> get copyWith =>
      __$$CancelResponseImplCopyWithImpl<_$CancelResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CancelResponseImplToJson(
      this,
    );
  }
}

abstract class _CancelResponse implements CancelResponse {
  const factory _CancelResponse(
      {final int? status,
      final List<CancelledClass>? cancelledClasses}) = _$CancelResponseImpl;

  factory _CancelResponse.fromJson(Map<String, dynamic> json) =
      _$CancelResponseImpl.fromJson;

  @override
  int? get status;
  @override
  List<CancelledClass>? get cancelledClasses;

  /// Create a copy of CancelResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CancelResponseImplCopyWith<_$CancelResponseImpl> get copyWith =>
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

  /// Serializes this CancelledClass to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CancelledClass
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of CancelledClass
  /// with the given fields replaced by the non-null parameter values.
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

  /// Create a copy of CancelledClass
  /// with the given fields replaced by the non-null parameter values.
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
abstract class _$$CancelledClassImplCopyWith<$Res>
    implements $CancelledClassCopyWith<$Res> {
  factory _$$CancelledClassImplCopyWith(_$CancelledClassImpl value,
          $Res Function(_$CancelledClassImpl) then) =
      __$$CancelledClassImplCopyWithImpl<$Res>;
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
class __$$CancelledClassImplCopyWithImpl<$Res>
    extends _$CancelledClassCopyWithImpl<$Res, _$CancelledClassImpl>
    implements _$$CancelledClassImplCopyWith<$Res> {
  __$$CancelledClassImplCopyWithImpl(
      _$CancelledClassImpl _value, $Res Function(_$CancelledClassImpl) _then)
      : super(_value, _then);

  /// Create a copy of CancelledClass
  /// with the given fields replaced by the non-null parameter values.
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
    return _then(_$CancelledClassImpl(
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
class _$CancelledClassImpl implements _CancelledClass {
  const _$CancelledClassImpl(
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

  factory _$CancelledClassImpl.fromJson(Map<String, dynamic> json) =>
      _$$CancelledClassImplFromJson(json);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CancelledClassImpl &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of CancelledClass
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CancelledClassImplCopyWith<_$CancelledClassImpl> get copyWith =>
      __$$CancelledClassImplCopyWithImpl<_$CancelledClassImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CancelledClassImplToJson(
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
      final CancelledBy? cancelledBy}) = _$CancelledClassImpl;

  factory _CancelledClass.fromJson(Map<String, dynamic> json) =
      _$CancelledClassImpl.fromJson;

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

  /// Create a copy of CancelledClass
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CancelledClassImplCopyWith<_$CancelledClassImpl> get copyWith =>
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

  /// Serializes this CancelledBy to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CancelledBy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of CancelledBy
  /// with the given fields replaced by the non-null parameter values.
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
abstract class _$$CancelledByImplCopyWith<$Res>
    implements $CancelledByCopyWith<$Res> {
  factory _$$CancelledByImplCopyWith(
          _$CancelledByImpl value, $Res Function(_$CancelledByImpl) then) =
      __$$CancelledByImplCopyWithImpl<$Res>;
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
class __$$CancelledByImplCopyWithImpl<$Res>
    extends _$CancelledByCopyWithImpl<$Res, _$CancelledByImpl>
    implements _$$CancelledByImplCopyWith<$Res> {
  __$$CancelledByImplCopyWithImpl(
      _$CancelledByImpl _value, $Res Function(_$CancelledByImpl) _then)
      : super(_value, _then);

  /// Create a copy of CancelledBy
  /// with the given fields replaced by the non-null parameter values.
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
    return _then(_$CancelledByImpl(
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
class _$CancelledByImpl implements _CancelledBy {
  const _$CancelledByImpl(
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

  factory _$CancelledByImpl.fromJson(Map<String, dynamic> json) =>
      _$$CancelledByImplFromJson(json);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CancelledByImpl &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, userId, whatsappNo,
      email, gender, dob, doj, profilePic, isActive);

  /// Create a copy of CancelledBy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CancelledByImplCopyWith<_$CancelledByImpl> get copyWith =>
      __$$CancelledByImplCopyWithImpl<_$CancelledByImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CancelledByImplToJson(
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
      final int? isActive}) = _$CancelledByImpl;

  factory _CancelledBy.fromJson(Map<String, dynamic> json) =
      _$CancelledByImpl.fromJson;

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

  /// Create a copy of CancelledBy
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CancelledByImplCopyWith<_$CancelledByImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
