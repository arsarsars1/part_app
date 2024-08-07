// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'batch_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BatchRequest _$BatchRequestFromJson(Map<String, dynamic> json) {
  return _BatchRequest.fromJson(json);
}

/// @nodoc
mixin _$BatchRequest {
  String? get batchName => throw _privateConstructorUsedError;
  int? get branchId => throw _privateConstructorUsedError;
  int? get courseId => throw _privateConstructorUsedError;
  int? get subjectId => throw _privateConstructorUsedError;
  int? get retainStudents => throw _privateConstructorUsedError;
  String? get batchStatus => throw _privateConstructorUsedError;
  dynamic get feeAmount => throw _privateConstructorUsedError;
  dynamic get admissionFees => throw _privateConstructorUsedError;
  @JsonKey(name: 'trainers[]')
  dynamic get trainers => throw _privateConstructorUsedError;
  @JsonKey(name: 'days[]')
  List<String>? get days => throw _privateConstructorUsedError;
  @JsonKey(name: 'students[]')
  List<String>? get students => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BatchRequestCopyWith<BatchRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BatchRequestCopyWith<$Res> {
  factory $BatchRequestCopyWith(
          BatchRequest value, $Res Function(BatchRequest) then) =
      _$BatchRequestCopyWithImpl<$Res, BatchRequest>;
  @useResult
  $Res call(
      {String? batchName,
      int? branchId,
      int? courseId,
      int? subjectId,
      int? retainStudents,
      String? batchStatus,
      dynamic feeAmount,
      dynamic admissionFees,
      @JsonKey(name: 'trainers[]') dynamic trainers,
      @JsonKey(name: 'days[]') List<String>? days,
      @JsonKey(name: 'students[]') List<String>? students});
}

/// @nodoc
class _$BatchRequestCopyWithImpl<$Res, $Val extends BatchRequest>
    implements $BatchRequestCopyWith<$Res> {
  _$BatchRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? batchName = freezed,
    Object? branchId = freezed,
    Object? courseId = freezed,
    Object? subjectId = freezed,
    Object? retainStudents = freezed,
    Object? batchStatus = freezed,
    Object? feeAmount = freezed,
    Object? admissionFees = freezed,
    Object? trainers = freezed,
    Object? days = freezed,
    Object? students = freezed,
  }) {
    return _then(_value.copyWith(
      batchName: freezed == batchName
          ? _value.batchName
          : batchName // ignore: cast_nullable_to_non_nullable
              as String?,
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
      retainStudents: freezed == retainStudents
          ? _value.retainStudents
          : retainStudents // ignore: cast_nullable_to_non_nullable
              as int?,
      batchStatus: freezed == batchStatus
          ? _value.batchStatus
          : batchStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      feeAmount: freezed == feeAmount
          ? _value.feeAmount
          : feeAmount // ignore: cast_nullable_to_non_nullable
              as dynamic,
      admissionFees: freezed == admissionFees
          ? _value.admissionFees
          : admissionFees // ignore: cast_nullable_to_non_nullable
              as dynamic,
      trainers: freezed == trainers
          ? _value.trainers
          : trainers // ignore: cast_nullable_to_non_nullable
              as dynamic,
      days: freezed == days
          ? _value.days
          : days // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      students: freezed == students
          ? _value.students
          : students // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BatchRequestImplCopyWith<$Res>
    implements $BatchRequestCopyWith<$Res> {
  factory _$$BatchRequestImplCopyWith(
          _$BatchRequestImpl value, $Res Function(_$BatchRequestImpl) then) =
      __$$BatchRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? batchName,
      int? branchId,
      int? courseId,
      int? subjectId,
      int? retainStudents,
      String? batchStatus,
      dynamic feeAmount,
      dynamic admissionFees,
      @JsonKey(name: 'trainers[]') dynamic trainers,
      @JsonKey(name: 'days[]') List<String>? days,
      @JsonKey(name: 'students[]') List<String>? students});
}

/// @nodoc
class __$$BatchRequestImplCopyWithImpl<$Res>
    extends _$BatchRequestCopyWithImpl<$Res, _$BatchRequestImpl>
    implements _$$BatchRequestImplCopyWith<$Res> {
  __$$BatchRequestImplCopyWithImpl(
      _$BatchRequestImpl _value, $Res Function(_$BatchRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? batchName = freezed,
    Object? branchId = freezed,
    Object? courseId = freezed,
    Object? subjectId = freezed,
    Object? retainStudents = freezed,
    Object? batchStatus = freezed,
    Object? feeAmount = freezed,
    Object? admissionFees = freezed,
    Object? trainers = freezed,
    Object? days = freezed,
    Object? students = freezed,
  }) {
    return _then(_$BatchRequestImpl(
      batchName: freezed == batchName
          ? _value.batchName
          : batchName // ignore: cast_nullable_to_non_nullable
              as String?,
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
      retainStudents: freezed == retainStudents
          ? _value.retainStudents
          : retainStudents // ignore: cast_nullable_to_non_nullable
              as int?,
      batchStatus: freezed == batchStatus
          ? _value.batchStatus
          : batchStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      feeAmount: freezed == feeAmount
          ? _value.feeAmount
          : feeAmount // ignore: cast_nullable_to_non_nullable
              as dynamic,
      admissionFees: freezed == admissionFees
          ? _value.admissionFees
          : admissionFees // ignore: cast_nullable_to_non_nullable
              as dynamic,
      trainers: freezed == trainers
          ? _value.trainers
          : trainers // ignore: cast_nullable_to_non_nullable
              as dynamic,
      days: freezed == days
          ? _value._days
          : days // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      students: freezed == students
          ? _value._students
          : students // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$BatchRequestImpl implements _BatchRequest {
  const _$BatchRequestImpl(
      {this.batchName,
      this.branchId,
      this.courseId,
      this.subjectId,
      this.retainStudents,
      this.batchStatus,
      this.feeAmount,
      this.admissionFees,
      @JsonKey(name: 'trainers[]') this.trainers,
      @JsonKey(name: 'days[]') final List<String>? days,
      @JsonKey(name: 'students[]') final List<String>? students})
      : _days = days,
        _students = students;

  factory _$BatchRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$BatchRequestImplFromJson(json);

  @override
  final String? batchName;
  @override
  final int? branchId;
  @override
  final int? courseId;
  @override
  final int? subjectId;
  @override
  final int? retainStudents;
  @override
  final String? batchStatus;
  @override
  final dynamic feeAmount;
  @override
  final dynamic admissionFees;
  @override
  @JsonKey(name: 'trainers[]')
  final dynamic trainers;
  final List<String>? _days;
  @override
  @JsonKey(name: 'days[]')
  List<String>? get days {
    final value = _days;
    if (value == null) return null;
    if (_days is EqualUnmodifiableListView) return _days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _students;
  @override
  @JsonKey(name: 'students[]')
  List<String>? get students {
    final value = _students;
    if (value == null) return null;
    if (_students is EqualUnmodifiableListView) return _students;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'BatchRequest(batchName: $batchName, branchId: $branchId, courseId: $courseId, subjectId: $subjectId, retainStudents: $retainStudents, batchStatus: $batchStatus, feeAmount: $feeAmount, admissionFees: $admissionFees, trainers: $trainers, days: $days, students: $students)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BatchRequestImpl &&
            (identical(other.batchName, batchName) ||
                other.batchName == batchName) &&
            (identical(other.branchId, branchId) ||
                other.branchId == branchId) &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId) &&
            (identical(other.subjectId, subjectId) ||
                other.subjectId == subjectId) &&
            (identical(other.retainStudents, retainStudents) ||
                other.retainStudents == retainStudents) &&
            (identical(other.batchStatus, batchStatus) ||
                other.batchStatus == batchStatus) &&
            const DeepCollectionEquality().equals(other.feeAmount, feeAmount) &&
            const DeepCollectionEquality()
                .equals(other.admissionFees, admissionFees) &&
            const DeepCollectionEquality().equals(other.trainers, trainers) &&
            const DeepCollectionEquality().equals(other._days, _days) &&
            const DeepCollectionEquality().equals(other._students, _students));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      batchName,
      branchId,
      courseId,
      subjectId,
      retainStudents,
      batchStatus,
      const DeepCollectionEquality().hash(feeAmount),
      const DeepCollectionEquality().hash(admissionFees),
      const DeepCollectionEquality().hash(trainers),
      const DeepCollectionEquality().hash(_days),
      const DeepCollectionEquality().hash(_students));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BatchRequestImplCopyWith<_$BatchRequestImpl> get copyWith =>
      __$$BatchRequestImplCopyWithImpl<_$BatchRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BatchRequestImplToJson(
      this,
    );
  }
}

abstract class _BatchRequest implements BatchRequest {
  const factory _BatchRequest(
          {final String? batchName,
          final int? branchId,
          final int? courseId,
          final int? subjectId,
          final int? retainStudents,
          final String? batchStatus,
          final dynamic feeAmount,
          final dynamic admissionFees,
          @JsonKey(name: 'trainers[]') final dynamic trainers,
          @JsonKey(name: 'days[]') final List<String>? days,
          @JsonKey(name: 'students[]') final List<String>? students}) =
      _$BatchRequestImpl;

  factory _BatchRequest.fromJson(Map<String, dynamic> json) =
      _$BatchRequestImpl.fromJson;

  @override
  String? get batchName;
  @override
  int? get branchId;
  @override
  int? get courseId;
  @override
  int? get subjectId;
  @override
  int? get retainStudents;
  @override
  String? get batchStatus;
  @override
  dynamic get feeAmount;
  @override
  dynamic get admissionFees;
  @override
  @JsonKey(name: 'trainers[]')
  dynamic get trainers;
  @override
  @JsonKey(name: 'days[]')
  List<String>? get days;
  @override
  @JsonKey(name: 'students[]')
  List<String>? get students;
  @override
  @JsonKey(ignore: true)
  _$$BatchRequestImplCopyWith<_$BatchRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Days _$DaysFromJson(Map<String, dynamic> json) {
  return _Days.fromJson(json);
}

/// @nodoc
mixin _$Days {
  int? get day => throw _privateConstructorUsedError;
  String? get startTime => throw _privateConstructorUsedError;
  String? get endTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DaysCopyWith<Days> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DaysCopyWith<$Res> {
  factory $DaysCopyWith(Days value, $Res Function(Days) then) =
      _$DaysCopyWithImpl<$Res, Days>;
  @useResult
  $Res call({int? day, String? startTime, String? endTime});
}

/// @nodoc
class _$DaysCopyWithImpl<$Res, $Val extends Days>
    implements $DaysCopyWith<$Res> {
  _$DaysCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
  }) {
    return _then(_value.copyWith(
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
abstract class _$$DaysImplCopyWith<$Res> implements $DaysCopyWith<$Res> {
  factory _$$DaysImplCopyWith(
          _$DaysImpl value, $Res Function(_$DaysImpl) then) =
      __$$DaysImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? day, String? startTime, String? endTime});
}

/// @nodoc
class __$$DaysImplCopyWithImpl<$Res>
    extends _$DaysCopyWithImpl<$Res, _$DaysImpl>
    implements _$$DaysImplCopyWith<$Res> {
  __$$DaysImplCopyWithImpl(_$DaysImpl _value, $Res Function(_$DaysImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
  }) {
    return _then(_$DaysImpl(
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
class _$DaysImpl implements _Days {
  const _$DaysImpl({this.day, this.startTime, this.endTime});

  factory _$DaysImpl.fromJson(Map<String, dynamic> json) =>
      _$$DaysImplFromJson(json);

  @override
  final int? day;
  @override
  final String? startTime;
  @override
  final String? endTime;

  @override
  String toString() {
    return 'Days(day: $day, startTime: $startTime, endTime: $endTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DaysImpl &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, day, startTime, endTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DaysImplCopyWith<_$DaysImpl> get copyWith =>
      __$$DaysImplCopyWithImpl<_$DaysImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DaysImplToJson(
      this,
    );
  }
}

abstract class _Days implements Days {
  const factory _Days(
      {final int? day,
      final String? startTime,
      final String? endTime}) = _$DaysImpl;

  factory _Days.fromJson(Map<String, dynamic> json) = _$DaysImpl.fromJson;

  @override
  int? get day;
  @override
  String? get startTime;
  @override
  String? get endTime;
  @override
  @JsonKey(ignore: true)
  _$$DaysImplCopyWith<_$DaysImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StudentsData _$StudentsDataFromJson(Map<String, dynamic> json) {
  return _StudentsData.fromJson(json);
}

/// @nodoc
mixin _$StudentsData {
  String? get name => throw _privateConstructorUsedError;
  String? get mobileNo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StudentsDataCopyWith<StudentsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentsDataCopyWith<$Res> {
  factory $StudentsDataCopyWith(
          StudentsData value, $Res Function(StudentsData) then) =
      _$StudentsDataCopyWithImpl<$Res, StudentsData>;
  @useResult
  $Res call({String? name, String? mobileNo});
}

/// @nodoc
class _$StudentsDataCopyWithImpl<$Res, $Val extends StudentsData>
    implements $StudentsDataCopyWith<$Res> {
  _$StudentsDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? mobileNo = freezed,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StudentsDataImplCopyWith<$Res>
    implements $StudentsDataCopyWith<$Res> {
  factory _$$StudentsDataImplCopyWith(
          _$StudentsDataImpl value, $Res Function(_$StudentsDataImpl) then) =
      __$$StudentsDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String? mobileNo});
}

/// @nodoc
class __$$StudentsDataImplCopyWithImpl<$Res>
    extends _$StudentsDataCopyWithImpl<$Res, _$StudentsDataImpl>
    implements _$$StudentsDataImplCopyWith<$Res> {
  __$$StudentsDataImplCopyWithImpl(
      _$StudentsDataImpl _value, $Res Function(_$StudentsDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? mobileNo = freezed,
  }) {
    return _then(_$StudentsDataImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNo: freezed == mobileNo
          ? _value.mobileNo
          : mobileNo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$StudentsDataImpl implements _StudentsData {
  const _$StudentsDataImpl({this.name, this.mobileNo});

  factory _$StudentsDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudentsDataImplFromJson(json);

  @override
  final String? name;
  @override
  final String? mobileNo;

  @override
  String toString() {
    return 'StudentsData(name: $name, mobileNo: $mobileNo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentsDataImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.mobileNo, mobileNo) ||
                other.mobileNo == mobileNo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, mobileNo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentsDataImplCopyWith<_$StudentsDataImpl> get copyWith =>
      __$$StudentsDataImplCopyWithImpl<_$StudentsDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StudentsDataImplToJson(
      this,
    );
  }
}

abstract class _StudentsData implements StudentsData {
  const factory _StudentsData({final String? name, final String? mobileNo}) =
      _$StudentsDataImpl;

  factory _StudentsData.fromJson(Map<String, dynamic> json) =
      _$StudentsDataImpl.fromJson;

  @override
  String? get name;
  @override
  String? get mobileNo;
  @override
  @JsonKey(ignore: true)
  _$$StudentsDataImplCopyWith<_$StudentsDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
