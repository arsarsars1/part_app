// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'otp.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Otp _$OtpFromJson(Map<String, dynamic> json) {
  return _Otp.fromJson(json);
}

/// @nodoc
mixin _$Otp {
  String get message => throw _privateConstructorUsedError;
  dynamic get otp => throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OtpCopyWith<Otp> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtpCopyWith<$Res> {
  factory $OtpCopyWith(Otp value, $Res Function(Otp) then) =
      _$OtpCopyWithImpl<$Res, Otp>;
  @useResult
  $Res call({String message, dynamic otp, int? status});
}

/// @nodoc
class _$OtpCopyWithImpl<$Res, $Val extends Otp> implements $OtpCopyWith<$Res> {
  _$OtpCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? otp = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as dynamic,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OtpImplCopyWith<$Res> implements $OtpCopyWith<$Res> {
  factory _$$OtpImplCopyWith(_$OtpImpl value, $Res Function(_$OtpImpl) then) =
      __$$OtpImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, dynamic otp, int? status});
}

/// @nodoc
class __$$OtpImplCopyWithImpl<$Res> extends _$OtpCopyWithImpl<$Res, _$OtpImpl>
    implements _$$OtpImplCopyWith<$Res> {
  __$$OtpImplCopyWithImpl(_$OtpImpl _value, $Res Function(_$OtpImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? otp = freezed,
    Object? status = freezed,
  }) {
    return _then(_$OtpImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as dynamic,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$OtpImpl implements _Otp {
  const _$OtpImpl({required this.message, this.otp, this.status});

  factory _$OtpImpl.fromJson(Map<String, dynamic> json) =>
      _$$OtpImplFromJson(json);

  @override
  final String message;
  @override
  final dynamic otp;
  @override
  final int? status;

  @override
  String toString() {
    return 'Otp(message: $message, otp: $otp, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtpImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.otp, otp) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(otp), status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OtpImplCopyWith<_$OtpImpl> get copyWith =>
      __$$OtpImplCopyWithImpl<_$OtpImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OtpImplToJson(
      this,
    );
  }
}

abstract class _Otp implements Otp {
  const factory _Otp(
      {required final String message,
      final dynamic otp,
      final int? status}) = _$OtpImpl;

  factory _Otp.fromJson(Map<String, dynamic> json) = _$OtpImpl.fromJson;

  @override
  String get message;
  @override
  dynamic get otp;
  @override
  int? get status;
  @override
  @JsonKey(ignore: true)
  _$$OtpImplCopyWith<_$OtpImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
