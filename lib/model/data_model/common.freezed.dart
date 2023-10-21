// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'common.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Common _$CommonFromJson(Map<String, dynamic> json) {
  return _Common.fromJson(json);
}

/// @nodoc
mixin _$Common {
  String? get message => throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommonCopyWith<Common> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommonCopyWith<$Res> {
  factory $CommonCopyWith(Common value, $Res Function(Common) then) =
      _$CommonCopyWithImpl<$Res, Common>;
  @useResult
  $Res call({String? message, int? status});
}

/// @nodoc
class _$CommonCopyWithImpl<$Res, $Val extends Common>
    implements $CommonCopyWith<$Res> {
  _$CommonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CommonCopyWith<$Res> implements $CommonCopyWith<$Res> {
  factory _$$_CommonCopyWith(_$_Common value, $Res Function(_$_Common) then) =
      __$$_CommonCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, int? status});
}

/// @nodoc
class __$$_CommonCopyWithImpl<$Res>
    extends _$CommonCopyWithImpl<$Res, _$_Common>
    implements _$$_CommonCopyWith<$Res> {
  __$$_CommonCopyWithImpl(_$_Common _value, $Res Function(_$_Common) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_Common(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Common implements _Common {
  const _$_Common({this.message, this.status});

  factory _$_Common.fromJson(Map<String, dynamic> json) =>
      _$$_CommonFromJson(json);

  @override
  final String? message;
  @override
  final int? status;

  @override
  String toString() {
    return 'Common(message: $message, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Common &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CommonCopyWith<_$_Common> get copyWith =>
      __$$_CommonCopyWithImpl<_$_Common>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CommonToJson(
      this,
    );
  }
}

abstract class _Common implements Common {
  const factory _Common({final String? message, final int? status}) = _$_Common;

  factory _Common.fromJson(Map<String, dynamic> json) = _$_Common.fromJson;

  @override
  String? get message;
  @override
  int? get status;
  @override
  @JsonKey(ignore: true)
  _$$_CommonCopyWith<_$_Common> get copyWith =>
      throw _privateConstructorUsedError;
}
