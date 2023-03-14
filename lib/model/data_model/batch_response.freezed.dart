// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'batch_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BatchResponse _$BatchResponseFromJson(Map<String, dynamic> json) {
  return _BatchResponse.fromJson(json);
}

/// @nodoc
mixin _$BatchResponse {
  int? get status => throw _privateConstructorUsedError;
  Datum? get batches => throw _privateConstructorUsedError;
  Batch? get batch => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BatchResponseCopyWith<BatchResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BatchResponseCopyWith<$Res> {
  factory $BatchResponseCopyWith(
          BatchResponse value, $Res Function(BatchResponse) then) =
      _$BatchResponseCopyWithImpl<$Res, BatchResponse>;
  @useResult
  $Res call({int? status, Datum? batches, Batch? batch});

  $DatumCopyWith<$Res>? get batches;
  $BatchCopyWith<$Res>? get batch;
}

/// @nodoc
class _$BatchResponseCopyWithImpl<$Res, $Val extends BatchResponse>
    implements $BatchResponseCopyWith<$Res> {
  _$BatchResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? batches = freezed,
    Object? batch = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      batches: freezed == batches
          ? _value.batches
          : batches // ignore: cast_nullable_to_non_nullable
              as Datum?,
      batch: freezed == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as Batch?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DatumCopyWith<$Res>? get batches {
    if (_value.batches == null) {
      return null;
    }

    return $DatumCopyWith<$Res>(_value.batches!, (value) {
      return _then(_value.copyWith(batches: value) as $Val);
    });
  }

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
abstract class _$$_BatchResponseCopyWith<$Res>
    implements $BatchResponseCopyWith<$Res> {
  factory _$$_BatchResponseCopyWith(
          _$_BatchResponse value, $Res Function(_$_BatchResponse) then) =
      __$$_BatchResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? status, Datum? batches, Batch? batch});

  @override
  $DatumCopyWith<$Res>? get batches;
  @override
  $BatchCopyWith<$Res>? get batch;
}

