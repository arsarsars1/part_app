// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendence_classes_of_month.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AttendenceClassDetailsesOfMonth _$AttendenceClassDetailsesOfMonthFromJson(
    Map<String, dynamic> json) {
  return _AttendenceClassDetailsesOfMonth.fromJson(json);
}

/// @nodoc
mixin _$AttendenceClassDetailsesOfMonth {
  int? get status => throw _privateConstructorUsedError;
  List<ClassDetails>? get classes => throw _privateConstructorUsedError;
  Batch? get batch => throw _privateConstructorUsedError;

  /// Serializes this AttendenceClassDetailsesOfMonth to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AttendenceClassDetailsesOfMonth
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AttendenceClassDetailsesOfMonthCopyWith<AttendenceClassDetailsesOfMonth>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendenceClassDetailsesOfMonthCopyWith<$Res> {
  factory $AttendenceClassDetailsesOfMonthCopyWith(
          AttendenceClassDetailsesOfMonth value,
          $Res Function(AttendenceClassDetailsesOfMonth) then) =
      _$AttendenceClassDetailsesOfMonthCopyWithImpl<$Res,
          AttendenceClassDetailsesOfMonth>;
  @useResult
  $Res call({int? status, List<ClassDetails>? classes, Batch? batch});

  $BatchCopyWith<$Res>? get batch;
}

/// @nodoc
class _$AttendenceClassDetailsesOfMonthCopyWithImpl<$Res,
        $Val extends AttendenceClassDetailsesOfMonth>
    implements $AttendenceClassDetailsesOfMonthCopyWith<$Res> {
  _$AttendenceClassDetailsesOfMonthCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AttendenceClassDetailsesOfMonth
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? classes = freezed,
    Object? batch = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      classes: freezed == classes
          ? _value.classes
          : classes // ignore: cast_nullable_to_non_nullable
              as List<ClassDetails>?,
      batch: freezed == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as Batch?,
    ) as $Val);
  }

  /// Create a copy of AttendenceClassDetailsesOfMonth
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BatchCopyWith<$Res>? get batch {
    if (_value.batch == null) {
      return null;
    }

    return $BatchCopyWith<$Res>(_value.batch!, (value) {
      return _then(_value.copyWith(batch: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AttendenceClassDetailsesOfMonthImplCopyWith<$Res>
    implements $AttendenceClassDetailsesOfMonthCopyWith<$Res> {
  factory _$$AttendenceClassDetailsesOfMonthImplCopyWith(
          _$AttendenceClassDetailsesOfMonthImpl value,
          $Res Function(_$AttendenceClassDetailsesOfMonthImpl) then) =
      __$$AttendenceClassDetailsesOfMonthImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? status, List<ClassDetails>? classes, Batch? batch});

  @override
  $BatchCopyWith<$Res>? get batch;
}

/// @nodoc
class __$$AttendenceClassDetailsesOfMonthImplCopyWithImpl<$Res>
    extends _$AttendenceClassDetailsesOfMonthCopyWithImpl<$Res,
        _$AttendenceClassDetailsesOfMonthImpl>
    implements _$$AttendenceClassDetailsesOfMonthImplCopyWith<$Res> {
  __$$AttendenceClassDetailsesOfMonthImplCopyWithImpl(
      _$AttendenceClassDetailsesOfMonthImpl _value,
      $Res Function(_$AttendenceClassDetailsesOfMonthImpl) _then)
      : super(_value, _then);

  /// Create a copy of AttendenceClassDetailsesOfMonth
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? classes = freezed,
    Object? batch = freezed,
  }) {
    return _then(_$AttendenceClassDetailsesOfMonthImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      classes: freezed == classes
          ? _value._classes
          : classes // ignore: cast_nullable_to_non_nullable
              as List<ClassDetails>?,
      batch: freezed == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as Batch?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AttendenceClassDetailsesOfMonthImpl
    implements _AttendenceClassDetailsesOfMonth {
  const _$AttendenceClassDetailsesOfMonthImpl(
      {this.status, final List<ClassDetails>? classes, this.batch})
      : _classes = classes;

  factory _$AttendenceClassDetailsesOfMonthImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$AttendenceClassDetailsesOfMonthImplFromJson(json);

  @override
  final int? status;
  final List<ClassDetails>? _classes;
  @override
  List<ClassDetails>? get classes {
    final value = _classes;
    if (value == null) return null;
    if (_classes is EqualUnmodifiableListView) return _classes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Batch? batch;

  @override
  String toString() {
    return 'AttendenceClassDetailsesOfMonth(status: $status, classes: $classes, batch: $batch)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendenceClassDetailsesOfMonthImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._classes, _classes) &&
            (identical(other.batch, batch) || other.batch == batch));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(_classes), batch);

  /// Create a copy of AttendenceClassDetailsesOfMonth
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendenceClassDetailsesOfMonthImplCopyWith<
          _$AttendenceClassDetailsesOfMonthImpl>
      get copyWith => __$$AttendenceClassDetailsesOfMonthImplCopyWithImpl<
          _$AttendenceClassDetailsesOfMonthImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttendenceClassDetailsesOfMonthImplToJson(
      this,
    );
  }
}

abstract class _AttendenceClassDetailsesOfMonth
    implements AttendenceClassDetailsesOfMonth {
  const factory _AttendenceClassDetailsesOfMonth(
      {final int? status,
      final List<ClassDetails>? classes,
      final Batch? batch}) = _$AttendenceClassDetailsesOfMonthImpl;

  factory _AttendenceClassDetailsesOfMonth.fromJson(Map<String, dynamic> json) =
      _$AttendenceClassDetailsesOfMonthImpl.fromJson;

  @override
  int? get status;
  @override
  List<ClassDetails>? get classes;
  @override
  Batch? get batch;

  /// Create a copy of AttendenceClassDetailsesOfMonth
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AttendenceClassDetailsesOfMonthImplCopyWith<
          _$AttendenceClassDetailsesOfMonthImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Batch _$BatchFromJson(Map<String, dynamic> json) {
  return _Batch.fromJson(json);
}

/// @nodoc
mixin _$Batch {
  int? get id => throw _privateConstructorUsedError;
  String? get batchName => throw _privateConstructorUsedError;
  int? get academyId => throw _privateConstructorUsedError;
  int? get branchId => throw _privateConstructorUsedError;
  int? get courseId => throw _privateConstructorUsedError;
  int? get subjectId => throw _privateConstructorUsedError;
  String? get batchStatus => throw _privateConstructorUsedError;
  int? get feeAmount => throw _privateConstructorUsedError;
  int? get admissionFees => throw _privateConstructorUsedError;
  int? get isActive => throw _privateConstructorUsedError;
  int? get activeStudentsCount => throw _privateConstructorUsedError;
  int? get inactiveStudentsCount => throw _privateConstructorUsedError;
  List<BatchDetail>? get batchDetail => throw _privateConstructorUsedError;
  List<Trainer>? get trainers => throw _privateConstructorUsedError;
  Course? get course => throw _privateConstructorUsedError;
  Subject? get subject => throw _privateConstructorUsedError;
  Branch? get branch => throw _privateConstructorUsedError;
  List<Student>? get students => throw _privateConstructorUsedError;

  /// Serializes this Batch to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Batch
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BatchCopyWith<Batch> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BatchCopyWith<$Res> {
  factory $BatchCopyWith(Batch value, $Res Function(Batch) then) =
      _$BatchCopyWithImpl<$Res, Batch>;
  @useResult
  $Res call(
      {int? id,
      String? batchName,
      int? academyId,
      int? branchId,
      int? courseId,
      int? subjectId,
      String? batchStatus,
      int? feeAmount,
      int? admissionFees,
      int? isActive,
      int? activeStudentsCount,
      int? inactiveStudentsCount,
      List<BatchDetail>? batchDetail,
      List<Trainer>? trainers,
      Course? course,
      Subject? subject,
      Branch? branch,
      List<Student>? students});

  $CourseCopyWith<$Res>? get course;
  $SubjectCopyWith<$Res>? get subject;
  $BranchCopyWith<$Res>? get branch;
}

/// @nodoc
class _$BatchCopyWithImpl<$Res, $Val extends Batch>
    implements $BatchCopyWith<$Res> {
  _$BatchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Batch
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? batchName = freezed,
    Object? academyId = freezed,
    Object? branchId = freezed,
    Object? courseId = freezed,
    Object? subjectId = freezed,
    Object? batchStatus = freezed,
    Object? feeAmount = freezed,
    Object? admissionFees = freezed,
    Object? isActive = freezed,
    Object? activeStudentsCount = freezed,
    Object? inactiveStudentsCount = freezed,
    Object? batchDetail = freezed,
    Object? trainers = freezed,
    Object? course = freezed,
    Object? subject = freezed,
    Object? branch = freezed,
    Object? students = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      batchName: freezed == batchName
          ? _value.batchName
          : batchName // ignore: cast_nullable_to_non_nullable
              as String?,
      academyId: freezed == academyId
          ? _value.academyId
          : academyId // ignore: cast_nullable_to_non_nullable
              as int?,
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as int?,
      courseId: freezed == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as int?,
      subjectId: freezed == subjectId
          ? _value.subjectId
          : subjectId // ignore: cast_nullable_to_non_nullable
              as int?,
      batchStatus: freezed == batchStatus
          ? _value.batchStatus
          : batchStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      feeAmount: freezed == feeAmount
          ? _value.feeAmount
          : feeAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      admissionFees: freezed == admissionFees
          ? _value.admissionFees
          : admissionFees // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int?,
      activeStudentsCount: freezed == activeStudentsCount
          ? _value.activeStudentsCount
          : activeStudentsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      inactiveStudentsCount: freezed == inactiveStudentsCount
          ? _value.inactiveStudentsCount
          : inactiveStudentsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      batchDetail: freezed == batchDetail
          ? _value.batchDetail
          : batchDetail // ignore: cast_nullable_to_non_nullable
              as List<BatchDetail>?,
      trainers: freezed == trainers
          ? _value.trainers
          : trainers // ignore: cast_nullable_to_non_nullable
              as List<Trainer>?,
      course: freezed == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as Course?,
      subject: freezed == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as Subject?,
      branch: freezed == branch
          ? _value.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as Branch?,
      students: freezed == students
          ? _value.students
          : students // ignore: cast_nullable_to_non_nullable
              as List<Student>?,
    ) as $Val);
  }

  /// Create a copy of Batch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CourseCopyWith<$Res>? get course {
    if (_value.course == null) {
      return null;
    }

    return $CourseCopyWith<$Res>(_value.course!, (value) {
      return _then(_value.copyWith(course: value) as $Val);
    });
  }

  /// Create a copy of Batch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SubjectCopyWith<$Res>? get subject {
    if (_value.subject == null) {
      return null;
    }

    return $SubjectCopyWith<$Res>(_value.subject!, (value) {
      return _then(_value.copyWith(subject: value) as $Val);
    });
  }

  /// Create a copy of Batch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BranchCopyWith<$Res>? get branch {
    if (_value.branch == null) {
      return null;
    }

    return $BranchCopyWith<$Res>(_value.branch!, (value) {
      return _then(_value.copyWith(branch: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BatchImplCopyWith<$Res> implements $BatchCopyWith<$Res> {
  factory _$$BatchImplCopyWith(
          _$BatchImpl value, $Res Function(_$BatchImpl) then) =
      __$$BatchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? batchName,
      int? academyId,
      int? branchId,
      int? courseId,
      int? subjectId,
      String? batchStatus,
      int? feeAmount,
      int? admissionFees,
      int? isActive,
      int? activeStudentsCount,
      int? inactiveStudentsCount,
      List<BatchDetail>? batchDetail,
      List<Trainer>? trainers,
      Course? course,
      Subject? subject,
      Branch? branch,
      List<Student>? students});

  @override
  $CourseCopyWith<$Res>? get course;
  @override
  $SubjectCopyWith<$Res>? get subject;
  @override
  $BranchCopyWith<$Res>? get branch;
}

/// @nodoc
class __$$BatchImplCopyWithImpl<$Res>
    extends _$BatchCopyWithImpl<$Res, _$BatchImpl>
    implements _$$BatchImplCopyWith<$Res> {
  __$$BatchImplCopyWithImpl(
      _$BatchImpl _value, $Res Function(_$BatchImpl) _then)
      : super(_value, _then);

  /// Create a copy of Batch
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? batchName = freezed,
    Object? academyId = freezed,
    Object? branchId = freezed,
    Object? courseId = freezed,
    Object? subjectId = freezed,
    Object? batchStatus = freezed,
    Object? feeAmount = freezed,
    Object? admissionFees = freezed,
    Object? isActive = freezed,
    Object? activeStudentsCount = freezed,
    Object? inactiveStudentsCount = freezed,
    Object? batchDetail = freezed,
    Object? trainers = freezed,
    Object? course = freezed,
    Object? subject = freezed,
    Object? branch = freezed,
    Object? students = freezed,
  }) {
    return _then(_$BatchImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      batchName: freezed == batchName
          ? _value.batchName
          : batchName // ignore: cast_nullable_to_non_nullable
              as String?,
      academyId: freezed == academyId
          ? _value.academyId
          : academyId // ignore: cast_nullable_to_non_nullable
              as int?,
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as int?,
      courseId: freezed == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as int?,
      subjectId: freezed == subjectId
          ? _value.subjectId
          : subjectId // ignore: cast_nullable_to_non_nullable
              as int?,
      batchStatus: freezed == batchStatus
          ? _value.batchStatus
          : batchStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      feeAmount: freezed == feeAmount
          ? _value.feeAmount
          : feeAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      admissionFees: freezed == admissionFees
          ? _value.admissionFees
          : admissionFees // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int?,
      activeStudentsCount: freezed == activeStudentsCount
          ? _value.activeStudentsCount
          : activeStudentsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      inactiveStudentsCount: freezed == inactiveStudentsCount
          ? _value.inactiveStudentsCount
          : inactiveStudentsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      batchDetail: freezed == batchDetail
          ? _value._batchDetail
          : batchDetail // ignore: cast_nullable_to_non_nullable
              as List<BatchDetail>?,
      trainers: freezed == trainers
          ? _value._trainers
          : trainers // ignore: cast_nullable_to_non_nullable
              as List<Trainer>?,
      course: freezed == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as Course?,
      subject: freezed == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as Subject?,
      branch: freezed == branch
          ? _value.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as Branch?,
      students: freezed == students
          ? _value._students
          : students // ignore: cast_nullable_to_non_nullable
              as List<Student>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$BatchImpl implements _Batch {
  const _$BatchImpl(
      {this.id,
      this.batchName,
      this.academyId,
      this.branchId,
      this.courseId,
      this.subjectId,
      this.batchStatus,
      this.feeAmount,
      this.admissionFees,
      this.isActive,
      this.activeStudentsCount,
      this.inactiveStudentsCount,
      final List<BatchDetail>? batchDetail,
      final List<Trainer>? trainers,
      this.course,
      this.subject,
      this.branch,
      final List<Student>? students})
      : _batchDetail = batchDetail,
        _trainers = trainers,
        _students = students;

  factory _$BatchImpl.fromJson(Map<String, dynamic> json) =>
      _$$BatchImplFromJson(json);

  @override
  final int? id;
  @override
  final String? batchName;
  @override
  final int? academyId;
  @override
  final int? branchId;
  @override
  final int? courseId;
  @override
  final int? subjectId;
  @override
  final String? batchStatus;
  @override
  final int? feeAmount;
  @override
  final int? admissionFees;
  @override
  final int? isActive;
  @override
  final int? activeStudentsCount;
  @override
  final int? inactiveStudentsCount;
  final List<BatchDetail>? _batchDetail;
  @override
  List<BatchDetail>? get batchDetail {
    final value = _batchDetail;
    if (value == null) return null;
    if (_batchDetail is EqualUnmodifiableListView) return _batchDetail;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Trainer>? _trainers;
  @override
  List<Trainer>? get trainers {
    final value = _trainers;
    if (value == null) return null;
    if (_trainers is EqualUnmodifiableListView) return _trainers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Course? course;
  @override
  final Subject? subject;
  @override
  final Branch? branch;
  final List<Student>? _students;
  @override
  List<Student>? get students {
    final value = _students;
    if (value == null) return null;
    if (_students is EqualUnmodifiableListView) return _students;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Batch(id: $id, batchName: $batchName, academyId: $academyId, branchId: $branchId, courseId: $courseId, subjectId: $subjectId, batchStatus: $batchStatus, feeAmount: $feeAmount, admissionFees: $admissionFees, isActive: $isActive, activeStudentsCount: $activeStudentsCount, inactiveStudentsCount: $inactiveStudentsCount, batchDetail: $batchDetail, trainers: $trainers, course: $course, subject: $subject, branch: $branch, students: $students)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BatchImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.batchName, batchName) ||
                other.batchName == batchName) &&
            (identical(other.academyId, academyId) ||
                other.academyId == academyId) &&
            (identical(other.branchId, branchId) ||
                other.branchId == branchId) &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId) &&
            (identical(other.subjectId, subjectId) ||
                other.subjectId == subjectId) &&
            (identical(other.batchStatus, batchStatus) ||
                other.batchStatus == batchStatus) &&
            (identical(other.feeAmount, feeAmount) ||
                other.feeAmount == feeAmount) &&
            (identical(other.admissionFees, admissionFees) ||
                other.admissionFees == admissionFees) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.activeStudentsCount, activeStudentsCount) ||
                other.activeStudentsCount == activeStudentsCount) &&
            (identical(other.inactiveStudentsCount, inactiveStudentsCount) ||
                other.inactiveStudentsCount == inactiveStudentsCount) &&
            const DeepCollectionEquality()
                .equals(other._batchDetail, _batchDetail) &&
            const DeepCollectionEquality().equals(other._trainers, _trainers) &&
            (identical(other.course, course) || other.course == course) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.branch, branch) || other.branch == branch) &&
            const DeepCollectionEquality().equals(other._students, _students));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      batchName,
      academyId,
      branchId,
      courseId,
      subjectId,
      batchStatus,
      feeAmount,
      admissionFees,
      isActive,
      activeStudentsCount,
      inactiveStudentsCount,
      const DeepCollectionEquality().hash(_batchDetail),
      const DeepCollectionEquality().hash(_trainers),
      course,
      subject,
      branch,
      const DeepCollectionEquality().hash(_students));

  /// Create a copy of Batch
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BatchImplCopyWith<_$BatchImpl> get copyWith =>
      __$$BatchImplCopyWithImpl<_$BatchImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BatchImplToJson(
      this,
    );
  }
}

