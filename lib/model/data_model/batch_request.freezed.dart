// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'batch_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BatchRequest _$BatchRequestFromJson(Map<String, dynamic> json) {
  return _BatchRequest.fromJson(json);
}

/// @nodoc
mixin _$BatchRequest {
  String? get batchName => throw _privateConstructorUsedError;
  int? get branchId => throw _privateConstructorUsedError;
  int? get courseId => throw _privateConstructorUsedError;
  int? get subjectId => throw _privateConstructorUsedError;
  String? get batchStatus => throw _privateConstructorUsedError;
  dynamic get feeAmount => throw _privateConstructorUsedError;
  dynamic get admissionFees => throw _privateConstructorUsedError;
  @JsonKey(name: 'trainers[]')
  List<int?>? get trainers => throw _privateConstructorUsedError;
  @JsonKey(name: 'days[]')
  List<String>? get days => throw _privateConstructorUsedError;

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
      String? batchStatus,
      dynamic feeAmount,
      dynamic admissionFees,
      @JsonKey(name: 'trainers[]') List<int?>? trainers,
      @JsonKey(name: 'days[]') List<String>? days});
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
    Object? batchStatus = freezed,
    Object? feeAmount = null,
    Object? admissionFees = null,
    Object? trainers = freezed,
    Object? days = freezed,
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
      batchStatus: freezed == batchStatus
          ? _value.batchStatus
          : batchStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      feeAmount: null == feeAmount
          ? _value.feeAmount
          : feeAmount // ignore: cast_nullable_to_non_nullable
              as dynamic,
      admissionFees: null == admissionFees
          ? _value.admissionFees
          : admissionFees // ignore: cast_nullable_to_non_nullable
              as dynamic,
      trainers: freezed == trainers
          ? _value.trainers
          : trainers // ignore: cast_nullable_to_non_nullable
              as List<int?>?,
      days: freezed == days
          ? _value.days
          : days // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BatchRequestCopyWith<$Res>
    implements $BatchRequestCopyWith<$Res> {
  factory _$$_BatchRequestCopyWith(
          _$_BatchRequest value, $Res Function(_$_BatchRequest) then) =
      __$$_BatchRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? batchName,
      int? branchId,
      int? courseId,
      int? subjectId,
      String? batchStatus,
      dynamic feeAmount,
      dynamic admissionFees,
      @JsonKey(name: 'trainers[]') List<int?>? trainers,
      @JsonKey(name: 'days[]') List<String>? days});
}

