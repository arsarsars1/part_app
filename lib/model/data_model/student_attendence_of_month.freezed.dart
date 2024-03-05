// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'student_attendence_of_month.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StudentAttendenceOfMonth _$StudentAttendenceOfMonthFromJson(
    Map<String, dynamic> json) {
  return _StudentAttendenceOfMonth.fromJson(json);
}

/// @nodoc
mixin _$StudentAttendenceOfMonth {
  int? get status => throw _privateConstructorUsedError;
  List<StudentAttendances>? get studentAttendance =>
      throw _privateConstructorUsedError;
  int? get presentCount => throw _privateConstructorUsedError;
  int? get absentCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StudentAttendenceOfMonthCopyWith<StudentAttendenceOfMonth> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentAttendenceOfMonthCopyWith<$Res> {
  factory $StudentAttendenceOfMonthCopyWith(StudentAttendenceOfMonth value,
          $Res Function(StudentAttendenceOfMonth) then) =
      _$StudentAttendenceOfMonthCopyWithImpl<$Res, StudentAttendenceOfMonth>;
  @useResult
  $Res call(
      {int? status,
      List<StudentAttendances>? studentAttendance,
      int? presentCount,
      int? absentCount});
}

/// @nodoc
class _$StudentAttendenceOfMonthCopyWithImpl<$Res,
        $Val extends StudentAttendenceOfMonth>
    implements $StudentAttendenceOfMonthCopyWith<$Res> {
  _$StudentAttendenceOfMonthCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? studentAttendance = freezed,
    Object? presentCount = freezed,
    Object? absentCount = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      studentAttendance: freezed == studentAttendance
          ? _value.studentAttendance
          : studentAttendance // ignore: cast_nullable_to_non_nullable
              as List<StudentAttendances>?,
      presentCount: freezed == presentCount
          ? _value.presentCount
          : presentCount // ignore: cast_nullable_to_non_nullable
              as int?,
      absentCount: freezed == absentCount
          ? _value.absentCount
          : absentCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StudentAttendenceOfMonthImplCopyWith<$Res>
    implements $StudentAttendenceOfMonthCopyWith<$Res> {
  factory _$$StudentAttendenceOfMonthImplCopyWith(
          _$StudentAttendenceOfMonthImpl value,
          $Res Function(_$StudentAttendenceOfMonthImpl) then) =
      __$$StudentAttendenceOfMonthImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? status,
      List<StudentAttendances>? studentAttendance,
      int? presentCount,
      int? absentCount});
}

