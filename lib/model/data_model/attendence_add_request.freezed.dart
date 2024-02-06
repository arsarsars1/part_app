// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendence_add_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AttendenceAddRequest _$AttendenceAddRequestFromJson(Map<String, dynamic> json) {
  return _AttendenceAddRequest.fromJson(json);
}

/// @nodoc
mixin _$AttendenceAddRequest {
  String? get conductedOn => throw _privateConstructorUsedError;
  String? get startTime => throw _privateConstructorUsedError;
  String? get endTime =>
      throw _privateConstructorUsedError; // Attendance? attendance,
  @JsonKey(name: 'attendance[]')
  List<String>? get attendance => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AttendenceAddRequestCopyWith<AttendenceAddRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendenceAddRequestCopyWith<$Res> {
  factory $AttendenceAddRequestCopyWith(AttendenceAddRequest value,
          $Res Function(AttendenceAddRequest) then) =
      _$AttendenceAddRequestCopyWithImpl<$Res, AttendenceAddRequest>;
  @useResult
  $Res call(
      {String? conductedOn,
      String? startTime,
      String? endTime,
      @JsonKey(name: 'attendance[]') List<String>? attendance});
}

/// @nodoc
class _$AttendenceAddRequestCopyWithImpl<$Res,
        $Val extends AttendenceAddRequest>
    implements $AttendenceAddRequestCopyWith<$Res> {
  _$AttendenceAddRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conductedOn = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? attendance = freezed,
  }) {
    return _then(_value.copyWith(
      conductedOn: freezed == conductedOn
          ? _value.conductedOn
          : conductedOn // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      attendance: freezed == attendance
          ? _value.attendance
          : attendance // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttendenceAddRequestImplCopyWith<$Res>
    implements $AttendenceAddRequestCopyWith<$Res> {
  factory _$$AttendenceAddRequestImplCopyWith(_$AttendenceAddRequestImpl value,
          $Res Function(_$AttendenceAddRequestImpl) then) =
      __$$AttendenceAddRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? conductedOn,
      String? startTime,
      String? endTime,
      @JsonKey(name: 'attendance[]') List<String>? attendance});
}

/// @nodoc
class __$$AttendenceAddRequestImplCopyWithImpl<$Res>
    extends _$AttendenceAddRequestCopyWithImpl<$Res, _$AttendenceAddRequestImpl>
    implements _$$AttendenceAddRequestImplCopyWith<$Res> {
  __$$AttendenceAddRequestImplCopyWithImpl(_$AttendenceAddRequestImpl _value,
      $Res Function(_$AttendenceAddRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conductedOn = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? attendance = freezed,
  }) {
    return _then(_$AttendenceAddRequestImpl(
      conductedOn: freezed == conductedOn
          ? _value.conductedOn
          : conductedOn // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      attendance: freezed == attendance
          ? _value._attendance
          : attendance // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$AttendenceAddRequestImpl implements _AttendenceAddRequest {
  const _$AttendenceAddRequestImpl(
      {this.conductedOn,
      this.startTime,
      this.endTime,
      @JsonKey(name: 'attendance[]') final List<String>? attendance})
      : _attendance = attendance;

  factory _$AttendenceAddRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttendenceAddRequestImplFromJson(json);

  @override
  final String? conductedOn;
  @override
  final String? startTime;
  @override
  final String? endTime;
// Attendance? attendance,
  final List<String>? _attendance;
// Attendance? attendance,
  @override
  @JsonKey(name: 'attendance[]')
  List<String>? get attendance {
    final value = _attendance;
    if (value == null) return null;
    if (_attendance is EqualUnmodifiableListView) return _attendance;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AttendenceAddRequest(conductedOn: $conductedOn, startTime: $startTime, endTime: $endTime, attendance: $attendance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendenceAddRequestImpl &&
            (identical(other.conductedOn, conductedOn) ||
                other.conductedOn == conductedOn) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            const DeepCollectionEquality()
                .equals(other._attendance, _attendance));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, conductedOn, startTime, endTime,
      const DeepCollectionEquality().hash(_attendance));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendenceAddRequestImplCopyWith<_$AttendenceAddRequestImpl>
      get copyWith =>
          __$$AttendenceAddRequestImplCopyWithImpl<_$AttendenceAddRequestImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttendenceAddRequestImplToJson(
      this,
    );
  }
}

abstract class _AttendenceAddRequest implements AttendenceAddRequest {
  const factory _AttendenceAddRequest(
          {final String? conductedOn,
          final String? startTime,
          final String? endTime,
          @JsonKey(name: 'attendance[]') final List<String>? attendance}) =
      _$AttendenceAddRequestImpl;

  factory _AttendenceAddRequest.fromJson(Map<String, dynamic> json) =
      _$AttendenceAddRequestImpl.fromJson;

  @override
  String? get conductedOn;
  @override
  String? get startTime;
  @override
  String? get endTime;
  @override // Attendance? attendance,
  @JsonKey(name: 'attendance[]')
  List<String>? get attendance;
  @override
  @JsonKey(ignore: true)
  _$$AttendenceAddRequestImplCopyWith<_$AttendenceAddRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Attendance _$AttendanceFromJson(Map<String, dynamic> json) {
  return _Attendance.fromJson(json);
}

/// @nodoc
mixin _$Attendance {
  int? get studentDetailId => throw _privateConstructorUsedError;
  int? get isPresent => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AttendanceCopyWith<Attendance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceCopyWith<$Res> {
  factory $AttendanceCopyWith(
          Attendance value, $Res Function(Attendance) then) =
      _$AttendanceCopyWithImpl<$Res, Attendance>;
  @useResult
  $Res call({int? studentDetailId, int? isPresent});
}

/// @nodoc
class _$AttendanceCopyWithImpl<$Res, $Val extends Attendance>
    implements $AttendanceCopyWith<$Res> {
  _$AttendanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? studentDetailId = freezed,
    Object? isPresent = freezed,
  }) {
    return _then(_value.copyWith(
      studentDetailId: freezed == studentDetailId
          ? _value.studentDetailId
          : studentDetailId // ignore: cast_nullable_to_non_nullable
              as int?,
      isPresent: freezed == isPresent
          ? _value.isPresent
          : isPresent // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttendanceImplCopyWith<$Res>
    implements $AttendanceCopyWith<$Res> {
  factory _$$AttendanceImplCopyWith(
          _$AttendanceImpl value, $Res Function(_$AttendanceImpl) then) =
      __$$AttendanceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? studentDetailId, int? isPresent});
}

/// @nodoc
class __$$AttendanceImplCopyWithImpl<$Res>
    extends _$AttendanceCopyWithImpl<$Res, _$AttendanceImpl>
    implements _$$AttendanceImplCopyWith<$Res> {
  __$$AttendanceImplCopyWithImpl(
      _$AttendanceImpl _value, $Res Function(_$AttendanceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? studentDetailId = freezed,
    Object? isPresent = freezed,
  }) {
    return _then(_$AttendanceImpl(
      studentDetailId: freezed == studentDetailId
          ? _value.studentDetailId
          : studentDetailId // ignore: cast_nullable_to_non_nullable
              as int?,
      isPresent: freezed == isPresent
          ? _value.isPresent
          : isPresent // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$AttendanceImpl implements _Attendance {
  const _$AttendanceImpl({this.studentDetailId, this.isPresent});

  factory _$AttendanceImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttendanceImplFromJson(json);

  @override
  final int? studentDetailId;
  @override
  final int? isPresent;

  @override
  String toString() {
    return 'Attendance(studentDetailId: $studentDetailId, isPresent: $isPresent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendanceImpl &&
            (identical(other.studentDetailId, studentDetailId) ||
                other.studentDetailId == studentDetailId) &&
            (identical(other.isPresent, isPresent) ||
                other.isPresent == isPresent));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, studentDetailId, isPresent);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendanceImplCopyWith<_$AttendanceImpl> get copyWith =>
      __$$AttendanceImplCopyWithImpl<_$AttendanceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttendanceImplToJson(
      this,
    );
  }
}

abstract class _Attendance implements Attendance {
  const factory _Attendance(
      {final int? studentDetailId, final int? isPresent}) = _$AttendanceImpl;

  factory _Attendance.fromJson(Map<String, dynamic> json) =
      _$AttendanceImpl.fromJson;

  @override
  int? get studentDetailId;
  @override
  int? get isPresent;
  @override
  @JsonKey(ignore: true)
  _$$AttendanceImplCopyWith<_$AttendanceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