abstract class _Batch implements Batch {
  const factory _Batch(
      {final int? id,
      final String? batchName,
      final int? academyId,
      final int? branchId,
      final int? courseId,
      final int? subjectId,
      final String? batchStatus,
      final int? feeAmount,
      final int? admissionFees,
      final int? isActive,
      final int? activeStudentsCount,
      final int? inactiveStudentsCount,
      final List<BatchDetail>? batchDetail,
      final List<Trainer>? trainers,
      final Course? course,
      final Subject? subject,
      final Branch? branch,
      final List<Student>? students}) = _$BatchImpl;

  factory _Batch.fromJson(Map<String, dynamic> json) = _$BatchImpl.fromJson;

  @override
  int? get id;
  @override
  String? get batchName;
  @override
  int? get academyId;
  @override
  int? get branchId;
  @override
  int? get courseId;
  @override
  int? get subjectId;
  @override
  String? get batchStatus;
  @override
  int? get feeAmount;
  @override
  int? get admissionFees;
  @override
  int? get isActive;
  @override
  int? get activeStudentsCount;
  @override
  int? get inactiveStudentsCount;
  @override
  List<BatchDetail>? get batchDetail;
  @override
  List<Trainer>? get trainers;
  @override
  Course? get course;
  @override
  Subject? get subject;
  @override
  Branch? get branch;
  @override
  List<Student>? get students;