/// @nodoc
class __$$StudentAttendenceOfMonthImplCopyWithImpl<$Res>
    extends _$StudentAttendenceOfMonthCopyWithImpl<$Res,
        _$StudentAttendenceOfMonthImpl>
    implements _$$StudentAttendenceOfMonthImplCopyWith<$Res> {
  __$$StudentAttendenceOfMonthImplCopyWithImpl(
      _$StudentAttendenceOfMonthImpl _value,
      $Res Function(_$StudentAttendenceOfMonthImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? studentAttendance = freezed,
    Object? presentCount = freezed,
    Object? absentCount = freezed,
  }) {
    return _then(_$StudentAttendenceOfMonthImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      studentAttendance: freezed == studentAttendance
          ? _value._studentAttendance
          : studentAttendance // ignore: cast_nullable_to_non_nullable
              as List<StudentAttendances>?,
      presentCount: freezed == presentCount
          ? _value.presentCount
          : presentCount // ignore: cast_nullable_to_non_nullable
              as int?,
      absentCount: freezed == absentCount
          ? _value.absentCount
          : absentCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$StudentAttendenceOfMonthImpl implements _StudentAttendenceOfMonth {
  const _$StudentAttendenceOfMonthImpl(
      {this.status,
      final List<StudentAttendances>? studentAttendance,
      this.presentCount,
      this.absentCount})
      : _studentAttendance = studentAttendance;

  factory _$StudentAttendenceOfMonthImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudentAttendenceOfMonthImplFromJson(json);

  @override
  final int? status;
  final List<StudentAttendances>? _studentAttendance;
  @override
  List<StudentAttendances>? get studentAttendance {
    final value = _studentAttendance;
    if (value == null) return null;
    if (_studentAttendance is EqualUnmodifiableListView)
      return _studentAttendance;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? presentCount;
  @override
  final int? absentCount;

  @override
  String toString() {
    return 'StudentAttendenceOfMonth(status: $status, studentAttendance: $studentAttendance, presentCount: $presentCount, absentCount: $absentCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentAttendenceOfMonthImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._studentAttendance, _studentAttendance) &&
            (identical(other.presentCount, presentCount) ||
                other.presentCount == presentCount) &&
            (identical(other.absentCount, absentCount) ||
                other.absentCount == absentCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_studentAttendance),
      presentCount,
      absentCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentAttendenceOfMonthImplCopyWith<_$StudentAttendenceOfMonthImpl>
      get copyWith => __$$StudentAttendenceOfMonthImplCopyWithImpl<
          _$StudentAttendenceOfMonthImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StudentAttendenceOfMonthImplToJson(
      this,
    );
  }
}

abstract class _StudentAttendenceOfMonth implements StudentAttendenceOfMonth {
  const factory _StudentAttendenceOfMonth(
      {final int? status,
      final List<StudentAttendances>? studentAttendance,
      final int? presentCount,
      final int? absentCount}) = _$StudentAttendenceOfMonthImpl;

  factory _StudentAttendenceOfMonth.fromJson(Map<String, dynamic> json) =
      _$StudentAttendenceOfMonthImpl.fromJson;

  @override
  int? get status;
  @override
  List<StudentAttendances>? get studentAttendance;
  @override
  int? get presentCount;
  @override
  int? get absentCount;
  @override
  @JsonKey(ignore: true)
  _$$StudentAttendenceOfMonthImplCopyWith<_$StudentAttendenceOfMonthImpl>
      get copyWith => throw _privateConstructorUsedError;
}

StudentAttendances _$StudentAttendancesFromJson(Map<String, dynamic> json) {
  return _StudentAttendances.fromJson(json);
}

/// @nodoc
mixin _$StudentAttendances {
  int? get id => throw _privateConstructorUsedError;
  int? get conductedClassId => throw _privateConstructorUsedError;
  int? get studentDetailId => throw _privateConstructorUsedError;
  String? get feeType => throw _privateConstructorUsedError;
  int? get cycle => throw _privateConstructorUsedError;
  int? get isPresent => throw _privateConstructorUsedError;
  ConductedClasses? get conductedClass => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StudentAttendancesCopyWith<StudentAttendances> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentAttendancesCopyWith<$Res> {
  factory $StudentAttendancesCopyWith(
          StudentAttendances value, $Res Function(StudentAttendances) then) =
      _$StudentAttendancesCopyWithImpl<$Res, StudentAttendances>;
  @useResult
  $Res call(
      {int? id,
      int? conductedClassId,
      int? studentDetailId,
      String? feeType,
      int? cycle,
      int? isPresent,
      ConductedClasses? conductedClass});

  $ConductedClassesCopyWith<$Res>? get conductedClass;
}

/// @nodoc
class _$StudentAttendancesCopyWithImpl<$Res, $Val extends StudentAttendances>
    implements $StudentAttendancesCopyWith<$Res> {
  _$StudentAttendancesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? conductedClassId = freezed,
    Object? studentDetailId = freezed,
    Object? feeType = freezed,
    Object? cycle = freezed,
    Object? isPresent = freezed,
    Object? conductedClass = freezed,
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
      conductedClass: freezed == conductedClass
          ? _value.conductedClass
          : conductedClass // ignore: cast_nullable_to_non_nullable
              as ConductedClasses?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ConductedClassesCopyWith<$Res>? get conductedClass {
    if (_value.conductedClass == null) {
      return null;
    }

    return $ConductedClassesCopyWith<$Res>(_value.conductedClass!, (value) {
      return _then(_value.copyWith(conductedClass: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StudentAttendancesImplCopyWith<$Res>
    implements $StudentAttendancesCopyWith<$Res> {
  factory _$$StudentAttendancesImplCopyWith(_$StudentAttendancesImpl value,
          $Res Function(_$StudentAttendancesImpl) then) =
      __$$StudentAttendancesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? conductedClassId,
      int? studentDetailId,
      String? feeType,
      int? cycle,
      int? isPresent,
      ConductedClasses? conductedClass});

  @override
  $ConductedClassesCopyWith<$Res>? get conductedClass;
}

/// @nodoc
class __$$StudentAttendancesImplCopyWithImpl<$Res>
    extends _$StudentAttendancesCopyWithImpl<$Res, _$StudentAttendancesImpl>
    implements _$$StudentAttendancesImplCopyWith<$Res> {
  __$$StudentAttendancesImplCopyWithImpl(_$StudentAttendancesImpl _value,
      $Res Function(_$StudentAttendancesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? conductedClassId = freezed,
    Object? studentDetailId = freezed,
    Object? feeType = freezed,
    Object? cycle = freezed,
    Object? isPresent = freezed,
    Object? conductedClass = freezed,
  }) {
    return _then(_$StudentAttendancesImpl(
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
      conductedClass: freezed == conductedClass
          ? _value.conductedClass
          : conductedClass // ignore: cast_nullable_to_non_nullable
              as ConductedClasses?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$StudentAttendancesImpl implements _StudentAttendances {
  const _$StudentAttendancesImpl(
      {this.id,
      this.conductedClassId,
      this.studentDetailId,
      this.feeType,
      this.cycle,
      this.isPresent,
      this.conductedClass});

  factory _$StudentAttendancesImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudentAttendancesImplFromJson(json);

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
  final ConductedClasses? conductedClass;

  @override
  String toString() {
    return 'StudentAttendances(id: $id, conductedClassId: $conductedClassId, studentDetailId: $studentDetailId, feeType: $feeType, cycle: $cycle, isPresent: $isPresent, conductedClass: $conductedClass)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentAttendancesImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.conductedClassId, conductedClassId) ||
                other.conductedClassId == conductedClassId) &&
            (identical(other.studentDetailId, studentDetailId) ||
                other.studentDetailId == studentDetailId) &&
            (identical(other.feeType, feeType) || other.feeType == feeType) &&
            (identical(other.cycle, cycle) || other.cycle == cycle) &&
            (identical(other.isPresent, isPresent) ||
                other.isPresent == isPresent) &&
            (identical(other.conductedClass, conductedClass) ||
                other.conductedClass == conductedClass));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, conductedClassId,
      studentDetailId, feeType, cycle, isPresent, conductedClass);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentAttendancesImplCopyWith<_$StudentAttendancesImpl> get copyWith =>
      __$$StudentAttendancesImplCopyWithImpl<_$StudentAttendancesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StudentAttendancesImplToJson(
      this,
    );
  }
}

abstract class _StudentAttendances implements StudentAttendances {
  const factory _StudentAttendances(
      {final int? id,
      final int? conductedClassId,
      final int? studentDetailId,
      final String? feeType,
      final int? cycle,
      final int? isPresent,
      final ConductedClasses? conductedClass}) = _$StudentAttendancesImpl;

  factory _StudentAttendances.fromJson(Map<String, dynamic> json) =
      _$StudentAttendancesImpl.fromJson;

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
  ConductedClasses? get conductedClass;
  @override
  @JsonKey(ignore: true)
  _$$StudentAttendancesImplCopyWith<_$StudentAttendancesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ConductedClasses _$ConductedClassesFromJson(Map<String, dynamic> json) {
  return _ConductedClasses.fromJson(json);
}

/// @nodoc
mixin _$ConductedClasses {
  int? get id => throw _privateConstructorUsedError;
  int? get batchId => throw _privateConstructorUsedError;
  String? get takenByType => throw _privateConstructorUsedError;
  int? get takenById => throw _privateConstructorUsedError;
  String? get updatedByType => throw _privateConstructorUsedError;
  int? get updatedById => throw _privateConstructorUsedError;
  DateTime? get conductedOn => throw _privateConstructorUsedError;
  String? get startTime => throw _privateConstructorUsedError;
  String? get endTime => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  By? get takenBy => throw _privateConstructorUsedError;
  By? get updatedBy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConductedClassesCopyWith<ConductedClasses> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConductedClassesCopyWith<$Res> {
  factory $ConductedClassesCopyWith(
          ConductedClasses value, $Res Function(ConductedClasses) then) =
      _$ConductedClassesCopyWithImpl<$Res, ConductedClasses>;
  @useResult
  $Res call(
      {int? id,
      int? batchId,
      String? takenByType,
      int? takenById,
      String? updatedByType,
      int? updatedById,
      DateTime? conductedOn,
      String? startTime,
      String? endTime,
      DateTime? createdAt,
      DateTime? updatedAt,
      By? takenBy,
      By? updatedBy});

  $ByCopyWith<$Res>? get takenBy;
  $ByCopyWith<$Res>? get updatedBy;
}

/// @nodoc
class _$ConductedClassesCopyWithImpl<$Res, $Val extends ConductedClasses>
    implements $ConductedClassesCopyWith<$Res> {
  _$ConductedClassesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
              as String?,
      updatedById: freezed == updatedById
          ? _value.updatedById
          : updatedById // ignore: cast_nullable_to_non_nullable
              as int?,
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
              as By?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as By?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ByCopyWith<$Res>? get takenBy {
    if (_value.takenBy == null) {
      return null;
    }

    return $ByCopyWith<$Res>(_value.takenBy!, (value) {
      return _then(_value.copyWith(takenBy: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ByCopyWith<$Res>? get updatedBy {
    if (_value.updatedBy == null) {
      return null;
    }

    return $ByCopyWith<$Res>(_value.updatedBy!, (value) {
      return _then(_value.copyWith(updatedBy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ConductedClassesImplCopyWith<$Res>
    implements $ConductedClassesCopyWith<$Res> {
  factory _$$ConductedClassesImplCopyWith(_$ConductedClassesImpl value,
          $Res Function(_$ConductedClassesImpl) then) =
      __$$ConductedClassesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? batchId,
      String? takenByType,
      int? takenById,
      String? updatedByType,
      int? updatedById,
      DateTime? conductedOn,
      String? startTime,
      String? endTime,
      DateTime? createdAt,
      DateTime? updatedAt,
      By? takenBy,
      By? updatedBy});

  @override
  $ByCopyWith<$Res>? get takenBy;
  @override
  $ByCopyWith<$Res>? get updatedBy;
}

/// @nodoc
class __$$ConductedClassesImplCopyWithImpl<$Res>
    extends _$ConductedClassesCopyWithImpl<$Res, _$ConductedClassesImpl>
    implements _$$ConductedClassesImplCopyWith<$Res> {
  __$$ConductedClassesImplCopyWithImpl(_$ConductedClassesImpl _value,
      $Res Function(_$ConductedClassesImpl) _then)
      : super(_value, _then);

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
  }) {
    return _then(_$ConductedClassesImpl(
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
              as String?,
      updatedById: freezed == updatedById
          ? _value.updatedById
          : updatedById // ignore: cast_nullable_to_non_nullable
              as int?,
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
              as By?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as By?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$ConductedClassesImpl implements _ConductedClasses {
  const _$ConductedClassesImpl(
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
      this.updatedBy});

  factory _$ConductedClassesImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConductedClassesImplFromJson(json);

  @override
  final int? id;
  @override
  final int? batchId;
  @override
  final String? takenByType;
  @override
  final int? takenById;
  @override
  final String? updatedByType;
  @override
  final int? updatedById;
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
  final By? takenBy;
  @override
  final By? updatedBy;

  @override
  String toString() {
    return 'ConductedClasses(id: $id, batchId: $batchId, takenByType: $takenByType, takenById: $takenById, updatedByType: $updatedByType, updatedById: $updatedById, conductedOn: $conductedOn, startTime: $startTime, endTime: $endTime, createdAt: $createdAt, updatedAt: $updatedAt, takenBy: $takenBy, updatedBy: $updatedBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConductedClassesImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.batchId, batchId) || other.batchId == batchId) &&
            (identical(other.takenByType, takenByType) ||
                other.takenByType == takenByType) &&
            (identical(other.takenById, takenById) ||
                other.takenById == takenById) &&
            (identical(other.updatedByType, updatedByType) ||
                other.updatedByType == updatedByType) &&
            (identical(other.updatedById, updatedById) ||
                other.updatedById == updatedById) &&
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
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      batchId,
      takenByType,
      takenById,
      updatedByType,
      updatedById,
      conductedOn,
      startTime,
      endTime,
      createdAt,
      updatedAt,
      takenBy,
      updatedBy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConductedClassesImplCopyWith<_$ConductedClassesImpl> get copyWith =>
      __$$ConductedClassesImplCopyWithImpl<_$ConductedClassesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConductedClassesImplToJson(
      this,
    );
  }
}

abstract class _ConductedClasses implements ConductedClasses {
  const factory _ConductedClasses(
      {final int? id,
      final int? batchId,
      final String? takenByType,
      final int? takenById,
      final String? updatedByType,
      final int? updatedById,
      final DateTime? conductedOn,
      final String? startTime,
      final String? endTime,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      final By? takenBy,
      final By? updatedBy}) = _$ConductedClassesImpl;

  factory _ConductedClasses.fromJson(Map<String, dynamic> json) =
      _$ConductedClassesImpl.fromJson;

  @override
  int? get id;
  @override
  int? get batchId;
  @override
  String? get takenByType;
  @override
  int? get takenById;
  @override
  String? get updatedByType;
  @override
  int? get updatedById;
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
  By? get takenBy;
  @override
  By? get updatedBy;
  @override
  @JsonKey(ignore: true)
  _$$ConductedClassesImplCopyWith<_$ConductedClassesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

By _$ByFromJson(Map<String, dynamic> json) {
  return _By.fromJson(json);
}

/// @nodoc
mixin _$By {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ByCopyWith<By> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ByCopyWith<$Res> {
  factory $ByCopyWith(By value, $Res Function(By) then) =
      _$ByCopyWithImpl<$Res, By>;
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class _$ByCopyWithImpl<$Res, $Val extends By> implements $ByCopyWith<$Res> {
  _$ByCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
abstract class _$$ByImplCopyWith<$Res> implements $ByCopyWith<$Res> {
  factory _$$ByImplCopyWith(_$ByImpl value, $Res Function(_$ByImpl) then) =
      __$$ByImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class __$$ByImplCopyWithImpl<$Res> extends _$ByCopyWithImpl<$Res, _$ByImpl>
    implements _$$ByImplCopyWith<$Res> {
  __$$ByImplCopyWithImpl(_$ByImpl _value, $Res Function(_$ByImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$ByImpl(
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
class _$ByImpl implements _By {
  const _$ByImpl({this.id, this.name});

  factory _$ByImpl.fromJson(Map<String, dynamic> json) =>
      _$$ByImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'By(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ByImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ByImplCopyWith<_$ByImpl> get copyWith =>
      __$$ByImplCopyWithImpl<_$ByImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ByImplToJson(
      this,
    );
  }
}

abstract class _By implements By {
  const factory _By({final int? id, final String? name}) = _$ByImpl;

  factory _By.fromJson(Map<String, dynamic> json) = _$ByImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$ByImplCopyWith<_$ByImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
