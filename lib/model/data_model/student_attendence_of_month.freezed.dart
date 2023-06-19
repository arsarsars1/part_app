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
abstract class _$$_StudentAttendenceOfMonthCopyWith<$Res>
    implements $StudentAttendenceOfMonthCopyWith<$Res> {
  factory _$$_StudentAttendenceOfMonthCopyWith(
          _$_StudentAttendenceOfMonth value,
          $Res Function(_$_StudentAttendenceOfMonth) then) =
      __$$_StudentAttendenceOfMonthCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? status,
      List<StudentAttendances>? studentAttendance,
      int? presentCount,
      int? absentCount});
}

/// @nodoc
class __$$_StudentAttendenceOfMonthCopyWithImpl<$Res>
    extends _$StudentAttendenceOfMonthCopyWithImpl<$Res,
        _$_StudentAttendenceOfMonth>
    implements _$$_StudentAttendenceOfMonthCopyWith<$Res> {
  __$$_StudentAttendenceOfMonthCopyWithImpl(_$_StudentAttendenceOfMonth _value,
      $Res Function(_$_StudentAttendenceOfMonth) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? studentAttendance = freezed,
    Object? presentCount = freezed,
    Object? absentCount = freezed,
  }) {
    return _then(_$_StudentAttendenceOfMonth(
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
class _$_StudentAttendenceOfMonth implements _StudentAttendenceOfMonth {
  const _$_StudentAttendenceOfMonth(
      {this.status,
      final List<StudentAttendances>? studentAttendance,
      this.presentCount,
      this.absentCount})
      : _studentAttendance = studentAttendance;

  factory _$_StudentAttendenceOfMonth.fromJson(Map<String, dynamic> json) =>
      _$$_StudentAttendenceOfMonthFromJson(json);

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StudentAttendenceOfMonth &&
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
  _$$_StudentAttendenceOfMonthCopyWith<_$_StudentAttendenceOfMonth>
      get copyWith => __$$_StudentAttendenceOfMonthCopyWithImpl<
          _$_StudentAttendenceOfMonth>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StudentAttendenceOfMonthToJson(
      this,
    );
  }
}

abstract class _StudentAttendenceOfMonth implements StudentAttendenceOfMonth {
  const factory _StudentAttendenceOfMonth(
      {final int? status,
      final List<StudentAttendances>? studentAttendance,
      final int? presentCount,
      final int? absentCount}) = _$_StudentAttendenceOfMonth;

  factory _StudentAttendenceOfMonth.fromJson(Map<String, dynamic> json) =
      _$_StudentAttendenceOfMonth.fromJson;

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
  _$$_StudentAttendenceOfMonthCopyWith<_$_StudentAttendenceOfMonth>
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
abstract class _$$_StudentAttendancesCopyWith<$Res>
    implements $StudentAttendancesCopyWith<$Res> {
  factory _$$_StudentAttendancesCopyWith(_$_StudentAttendances value,
          $Res Function(_$_StudentAttendances) then) =
      __$$_StudentAttendancesCopyWithImpl<$Res>;
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
class __$$_StudentAttendancesCopyWithImpl<$Res>
    extends _$StudentAttendancesCopyWithImpl<$Res, _$_StudentAttendances>
    implements _$$_StudentAttendancesCopyWith<$Res> {
  __$$_StudentAttendancesCopyWithImpl(
      _$_StudentAttendances _value, $Res Function(_$_StudentAttendances) _then)
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
    return _then(_$_StudentAttendances(
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
class _$_StudentAttendances implements _StudentAttendances {
  const _$_StudentAttendances(
      {this.id,
      this.conductedClassId,
      this.studentDetailId,
      this.feeType,
      this.cycle,
      this.isPresent,
      this.conductedClass});

  factory _$_StudentAttendances.fromJson(Map<String, dynamic> json) =>
      _$$_StudentAttendancesFromJson(json);

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StudentAttendances &&
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
  _$$_StudentAttendancesCopyWith<_$_StudentAttendances> get copyWith =>
      __$$_StudentAttendancesCopyWithImpl<_$_StudentAttendances>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StudentAttendancesToJson(
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
      final ConductedClasses? conductedClass}) = _$_StudentAttendances;

  factory _StudentAttendances.fromJson(Map<String, dynamic> json) =
      _$_StudentAttendances.fromJson;

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
  _$$_StudentAttendancesCopyWith<_$_StudentAttendances> get copyWith =>
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
abstract class _$$_ConductedClassesCopyWith<$Res>
    implements $ConductedClassesCopyWith<$Res> {
  factory _$$_ConductedClassesCopyWith(
          _$_ConductedClasses value, $Res Function(_$_ConductedClasses) then) =
      __$$_ConductedClassesCopyWithImpl<$Res>;
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
class __$$_ConductedClassesCopyWithImpl<$Res>
    extends _$ConductedClassesCopyWithImpl<$Res, _$_ConductedClasses>
    implements _$$_ConductedClassesCopyWith<$Res> {
  __$$_ConductedClassesCopyWithImpl(
      _$_ConductedClasses _value, $Res Function(_$_ConductedClasses) _then)
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
    return _then(_$_ConductedClasses(
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
class _$_ConductedClasses implements _ConductedClasses {
  const _$_ConductedClasses(
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

  factory _$_ConductedClasses.fromJson(Map<String, dynamic> json) =>
      _$$_ConductedClassesFromJson(json);

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConductedClasses &&
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
  _$$_ConductedClassesCopyWith<_$_ConductedClasses> get copyWith =>
      __$$_ConductedClassesCopyWithImpl<_$_ConductedClasses>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ConductedClassesToJson(
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
      final By? updatedBy}) = _$_ConductedClasses;

  factory _ConductedClasses.fromJson(Map<String, dynamic> json) =
      _$_ConductedClasses.fromJson;

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
  _$$_ConductedClassesCopyWith<_$_ConductedClasses> get copyWith =>
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
abstract class _$$_ByCopyWith<$Res> implements $ByCopyWith<$Res> {
  factory _$$_ByCopyWith(_$_By value, $Res Function(_$_By) then) =
      __$$_ByCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class __$$_ByCopyWithImpl<$Res> extends _$ByCopyWithImpl<$Res, _$_By>
    implements _$$_ByCopyWith<$Res> {
  __$$_ByCopyWithImpl(_$_By _value, $Res Function(_$_By) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_By(
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
class _$_By implements _By {
  const _$_By({this.id, this.name});

  factory _$_By.fromJson(Map<String, dynamic> json) => _$$_ByFromJson(json);

  @override
  final int? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'By(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_By &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ByCopyWith<_$_By> get copyWith =>
      __$$_ByCopyWithImpl<_$_By>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ByToJson(
      this,
    );
  }
}

abstract class _By implements By {
  const factory _By({final int? id, final String? name}) = _$_By;

  factory _By.fromJson(Map<String, dynamic> json) = _$_By.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$_ByCopyWith<_$_By> get copyWith => throw _privateConstructorUsedError;
}