  /// Create a copy of Batch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BatchImplCopyWith<_$BatchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BatchDetail _$BatchDetailFromJson(Map<String, dynamic> json) {
  return _BatchDetail.fromJson(json);
}

/// @nodoc
mixin _$BatchDetail {
  int? get id => throw _privateConstructorUsedError;
  int? get batchId => throw _privateConstructorUsedError;
  int? get day => throw _privateConstructorUsedError;
  String? get startTime => throw _privateConstructorUsedError;
  String? get endTime => throw _privateConstructorUsedError;
  int? get isActive => throw _privateConstructorUsedError;

  /// Serializes this BatchDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BatchDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BatchDetailCopyWith<BatchDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BatchDetailCopyWith<$Res> {
  factory $BatchDetailCopyWith(
          BatchDetail value, $Res Function(BatchDetail) then) =
      _$BatchDetailCopyWithImpl<$Res, BatchDetail>;
  @useResult
  $Res call(
      {int? id,
      int? batchId,
      int? day,
      String? startTime,
      String? endTime,
      int? isActive});
}

/// @nodoc
class _$BatchDetailCopyWithImpl<$Res, $Val extends BatchDetail>
    implements $BatchDetailCopyWith<$Res> {
  _$BatchDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BatchDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? batchId = freezed,
    Object? day = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? isActive = freezed,
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
      day: freezed == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BatchDetailImplCopyWith<$Res>
    implements $BatchDetailCopyWith<$Res> {
  factory _$$BatchDetailImplCopyWith(
          _$BatchDetailImpl value, $Res Function(_$BatchDetailImpl) then) =
      __$$BatchDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? batchId,
      int? day,
      String? startTime,
      String? endTime,
      int? isActive});
}

