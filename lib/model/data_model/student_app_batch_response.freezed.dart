// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'student_app_batch_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StudentAppBatchResponse _$StudentAppBatchResponseFromJson(
    Map<String, dynamic> json) {
  return _StudentAppBatchResponse.fromJson(json);
}

/// @nodoc
mixin _$StudentAppBatchResponse {
  String? get branchName => throw _privateConstructorUsedError;
  List<StudentAppBatchDetail>? get batches =>
      throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StudentAppBatchResponseCopyWith<StudentAppBatchResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentAppBatchResponseCopyWith<$Res> {
  factory $StudentAppBatchResponseCopyWith(StudentAppBatchResponse value,
          $Res Function(StudentAppBatchResponse) then) =
      _$StudentAppBatchResponseCopyWithImpl<$Res, StudentAppBatchResponse>;
  @useResult
  $Res call(
      {String? branchName, List<StudentAppBatchDetail>? batches, int? status});
}

/// @nodoc
class _$StudentAppBatchResponseCopyWithImpl<$Res,
        $Val extends StudentAppBatchResponse>
    implements $StudentAppBatchResponseCopyWith<$Res> {
  _$StudentAppBatchResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? branchName = freezed,
    Object? batches = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      branchName: freezed == branchName
          ? _value.branchName
          : branchName // ignore: cast_nullable_to_non_nullable
              as String?,
      batches: freezed == batches
          ? _value.batches
          : batches // ignore: cast_nullable_to_non_nullable
              as List<StudentAppBatchDetail>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StudentAppBatchResponseImplCopyWith<$Res>
    implements $StudentAppBatchResponseCopyWith<$Res> {
  factory _$$StudentAppBatchResponseImplCopyWith(
          _$StudentAppBatchResponseImpl value,
          $Res Function(_$StudentAppBatchResponseImpl) then) =
      __$$StudentAppBatchResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? branchName, List<StudentAppBatchDetail>? batches, int? status});
}

