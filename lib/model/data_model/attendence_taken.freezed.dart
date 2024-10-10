// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendence_taken.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AttendenceTaken _$AttendenceTakenFromJson(Map<String, dynamic> json) {
  return _AttendenceTaken.fromJson(json);
}

/// @nodoc
mixin _$AttendenceTaken {
  ConductedClassDetails? get conductedClass =>
      throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;

  /// Serializes this AttendenceTaken to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AttendenceTaken
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AttendenceTakenCopyWith<AttendenceTaken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendenceTakenCopyWith<$Res> {
  factory $AttendenceTakenCopyWith(
          AttendenceTaken value, $Res Function(AttendenceTaken) then) =
      _$AttendenceTakenCopyWithImpl<$Res, AttendenceTaken>;
  @useResult
  $Res call({ConductedClassDetails? conductedClass, int? status});

  $ConductedClassDetailsCopyWith<$Res>? get conductedClass;
}

/// @nodoc
class _$AttendenceTakenCopyWithImpl<$Res, $Val extends AttendenceTaken>
    implements $AttendenceTakenCopyWith<$Res> {
  _$AttendenceTakenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AttendenceTaken
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conductedClass = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      conductedClass: freezed == conductedClass
          ? _value.conductedClass
          : conductedClass // ignore: cast_nullable_to_non_nullable
              as ConductedClassDetails?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  /// Create a copy of AttendenceTaken
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ConductedClassDetailsCopyWith<$Res>? get conductedClass {
    if (_value.conductedClass == null) {
      return null;
    }

    return $ConductedClassDetailsCopyWith<$Res>(_value.conductedClass!,
        (value) {
      return _then(_value.copyWith(conductedClass: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AttendenceTakenImplCopyWith<$Res>
    implements $AttendenceTakenCopyWith<$Res> {
  factory _$$AttendenceTakenImplCopyWith(_$AttendenceTakenImpl value,
          $Res Function(_$AttendenceTakenImpl) then) =
      __$$AttendenceTakenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ConductedClassDetails? conductedClass, int? status});

  @override
  $ConductedClassDetailsCopyWith<$Res>? get conductedClass;
}

/// @nodoc
class __$$AttendenceTakenImplCopyWithImpl<$Res>
    extends _$AttendenceTakenCopyWithImpl<$Res, _$AttendenceTakenImpl>
    implements _$$AttendenceTakenImplCopyWith<$Res> {
  __$$AttendenceTakenImplCopyWithImpl(
      _$AttendenceTakenImpl _value, $Res Function(_$AttendenceTakenImpl) _then)
      : super(_value, _then);

  /// Create a copy of AttendenceTaken
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conductedClass = freezed,
    Object? status = freezed,
  }) {
    return _then(_$AttendenceTakenImpl(
      conductedClass: freezed == conductedClass
          ? _value.conductedClass
          : conductedClass // ignore: cast_nullable_to_non_nullable
              as ConductedClassDetails?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$AttendenceTakenImpl implements _AttendenceTaken {
  const _$AttendenceTakenImpl({this.conductedClass, this.status});

  factory _$AttendenceTakenImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttendenceTakenImplFromJson(json);

  @override
  final ConductedClassDetails? conductedClass;
  @override
  final int? status;

  @override
  String toString() {
    return 'AttendenceTaken(conductedClass: $conductedClass, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendenceTakenImpl &&
            (identical(other.conductedClass, conductedClass) ||
                other.conductedClass == conductedClass) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, conductedClass, status);

  /// Create a copy of AttendenceTaken
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendenceTakenImplCopyWith<_$AttendenceTakenImpl> get copyWith =>
      __$$AttendenceTakenImplCopyWithImpl<_$AttendenceTakenImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttendenceTakenImplToJson(
      this,
    );
  }
}

abstract class _AttendenceTaken implements AttendenceTaken {
  const factory _AttendenceTaken(
      {final ConductedClassDetails? conductedClass,
      final int? status}) = _$AttendenceTakenImpl;

  factory _AttendenceTaken.fromJson(Map<String, dynamic> json) =
      _$AttendenceTakenImpl.fromJson;

  @override
  ConductedClassDetails? get conductedClass;
  @override
  int? get status;

  /// Create a copy of AttendenceTaken
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AttendenceTakenImplCopyWith<_$AttendenceTakenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ConductedClassDetails _$ConductedClassDetailsFromJson(
    Map<String, dynamic> json) {
  return _ConductedClassDetails.fromJson(json);
}

/// @nodoc
mixin _$ConductedClassDetails {
  int? get id => throw _privateConstructorUsedError;
  int? get batchId => throw _privateConstructorUsedError;
  String? get takenByType => throw _privateConstructorUsedError;
  int? get takenById => throw _privateConstructorUsedError;
  dynamic get updatedByType => throw _privateConstructorUsedError;
  dynamic get updatedById => throw _privateConstructorUsedError;
  DateTime? get conductedOn => throw _privateConstructorUsedError;
  String? get startTime => throw _privateConstructorUsedError;
  String? get endTime => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  TakenBy? get takenBy => throw _privateConstructorUsedError;
  dynamic get updatedBy => throw _privateConstructorUsedError;
  List<AttendanceDetails>? get attendances =>
      throw _privateConstructorUsedError;

  /// Serializes this ConductedClassDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConductedClassDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConductedClassDetailsCopyWith<ConductedClassDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConductedClassDetailsCopyWith<$Res> {
  factory $ConductedClassDetailsCopyWith(ConductedClassDetails value,
          $Res Function(ConductedClassDetails) then) =
      _$ConductedClassDetailsCopyWithImpl<$Res, ConductedClassDetails>;
  @useResult
  $Res call(
      {int? id,
      int? batchId,
      String? takenByType,
      int? takenById,
      dynamic updatedByType,
      dynamic updatedById,
      DateTime? conductedOn,
      String? startTime,
      String? endTime,
      DateTime? createdAt,
      DateTime? updatedAt,
      TakenBy? takenBy,
      dynamic updatedBy,
      List<AttendanceDetails>? attendances});

  $TakenByCopyWith<$Res>? get takenBy;
}

/// @nodoc
class _$ConductedClassDetailsCopyWithImpl<$Res,
        $Val extends ConductedClassDetails>
    implements $ConductedClassDetailsCopyWith<$Res> {
  _$ConductedClassDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConductedClassDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? batchId = freezed,
    Object? takenByType = freezed,
    Object? takenById = freezed,
    Object? updatedByType = freezed,
    Object? updatedById = freezed,
    Object? conductedOn = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? takenBy = freezed,
    Object? updatedBy = freezed,
    Object? attendances = freezed,
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
      takenByType: freezed == takenByType
          ? _value.takenByType
          : takenByType // ignore: cast_nullable_to_non_nullable
              as String?,
      takenById: freezed == takenById
          ? _value.takenById
          : takenById // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedByType: freezed == updatedByType
          ? _value.updatedByType
          : updatedByType // ignore: cast_nullable_to_non_nullable
              as dynamic,
      updatedById: freezed == updatedById
          ? _value.updatedById
          : updatedById // ignore: cast_nullable_to_non_nullable
              as dynamic,
      conductedOn: freezed == conductedOn
          ? _value.conductedOn
          : conductedOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      takenBy: freezed == takenBy
          ? _value.takenBy
          : takenBy // ignore: cast_nullable_to_non_nullable
              as TakenBy?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as dynamic,
      attendances: freezed == attendances
          ? _value.attendances
          : attendances // ignore: cast_nullable_to_non_nullable
              as List<AttendanceDetails>?,
    ) as $Val);
  }

  /// Create a copy of ConductedClassDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TakenByCopyWith<$Res>? get takenBy {
    if (_value.takenBy == null) {
      return null;
    }

    return $TakenByCopyWith<$Res>(_value.takenBy!, (value) {
      return _then(_value.copyWith(takenBy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ConductedClassDetailsImplCopyWith<$Res>
    implements $ConductedClassDetailsCopyWith<$Res> {
  factory _$$ConductedClassDetailsImplCopyWith(
          _$ConductedClassDetailsImpl value,
          $Res Function(_$ConductedClassDetailsImpl) then) =
      __$$ConductedClassDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? batchId,
      String? takenByType,
      int? takenById,
      dynamic updatedByType,
      dynamic updatedById,
      DateTime? conductedOn,
      String? startTime,
      String? endTime,
      DateTime? createdAt,
      DateTime? updatedAt,
      TakenBy? takenBy,
      dynamic updatedBy,
      List<AttendanceDetails>? attendances});

  @override
  $TakenByCopyWith<$Res>? get takenBy;
}

/// @nodoc
class __$$ConductedClassDetailsImplCopyWithImpl<$Res>
    extends _$ConductedClassDetailsCopyWithImpl<$Res,
        _$ConductedClassDetailsImpl>
    implements _$$ConductedClassDetailsImplCopyWith<$Res> {
  __$$ConductedClassDetailsImplCopyWithImpl(_$ConductedClassDetailsImpl _value,
      $Res Function(_$ConductedClassDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConductedClassDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? batchId = freezed,
    Object? takenByType = freezed,
    Object? takenById = freezed,
    Object? updatedByType = freezed,
    Object? updatedById = freezed,
    Object? conductedOn = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? takenBy = freezed,
    Object? updatedBy = freezed,
    Object? attendances = freezed,
  }) {
    return _then(_$ConductedClassDetailsImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      batchId: freezed == batchId
          ? _value.batchId
          : batchId // ignore: cast_nullable_to_non_nullable
              as int?,
      takenByType: freezed == takenByType
          ? _value.takenByType
          : takenByType // ignore: cast_nullable_to_non_nullable
              as String?,
      takenById: freezed == takenById
          ? _value.takenById
          : takenById // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedByType: freezed == updatedByType
          ? _value.updatedByType
          : updatedByType // ignore: cast_nullable_to_non_nullable
              as dynamic,
      updatedById: freezed == updatedById
          ? _value.updatedById
          : updatedById // ignore: cast_nullable_to_non_nullable
              as dynamic,
      conductedOn: freezed == conductedOn
          ? _value.conductedOn
          : conductedOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      takenBy: freezed == takenBy
          ? _value.takenBy
          : takenBy // ignore: cast_nullable_to_non_nullable
              as TakenBy?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as dynamic,
      attendances: freezed == attendances
          ? _value._attendances
          : attendances // ignore: cast_nullable_to_non_nullable
              as List<AttendanceDetails>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$ConductedClassDetailsImpl implements _ConductedClassDetails {
  const _$ConductedClassDetailsImpl(
      {this.id,
      this.batchId,
      this.takenByType,
      this.takenById,
      this.updatedByType,
      this.updatedById,
      this.conductedOn,
      this.startTime,
      this.endTime,
      this.createdAt,
      this.updatedAt,
      this.takenBy,
      this.updatedBy,
      final List<AttendanceDetails>? attendances})
      : _attendances = attendances;

  factory _$ConductedClassDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConductedClassDetailsImplFromJson(json);

  @override
  final int? id;
  @override
  final int? batchId;
  @override
  final String? takenByType;
  @override
  final int? takenById;
  @override
  final dynamic updatedByType;
  @override
  final dynamic updatedById;
  @override
  final DateTime? conductedOn;
  @override
  final String? startTime;
  @override
  final String? endTime;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final TakenBy? takenBy;
  @override
  final dynamic updatedBy;
  final List<AttendanceDetails>? _attendances;
  @override
  List<AttendanceDetails>? get attendances {
    final value = _attendances;
    if (value == null) return null;
    if (_attendances is EqualUnmodifiableListView) return _attendances;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ConductedClassDetails(id: $id, batchId: $batchId, takenByType: $takenByType, takenById: $takenById, updatedByType: $updatedByType, updatedById: $updatedById, conductedOn: $conductedOn, startTime: $startTime, endTime: $endTime, createdAt: $createdAt, updatedAt: $updatedAt, takenBy: $takenBy, updatedBy: $updatedBy, attendances: $attendances)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConductedClassDetailsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.batchId, batchId) || other.batchId == batchId) &&
            (identical(other.takenByType, takenByType) ||
                other.takenByType == takenByType) &&
            (identical(other.takenById, takenById) ||
                other.takenById == takenById) &&
            const DeepCollectionEquality()
                .equals(other.updatedByType, updatedByType) &&
            const DeepCollectionEquality()
                .equals(other.updatedById, updatedById) &&
            (identical(other.conductedOn, conductedOn) ||
                other.conductedOn == conductedOn) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.takenBy, takenBy) || other.takenBy == takenBy) &&
            const DeepCollectionEquality().equals(other.updatedBy, updatedBy) &&
            const DeepCollectionEquality()
                .equals(other._attendances, _attendances));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      batchId,
      takenByType,
      takenById,
      const DeepCollectionEquality().hash(updatedByType),
      const DeepCollectionEquality().hash(updatedById),
      conductedOn,
      startTime,
      endTime,
      createdAt,
      updatedAt,
      takenBy,
      const DeepCollectionEquality().hash(updatedBy),
      const DeepCollectionEquality().hash(_attendances));

  /// Create a copy of ConductedClassDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConductedClassDetailsImplCopyWith<_$ConductedClassDetailsImpl>
      get copyWith => __$$ConductedClassDetailsImplCopyWithImpl<
          _$ConductedClassDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConductedClassDetailsImplToJson(
      this,
    );
  }
}

abstract class _ConductedClassDetails implements ConductedClassDetails {
  const factory _ConductedClassDetails(
          {final int? id,
          final int? batchId,
          final String? takenByType,
          final int? takenById,
          final dynamic updatedByType,
          final dynamic updatedById,
          final DateTime? conductedOn,
          final String? startTime,
          final String? endTime,
          final DateTime? createdAt,
          final DateTime? updatedAt,
          final TakenBy? takenBy,
          final dynamic updatedBy,
          final List<AttendanceDetails>? attendances}) =
      _$ConductedClassDetailsImpl;

  factory _ConductedClassDetails.fromJson(Map<String, dynamic> json) =
      _$ConductedClassDetailsImpl.fromJson;

  @override
  int? get id;
  @override
  int? get batchId;
  @override
  String? get takenByType;
  @override
  int? get takenById;
  @override
  dynamic get updatedByType;
  @override
  dynamic get updatedById;
  @override
  DateTime? get conductedOn;
  @override
  String? get startTime;
  @override
  String? get endTime;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  TakenBy? get takenBy;
  @override
  dynamic get updatedBy;
  @override
  List<AttendanceDetails>? get attendances;

  /// Create a copy of ConductedClassDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConductedClassDetailsImplCopyWith<_$ConductedClassDetailsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AttendanceDetails _$AttendanceDetailsFromJson(Map<String, dynamic> json) {
  return _AttendanceDetails.fromJson(json);
}

/// @nodoc
mixin _$AttendanceDetails {
  int? get id => throw _privateConstructorUsedError;
  int? get conductedClassId => throw _privateConstructorUsedError;
  int? get studentDetailId => throw _privateConstructorUsedError;
  String? get feeType => throw _privateConstructorUsedError;
  int? get cycle => throw _privateConstructorUsedError;
  int? get isPresent => throw _privateConstructorUsedError;
  StudentDetail? get studentDetail => throw _privateConstructorUsedError;

  /// Serializes this AttendanceDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AttendanceDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AttendanceDetailsCopyWith<AttendanceDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceDetailsCopyWith<$Res> {
  factory $AttendanceDetailsCopyWith(
          AttendanceDetails value, $Res Function(AttendanceDetails) then) =
      _$AttendanceDetailsCopyWithImpl<$Res, AttendanceDetails>;
  @useResult
  $Res call(
      {int? id,
      int? conductedClassId,
      int? studentDetailId,
      String? feeType,
      int? cycle,
      int? isPresent,
      StudentDetail? studentDetail});

  $StudentDetailCopyWith<$Res>? get studentDetail;
}

/// @nodoc
class _$AttendanceDetailsCopyWithImpl<$Res, $Val extends AttendanceDetails>
    implements $AttendanceDetailsCopyWith<$Res> {
  _$AttendanceDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AttendanceDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? conductedClassId = freezed,
    Object? studentDetailId = freezed,
    Object? feeType = freezed,
    Object? cycle = freezed,
    Object? isPresent = freezed,
    Object? studentDetail = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      conductedClassId: freezed == conductedClassId
          ? _value.conductedClassId
          : conductedClassId // ignore: cast_nullable_to_non_nullable
              as int?,
      studentDetailId: freezed == studentDetailId
          ? _value.studentDetailId
          : studentDetailId // ignore: cast_nullable_to_non_nullable
              as int?,
      feeType: freezed == feeType
          ? _value.feeType
          : feeType // ignore: cast_nullable_to_non_nullable
              as String?,
      cycle: freezed == cycle
          ? _value.cycle
          : cycle // ignore: cast_nullable_to_non_nullable
              as int?,
      isPresent: freezed == isPresent
          ? _value.isPresent
          : isPresent // ignore: cast_nullable_to_non_nullable
              as int?,
      studentDetail: freezed == studentDetail
          ? _value.studentDetail
          : studentDetail // ignore: cast_nullable_to_non_nullable
              as StudentDetail?,
    ) as $Val);
  }

  /// Create a copy of AttendanceDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StudentDetailCopyWith<$Res>? get studentDetail {
    if (_value.studentDetail == null) {
      return null;
    }

    return $StudentDetailCopyWith<$Res>(_value.studentDetail!, (value) {
      return _then(_value.copyWith(studentDetail: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AttendanceDetailsImplCopyWith<$Res>
    implements $AttendanceDetailsCopyWith<$Res> {
  factory _$$AttendanceDetailsImplCopyWith(_$AttendanceDetailsImpl value,
          $Res Function(_$AttendanceDetailsImpl) then) =
      __$$AttendanceDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? conductedClassId,
      int? studentDetailId,
      String? feeType,
      int? cycle,
      int? isPresent,
      StudentDetail? studentDetail});

  @override
  $StudentDetailCopyWith<$Res>? get studentDetail;
}

/// @nodoc
class __$$AttendanceDetailsImplCopyWithImpl<$Res>
    extends _$AttendanceDetailsCopyWithImpl<$Res, _$AttendanceDetailsImpl>
    implements _$$AttendanceDetailsImplCopyWith<$Res> {
  __$$AttendanceDetailsImplCopyWithImpl(_$AttendanceDetailsImpl _value,
      $Res Function(_$AttendanceDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of AttendanceDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? conductedClassId = freezed,
    Object? studentDetailId = freezed,
    Object? feeType = freezed,
    Object? cycle = freezed,
    Object? isPresent = freezed,
    Object? studentDetail = freezed,
  }) {
    return _then(_$AttendanceDetailsImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      conductedClassId: freezed == conductedClassId
          ? _value.conductedClassId
          : conductedClassId // ignore: cast_nullable_to_non_nullable
              as int?,
      studentDetailId: freezed == studentDetailId
          ? _value.studentDetailId
          : studentDetailId // ignore: cast_nullable_to_non_nullable
              as int?,
      feeType: freezed == feeType
          ? _value.feeType
          : feeType // ignore: cast_nullable_to_non_nullable
              as String?,
      cycle: freezed == cycle
          ? _value.cycle
          : cycle // ignore: cast_nullable_to_non_nullable
              as int?,
      isPresent: freezed == isPresent
          ? _value.isPresent
          : isPresent // ignore: cast_nullable_to_non_nullable
              as int?,
      studentDetail: freezed == studentDetail
          ? _value.studentDetail
          : studentDetail // ignore: cast_nullable_to_non_nullable
              as StudentDetail?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$AttendanceDetailsImpl implements _AttendanceDetails {
  const _$AttendanceDetailsImpl(
      {this.id,
      this.conductedClassId,
      this.studentDetailId,
      this.feeType,
      this.cycle,
      this.isPresent,
      this.studentDetail});

  factory _$AttendanceDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttendanceDetailsImplFromJson(json);

  @override
  final int? id;
  @override
  final int? conductedClassId;
  @override
  final int? studentDetailId;
  @override
  final String? feeType;
  @override
  final int? cycle;
  @override
  final int? isPresent;
  @override
  final StudentDetail? studentDetail;

  @override
  String toString() {
    return 'AttendanceDetails(id: $id, conductedClassId: $conductedClassId, studentDetailId: $studentDetailId, feeType: $feeType, cycle: $cycle, isPresent: $isPresent, studentDetail: $studentDetail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendanceDetailsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.conductedClassId, conductedClassId) ||
                other.conductedClassId == conductedClassId) &&
            (identical(other.studentDetailId, studentDetailId) ||
                other.studentDetailId == studentDetailId) &&
            (identical(other.feeType, feeType) || other.feeType == feeType) &&
            (identical(other.cycle, cycle) || other.cycle == cycle) &&
            (identical(other.isPresent, isPresent) ||
                other.isPresent == isPresent) &&
            (identical(other.studentDetail, studentDetail) ||
                other.studentDetail == studentDetail));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, conductedClassId,
      studentDetailId, feeType, cycle, isPresent, studentDetail);

  /// Create a copy of AttendanceDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendanceDetailsImplCopyWith<_$AttendanceDetailsImpl> get copyWith =>
      __$$AttendanceDetailsImplCopyWithImpl<_$AttendanceDetailsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttendanceDetailsImplToJson(
      this,
    );
  }
}

abstract class _AttendanceDetails implements AttendanceDetails {
  const factory _AttendanceDetails(
      {final int? id,
      final int? conductedClassId,
      final int? studentDetailId,
      final String? feeType,
      final int? cycle,
      final int? isPresent,
      final StudentDetail? studentDetail}) = _$AttendanceDetailsImpl;

  factory _AttendanceDetails.fromJson(Map<String, dynamic> json) =
      _$AttendanceDetailsImpl.fromJson;

  @override
  int? get id;
  @override
  int? get conductedClassId;
  @override
  int? get studentDetailId;
  @override
  String? get feeType;
  @override
  int? get cycle;
  @override
  int? get isPresent;
  @override
  StudentDetail? get studentDetail;

  /// Create a copy of AttendanceDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AttendanceDetailsImplCopyWith<_$AttendanceDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StudentDetail _$StudentDetailFromJson(Map<String, dynamic> json) {
  return _StudentDetail.fromJson(json);
}

/// @nodoc
mixin _$StudentDetail {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get parentName => throw _privateConstructorUsedError;
  int? get userId => throw _privateConstructorUsedError;
  int? get academyId => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  DateTime? get dob => throw _privateConstructorUsedError;
  DateTime? get doj => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get whatsappNo => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get profilePic => throw _privateConstructorUsedError;
  int? get isActive => throw _privateConstructorUsedError;

  /// Serializes this StudentDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StudentDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StudentDetailCopyWith<StudentDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentDetailCopyWith<$Res> {
  factory $StudentDetailCopyWith(
          StudentDetail value, $Res Function(StudentDetail) then) =
      _$StudentDetailCopyWithImpl<$Res, StudentDetail>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? parentName,
      int? userId,
      int? academyId,
      String? gender,
      DateTime? dob,
      DateTime? doj,
      String? email,
      String? whatsappNo,
      String? address,
      String? profilePic,
      int? isActive});
}

/// @nodoc
class _$StudentDetailCopyWithImpl<$Res, $Val extends StudentDetail>
    implements $StudentDetailCopyWith<$Res> {
  _$StudentDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StudentDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? parentName = freezed,
    Object? userId = freezed,
    Object? academyId = freezed,
    Object? gender = freezed,
    Object? dob = freezed,
    Object? doj = freezed,
    Object? email = freezed,
    Object? whatsappNo = freezed,
    Object? address = freezed,
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
      parentName: freezed == parentName
          ? _value.parentName
          : parentName // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      academyId: freezed == academyId
          ? _value.academyId
          : academyId // ignore: cast_nullable_to_non_nullable
              as int?,
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
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      whatsappNo: freezed == whatsappNo
          ? _value.whatsappNo
          : whatsappNo // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$StudentDetailImplCopyWith<$Res>
    implements $StudentDetailCopyWith<$Res> {
  factory _$$StudentDetailImplCopyWith(
          _$StudentDetailImpl value, $Res Function(_$StudentDetailImpl) then) =
      __$$StudentDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? parentName,
      int? userId,
      int? academyId,
      String? gender,
      DateTime? dob,
      DateTime? doj,
      String? email,
      String? whatsappNo,
      String? address,
      String? profilePic,
      int? isActive});
}

/// @nodoc
class __$$StudentDetailImplCopyWithImpl<$Res>
    extends _$StudentDetailCopyWithImpl<$Res, _$StudentDetailImpl>
    implements _$$StudentDetailImplCopyWith<$Res> {
  __$$StudentDetailImplCopyWithImpl(
      _$StudentDetailImpl _value, $Res Function(_$StudentDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of StudentDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? parentName = freezed,
    Object? userId = freezed,
    Object? academyId = freezed,
    Object? gender = freezed,
    Object? dob = freezed,
    Object? doj = freezed,
    Object? email = freezed,
    Object? whatsappNo = freezed,
    Object? address = freezed,
    Object? profilePic = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_$StudentDetailImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      parentName: freezed == parentName
          ? _value.parentName
          : parentName // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      academyId: freezed == academyId
          ? _value.academyId
          : academyId // ignore: cast_nullable_to_non_nullable
              as int?,
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
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      whatsappNo: freezed == whatsappNo
          ? _value.whatsappNo
          : whatsappNo // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$StudentDetailImpl implements _StudentDetail {
  const _$StudentDetailImpl(
      {this.id,
      this.name,
      this.parentName,
      this.userId,
      this.academyId,
      this.gender,
      this.dob,
      this.doj,
      this.email,
      this.whatsappNo,
      this.address,
      this.profilePic,
      this.isActive});

  factory _$StudentDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudentDetailImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? parentName;
  @override
  final int? userId;
  @override
  final int? academyId;
  @override
  final String? gender;
  @override
  final DateTime? dob;
  @override
  final DateTime? doj;
  @override
  final String? email;
  @override
  final String? whatsappNo;
  @override
  final String? address;
  @override
  final String? profilePic;
  @override
  final int? isActive;

  @override
  String toString() {
    return 'StudentDetail(id: $id, name: $name, parentName: $parentName, userId: $userId, academyId: $academyId, gender: $gender, dob: $dob, doj: $doj, email: $email, whatsappNo: $whatsappNo, address: $address, profilePic: $profilePic, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.parentName, parentName) ||
                other.parentName == parentName) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.academyId, academyId) ||
                other.academyId == academyId) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            (identical(other.doj, doj) || other.doj == doj) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.whatsappNo, whatsappNo) ||
                other.whatsappNo == whatsappNo) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.profilePic, profilePic) ||
                other.profilePic == profilePic) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      parentName,
      userId,
      academyId,
      gender,
      dob,
      doj,
      email,
      whatsappNo,
      address,
      profilePic,
      isActive);

  /// Create a copy of StudentDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentDetailImplCopyWith<_$StudentDetailImpl> get copyWith =>
      __$$StudentDetailImplCopyWithImpl<_$StudentDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StudentDetailImplToJson(
      this,
    );
  }
}