/// @nodoc
class __$$BatchDetailImplCopyWithImpl<$Res>
    extends _$BatchDetailCopyWithImpl<$Res, _$BatchDetailImpl>
    implements _$$BatchDetailImplCopyWith<$Res> {
  __$$BatchDetailImplCopyWithImpl(
      _$BatchDetailImpl _value, $Res Function(_$BatchDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of BatchDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? batchId = freezed,
    Object? day = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_$BatchDetailImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      batchId: freezed == batchId
          ? _value.batchId
          : batchId // ignore: cast_nullable_to_non_nullable
              as int?,
      day: freezed == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
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
class _$BatchDetailImpl implements _BatchDetail {
  const _$BatchDetailImpl(
      {this.id,
      this.batchId,
      this.day,
      this.startTime,
      this.endTime,
      this.isActive});

  factory _$BatchDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$BatchDetailImplFromJson(json);

  @override
  final int? id;
  @override
  final int? batchId;
  @override
  final int? day;
  @override
  final String? startTime;
  @override
  final String? endTime;
  @override
  final int? isActive;

  @override
  String toString() {
    return 'BatchDetail(id: $id, batchId: $batchId, day: $day, startTime: $startTime, endTime: $endTime, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BatchDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.batchId, batchId) || other.batchId == batchId) &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, batchId, day, startTime, endTime, isActive);

  /// Create a copy of BatchDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BatchDetailImplCopyWith<_$BatchDetailImpl> get copyWith =>
      __$$BatchDetailImplCopyWithImpl<_$BatchDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BatchDetailImplToJson(
      this,
    );
  }
}

abstract class _BatchDetail implements BatchDetail {
  const factory _BatchDetail(
      {final int? id,
      final int? batchId,
      final int? day,
      final String? startTime,
      final String? endTime,
      final int? isActive}) = _$BatchDetailImpl;

  factory _BatchDetail.fromJson(Map<String, dynamic> json) =
      _$BatchDetailImpl.fromJson;

  @override
  int? get id;
  @override
  int? get batchId;
  @override
  int? get day;
  @override
  String? get startTime;
  @override
  String? get endTime;
  @override
  int? get isActive;

  /// Create a copy of BatchDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BatchDetailImplCopyWith<_$BatchDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Branch _$BranchFromJson(Map<String, dynamic> json) {
  return _Branch.fromJson(json);
}

/// @nodoc
mixin _$Branch {
  int? get id => throw _privateConstructorUsedError;
  String? get branchName => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  int? get pincode => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  int? get stateId => throw _privateConstructorUsedError;
  int? get districtId => throw _privateConstructorUsedError;
  int? get countryId => throw _privateConstructorUsedError;
  Country? get country => throw _privateConstructorUsedError;
  StateDetails? get state => throw _privateConstructorUsedError;
  District? get district => throw _privateConstructorUsedError;
  Timezone? get timezone => throw _privateConstructorUsedError;

  /// Serializes this Branch to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Branch
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BranchCopyWith<Branch> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BranchCopyWith<$Res> {
  factory $BranchCopyWith(Branch value, $Res Function(Branch) then) =
      _$BranchCopyWithImpl<$Res, Branch>;
  @useResult
  $Res call(
      {int? id,
      String? branchName,
      String? address,
      int? pincode,
      String? currency,
      int? stateId,
      int? districtId,
      int? countryId,
      Country? country,
      StateDetails? state,
      District? district,
      Timezone? timezone});

  $CountryCopyWith<$Res>? get country;
  $StateDetailsCopyWith<$Res>? get state;
  $DistrictCopyWith<$Res>? get district;
  $TimezoneCopyWith<$Res>? get timezone;
}

/// @nodoc
class _$BranchCopyWithImpl<$Res, $Val extends Branch>
    implements $BranchCopyWith<$Res> {
  _$BranchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Branch
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? branchName = freezed,
    Object? address = freezed,
    Object? pincode = freezed,
    Object? currency = freezed,
    Object? stateId = freezed,
    Object? districtId = freezed,
    Object? countryId = freezed,
    Object? country = freezed,
    Object? state = freezed,
    Object? district = freezed,
    Object? timezone = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      branchName: freezed == branchName
          ? _value.branchName
          : branchName // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      pincode: freezed == pincode
          ? _value.pincode
          : pincode // ignore: cast_nullable_to_non_nullable
              as int?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      stateId: freezed == stateId
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as int?,
      districtId: freezed == districtId
          ? _value.districtId
          : districtId // ignore: cast_nullable_to_non_nullable
              as int?,
      countryId: freezed == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as int?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as Country?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as StateDetails?,
      district: freezed == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as District?,
      timezone: freezed == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as Timezone?,
    ) as $Val);
  }

  /// Create a copy of Branch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CountryCopyWith<$Res>? get country {
    if (_value.country == null) {
      return null;
    }

    return $CountryCopyWith<$Res>(_value.country!, (value) {
      return _then(_value.copyWith(country: value) as $Val);
    });
  }

  /// Create a copy of Branch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StateDetailsCopyWith<$Res>? get state {
    if (_value.state == null) {
      return null;
    }

    return $StateDetailsCopyWith<$Res>(_value.state!, (value) {
      return _then(_value.copyWith(state: value) as $Val);
    });
  }

  /// Create a copy of Branch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DistrictCopyWith<$Res>? get district {
    if (_value.district == null) {
      return null;
    }

    return $DistrictCopyWith<$Res>(_value.district!, (value) {
      return _then(_value.copyWith(district: value) as $Val);
    });
  }

  /// Create a copy of Branch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TimezoneCopyWith<$Res>? get timezone {
    if (_value.timezone == null) {
      return null;
    }

    return $TimezoneCopyWith<$Res>(_value.timezone!, (value) {
      return _then(_value.copyWith(timezone: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BranchImplCopyWith<$Res> implements $BranchCopyWith<$Res> {
  factory _$$BranchImplCopyWith(
          _$BranchImpl value, $Res Function(_$BranchImpl) then) =
      __$$BranchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? branchName,
      String? address,
      int? pincode,
      String? currency,
      int? stateId,
      int? districtId,
      int? countryId,
      Country? country,
      StateDetails? state,
      District? district,
      Timezone? timezone});

  @override
  $CountryCopyWith<$Res>? get country;
  @override
  $StateDetailsCopyWith<$Res>? get state;
  @override
  $DistrictCopyWith<$Res>? get district;
  @override
  $TimezoneCopyWith<$Res>? get timezone;
}

/// @nodoc
class __$$BranchImplCopyWithImpl<$Res>
    extends _$BranchCopyWithImpl<$Res, _$BranchImpl>
    implements _$$BranchImplCopyWith<$Res> {
  __$$BranchImplCopyWithImpl(
      _$BranchImpl _value, $Res Function(_$BranchImpl) _then)
      : super(_value, _then);

  /// Create a copy of Branch
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? branchName = freezed,
    Object? address = freezed,
    Object? pincode = freezed,
    Object? currency = freezed,
    Object? stateId = freezed,
    Object? districtId = freezed,
    Object? countryId = freezed,
    Object? country = freezed,
    Object? state = freezed,
    Object? district = freezed,
    Object? timezone = freezed,
  }) {
    return _then(_$BranchImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      branchName: freezed == branchName
          ? _value.branchName
          : branchName // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      pincode: freezed == pincode
          ? _value.pincode
          : pincode // ignore: cast_nullable_to_non_nullable
              as int?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      stateId: freezed == stateId
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as int?,
      districtId: freezed == districtId
          ? _value.districtId
          : districtId // ignore: cast_nullable_to_non_nullable
              as int?,
      countryId: freezed == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as int?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as Country?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as StateDetails?,
      district: freezed == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as District?,
      timezone: freezed == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as Timezone?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$BranchImpl implements _Branch {
  const _$BranchImpl(
      {this.id,
      this.branchName,
      this.address,
      this.pincode,
      this.currency,
      this.stateId,
      this.districtId,
      this.countryId,
      this.country,
      this.state,
      this.district,
      this.timezone});

  factory _$BranchImpl.fromJson(Map<String, dynamic> json) =>
      _$$BranchImplFromJson(json);

  @override
  final int? id;
  @override
  final String? branchName;
  @override
  final String? address;
  @override
  final int? pincode;
  @override
  final String? currency;
  @override
  final int? stateId;
  @override
  final int? districtId;
  @override
  final int? countryId;
  @override
  final Country? country;
  @override
  final StateDetails? state;
  @override
  final District? district;
  @override
  final Timezone? timezone;

  @override
  String toString() {
    return 'Branch(id: $id, branchName: $branchName, address: $address, pincode: $pincode, currency: $currency, stateId: $stateId, districtId: $districtId, countryId: $countryId, country: $country, state: $state, district: $district, timezone: $timezone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BranchImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.branchName, branchName) ||
                other.branchName == branchName) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.pincode, pincode) || other.pincode == pincode) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.stateId, stateId) || other.stateId == stateId) &&
            (identical(other.districtId, districtId) ||
                other.districtId == districtId) &&
            (identical(other.countryId, countryId) ||
                other.countryId == countryId) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.district, district) ||
                other.district == district) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      branchName,
      address,
      pincode,
      currency,
      stateId,
      districtId,
      countryId,
      country,
      state,
      district,
      timezone);

  /// Create a copy of Branch
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BranchImplCopyWith<_$BranchImpl> get copyWith =>
      __$$BranchImplCopyWithImpl<_$BranchImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BranchImplToJson(
      this,
    );
  }
}