/// @nodoc
class __$$_BatchResponseCopyWithImpl<$Res>
    extends _$BatchResponseCopyWithImpl<$Res, _$_BatchResponse>
    implements _$$_BatchResponseCopyWith<$Res> {
  __$$_BatchResponseCopyWithImpl(
      _$_BatchResponse _value, $Res Function(_$_BatchResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? batches = freezed,
    Object? batch = freezed,
  }) {
    return _then(_$_BatchResponse(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      batches: freezed == batches
          ? _value.batches
          : batches // ignore: cast_nullable_to_non_nullable
              as Datum?,
      batch: freezed == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as Batch?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_BatchResponse implements _BatchResponse {
  const _$_BatchResponse({this.status, this.batches, this.batch});

  factory _$_BatchResponse.fromJson(Map<String, dynamic> json) =>
      _$$_BatchResponseFromJson(json);

  @override
  final int? status;
  @override
  final Datum? batches;
  @override
  final Batch? batch;

  @override
  String toString() {
    return 'BatchResponse(status: $status, batches: $batches, batch: $batch)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BatchResponse &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.batches, batches) || other.batches == batches) &&
            (identical(other.batch, batch) || other.batch == batch));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, batches, batch);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BatchResponseCopyWith<_$_BatchResponse> get copyWith =>
      __$$_BatchResponseCopyWithImpl<_$_BatchResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BatchResponseToJson(
      this,
    );
  }
}

abstract class _BatchResponse implements BatchResponse {
  const factory _BatchResponse(
      {final int? status,
      final Datum? batches,
      final Batch? batch}) = _$_BatchResponse;

  factory _BatchResponse.fromJson(Map<String, dynamic> json) =
      _$_BatchResponse.fromJson;

  @override
  int? get status;
  @override
  Datum? get batches;
  @override
  Batch? get batch;
  @override
  @JsonKey(ignore: true)
  _$$_BatchResponseCopyWith<_$_BatchResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

StudentsBatchResponse _$StudentsBatchResponseFromJson(
    Map<String, dynamic> json) {
  return _StudentsBatchResponse.fromJson(json);
}

/// @nodoc
mixin _$StudentsBatchResponse {
  int? get status => throw _privateConstructorUsedError;
  List<Batch>? get batches => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StudentsBatchResponseCopyWith<StudentsBatchResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentsBatchResponseCopyWith<$Res> {
  factory $StudentsBatchResponseCopyWith(StudentsBatchResponse value,
          $Res Function(StudentsBatchResponse) then) =
      _$StudentsBatchResponseCopyWithImpl<$Res, StudentsBatchResponse>;
  @useResult
  $Res call({int? status, List<Batch>? batches});
}

/// @nodoc
class _$StudentsBatchResponseCopyWithImpl<$Res,
        $Val extends StudentsBatchResponse>
    implements $StudentsBatchResponseCopyWith<$Res> {
  _$StudentsBatchResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? batches = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      batches: freezed == batches
          ? _value.batches
          : batches // ignore: cast_nullable_to_non_nullable
              as List<Batch>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StudentsBatchResponseCopyWith<$Res>
    implements $StudentsBatchResponseCopyWith<$Res> {
  factory _$$_StudentsBatchResponseCopyWith(_$_StudentsBatchResponse value,
          $Res Function(_$_StudentsBatchResponse) then) =
      __$$_StudentsBatchResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? status, List<Batch>? batches});
}

/// @nodoc
class __$$_StudentsBatchResponseCopyWithImpl<$Res>
    extends _$StudentsBatchResponseCopyWithImpl<$Res, _$_StudentsBatchResponse>
    implements _$$_StudentsBatchResponseCopyWith<$Res> {
  __$$_StudentsBatchResponseCopyWithImpl(_$_StudentsBatchResponse _value,
      $Res Function(_$_StudentsBatchResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? batches = freezed,
  }) {
    return _then(_$_StudentsBatchResponse(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      batches: freezed == batches
          ? _value._batches
          : batches // ignore: cast_nullable_to_non_nullable
              as List<Batch>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_StudentsBatchResponse implements _StudentsBatchResponse {
  const _$_StudentsBatchResponse({this.status, final List<Batch>? batches})
      : _batches = batches;

  factory _$_StudentsBatchResponse.fromJson(Map<String, dynamic> json) =>
      _$$_StudentsBatchResponseFromJson(json);

  @override
  final int? status;
  final List<Batch>? _batches;
  @override
  List<Batch>? get batches {
    final value = _batches;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'StudentsBatchResponse(status: $status, batches: $batches)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StudentsBatchResponse &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._batches, _batches));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_batches));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StudentsBatchResponseCopyWith<_$_StudentsBatchResponse> get copyWith =>
      __$$_StudentsBatchResponseCopyWithImpl<_$_StudentsBatchResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StudentsBatchResponseToJson(
      this,
    );
  }
}

abstract class _StudentsBatchResponse implements StudentsBatchResponse {
  const factory _StudentsBatchResponse(
      {final int? status,
      final List<Batch>? batches}) = _$_StudentsBatchResponse;

  factory _StudentsBatchResponse.fromJson(Map<String, dynamic> json) =
      _$_StudentsBatchResponse.fromJson;

  @override
  int? get status;
  @override
  List<Batch>? get batches;
  @override
  @JsonKey(ignore: true)
  _$$_StudentsBatchResponseCopyWith<_$_StudentsBatchResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

Datum _$DatumFromJson(Map<String, dynamic> json) {
  return _Datum.fromJson(json);
}

/// @nodoc
mixin _$Datum {
  int? get currentPage => throw _privateConstructorUsedError;
  List<Batch> get data => throw _privateConstructorUsedError;
  int? get from => throw _privateConstructorUsedError;
  int? get perPage => throw _privateConstructorUsedError;
  String? get nextPageUrl => throw _privateConstructorUsedError;
  int? get to => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DatumCopyWith<Datum> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DatumCopyWith<$Res> {
  factory $DatumCopyWith(Datum value, $Res Function(Datum) then) =
      _$DatumCopyWithImpl<$Res, Datum>;
  @useResult
  $Res call(
      {int? currentPage,
      List<Batch> data,
      int? from,
      int? perPage,
      String? nextPageUrl,
      int? to});
}

/// @nodoc
class _$DatumCopyWithImpl<$Res, $Val extends Datum>
    implements $DatumCopyWith<$Res> {
  _$DatumCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = freezed,
    Object? data = null,
    Object? from = freezed,
    Object? perPage = freezed,
    Object? nextPageUrl = freezed,
    Object? to = freezed,
  }) {
    return _then(_value.copyWith(
      currentPage: freezed == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Batch>,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as int?,
      perPage: freezed == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int?,
      nextPageUrl: freezed == nextPageUrl
          ? _value.nextPageUrl
          : nextPageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DatumCopyWith<$Res> implements $DatumCopyWith<$Res> {
  factory _$$_DatumCopyWith(_$_Datum value, $Res Function(_$_Datum) then) =
      __$$_DatumCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? currentPage,
      List<Batch> data,
      int? from,
      int? perPage,
      String? nextPageUrl,
      int? to});
}

/// @nodoc
class __$$_DatumCopyWithImpl<$Res> extends _$DatumCopyWithImpl<$Res, _$_Datum>
    implements _$$_DatumCopyWith<$Res> {
  __$$_DatumCopyWithImpl(_$_Datum _value, $Res Function(_$_Datum) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = freezed,
    Object? data = null,
    Object? from = freezed,
    Object? perPage = freezed,
    Object? nextPageUrl = freezed,
    Object? to = freezed,
  }) {
    return _then(_$_Datum(
      currentPage: freezed == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int?,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Batch>,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as int?,
      perPage: freezed == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int?,
      nextPageUrl: freezed == nextPageUrl
          ? _value.nextPageUrl
          : nextPageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Datum implements _Datum {
  const _$_Datum(
      {this.currentPage,
      required final List<Batch> data,
      this.from,
      this.perPage,
      this.nextPageUrl,
      this.to})
      : _data = data;

  factory _$_Datum.fromJson(Map<String, dynamic> json) =>
      _$$_DatumFromJson(json);

  @override
  final int? currentPage;
  final List<Batch> _data;
  @override
  List<Batch> get data {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final int? from;
  @override
  final int? perPage;
  @override
  final String? nextPageUrl;
  @override
  final int? to;

  @override
  String toString() {
    return 'Datum(currentPage: $currentPage, data: $data, from: $from, perPage: $perPage, nextPageUrl: $nextPageUrl, to: $to)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Datum &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.nextPageUrl, nextPageUrl) ||
                other.nextPageUrl == nextPageUrl) &&
            (identical(other.to, to) || other.to == to));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentPage,
      const DeepCollectionEquality().hash(_data),
      from,
      perPage,
      nextPageUrl,
      to);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DatumCopyWith<_$_Datum> get copyWith =>
      __$$_DatumCopyWithImpl<_$_Datum>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DatumToJson(
      this,
    );
  }
}

abstract class _Datum implements Datum {
  const factory _Datum(
      {final int? currentPage,
      required final List<Batch> data,
      final int? from,
      final int? perPage,
      final String? nextPageUrl,
      final int? to}) = _$_Datum;

  factory _Datum.fromJson(Map<String, dynamic> json) = _$_Datum.fromJson;

  @override
  int? get currentPage;
  @override
  List<Batch> get data;
  @override
  int? get from;
  @override
  int? get perPage;
  @override
  String? get nextPageUrl;
  @override
  int? get to;
  @override
  @JsonKey(ignore: true)
  _$$_DatumCopyWith<_$_Datum> get copyWith =>
      throw _privateConstructorUsedError;
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
  int? get activeStudentsCount => throw _privateConstructorUsedError;
  int? get inactiveStudentsCount => throw _privateConstructorUsedError;
  int? get admissionFees => throw _privateConstructorUsedError;
  int? get isActive => throw _privateConstructorUsedError; // Pivot? pivot,
  List<BatchDetail>? get batchDetail => throw _privateConstructorUsedError;
  List<Trainer>? get trainers => throw _privateConstructorUsedError;
  Course? get course => throw _privateConstructorUsedError;
  Course? get subject => throw _privateConstructorUsedError;
  Branch? get branch => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
      int? activeStudentsCount,
      int? inactiveStudentsCount,
      int? admissionFees,
      int? isActive,
      List<BatchDetail>? batchDetail,
      List<Trainer>? trainers,
      Course? course,
      Course? subject,
      Branch? branch});

  $CourseCopyWith<$Res>? get course;
  $CourseCopyWith<$Res>? get subject;
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
    Object? activeStudentsCount = freezed,
    Object? inactiveStudentsCount = freezed,
    Object? admissionFees = freezed,
    Object? isActive = freezed,
    Object? batchDetail = freezed,
    Object? trainers = freezed,
    Object? course = freezed,
    Object? subject = freezed,
    Object? branch = freezed,
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
      activeStudentsCount: freezed == activeStudentsCount
          ? _value.activeStudentsCount
          : activeStudentsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      inactiveStudentsCount: freezed == inactiveStudentsCount
          ? _value.inactiveStudentsCount
          : inactiveStudentsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      admissionFees: freezed == admissionFees
          ? _value.admissionFees
          : admissionFees // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
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
              as Course?,
      branch: freezed == branch
          ? _value.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as Branch?,
    ) as $Val);
  }

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

  @override
  @pragma('vm:prefer-inline')
  $CourseCopyWith<$Res>? get subject {
    if (_value.subject == null) {
      return null;
    }

    return $CourseCopyWith<$Res>(_value.subject!, (value) {
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
abstract class _$$_BatchCopyWith<$Res> implements $BatchCopyWith<$Res> {
  factory _$$_BatchCopyWith(_$_Batch value, $Res Function(_$_Batch) then) =
      __$$_BatchCopyWithImpl<$Res>;
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
      int? activeStudentsCount,
      int? inactiveStudentsCount,
      int? admissionFees,
      int? isActive,
      List<BatchDetail>? batchDetail,
      List<Trainer>? trainers,
      Course? course,
      Course? subject,
      Branch? branch});

  @override
  $CourseCopyWith<$Res>? get course;
  @override
  $CourseCopyWith<$Res>? get subject;
  @override
  $BranchCopyWith<$Res>? get branch;
}

/// @nodoc
class __$$_BatchCopyWithImpl<$Res> extends _$BatchCopyWithImpl<$Res, _$_Batch>
    implements _$$_BatchCopyWith<$Res> {
  __$$_BatchCopyWithImpl(_$_Batch _value, $Res Function(_$_Batch) _then)
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
    Object? activeStudentsCount = freezed,
    Object? inactiveStudentsCount = freezed,
    Object? admissionFees = freezed,
    Object? isActive = freezed,
    Object? batchDetail = freezed,
    Object? trainers = freezed,
    Object? course = freezed,
    Object? subject = freezed,
    Object? branch = freezed,
  }) {
    return _then(_$_Batch(
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
      activeStudentsCount: freezed == activeStudentsCount
          ? _value.activeStudentsCount
          : activeStudentsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      inactiveStudentsCount: freezed == inactiveStudentsCount
          ? _value.inactiveStudentsCount
          : inactiveStudentsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      admissionFees: freezed == admissionFees
          ? _value.admissionFees
          : admissionFees // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
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
              as Course?,
      branch: freezed == branch
          ? _value.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as Branch?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Batch implements _Batch {
  const _$_Batch(
      {this.id,
      this.batchName,
      this.academyId,
      this.branchId,
      this.courseId,
      this.subjectId,
      this.batchStatus,
      this.feeAmount,
      this.activeStudentsCount,
      this.inactiveStudentsCount,
      this.admissionFees,
      this.isActive,
      final List<BatchDetail>? batchDetail,
      final List<Trainer>? trainers,
      this.course,
      this.subject,
      this.branch})
      : _batchDetail = batchDetail,
        _trainers = trainers;

  factory _$_Batch.fromJson(Map<String, dynamic> json) =>
      _$$_BatchFromJson(json);

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
  final int? activeStudentsCount;
  @override
  final int? inactiveStudentsCount;
  @override
  final int? admissionFees;
  @override
  final int? isActive;
// Pivot? pivot,
  final List<BatchDetail>? _batchDetail;
// Pivot? pivot,
  @override
  List<BatchDetail>? get batchDetail {
    final value = _batchDetail;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Trainer>? _trainers;
  @override
  List<Trainer>? get trainers {
    final value = _trainers;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Course? course;
  @override
  final Course? subject;
  @override
  final Branch? branch;

  @override
  String toString() {
    return 'Batch(id: $id, batchName: $batchName, academyId: $academyId, branchId: $branchId, courseId: $courseId, subjectId: $subjectId, batchStatus: $batchStatus, feeAmount: $feeAmount, activeStudentsCount: $activeStudentsCount, inactiveStudentsCount: $inactiveStudentsCount, admissionFees: $admissionFees, isActive: $isActive, batchDetail: $batchDetail, trainers: $trainers, course: $course, subject: $subject, branch: $branch)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Batch &&
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
            (identical(other.activeStudentsCount, activeStudentsCount) ||
                other.activeStudentsCount == activeStudentsCount) &&
            (identical(other.inactiveStudentsCount, inactiveStudentsCount) ||
                other.inactiveStudentsCount == inactiveStudentsCount) &&
            (identical(other.admissionFees, admissionFees) ||
                other.admissionFees == admissionFees) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            const DeepCollectionEquality()
                .equals(other._batchDetail, _batchDetail) &&
            const DeepCollectionEquality().equals(other._trainers, _trainers) &&
            (identical(other.course, course) || other.course == course) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.branch, branch) || other.branch == branch));
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
      activeStudentsCount,
      inactiveStudentsCount,
      admissionFees,
      isActive,
      const DeepCollectionEquality().hash(_batchDetail),
      const DeepCollectionEquality().hash(_trainers),
      course,
      subject,
      branch);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BatchCopyWith<_$_Batch> get copyWith =>
      __$$_BatchCopyWithImpl<_$_Batch>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BatchToJson(
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
      final int? activeStudentsCount,
      final int? inactiveStudentsCount,
      final int? admissionFees,
      final int? isActive,
      final List<BatchDetail>? batchDetail,
      final List<Trainer>? trainers,
      final Course? course,
      final Course? subject,
      final Branch? branch}) = _$_Batch;

  factory _Batch.fromJson(Map<String, dynamic> json) = _$_Batch.fromJson;

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
  int? get activeStudentsCount;
  @override
  int? get inactiveStudentsCount;
  @override
  int? get admissionFees;
  @override
  int? get isActive;
  @override // Pivot? pivot,
  List<BatchDetail>? get batchDetail;
  @override
  List<Trainer>? get trainers;
  @override
  Course? get course;
  @override
  Course? get subject;
  @override
  Branch? get branch;
  @override
  @JsonKey(ignore: true)
  _$$_BatchCopyWith<_$_Batch> get copyWith =>
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
  DateTime? get previousDate => throw _privateConstructorUsedError;
  DateTime? get newDate => throw _privateConstructorUsedError;
  String? get startTime => throw _privateConstructorUsedError;
  String? get endTime => throw _privateConstructorUsedError;
  int? get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
      DateTime? previousDate,
      DateTime? newDate,
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

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? batchId = freezed,
    Object? day = freezed,
    Object? previousDate = freezed,
    Object? newDate = freezed,
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
      previousDate: freezed == previousDate
          ? _value.previousDate
          : previousDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      newDate: freezed == newDate
          ? _value.newDate
          : newDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
abstract class _$$_BatchDetailCopyWith<$Res>
    implements $BatchDetailCopyWith<$Res> {
  factory _$$_BatchDetailCopyWith(
          _$_BatchDetail value, $Res Function(_$_BatchDetail) then) =
      __$$_BatchDetailCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? batchId,
      int? day,
      DateTime? previousDate,
      DateTime? newDate,
      String? startTime,
      String? endTime,
      int? isActive});
}

/// @nodoc
class __$$_BatchDetailCopyWithImpl<$Res>
    extends _$BatchDetailCopyWithImpl<$Res, _$_BatchDetail>
    implements _$$_BatchDetailCopyWith<$Res> {
  __$$_BatchDetailCopyWithImpl(
      _$_BatchDetail _value, $Res Function(_$_BatchDetail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? batchId = freezed,
    Object? day = freezed,
    Object? previousDate = freezed,
    Object? newDate = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_$_BatchDetail(
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
      previousDate: freezed == previousDate
          ? _value.previousDate
          : previousDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      newDate: freezed == newDate
          ? _value.newDate
          : newDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
class _$_BatchDetail implements _BatchDetail {
  const _$_BatchDetail(
      {this.id,
      this.batchId,
      this.day,
      this.previousDate,
      this.newDate,
      this.startTime,
      this.endTime,
      this.isActive});

  factory _$_BatchDetail.fromJson(Map<String, dynamic> json) =>
      _$$_BatchDetailFromJson(json);

  @override
  final int? id;
  @override
  final int? batchId;
  @override
  final int? day;
  @override
  final DateTime? previousDate;
  @override
  final DateTime? newDate;
  @override
  final String? startTime;
  @override
  final String? endTime;
  @override
  final int? isActive;

  @override
  String toString() {
    return 'BatchDetail(id: $id, batchId: $batchId, day: $day, previousDate: $previousDate, newDate: $newDate, startTime: $startTime, endTime: $endTime, isActive: $isActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BatchDetail &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.batchId, batchId) || other.batchId == batchId) &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.previousDate, previousDate) ||
                other.previousDate == previousDate) &&
            (identical(other.newDate, newDate) || other.newDate == newDate) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, batchId, day, previousDate,
      newDate, startTime, endTime, isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BatchDetailCopyWith<_$_BatchDetail> get copyWith =>
      __$$_BatchDetailCopyWithImpl<_$_BatchDetail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BatchDetailToJson(
      this,
    );
  }
}

abstract class _BatchDetail implements BatchDetail {
  const factory _BatchDetail(
      {final int? id,
      final int? batchId,
      final int? day,
      final DateTime? previousDate,
      final DateTime? newDate,
      final String? startTime,
      final String? endTime,
      final int? isActive}) = _$_BatchDetail;

  factory _BatchDetail.fromJson(Map<String, dynamic> json) =
      _$_BatchDetail.fromJson;

  @override
  int? get id;
  @override
  int? get batchId;
  @override
  int? get day;
  @override
  DateTime? get previousDate;
  @override
  DateTime? get newDate;
  @override
  String? get startTime;
  @override
  String? get endTime;
  @override
  int? get isActive;
  @override
  @JsonKey(ignore: true)
  _$$_BatchDetailCopyWith<_$_BatchDetail> get copyWith =>
      throw _privateConstructorUsedError;
}