/// @nodoc
class __$$StudentAppBatchResponseImplCopyWithImpl<$Res>
    extends _$StudentAppBatchResponseCopyWithImpl<$Res,
        _$StudentAppBatchResponseImpl>
    implements _$$StudentAppBatchResponseImplCopyWith<$Res> {
  __$$StudentAppBatchResponseImplCopyWithImpl(
      _$StudentAppBatchResponseImpl _value,
      $Res Function(_$StudentAppBatchResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? branchName = freezed,
    Object? batches = freezed,
    Object? status = freezed,
  }) {
    return _then(_$StudentAppBatchResponseImpl(
      branchName: freezed == branchName
          ? _value.branchName
          : branchName // ignore: cast_nullable_to_non_nullable
              as String?,
      batches: freezed == batches
          ? _value._batches
          : batches // ignore: cast_nullable_to_non_nullable
              as List<StudentAppBatchDetail>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$StudentAppBatchResponseImpl implements _StudentAppBatchResponse {
  const _$StudentAppBatchResponseImpl(
      {this.branchName,
      final List<StudentAppBatchDetail>? batches,
      this.status})
      : _batches = batches;

  factory _$StudentAppBatchResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudentAppBatchResponseImplFromJson(json);

  @override
  final String? branchName;
  final List<StudentAppBatchDetail>? _batches;
  @override
  List<StudentAppBatchDetail>? get batches {
    final value = _batches;
    if (value == null) return null;
    if (_batches is EqualUnmodifiableListView) return _batches;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? status;

  @override
  String toString() {
    return 'StudentAppBatchResponse(branchName: $branchName, batches: $batches, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentAppBatchResponseImpl &&
            (identical(other.branchName, branchName) ||
                other.branchName == branchName) &&
            const DeepCollectionEquality().equals(other._batches, _batches) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, branchName,
      const DeepCollectionEquality().hash(_batches), status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentAppBatchResponseImplCopyWith<_$StudentAppBatchResponseImpl>
      get copyWith => __$$StudentAppBatchResponseImplCopyWithImpl<
          _$StudentAppBatchResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StudentAppBatchResponseImplToJson(
      this,
    );
  }
}

abstract class _StudentAppBatchResponse implements StudentAppBatchResponse {
  const factory _StudentAppBatchResponse(
      {final String? branchName,
      final List<StudentAppBatchDetail>? batches,
      final int? status}) = _$StudentAppBatchResponseImpl;

  factory _StudentAppBatchResponse.fromJson(Map<String, dynamic> json) =
      _$StudentAppBatchResponseImpl.fromJson;

  @override
  String? get branchName;
  @override
  List<StudentAppBatchDetail>? get batches;
  @override
  int? get status;
  @override
  @JsonKey(ignore: true)
  _$$StudentAppBatchResponseImplCopyWith<_$StudentAppBatchResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

StudentAppBatchDetail _$StudentAppBatchDetailFromJson(
    Map<String, dynamic> json) {
  return _StudentAppBatchDetail.fromJson(json);
}

/// @nodoc
mixin _$StudentAppBatchDetail {
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
  AdminDetail? get adminDetail => throw _privateConstructorUsedError;
  List<StudentAppBatchInDetail>? get batchDetail =>
      throw _privateConstructorUsedError;
  List<Trainer>? get trainers => throw _privateConstructorUsedError;
  CourseDetail? get course => throw _privateConstructorUsedError;
  Subject? get subject => throw _privateConstructorUsedError;
  Branch? get branch => throw _privateConstructorUsedError;
  List<StudentDetail>? get students => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StudentAppBatchDetailCopyWith<StudentAppBatchDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentAppBatchDetailCopyWith<$Res> {
  factory $StudentAppBatchDetailCopyWith(StudentAppBatchDetail value,
          $Res Function(StudentAppBatchDetail) then) =
      _$StudentAppBatchDetailCopyWithImpl<$Res, StudentAppBatchDetail>;
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
      AdminDetail? adminDetail,
      List<StudentAppBatchInDetail>? batchDetail,
      List<Trainer>? trainers,
      CourseDetail? course,
      Subject? subject,
      Branch? branch,
      List<StudentDetail>? students});

  $AdminDetailCopyWith<$Res>? get adminDetail;
  $CourseDetailCopyWith<$Res>? get course;
  $SubjectCopyWith<$Res>? get subject;
  $BranchCopyWith<$Res>? get branch;
}

/// @nodoc
class _$StudentAppBatchDetailCopyWithImpl<$Res,
        $Val extends StudentAppBatchDetail>
    implements $StudentAppBatchDetailCopyWith<$Res> {
  _$StudentAppBatchDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    Object? adminDetail = freezed,
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
      adminDetail: freezed == adminDetail
          ? _value.adminDetail
          : adminDetail // ignore: cast_nullable_to_non_nullable
              as AdminDetail?,
      batchDetail: freezed == batchDetail
          ? _value.batchDetail
          : batchDetail // ignore: cast_nullable_to_non_nullable
              as List<StudentAppBatchInDetail>?,
      trainers: freezed == trainers
          ? _value.trainers
          : trainers // ignore: cast_nullable_to_non_nullable
              as List<Trainer>?,
      course: freezed == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as CourseDetail?,
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
              as List<StudentDetail>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AdminDetailCopyWith<$Res>? get adminDetail {
    if (_value.adminDetail == null) {
      return null;
    }

    return $AdminDetailCopyWith<$Res>(_value.adminDetail!, (value) {
      return _then(_value.copyWith(adminDetail: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CourseDetailCopyWith<$Res>? get course {
    if (_value.course == null) {
      return null;
    }

    return $CourseDetailCopyWith<$Res>(_value.course!, (value) {
      return _then(_value.copyWith(course: value) as $Val);
    });
  }

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
abstract class _$$StudentAppBatchDetailImplCopyWith<$Res>
    implements $StudentAppBatchDetailCopyWith<$Res> {
  factory _$$StudentAppBatchDetailImplCopyWith(
          _$StudentAppBatchDetailImpl value,
          $Res Function(_$StudentAppBatchDetailImpl) then) =
      __$$StudentAppBatchDetailImplCopyWithImpl<$Res>;
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
      AdminDetail? adminDetail,
      List<StudentAppBatchInDetail>? batchDetail,
      List<Trainer>? trainers,
      CourseDetail? course,
      Subject? subject,
      Branch? branch,
      List<StudentDetail>? students});

  @override
  $AdminDetailCopyWith<$Res>? get adminDetail;
  @override
  $CourseDetailCopyWith<$Res>? get course;
  @override
  $SubjectCopyWith<$Res>? get subject;
  @override
  $BranchCopyWith<$Res>? get branch;
}

/// @nodoc
class __$$StudentAppBatchDetailImplCopyWithImpl<$Res>
    extends _$StudentAppBatchDetailCopyWithImpl<$Res,
        _$StudentAppBatchDetailImpl>
    implements _$$StudentAppBatchDetailImplCopyWith<$Res> {
  __$$StudentAppBatchDetailImplCopyWithImpl(_$StudentAppBatchDetailImpl _value,
      $Res Function(_$StudentAppBatchDetailImpl) _then)
      : super(_value, _then);

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
    Object? adminDetail = freezed,
    Object? batchDetail = freezed,
    Object? trainers = freezed,
    Object? course = freezed,
    Object? subject = freezed,
    Object? branch = freezed,
    Object? students = freezed,
  }) {
    return _then(_$StudentAppBatchDetailImpl(
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
      adminDetail: freezed == adminDetail
          ? _value.adminDetail
          : adminDetail // ignore: cast_nullable_to_non_nullable
              as AdminDetail?,
      batchDetail: freezed == batchDetail
          ? _value._batchDetail
          : batchDetail // ignore: cast_nullable_to_non_nullable
              as List<StudentAppBatchInDetail>?,
      trainers: freezed == trainers
          ? _value._trainers
          : trainers // ignore: cast_nullable_to_non_nullable
              as List<Trainer>?,
      course: freezed == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as CourseDetail?,
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
              as List<StudentDetail>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$StudentAppBatchDetailImpl implements _StudentAppBatchDetail {
  const _$StudentAppBatchDetailImpl(
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
      this.adminDetail,
      final List<StudentAppBatchInDetail>? batchDetail,
      final List<Trainer>? trainers,
      this.course,
      this.subject,
      this.branch,
      final List<StudentDetail>? students})
      : _batchDetail = batchDetail,
        _trainers = trainers,
        _students = students;

  factory _$StudentAppBatchDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudentAppBatchDetailImplFromJson(json);

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
  final AdminDetail? adminDetail;
  final List<StudentAppBatchInDetail>? _batchDetail;
  @override
  List<StudentAppBatchInDetail>? get batchDetail {
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
  final CourseDetail? course;
  @override
  final Subject? subject;
  @override
  final Branch? branch;
  final List<StudentDetail>? _students;
  @override
  List<StudentDetail>? get students {
    final value = _students;
    if (value == null) return null;
    if (_students is EqualUnmodifiableListView) return _students;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'StudentAppBatchDetail(id: $id, batchName: $batchName, academyId: $academyId, branchId: $branchId, courseId: $courseId, subjectId: $subjectId, batchStatus: $batchStatus, feeAmount: $feeAmount, admissionFees: $admissionFees, isActive: $isActive, adminDetail: $adminDetail, batchDetail: $batchDetail, trainers: $trainers, course: $course, subject: $subject, branch: $branch, students: $students)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentAppBatchDetailImpl &&
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
            (identical(other.adminDetail, adminDetail) ||
                other.adminDetail == adminDetail) &&
            const DeepCollectionEquality()
                .equals(other._batchDetail, _batchDetail) &&
            const DeepCollectionEquality().equals(other._trainers, _trainers) &&
            (identical(other.course, course) || other.course == course) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.branch, branch) || other.branch == branch) &&
            const DeepCollectionEquality().equals(other._students, _students));
  }

  @JsonKey(ignore: true)
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
      adminDetail,
      const DeepCollectionEquality().hash(_batchDetail),
      const DeepCollectionEquality().hash(_trainers),
      course,
      subject,
      branch,
      const DeepCollectionEquality().hash(_students));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentAppBatchDetailImplCopyWith<_$StudentAppBatchDetailImpl>
      get copyWith => __$$StudentAppBatchDetailImplCopyWithImpl<
          _$StudentAppBatchDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StudentAppBatchDetailImplToJson(
      this,
    );
  }
}

abstract class _StudentAppBatchDetail implements StudentAppBatchDetail {
  const factory _StudentAppBatchDetail(
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
      final AdminDetail? adminDetail,
      final List<StudentAppBatchInDetail>? batchDetail,
      final List<Trainer>? trainers,
      final CourseDetail? course,
      final Subject? subject,
      final Branch? branch,
      final List<StudentDetail>? students}) = _$StudentAppBatchDetailImpl;

  factory _StudentAppBatchDetail.fromJson(Map<String, dynamic> json) =
      _$StudentAppBatchDetailImpl.fromJson;

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
  AdminDetail? get adminDetail;
  @override
  List<StudentAppBatchInDetail>? get batchDetail;
  @override
  List<Trainer>? get trainers;
  @override
  CourseDetail? get course;
  @override
  Subject? get subject;
  @override
  Branch? get branch;
  @override
  List<StudentDetail>? get students;
  @override
  @JsonKey(ignore: true)
  _$$StudentAppBatchDetailImplCopyWith<_$StudentAppBatchDetailImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AdminDetail _$AdminDetailFromJson(Map<String, dynamic> json) {
  return _AdminDetail.fromJson(json);
}

/// @nodoc
mixin _$AdminDetail {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  int? get userId => throw _privateConstructorUsedError;
  String? get profilePic => throw _privateConstructorUsedError;
  String? get whatsappNo => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  DateTime? get dob => throw _privateConstructorUsedError;
  DateTime? get doj => throw _privateConstructorUsedError;
  int? get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdminDetailCopyWith<AdminDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminDetailCopyWith<$Res> {
  factory $AdminDetailCopyWith(
          AdminDetail value, $Res Function(AdminDetail) then) =
      _$AdminDetailCopyWithImpl<$Res, AdminDetail>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      int? userId,
      String? profilePic,
      String? whatsappNo,
      String? email,
      String? gender,
      DateTime? dob,
      DateTime? doj,
      int? isActive});
}

/// @nodoc
class _$AdminDetailCopyWithImpl<$Res, $Val extends AdminDetail>
    implements $AdminDetailCopyWith<$Res> {
  _$AdminDetailCopyWithImpl(this._value, this._then);

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
    Object? profilePic = freezed,
    Object? whatsappNo = freezed,
    Object? email = freezed,
    Object? gender = freezed,
    Object? dob = freezed,
    Object? doj = freezed,
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
      profilePic: freezed == profilePic
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as String?,
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
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdminDetailImplCopyWith<$Res>
    implements $AdminDetailCopyWith<$Res> {
  factory _$$AdminDetailImplCopyWith(
          _$AdminDetailImpl value, $Res Function(_$AdminDetailImpl) then) =
      __$$AdminDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      int? userId,
      String? profilePic,
      String? whatsappNo,
      String? email,
      String? gender,
      DateTime? dob,
      DateTime? doj,
      int? isActive});
}

/// @nodoc
class __$$AdminDetailImplCopyWithImpl<$Res>
    extends _$AdminDetailCopyWithImpl<$Res, _$AdminDetailImpl>
    implements _$$AdminDetailImplCopyWith<$Res> {
  __$$AdminDetailImplCopyWithImpl(
      _$AdminDetailImpl _value, $Res Function(_$AdminDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? userId = freezed,
    Object? profilePic = freezed,
    Object? whatsappNo = freezed,
    Object? email = freezed,
    Object? gender = freezed,
    Object? dob = freezed,
    Object? doj = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_$AdminDetailImpl(
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
      profilePic: freezed == profilePic
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as String?,
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
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$AdminDetailImpl implements _AdminDetail {
  const _$AdminDetailImpl(
      {this.id,
      this.name,
      this.userId,
      this.profilePic,
      this.whatsappNo,
      this.email,
      this.gender,
      this.dob,
      this.doj,
      this.isActive});

  factory _$AdminDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdminDetailImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final int? userId;
  @override
  final String? profilePic;
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
  final int? isActive;

  @override
  String toString() {
    return 'AdminDetail(id: $id, name: $name, userId: $userId, profilePic: $profilePic, whatsappNo: $whatsappNo, email: $email, gender: $gender, dob: $dob, doj: $doj, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.profilePic, profilePic) ||
                other.profilePic == profilePic) &&
            (identical(other.whatsappNo, whatsappNo) ||
                other.whatsappNo == whatsappNo) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            (identical(other.doj, doj) || other.doj == doj) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, userId, profilePic,
      whatsappNo, email, gender, dob, doj, isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminDetailImplCopyWith<_$AdminDetailImpl> get copyWith =>
      __$$AdminDetailImplCopyWithImpl<_$AdminDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdminDetailImplToJson(
      this,
    );
  }
}

abstract class _AdminDetail implements AdminDetail {
  const factory _AdminDetail(
      {final int? id,
      final String? name,
      final int? userId,
      final String? profilePic,
      final String? whatsappNo,
      final String? email,
      final String? gender,
      final DateTime? dob,
      final DateTime? doj,
      final int? isActive}) = _$AdminDetailImpl;

  factory _AdminDetail.fromJson(Map<String, dynamic> json) =
      _$AdminDetailImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  int? get userId;
  @override
  String? get profilePic;
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
  int? get isActive;
  @override
  @JsonKey(ignore: true)
  _$$AdminDetailImplCopyWith<_$AdminDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StudentAppBatchInDetail _$StudentAppBatchInDetailFromJson(
    Map<String, dynamic> json) {
  return _StudentAppBatchInDetail.fromJson(json);
}

/// @nodoc
mixin _$StudentAppBatchInDetail {
  int? get id => throw _privateConstructorUsedError;
  int? get batchId => throw _privateConstructorUsedError;
  int? get day => throw _privateConstructorUsedError;
  String? get startTime => throw _privateConstructorUsedError;
  String? get endTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StudentAppBatchInDetailCopyWith<StudentAppBatchInDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentAppBatchInDetailCopyWith<$Res> {
  factory $StudentAppBatchInDetailCopyWith(StudentAppBatchInDetail value,
          $Res Function(StudentAppBatchInDetail) then) =
      _$StudentAppBatchInDetailCopyWithImpl<$Res, StudentAppBatchInDetail>;
  @useResult
  $Res call(
      {int? id, int? batchId, int? day, String? startTime, String? endTime});
}

/// @nodoc
class _$StudentAppBatchInDetailCopyWithImpl<$Res,
        $Val extends StudentAppBatchInDetail>
    implements $StudentAppBatchInDetailCopyWith<$Res> {
  _$StudentAppBatchInDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? batchId = freezed,
    Object? day = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StudentAppBatchInDetailImplCopyWith<$Res>
    implements $StudentAppBatchInDetailCopyWith<$Res> {
  factory _$$StudentAppBatchInDetailImplCopyWith(
          _$StudentAppBatchInDetailImpl value,
          $Res Function(_$StudentAppBatchInDetailImpl) then) =
      __$$StudentAppBatchInDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id, int? batchId, int? day, String? startTime, String? endTime});
}

/// @nodoc
class __$$StudentAppBatchInDetailImplCopyWithImpl<$Res>
    extends _$StudentAppBatchInDetailCopyWithImpl<$Res,
        _$StudentAppBatchInDetailImpl>
    implements _$$StudentAppBatchInDetailImplCopyWith<$Res> {
  __$$StudentAppBatchInDetailImplCopyWithImpl(
      _$StudentAppBatchInDetailImpl _value,
      $Res Function(_$StudentAppBatchInDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? batchId = freezed,
    Object? day = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
  }) {
    return _then(_$StudentAppBatchInDetailImpl(
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
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$StudentAppBatchInDetailImpl implements _StudentAppBatchInDetail {
  const _$StudentAppBatchInDetailImpl(
      {this.id, this.batchId, this.day, this.startTime, this.endTime});

  factory _$StudentAppBatchInDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudentAppBatchInDetailImplFromJson(json);

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
  String toString() {
    return 'StudentAppBatchInDetail(id: $id, batchId: $batchId, day: $day, startTime: $startTime, endTime: $endTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentAppBatchInDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.batchId, batchId) || other.batchId == batchId) &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, batchId, day, startTime, endTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentAppBatchInDetailImplCopyWith<_$StudentAppBatchInDetailImpl>
      get copyWith => __$$StudentAppBatchInDetailImplCopyWithImpl<
          _$StudentAppBatchInDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StudentAppBatchInDetailImplToJson(
      this,
    );
  }
}

abstract class _StudentAppBatchInDetail implements StudentAppBatchInDetail {
  const factory _StudentAppBatchInDetail(
      {final int? id,
      final int? batchId,
      final int? day,
      final String? startTime,
      final String? endTime}) = _$StudentAppBatchInDetailImpl;

  factory _StudentAppBatchInDetail.fromJson(Map<String, dynamic> json) =
      _$StudentAppBatchInDetailImpl.fromJson;

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
  @JsonKey(ignore: true)
  _$$StudentAppBatchInDetailImplCopyWith<_$StudentAppBatchInDetailImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Branch _$BranchFromJson(Map<String, dynamic> json) {
  return _Branch.fromJson(json);
}

/// @nodoc
mixin _$Branch {
  int? get id => throw _privateConstructorUsedError;
  String? get branchName => throw _privateConstructorUsedError;
  int? get academyId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BranchCopyWith<Branch> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BranchCopyWith<$Res> {
  factory $BranchCopyWith(Branch value, $Res Function(Branch) then) =
      _$BranchCopyWithImpl<$Res, Branch>;
  @useResult
  $Res call({int? id, String? branchName, int? academyId});
}

/// @nodoc
class _$BranchCopyWithImpl<$Res, $Val extends Branch>
    implements $BranchCopyWith<$Res> {
  _$BranchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? branchName = freezed,
    Object? academyId = freezed,
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
      academyId: freezed == academyId
          ? _value.academyId
          : academyId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BranchImplCopyWith<$Res> implements $BranchCopyWith<$Res> {
  factory _$$BranchImplCopyWith(
          _$BranchImpl value, $Res Function(_$BranchImpl) then) =
      __$$BranchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? branchName, int? academyId});
}

/// @nodoc
class __$$BranchImplCopyWithImpl<$Res>
    extends _$BranchCopyWithImpl<$Res, _$BranchImpl>
    implements _$$BranchImplCopyWith<$Res> {
  __$$BranchImplCopyWithImpl(
      _$BranchImpl _value, $Res Function(_$BranchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? branchName = freezed,
    Object? academyId = freezed,
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
      academyId: freezed == academyId
          ? _value.academyId
          : academyId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$BranchImpl implements _Branch {
  const _$BranchImpl({this.id, this.branchName, this.academyId});

  factory _$BranchImpl.fromJson(Map<String, dynamic> json) =>
      _$$BranchImplFromJson(json);

  @override
  final int? id;
  @override
  final String? branchName;
  @override
  final int? academyId;

  @override
  String toString() {
    return 'Branch(id: $id, branchName: $branchName, academyId: $academyId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BranchImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.branchName, branchName) ||
                other.branchName == branchName) &&
            (identical(other.academyId, academyId) ||
                other.academyId == academyId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, branchName, academyId);

  @JsonKey(ignore: true)
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
      final int? academyId}) = _$BranchImpl;

  factory _Branch.fromJson(Map<String, dynamic> json) = _$BranchImpl.fromJson;

  @override
  int? get id;
  @override
  String? get branchName;
  @override
  int? get academyId;
  @override
  @JsonKey(ignore: true)
  _$$BranchImplCopyWith<_$BranchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CourseDetail _$CourseDetailFromJson(Map<String, dynamic> json) {
  return _CourseDetail.fromJson(json);
}

/// @nodoc
mixin _$CourseDetail {
  int? get id => throw _privateConstructorUsedError;
  String? get courseName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CourseDetailCopyWith<CourseDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseDetailCopyWith<$Res> {
  factory $CourseDetailCopyWith(
          CourseDetail value, $Res Function(CourseDetail) then) =
      _$CourseDetailCopyWithImpl<$Res, CourseDetail>;
  @useResult
  $Res call({int? id, String? courseName});
}

/// @nodoc
class _$CourseDetailCopyWithImpl<$Res, $Val extends CourseDetail>
    implements $CourseDetailCopyWith<$Res> {
  _$CourseDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? courseName = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      courseName: freezed == courseName
          ? _value.courseName
          : courseName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CourseDetailImplCopyWith<$Res>
    implements $CourseDetailCopyWith<$Res> {
  factory _$$CourseDetailImplCopyWith(
          _$CourseDetailImpl value, $Res Function(_$CourseDetailImpl) then) =
      __$$CourseDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? courseName});
}

/// @nodoc
class __$$CourseDetailImplCopyWithImpl<$Res>
    extends _$CourseDetailCopyWithImpl<$Res, _$CourseDetailImpl>
    implements _$$CourseDetailImplCopyWith<$Res> {
  __$$CourseDetailImplCopyWithImpl(
      _$CourseDetailImpl _value, $Res Function(_$CourseDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? courseName = freezed,
  }) {
    return _then(_$CourseDetailImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      courseName: freezed == courseName
          ? _value.courseName
          : courseName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$CourseDetailImpl implements _CourseDetail {
  const _$CourseDetailImpl({this.id, this.courseName});

  factory _$CourseDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$CourseDetailImplFromJson(json);

  @override
  final int? id;
  @override
  final String? courseName;

  @override
  String toString() {
    return 'CourseDetail(id: $id, courseName: $courseName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.courseName, courseName) ||
                other.courseName == courseName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, courseName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseDetailImplCopyWith<_$CourseDetailImpl> get copyWith =>
      __$$CourseDetailImplCopyWithImpl<_$CourseDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CourseDetailImplToJson(
      this,
    );
  }
}

abstract class _CourseDetail implements CourseDetail {
  const factory _CourseDetail({final int? id, final String? courseName}) =
      _$CourseDetailImpl;

  factory _CourseDetail.fromJson(Map<String, dynamic> json) =
      _$CourseDetailImpl.fromJson;

  @override
  int? get id;
  @override
  String? get courseName;
  @override
  @JsonKey(ignore: true)
  _$$CourseDetailImplCopyWith<_$CourseDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StudentDetail _$StudentDetailFromJson(Map<String, dynamic> json) {
  return _StudentDetail.fromJson(json);
}

/// @nodoc
mixin _$StudentDetail {
  String? get name => throw _privateConstructorUsedError;
  int? get feeAmount => throw _privateConstructorUsedError;
  String? get feeType => throw _privateConstructorUsedError;
  int? get admissionFees => throw _privateConstructorUsedError;
  int? get noOfClasses => throw _privateConstructorUsedError;
  int? get cycle => throw _privateConstructorUsedError;
  int? get paymentDueDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
      {String? name,
      int? feeAmount,
      String? feeType,
      int? admissionFees,
      int? noOfClasses,
      int? cycle,
      int? paymentDueDate});
}

/// @nodoc
class _$StudentDetailCopyWithImpl<$Res, $Val extends StudentDetail>
    implements $StudentDetailCopyWith<$Res> {
  _$StudentDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? feeAmount = freezed,
    Object? feeType = freezed,
    Object? admissionFees = freezed,
    Object? noOfClasses = freezed,
    Object? cycle = freezed,
    Object? paymentDueDate = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      feeAmount: freezed == feeAmount
          ? _value.feeAmount
          : feeAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      feeType: freezed == feeType
          ? _value.feeType
          : feeType // ignore: cast_nullable_to_non_nullable
              as String?,
      admissionFees: freezed == admissionFees
          ? _value.admissionFees
          : admissionFees // ignore: cast_nullable_to_non_nullable
              as int?,
      noOfClasses: freezed == noOfClasses
          ? _value.noOfClasses
          : noOfClasses // ignore: cast_nullable_to_non_nullable
              as int?,
      cycle: freezed == cycle
          ? _value.cycle
          : cycle // ignore: cast_nullable_to_non_nullable
              as int?,
      paymentDueDate: freezed == paymentDueDate
          ? _value.paymentDueDate
          : paymentDueDate // ignore: cast_nullable_to_non_nullable
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
      {String? name,
      int? feeAmount,
      String? feeType,
      int? admissionFees,
      int? noOfClasses,
      int? cycle,
      int? paymentDueDate});
}

/// @nodoc
class __$$StudentDetailImplCopyWithImpl<$Res>
    extends _$StudentDetailCopyWithImpl<$Res, _$StudentDetailImpl>
    implements _$$StudentDetailImplCopyWith<$Res> {
  __$$StudentDetailImplCopyWithImpl(
      _$StudentDetailImpl _value, $Res Function(_$StudentDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? feeAmount = freezed,
    Object? feeType = freezed,
    Object? admissionFees = freezed,
    Object? noOfClasses = freezed,
    Object? cycle = freezed,
    Object? paymentDueDate = freezed,
  }) {
    return _then(_$StudentDetailImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      feeAmount: freezed == feeAmount
          ? _value.feeAmount
          : feeAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      feeType: freezed == feeType
          ? _value.feeType
          : feeType // ignore: cast_nullable_to_non_nullable
              as String?,
      admissionFees: freezed == admissionFees
          ? _value.admissionFees
          : admissionFees // ignore: cast_nullable_to_non_nullable
              as int?,
      noOfClasses: freezed == noOfClasses
          ? _value.noOfClasses
          : noOfClasses // ignore: cast_nullable_to_non_nullable
              as int?,
      cycle: freezed == cycle
          ? _value.cycle
          : cycle // ignore: cast_nullable_to_non_nullable
              as int?,
      paymentDueDate: freezed == paymentDueDate
          ? _value.paymentDueDate
          : paymentDueDate // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$StudentDetailImpl implements _StudentDetail {
  const _$StudentDetailImpl(
      {this.name,
      this.feeAmount,
      this.feeType,
      this.admissionFees,
      this.noOfClasses,
      this.cycle,
      this.paymentDueDate});

  factory _$StudentDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudentDetailImplFromJson(json);

  @override
  final String? name;
  @override
  final int? feeAmount;
  @override
  final String? feeType;
  @override
  final int? admissionFees;
  @override
  final int? noOfClasses;
  @override
  final int? cycle;
  @override
  final int? paymentDueDate;

  @override
  String toString() {
    return 'StudentDetail(name: $name, feeAmount: $feeAmount, feeType: $feeType, admissionFees: $admissionFees, noOfClasses: $noOfClasses, cycle: $cycle, paymentDueDate: $paymentDueDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentDetailImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.feeAmount, feeAmount) ||
                other.feeAmount == feeAmount) &&
            (identical(other.feeType, feeType) || other.feeType == feeType) &&
            (identical(other.admissionFees, admissionFees) ||
                other.admissionFees == admissionFees) &&
            (identical(other.noOfClasses, noOfClasses) ||
                other.noOfClasses == noOfClasses) &&
            (identical(other.cycle, cycle) || other.cycle == cycle) &&
            (identical(other.paymentDueDate, paymentDueDate) ||
                other.paymentDueDate == paymentDueDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, feeAmount, feeType,
      admissionFees, noOfClasses, cycle, paymentDueDate);

  @JsonKey(ignore: true)
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
      {final String? name,
      final int? feeAmount,
      final String? feeType,
      final int? admissionFees,
      final int? noOfClasses,
      final int? cycle,
      final int? paymentDueDate}) = _$StudentDetailImpl;

  factory _StudentDetail.fromJson(Map<String, dynamic> json) =
      _$StudentDetailImpl.fromJson;

  @override
  String? get name;
  @override
  int? get feeAmount;
  @override
  String? get feeType;
  @override
  int? get admissionFees;
  @override
  int? get noOfClasses;
  @override
  int? get cycle;
  @override
  int? get paymentDueDate;
  @override
  @JsonKey(ignore: true)
  _$$StudentDetailImplCopyWith<_$StudentDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Subject _$SubjectFromJson(Map<String, dynamic> json) {
  return _Subject.fromJson(json);
}

/// @nodoc
mixin _$Subject {
  int? get id => throw _privateConstructorUsedError;
  String? get subjectName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubjectCopyWith<Subject> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubjectCopyWith<$Res> {
  factory $SubjectCopyWith(Subject value, $Res Function(Subject) then) =
      _$SubjectCopyWithImpl<$Res, Subject>;
  @useResult
  $Res call({int? id, String? subjectName});
}

/// @nodoc
class _$SubjectCopyWithImpl<$Res, $Val extends Subject>
    implements $SubjectCopyWith<$Res> {
  _$SubjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? subjectName = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      subjectName: freezed == subjectName
          ? _value.subjectName
          : subjectName // ignore: cast_nullable_to_non_nullable
              as String?,
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
  $Res call({int? id, String? subjectName});
}

/// @nodoc
class __$$SubjectImplCopyWithImpl<$Res>
    extends _$SubjectCopyWithImpl<$Res, _$SubjectImpl>
    implements _$$SubjectImplCopyWith<$Res> {
  __$$SubjectImplCopyWithImpl(
      _$SubjectImpl _value, $Res Function(_$SubjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? subjectName = freezed,
  }) {
    return _then(_$SubjectImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      subjectName: freezed == subjectName
          ? _value.subjectName
          : subjectName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$SubjectImpl implements _Subject {
  const _$SubjectImpl({this.id, this.subjectName});

  factory _$SubjectImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubjectImplFromJson(json);

  @override
  final int? id;
  @override
  final String? subjectName;

  @override
  String toString() {
    return 'Subject(id: $id, subjectName: $subjectName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubjectImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.subjectName, subjectName) ||
                other.subjectName == subjectName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, subjectName);

  @JsonKey(ignore: true)
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
  const factory _Subject({final int? id, final String? subjectName}) =
      _$SubjectImpl;

  factory _Subject.fromJson(Map<String, dynamic> json) = _$SubjectImpl.fromJson;

  @override
  int? get id;
  @override
  String? get subjectName;
  @override
  @JsonKey(ignore: true)
  _$$SubjectImplCopyWith<_$SubjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Trainer _$TrainerFromJson(Map<String, dynamic> json) {
  return _Trainer.fromJson(json);
}

/// @nodoc
mixin _$Trainer {
  String? get name => throw _privateConstructorUsedError;
  String? get profilePic => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TrainerCopyWith<Trainer> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrainerCopyWith<$Res> {
  factory $TrainerCopyWith(Trainer value, $Res Function(Trainer) then) =
      _$TrainerCopyWithImpl<$Res, Trainer>;
  @useResult
  $Res call({String? name, String? profilePic});
}

/// @nodoc
class _$TrainerCopyWithImpl<$Res, $Val extends Trainer>
    implements $TrainerCopyWith<$Res> {
  _$TrainerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? profilePic = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePic: freezed == profilePic
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TrainerImplCopyWith<$Res> implements $TrainerCopyWith<$Res> {
  factory _$$TrainerImplCopyWith(
          _$TrainerImpl value, $Res Function(_$TrainerImpl) then) =
      __$$TrainerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String? profilePic});
}

/// @nodoc
class __$$TrainerImplCopyWithImpl<$Res>
    extends _$TrainerCopyWithImpl<$Res, _$TrainerImpl>
    implements _$$TrainerImplCopyWith<$Res> {
  __$$TrainerImplCopyWithImpl(
      _$TrainerImpl _value, $Res Function(_$TrainerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? profilePic = freezed,
  }) {
    return _then(_$TrainerImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePic: freezed == profilePic
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$TrainerImpl implements _Trainer {
  const _$TrainerImpl({this.name, this.profilePic});

  factory _$TrainerImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrainerImplFromJson(json);

  @override
  final String? name;
  @override
  final String? profilePic;

  @override
  String toString() {
    return 'Trainer(name: $name, profilePic: $profilePic)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrainerImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.profilePic, profilePic) ||
                other.profilePic == profilePic));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, profilePic);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TrainerImplCopyWith<_$TrainerImpl> get copyWith =>
      __$$TrainerImplCopyWithImpl<_$TrainerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrainerImplToJson(
      this,
    );
  }
}

abstract class _Trainer implements Trainer {
  const factory _Trainer({final String? name, final String? profilePic}) =
      _$TrainerImpl;

  factory _Trainer.fromJson(Map<String, dynamic> json) = _$TrainerImpl.fromJson;

  @override
  String? get name;
  @override
  String? get profilePic;
  @override
  @JsonKey(ignore: true)
  _$$TrainerImplCopyWith<_$TrainerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