abstract class _Branch implements Branch {
  const factory _Branch(
      {final int? id,
      final String? branchName,
      final String? address,
      final int? pincode,
      final String? currency,
      final int? stateId,
      final int? districtId,
      final int? countryId,
      final Country? country,
      final StateDetails? state,
      final District? district,
      final Timezone? timezone}) = _$BranchImpl;

  factory _Branch.fromJson(Map<String, dynamic> json) = _$BranchImpl.fromJson;

  @override
  int? get id;
  @override
  String? get branchName;
  @override
  String? get address;
  @override
  int? get pincode;
  @override
  String? get currency;
  @override
  int? get stateId;
  @override
  int? get districtId;
  @override
  int? get countryId;
  @override
  Country? get country;
  @override
  StateDetails? get state;
  @override
  District? get district;
  @override
  Timezone? get timezone;

  /// Create a copy of Branch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BranchImplCopyWith<_$BranchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Country _$CountryFromJson(Map<String, dynamic> json) {
  return _Country.fromJson(json);
}

/// @nodoc
mixin _$Country {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  String? get currencySymbol => throw _privateConstructorUsedError;
  String? get currencyCode => throw _privateConstructorUsedError;
  String? get timezone => throw _privateConstructorUsedError;
  String? get currencySubUnit => throw _privateConstructorUsedError;

  /// Serializes this Country to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Country
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CountryCopyWith<Country> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryCopyWith<$Res> {
  factory $CountryCopyWith(Country value, $Res Function(Country) then) =
      _$CountryCopyWithImpl<$Res, Country>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? currency,
      String? currencySymbol,
      String? currencyCode,
      String? timezone,
      String? currencySubUnit});
}

/// @nodoc
class _$CountryCopyWithImpl<$Res, $Val extends Country>
    implements $CountryCopyWith<$Res> {
  _$CountryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Country
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? currency = freezed,
    Object? currencySymbol = freezed,
    Object? currencyCode = freezed,
    Object? timezone = freezed,
    Object? currencySubUnit = freezed,
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
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      currencySymbol: freezed == currencySymbol
          ? _value.currencySymbol
          : currencySymbol // ignore: cast_nullable_to_non_nullable
              as String?,
      currencyCode: freezed == currencyCode
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String?,
      timezone: freezed == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
      currencySubUnit: freezed == currencySubUnit
          ? _value.currencySubUnit
          : currencySubUnit // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CountryImplCopyWith<$Res> implements $CountryCopyWith<$Res> {
  factory _$$CountryImplCopyWith(
          _$CountryImpl value, $Res Function(_$CountryImpl) then) =
      __$$CountryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? currency,
      String? currencySymbol,
      String? currencyCode,
      String? timezone,
      String? currencySubUnit});
}

