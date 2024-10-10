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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Common _$CommonFromJson(Map<String, dynamic> json) {
  return _Common.fromJson(json);
}

/// @nodoc
mixin _$Common {
  String? get message => throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;

  /// Serializes this Common to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Common
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of Common
  /// with the given fields replaced by the non-null parameter values.
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
abstract class _$$CommonImplCopyWith<$Res> implements $CommonCopyWith<$Res> {
  factory _$$CommonImplCopyWith(
          _$CommonImpl value, $Res Function(_$CommonImpl) then) =
      __$$CommonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, int? status});
}

/// @nodoc
class __$$CommonImplCopyWithImpl<$Res>
    extends _$CommonCopyWithImpl<$Res, _$CommonImpl>
    implements _$$CommonImplCopyWith<$Res> {
  __$$CommonImplCopyWithImpl(
      _$CommonImpl _value, $Res Function(_$CommonImpl) _then)
      : super(_value, _then);

  /// Create a copy of Common
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? status = freezed,
  }) {
    return _then(_$CommonImpl(
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
class _$CommonImpl implements _Common {
  const _$CommonImpl({this.message, this.status});

  factory _$CommonImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommonImplFromJson(json);

  @override
  final String? message;
  @override
  final int? status;

  @override
  String toString() {
    return 'Common(message: $message, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommonImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, status);

  /// Create a copy of Common
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommonImplCopyWith<_$CommonImpl> get copyWith =>
      __$$CommonImplCopyWithImpl<_$CommonImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommonImplToJson(
      this,
    );
  }
}

abstract class _Common implements Common {
  const factory _Common({final String? message, final int? status}) =
      _$CommonImpl;

  factory _Common.fromJson(Map<String, dynamic> json) = _$CommonImpl.fromJson;

  @override
  String? get message;
  @override
  int? get status;

  /// Create a copy of Common
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommonImplCopyWith<_$CommonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