/// @nodoc
class __$$_BatchRequestCopyWithImpl<$Res>
    extends _$BatchRequestCopyWithImpl<$Res, _$_BatchRequest>
    implements _$$_BatchRequestCopyWith<$Res> {
  __$$_BatchRequestCopyWithImpl(
      _$_BatchRequest _value, $Res Function(_$_BatchRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? batchName = freezed,
    Object? branchId = freezed,
    Object? courseId = freezed,
    Object? subjectId = freezed,
    Object? batchStatus = freezed,
    Object? feeAmount = null,
    Object? admissionFees = null,
    Object? trainers = freezed,
    Object? days = freezed,
  }) {
    return _then(_$_BatchRequest(
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
      batchStatus: freezed == batchStatus
          ? _value.batchStatus
          : batchStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      feeAmount: null == feeAmount
          ? _value.feeAmount
          : feeAmount // ignore: cast_nullable_to_non_nullable
              as dynamic,
      admissionFees: null == admissionFees
          ? _value.admissionFees
          : admissionFees // ignore: cast_nullable_to_non_nullable
              as dynamic,
      trainers: freezed == trainers
          ? _value._trainers
          : trainers // ignore: cast_nullable_to_non_nullable
              as List<int?>?,
      days: freezed == days
          ? _value._days
          : days // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_BatchRequest implements _BatchRequest {
  const _$_BatchRequest(
      {this.batchName,
      this.branchId,
      this.courseId,
      this.subjectId,
      this.batchStatus,
      this.feeAmount,
      this.admissionFees,
      @JsonKey(name: 'trainers[]') final List<int?>? trainers,
      @JsonKey(name: 'days[]') final List<String>? days})
      : _trainers = trainers,
        _days = days;

  factory _$_BatchRequest.fromJson(Map<String, dynamic> json) =>
      _$$_BatchRequestFromJson(json);

  @override
  final String? batchName;
  @override
  final int? branchId;
  @override
  final int? courseId;
  @override
  final int? subjectId;
  @override
  final String? batchStatus;
  @override
  final dynamic feeAmount;
  @override
  final dynamic admissionFees;
  final List<int?>? _trainers;
  @override
  @JsonKey(name: 'trainers[]')
  List<int?>? get trainers {
    final value = _trainers;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _days;
  @override
  @JsonKey(name: 'days[]')
  List<String>? get days {
    final value = _days;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'BatchRequest(batchName: $batchName, branchId: $branchId, courseId: $courseId, subjectId: $subjectId, batchStatus: $batchStatus, feeAmount: $feeAmount, admissionFees: $admissionFees, trainers: $trainers, days: $days)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BatchRequest &&
            (identical(other.batchName, batchName) ||
                other.batchName == batchName) &&
            (identical(other.branchId, branchId) ||
                other.branchId == branchId) &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId) &&
            (identical(other.subjectId, subjectId) ||
                other.subjectId == subjectId) &&
            (identical(other.batchStatus, batchStatus) ||
                other.batchStatus == batchStatus) &&
            const DeepCollectionEquality().equals(other.feeAmount, feeAmount) &&
            const DeepCollectionEquality()
                .equals(other.admissionFees, admissionFees) &&
            const DeepCollectionEquality().equals(other._trainers, _trainers) &&
            const DeepCollectionEquality().equals(other._days, _days));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      batchName,
      branchId,
      courseId,
      subjectId,
      batchStatus,
      const DeepCollectionEquality().hash(feeAmount),
      const DeepCollectionEquality().hash(admissionFees),
      const DeepCollectionEquality().hash(_trainers),
      const DeepCollectionEquality().hash(_days));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BatchRequestCopyWith<_$_BatchRequest> get copyWith =>
      __$$_BatchRequestCopyWithImpl<_$_BatchRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BatchRequestToJson(
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
      final String? batchStatus,
      final dynamic feeAmount,
      final dynamic admissionFees,
      @JsonKey(name: 'trainers[]') final List<int?>? trainers,
      @JsonKey(name: 'days[]') final List<String>? days}) = _$_BatchRequest;

  factory _BatchRequest.fromJson(Map<String, dynamic> json) =
      _$_BatchRequest.fromJson;

  @override
  String? get batchName;
  @override
  int? get branchId;
  @override
  int? get courseId;
  @override
  int? get subjectId;
  @override
  String? get batchStatus;
  @override
  dynamic get feeAmount;
  @override
  dynamic get admissionFees;
  @override
  @JsonKey(name: 'trainers[]')
  List<int?>? get trainers;
  @override
  @JsonKey(name: 'days[]')
  List<String>? get days;
  @override
  @JsonKey(ignore: true)
  _$$_BatchRequestCopyWith<_$_BatchRequest> get copyWith =>
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
abstract class _$$_DaysCopyWith<$Res> implements $DaysCopyWith<$Res> {
  factory _$$_DaysCopyWith(_$_Days value, $Res Function(_$_Days) then) =
      __$$_DaysCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? day, String? startTime, String? endTime});
}

/// @nodoc
class __$$_DaysCopyWithImpl<$Res> extends _$DaysCopyWithImpl<$Res, _$_Days>
    implements _$$_DaysCopyWith<$Res> {
  __$$_DaysCopyWithImpl(_$_Days _value, $Res Function(_$_Days) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
  }) {
    return _then(_$_Days(
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
class _$_Days implements _Days {
  const _$_Days({this.day, this.startTime, this.endTime});

  factory _$_Days.fromJson(Map<String, dynamic> json) => _$$_DaysFromJson(json);

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Days &&
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
  _$$_DaysCopyWith<_$_Days> get copyWith =>
      __$$_DaysCopyWithImpl<_$_Days>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DaysToJson(
      this,
    );
  }
}

abstract class _Days implements Days {
  const factory _Days(
      {final int? day,
      final String? startTime,
      final String? endTime}) = _$_Days;

  factory _Days.fromJson(Map<String, dynamic> json) = _$_Days.fromJson;

  @override
  int? get day;
  @override
  String? get startTime;
  @override
  String? get endTime;
  @override
  @JsonKey(ignore: true)
  _$$_DaysCopyWith<_$_Days> get copyWith => throw _privateConstructorUsedError;
}