/// @nodoc
class __$$CountryImplCopyWithImpl<$Res>
    extends _$CountryCopyWithImpl<$Res, _$CountryImpl>
    implements _$$CountryImplCopyWith<$Res> {
  __$$CountryImplCopyWithImpl(
      _$CountryImpl _value, $Res Function(_$CountryImpl) _then)
      : super(_value, _then);

  /// Create a copy of Country
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? currency = freezed,
    Object? currencySymbol = freezed,
    Object? currencyCode = freezed,
    Object? timezone = freezed,
    Object? currencySubUnit = freezed,
  }) {
    return _then(_$CountryImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      currencySymbol: freezed == currencySymbol
          ? _value.currencySymbol
          : currencySymbol // ignore: cast_nullable_to_non_nullable
              as String?,
      currencyCode: freezed == currencyCode
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String?,
      timezone: freezed == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
      currencySubUnit: freezed == currencySubUnit
          ? _value.currencySubUnit
          : currencySubUnit // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$CountryImpl implements _Country {
  const _$CountryImpl(
      {this.id,
      this.name,
      this.currency,
      this.currencySymbol,
      this.currencyCode,
      this.timezone,
      this.currencySubUnit});

  factory _$CountryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CountryImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? currency;
  @override
  final String? currencySymbol;
  @override
  final String? currencyCode;
  @override
  final String? timezone;
  @override
  final String? currencySubUnit;

  @override
  String toString() {
    return 'Country(id: $id, name: $name, currency: $currency, currencySymbol: $currencySymbol, currencyCode: $currencyCode, timezone: $timezone, currencySubUnit: $currencySubUnit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CountryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.currencySymbol, currencySymbol) ||
                other.currencySymbol == currencySymbol) &&
            (identical(other.currencyCode, currencyCode) ||
                other.currencyCode == currencyCode) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            (identical(other.currencySubUnit, currencySubUnit) ||
                other.currencySubUnit == currencySubUnit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, currency,
      currencySymbol, currencyCode, timezone, currencySubUnit);

  /// Create a copy of Country
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CountryImplCopyWith<_$CountryImpl> get copyWith =>
      __$$CountryImplCopyWithImpl<_$CountryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CountryImplToJson(
      this,
    );
  }
}

abstract class _Country implements Country {
  const factory _Country(
      {final int? id,
      final String? name,
      final String? currency,
      final String? currencySymbol,
      final String? currencyCode,
      final String? timezone,
      final String? currencySubUnit}) = _$CountryImpl;

  factory _Country.fromJson(Map<String, dynamic> json) = _$CountryImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get currency;
  @override
  String? get currencySymbol;
  @override
  String? get currencyCode;
  @override
  String? get timezone;
  @override
  String? get currencySubUnit;