abstract class _StudentDetail implements StudentDetail {
  const factory _StudentDetail(
      {final int? id,
      final String? name,
      final String? parentName,
      final int? userId,
      final int? academyId,
      final String? gender,
      final DateTime? dob,
      final DateTime? doj,
      final String? email,
      final String? whatsappNo,
      final String? address,
      final String? profilePic,
      final int? isActive}) = _$StudentDetailImpl;

  factory _StudentDetail.fromJson(Map<String, dynamic> json) =
      _$StudentDetailImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get parentName;
  @override
  int? get userId;
  @override
  int? get academyId;
  @override
  String? get gender;
  @override
  DateTime? get dob;
  @override
  DateTime? get doj;
  @override
  String? get email;
  @override
  String? get whatsappNo;
  @override
  String? get address;
  @override
  String? get profilePic;
  @override
  int? get isActive;

  /// Create a copy of StudentDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StudentDetailImplCopyWith<_$StudentDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TakenBy _$TakenByFromJson(Map<String, dynamic> json) {
  return _TakenBy.fromJson(json);
}

/// @nodoc
mixin _$TakenBy {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  /// Serializes this TakenBy to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TakenBy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TakenByCopyWith<TakenBy> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TakenByCopyWith<$Res> {
  factory $TakenByCopyWith(TakenBy value, $Res Function(TakenBy) then) =
      _$TakenByCopyWithImpl<$Res, TakenBy>;
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class _$TakenByCopyWithImpl<$Res, $Val extends TakenBy>
    implements $TakenByCopyWith<$Res> {
  _$TakenByCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TakenBy
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TakenByImplCopyWith<$Res> implements $TakenByCopyWith<$Res> {
  factory _$$TakenByImplCopyWith(
          _$TakenByImpl value, $Res Function(_$TakenByImpl) then) =
      __$$TakenByImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class __$$TakenByImplCopyWithImpl<$Res>
    extends _$TakenByCopyWithImpl<$Res, _$TakenByImpl>
    implements _$$TakenByImplCopyWith<$Res> {
  __$$TakenByImplCopyWithImpl(
      _$TakenByImpl _value, $Res Function(_$TakenByImpl) _then)
      : super(_value, _then);

  /// Create a copy of TakenBy
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$TakenByImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$TakenByImpl implements _TakenBy {
  const _$TakenByImpl({this.id, this.name});

  factory _$TakenByImpl.fromJson(Map<String, dynamic> json) =>
      _$$TakenByImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'TakenBy(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TakenByImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of TakenBy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TakenByImplCopyWith<_$TakenByImpl> get copyWith =>
      __$$TakenByImplCopyWithImpl<_$TakenByImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TakenByImplToJson(
      this,
    );
  }
}

abstract class _TakenBy implements TakenBy {
  const factory _TakenBy({final int? id, final String? name}) = _$TakenByImpl;

  factory _TakenBy.fromJson(Map<String, dynamic> json) = _$TakenByImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;

  /// Create a copy of TakenBy
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TakenByImplCopyWith<_$TakenByImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
