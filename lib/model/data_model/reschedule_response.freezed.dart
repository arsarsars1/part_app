// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reschedule_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RescheduleResponse _$RescheduleResponseFromJson(Map<String, dynamic> json) {
  return _RescheduleResponse.fromJson(json);
}

/// @nodoc
mixin _$RescheduleResponse {
  int? get status => throw _privateConstructorUsedError;
  List<BatchDetail>? get rescheduledClasses =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RescheduleResponseCopyWith<RescheduleResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RescheduleResponseCopyWith<$Res> {
  factory $RescheduleResponseCopyWith(
          RescheduleResponse value, $Res Function(RescheduleResponse) then) =
      _$RescheduleResponseCopyWithImpl<$Res, RescheduleResponse>;
  @useResult
  $Res call({int? status, List<BatchDetail>? rescheduledClasses});
}

/// @nodoc
class _$RescheduleResponseCopyWithImpl<$Res, $Val extends RescheduleResponse>
    implements $RescheduleResponseCopyWith<$Res> {
  _$RescheduleResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? rescheduledClasses = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      rescheduledClasses: freezed == rescheduledClasses
          ? _value.rescheduledClasses
          : rescheduledClasses // ignore: cast_nullable_to_non_nullable
              as List<BatchDetail>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RescheduleResponseCopyWith<$Res>
    implements $RescheduleResponseCopyWith<$Res> {
  factory _$$_RescheduleResponseCopyWith(_$_RescheduleResponse value,
          $Res Function(_$_RescheduleResponse) then) =
      __$$_RescheduleResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? status, List<BatchDetail>? rescheduledClasses});
}

/// @nodoc
class __$$_RescheduleResponseCopyWithImpl<$Res>
    extends _$RescheduleResponseCopyWithImpl<$Res, _$_RescheduleResponse>
    implements _$$_RescheduleResponseCopyWith<$Res> {
  __$$_RescheduleResponseCopyWithImpl(
      _$_RescheduleResponse _value, $Res Function(_$_RescheduleResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? rescheduledClasses = freezed,
  }) {
    return _then(_$_RescheduleResponse(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      rescheduledClasses: freezed == rescheduledClasses
          ? _value._rescheduledClasses
          : rescheduledClasses // ignore: cast_nullable_to_non_nullable
              as List<BatchDetail>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_RescheduleResponse implements _RescheduleResponse {
  const _$_RescheduleResponse(
      {this.status, final List<BatchDetail>? rescheduledClasses})
      : _rescheduledClasses = rescheduledClasses;

  factory _$_RescheduleResponse.fromJson(Map<String, dynamic> json) =>
      _$$_RescheduleResponseFromJson(json);

  @override
  final int? status;
  final List<BatchDetail>? _rescheduledClasses;
  @override
  List<BatchDetail>? get rescheduledClasses {
    final value = _rescheduledClasses;
    if (value == null) return null;
    if (_rescheduledClasses is EqualUnmodifiableListView)
      return _rescheduledClasses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'RescheduleResponse(status: $status, rescheduledClasses: $rescheduledClasses)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RescheduleResponse &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._rescheduledClasses, _rescheduledClasses));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(_rescheduledClasses));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RescheduleResponseCopyWith<_$_RescheduleResponse> get copyWith =>
      __$$_RescheduleResponseCopyWithImpl<_$_RescheduleResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RescheduleResponseToJson(
      this,
    );
  }
}

abstract class _RescheduleResponse implements RescheduleResponse {
  const factory _RescheduleResponse(
      {final int? status,
      final List<BatchDetail>? rescheduledClasses}) = _$_RescheduleResponse;

  factory _RescheduleResponse.fromJson(Map<String, dynamic> json) =
      _$_RescheduleResponse.fromJson;

  @override
  int? get status;
  @override
  List<BatchDetail>? get rescheduledClasses;
  @override
  @JsonKey(ignore: true)
  _$$_RescheduleResponseCopyWith<_$_RescheduleResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