  /// Create a copy of Country
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CountryImplCopyWith<_$CountryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

District _$DistrictFromJson(Map<String, dynamic> json) {
  return _District.fromJson(json);
}

/// @nodoc
mixin _$District {
  int? get id => throw _privateConstructorUsedError;
  String? get districtName => throw _privateConstructorUsedError;

  /// Serializes this District to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of District
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DistrictCopyWith<District> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DistrictCopyWith<$Res> {
  factory $DistrictCopyWith(District value, $Res Function(District) then) =
      _$DistrictCopyWithImpl<$Res, District>;
  @useResult
  $Res call({int? id, String? districtName});
}

/// @nodoc
class _$DistrictCopyWithImpl<$Res, $Val extends District>
    implements $DistrictCopyWith<$Res> {
  _$DistrictCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of District
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? districtName = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      districtName: freezed == districtName
          ? _value.districtName
          : districtName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DistrictImplCopyWith<$Res>
    implements $DistrictCopyWith<$Res> {
  factory _$$DistrictImplCopyWith(
          _$DistrictImpl value, $Res Function(_$DistrictImpl) then) =
      __$$DistrictImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? districtName});
}

/// @nodoc
class __$$DistrictImplCopyWithImpl<$Res>
    extends _$DistrictCopyWithImpl<$Res, _$DistrictImpl>
    implements _$$DistrictImplCopyWith<$Res> {
  __$$DistrictImplCopyWithImpl(
      _$DistrictImpl _value, $Res Function(_$DistrictImpl) _then)
      : super(_value, _then);

  /// Create a copy of District
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? districtName = freezed,
  }) {
    return _then(_$DistrictImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      districtName: freezed == districtName
          ? _value.districtName
          : districtName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$DistrictImpl implements _District {
  const _$DistrictImpl({this.id, this.districtName});

  factory _$DistrictImpl.fromJson(Map<String, dynamic> json) =>
      _$$DistrictImplFromJson(json);

  @override
  final int? id;
  @override
  final String? districtName;

  @override
  String toString() {
    return 'District(id: $id, districtName: $districtName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DistrictImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.districtName, districtName) ||
                other.districtName == districtName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, districtName);

  /// Create a copy of District
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DistrictImplCopyWith<_$DistrictImpl> get copyWith =>
      __$$DistrictImplCopyWithImpl<_$DistrictImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DistrictImplToJson(
      this,
    );
  }
}

abstract class _District implements District {
  const factory _District({final int? id, final String? districtName}) =
      _$DistrictImpl;

  factory _District.fromJson(Map<String, dynamic> json) =
      _$DistrictImpl.fromJson;

  @override
  int? get id;
  @override
  String? get districtName;

  /// Create a copy of District
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DistrictImplCopyWith<_$DistrictImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StateDetails _$StateDetailsFromJson(Map<String, dynamic> json) {
  return _StateDetails.fromJson(json);
}

/// @nodoc
mixin _$StateDetails {
  int? get id => throw _privateConstructorUsedError;
  String? get stateName => throw _privateConstructorUsedError;

  /// Serializes this StateDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StateDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StateDetailsCopyWith<StateDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StateDetailsCopyWith<$Res> {
  factory $StateDetailsCopyWith(
          StateDetails value, $Res Function(StateDetails) then) =
      _$StateDetailsCopyWithImpl<$Res, StateDetails>;
  @useResult
  $Res call({int? id, String? stateName});
}

/// @nodoc
class _$StateDetailsCopyWithImpl<$Res, $Val extends StateDetails>
    implements $StateDetailsCopyWith<$Res> {
  _$StateDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StateDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? stateName = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      stateName: freezed == stateName
          ? _value.stateName
          : stateName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StateDetailsImplCopyWith<$Res>
    implements $StateDetailsCopyWith<$Res> {
  factory _$$StateDetailsImplCopyWith(
          _$StateDetailsImpl value, $Res Function(_$StateDetailsImpl) then) =
      __$$StateDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? stateName});
}

/// @nodoc
class __$$StateDetailsImplCopyWithImpl<$Res>
    extends _$StateDetailsCopyWithImpl<$Res, _$StateDetailsImpl>
    implements _$$StateDetailsImplCopyWith<$Res> {
  __$$StateDetailsImplCopyWithImpl(
      _$StateDetailsImpl _value, $Res Function(_$StateDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of StateDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? stateName = freezed,
  }) {
    return _then(_$StateDetailsImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      stateName: freezed == stateName
          ? _value.stateName
          : stateName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$StateDetailsImpl implements _StateDetails {
  const _$StateDetailsImpl({this.id, this.stateName});

  factory _$StateDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$StateDetailsImplFromJson(json);

  @override
  final int? id;
  @override
  final String? stateName;

  @override
  String toString() {
    return 'StateDetails(id: $id, stateName: $stateName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StateDetailsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.stateName, stateName) ||
                other.stateName == stateName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, stateName);

  /// Create a copy of StateDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StateDetailsImplCopyWith<_$StateDetailsImpl> get copyWith =>
      __$$StateDetailsImplCopyWithImpl<_$StateDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StateDetailsImplToJson(
      this,
    );
  }
}

abstract class _StateDetails implements StateDetails {
  const factory _StateDetails({final int? id, final String? stateName}) =
      _$StateDetailsImpl;

  factory _StateDetails.fromJson(Map<String, dynamic> json) =
      _$StateDetailsImpl.fromJson;

  @override
  int? get id;
  @override
  String? get stateName;

  /// Create a copy of StateDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StateDetailsImplCopyWith<_$StateDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Timezone _$TimezoneFromJson(Map<String, dynamic> json) {
  return _Timezone.fromJson(json);
}

/// @nodoc
mixin _$Timezone {
  int? get id => throw _privateConstructorUsedError;
  String? get timezone => throw _privateConstructorUsedError;

  /// Serializes this Timezone to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Timezone
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TimezoneCopyWith<Timezone> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimezoneCopyWith<$Res> {
  factory $TimezoneCopyWith(Timezone value, $Res Function(Timezone) then) =
      _$TimezoneCopyWithImpl<$Res, Timezone>;
  @useResult
  $Res call({int? id, String? timezone});
}

/// @nodoc
class _$TimezoneCopyWithImpl<$Res, $Val extends Timezone>
    implements $TimezoneCopyWith<$Res> {
  _$TimezoneCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Timezone
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? timezone = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      timezone: freezed == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimezoneImplCopyWith<$Res>
    implements $TimezoneCopyWith<$Res> {
  factory _$$TimezoneImplCopyWith(
          _$TimezoneImpl value, $Res Function(_$TimezoneImpl) then) =
      __$$TimezoneImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? timezone});
}

/// @nodoc
class __$$TimezoneImplCopyWithImpl<$Res>
    extends _$TimezoneCopyWithImpl<$Res, _$TimezoneImpl>
    implements _$$TimezoneImplCopyWith<$Res> {
  __$$TimezoneImplCopyWithImpl(
      _$TimezoneImpl _value, $Res Function(_$TimezoneImpl) _then)
      : super(_value, _then);

  /// Create a copy of Timezone
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? timezone = freezed,
  }) {
    return _then(_$TimezoneImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      timezone: freezed == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$TimezoneImpl implements _Timezone {
  const _$TimezoneImpl({this.id, this.timezone});

  factory _$TimezoneImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimezoneImplFromJson(json);

  @override
  final int? id;
  @override
  final String? timezone;

  @override
  String toString() {
    return 'Timezone(id: $id, timezone: $timezone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimezoneImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, timezone);

  /// Create a copy of Timezone
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimezoneImplCopyWith<_$TimezoneImpl> get copyWith =>
      __$$TimezoneImplCopyWithImpl<_$TimezoneImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimezoneImplToJson(
      this,
    );
  }
}

abstract class _Timezone implements Timezone {
  const factory _Timezone({final int? id, final String? timezone}) =
      _$TimezoneImpl;

  factory _Timezone.fromJson(Map<String, dynamic> json) =
      _$TimezoneImpl.fromJson;

  @override
  int? get id;
  @override
  String? get timezone;

  /// Create a copy of Timezone
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimezoneImplCopyWith<_$TimezoneImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Course _$CourseFromJson(Map<String, dynamic> json) {
  return _Course.fromJson(json);
}

/// @nodoc
mixin _$Course {
  int? get id => throw _privateConstructorUsedError;
  int? get academyTypeId => throw _privateConstructorUsedError;
  String? get courseName => throw _privateConstructorUsedError;
  int? get isActive => throw _privateConstructorUsedError;

  /// Serializes this Course to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Course
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CourseCopyWith<Course> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseCopyWith<$Res> {
  factory $CourseCopyWith(Course value, $Res Function(Course) then) =
      _$CourseCopyWithImpl<$Res, Course>;
  @useResult
  $Res call({int? id, int? academyTypeId, String? courseName, int? isActive});
}

/// @nodoc
class _$CourseCopyWithImpl<$Res, $Val extends Course>
    implements $CourseCopyWith<$Res> {
  _$CourseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Course
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? academyTypeId = freezed,
    Object? courseName = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      academyTypeId: freezed == academyTypeId
          ? _value.academyTypeId
          : academyTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      courseName: freezed == courseName
          ? _value.courseName
          : courseName // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CourseImplCopyWith<$Res> implements $CourseCopyWith<$Res> {
  factory _$$CourseImplCopyWith(
          _$CourseImpl value, $Res Function(_$CourseImpl) then) =
      __$$CourseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, int? academyTypeId, String? courseName, int? isActive});
}

/// @nodoc
class __$$CourseImplCopyWithImpl<$Res>
    extends _$CourseCopyWithImpl<$Res, _$CourseImpl>
    implements _$$CourseImplCopyWith<$Res> {
  __$$CourseImplCopyWithImpl(
      _$CourseImpl _value, $Res Function(_$CourseImpl) _then)
      : super(_value, _then);

  /// Create a copy of Course
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? academyTypeId = freezed,
    Object? courseName = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_$CourseImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      academyTypeId: freezed == academyTypeId
          ? _value.academyTypeId
          : academyTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      courseName: freezed == courseName
          ? _value.courseName
          : courseName // ignore: cast_nullable_to_non_nullable
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
class _$CourseImpl implements _Course {
  const _$CourseImpl(
      {this.id, this.academyTypeId, this.courseName, this.isActive});

  factory _$CourseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CourseImplFromJson(json);

  @override
  final int? id;
  @override
  final int? academyTypeId;
  @override
  final String? courseName;
  @override
  final int? isActive;

  @override
  String toString() {
    return 'Course(id: $id, academyTypeId: $academyTypeId, courseName: $courseName, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.academyTypeId, academyTypeId) ||
                other.academyTypeId == academyTypeId) &&
            (identical(other.courseName, courseName) ||
                other.courseName == courseName) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, academyTypeId, courseName, isActive);

  /// Create a copy of Course
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseImplCopyWith<_$CourseImpl> get copyWith =>
      __$$CourseImplCopyWithImpl<_$CourseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CourseImplToJson(
      this,
    );
  }
}

abstract class _Course implements Course {
  const factory _Course(
      {final int? id,
      final int? academyTypeId,
      final String? courseName,
      final int? isActive}) = _$CourseImpl;

  factory _Course.fromJson(Map<String, dynamic> json) = _$CourseImpl.fromJson;

  @override
  int? get id;
  @override
  int? get academyTypeId;
  @override
  String? get courseName;
  @override
  int? get isActive;

  /// Create a copy of Course
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CourseImplCopyWith<_$CourseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Subject _$SubjectFromJson(Map<String, dynamic> json) {
  return _Subject.fromJson(json);
}

/// @nodoc
mixin _$Subject {
  int? get id => throw _privateConstructorUsedError;
  int? get courseId => throw _privateConstructorUsedError;
  String? get subjectName => throw _privateConstructorUsedError;
  int? get isActive => throw _privateConstructorUsedError;

  /// Serializes this Subject to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Subject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubjectCopyWith<Subject> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubjectCopyWith<$Res> {
  factory $SubjectCopyWith(Subject value, $Res Function(Subject) then) =
      _$SubjectCopyWithImpl<$Res, Subject>;
  @useResult
  $Res call({int? id, int? courseId, String? subjectName, int? isActive});
}

/// @nodoc
class _$SubjectCopyWithImpl<$Res, $Val extends Subject>
    implements $SubjectCopyWith<$Res> {
  _$SubjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Subject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? courseId = freezed,
    Object? subjectName = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      courseId: freezed == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as int?,
      subjectName: freezed == subjectName
          ? _value.subjectName
          : subjectName // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubjectImplCopyWith<$Res> implements $SubjectCopyWith<$Res> {
  factory _$$SubjectImplCopyWith(
          _$SubjectImpl value, $Res Function(_$SubjectImpl) then) =
      __$$SubjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, int? courseId, String? subjectName, int? isActive});
}

/// @nodoc
class __$$SubjectImplCopyWithImpl<$Res>
    extends _$SubjectCopyWithImpl<$Res, _$SubjectImpl>
    implements _$$SubjectImplCopyWith<$Res> {
  __$$SubjectImplCopyWithImpl(
      _$SubjectImpl _value, $Res Function(_$SubjectImpl) _then)
      : super(_value, _then);

  /// Create a copy of Subject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? courseId = freezed,
    Object? subjectName = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_$SubjectImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      courseId: freezed == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as int?,
      subjectName: freezed == subjectName
          ? _value.subjectName
          : subjectName // ignore: cast_nullable_to_non_nullable
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
class _$SubjectImpl implements _Subject {
  const _$SubjectImpl(
      {this.id, this.courseId, this.subjectName, this.isActive});

  factory _$SubjectImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubjectImplFromJson(json);

  @override
  final int? id;
  @override
  final int? courseId;
  @override
  final String? subjectName;
  @override
  final int? isActive;

  @override
  String toString() {
    return 'Subject(id: $id, courseId: $courseId, subjectName: $subjectName, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubjectImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId) &&
            (identical(other.subjectName, subjectName) ||
                other.subjectName == subjectName) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, courseId, subjectName, isActive);

  /// Create a copy of Subject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubjectImplCopyWith<_$SubjectImpl> get copyWith =>
      __$$SubjectImplCopyWithImpl<_$SubjectImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubjectImplToJson(
      this,
    );
  }
}

abstract class _Subject implements Subject {
  const factory _Subject(
      {final int? id,
      final int? courseId,
      final String? subjectName,
      final int? isActive}) = _$SubjectImpl;

  factory _Subject.fromJson(Map<String, dynamic> json) = _$SubjectImpl.fromJson;

  @override
  int? get id;
  @override
  int? get courseId;
  @override
  String? get subjectName;
  @override
  int? get isActive;

  /// Create a copy of Subject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubjectImplCopyWith<_$SubjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ClassDetails _$ClassDetailsFromJson(Map<String, dynamic> json) {
  return _ClassDetails.fromJson(json);
}

/// @nodoc
mixin _$ClassDetails {
  String? get startTime => throw _privateConstructorUsedError;
  String? get endTime => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;
  bool? get rescheduled => throw _privateConstructorUsedError;
  bool? get conducted => throw _privateConstructorUsedError;

  /// Serializes this ClassDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClassDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClassDetailsCopyWith<ClassDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClassDetailsCopyWith<$Res> {
  factory $ClassDetailsCopyWith(
          ClassDetails value, $Res Function(ClassDetails) then) =
      _$ClassDetailsCopyWithImpl<$Res, ClassDetails>;
  @useResult
  $Res call(
      {String? startTime,
      String? endTime,
      DateTime? date,
      bool? rescheduled,
      bool? conducted});
}

/// @nodoc
class _$ClassDetailsCopyWithImpl<$Res, $Val extends ClassDetails>
    implements $ClassDetailsCopyWith<$Res> {
  _$ClassDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClassDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? date = freezed,
    Object? rescheduled = freezed,
    Object? conducted = freezed,
  }) {
    return _then(_value.copyWith(
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rescheduled: freezed == rescheduled
          ? _value.rescheduled
          : rescheduled // ignore: cast_nullable_to_non_nullable
              as bool?,
      conducted: freezed == conducted
          ? _value.conducted
          : conducted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClassDetailsImplCopyWith<$Res>
    implements $ClassDetailsCopyWith<$Res> {
  factory _$$ClassDetailsImplCopyWith(
          _$ClassDetailsImpl value, $Res Function(_$ClassDetailsImpl) then) =
      __$$ClassDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? startTime,
      String? endTime,
      DateTime? date,
      bool? rescheduled,
      bool? conducted});
}

/// @nodoc
class __$$ClassDetailsImplCopyWithImpl<$Res>
    extends _$ClassDetailsCopyWithImpl<$Res, _$ClassDetailsImpl>
    implements _$$ClassDetailsImplCopyWith<$Res> {
  __$$ClassDetailsImplCopyWithImpl(
      _$ClassDetailsImpl _value, $Res Function(_$ClassDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClassDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? date = freezed,
    Object? rescheduled = freezed,
    Object? conducted = freezed,
  }) {
    return _then(_$ClassDetailsImpl(
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rescheduled: freezed == rescheduled
          ? _value.rescheduled
          : rescheduled // ignore: cast_nullable_to_non_nullable
              as bool?,
      conducted: freezed == conducted
          ? _value.conducted
          : conducted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$ClassDetailsImpl implements _ClassDetails {
  const _$ClassDetailsImpl(
      {this.startTime,
      this.endTime,
      this.date,
      this.rescheduled,
      this.conducted});

  factory _$ClassDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClassDetailsImplFromJson(json);

  @override
  final String? startTime;
  @override
  final String? endTime;
  @override
  final DateTime? date;
  @override
  final bool? rescheduled;
  @override
  final bool? conducted;

  @override
  String toString() {
    return 'ClassDetails(startTime: $startTime, endTime: $endTime, date: $date, rescheduled: $rescheduled, conducted: $conducted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClassDetailsImpl &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.rescheduled, rescheduled) ||
                other.rescheduled == rescheduled) &&
            (identical(other.conducted, conducted) ||
                other.conducted == conducted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, startTime, endTime, date, rescheduled, conducted);

  /// Create a copy of ClassDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClassDetailsImplCopyWith<_$ClassDetailsImpl> get copyWith =>
      __$$ClassDetailsImplCopyWithImpl<_$ClassDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClassDetailsImplToJson(
      this,
    );
  }
}

abstract class _ClassDetails implements ClassDetails {
  const factory _ClassDetails(
      {final String? startTime,
      final String? endTime,
      final DateTime? date,
      final bool? rescheduled,
      final bool? conducted}) = _$ClassDetailsImpl;

  factory _ClassDetails.fromJson(Map<String, dynamic> json) =
      _$ClassDetailsImpl.fromJson;

  @override
  String? get startTime;
  @override
  String? get endTime;
  @override
  DateTime? get date;
  @override
  bool? get rescheduled;
  @override
  bool? get conducted;

  /// Create a copy of ClassDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClassDetailsImplCopyWith<_$ClassDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
