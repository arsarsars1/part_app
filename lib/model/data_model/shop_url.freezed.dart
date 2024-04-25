// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop_url.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ShopUrl _$ShopUrlFromJson(Map<String, dynamic> json) {
  return _ShopUrl.fromJson(json);
}

/// @nodoc
mixin _$ShopUrl {
  String? get url => throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShopUrlCopyWith<ShopUrl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopUrlCopyWith<$Res> {
  factory $ShopUrlCopyWith(ShopUrl value, $Res Function(ShopUrl) then) =
      _$ShopUrlCopyWithImpl<$Res, ShopUrl>;
  @useResult
  $Res call({String? url, int? status});
}

/// @nodoc
class _$ShopUrlCopyWithImpl<$Res, $Val extends ShopUrl>
    implements $ShopUrlCopyWith<$Res> {
  _$ShopUrlCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShopUrlImplCopyWith<$Res> implements $ShopUrlCopyWith<$Res> {
  factory _$$ShopUrlImplCopyWith(
          _$ShopUrlImpl value, $Res Function(_$ShopUrlImpl) then) =
      __$$ShopUrlImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? url, int? status});
}

/// @nodoc
class __$$ShopUrlImplCopyWithImpl<$Res>
    extends _$ShopUrlCopyWithImpl<$Res, _$ShopUrlImpl>
    implements _$$ShopUrlImplCopyWith<$Res> {
  __$$ShopUrlImplCopyWithImpl(
      _$ShopUrlImpl _value, $Res Function(_$ShopUrlImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? status = freezed,
  }) {
    return _then(_$ShopUrlImpl(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
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
class _$ShopUrlImpl implements _ShopUrl {
  const _$ShopUrlImpl({this.url, this.status});

  factory _$ShopUrlImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShopUrlImplFromJson(json);

  @override
  final String? url;
  @override
  final int? status;

  @override
  String toString() {
    return 'ShopUrl(url: $url, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShopUrlImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, url, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShopUrlImplCopyWith<_$ShopUrlImpl> get copyWith =>
      __$$ShopUrlImplCopyWithImpl<_$ShopUrlImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShopUrlImplToJson(
      this,
    );
  }
}

abstract class _ShopUrl implements ShopUrl {
  const factory _ShopUrl({final String? url, final int? status}) =
      _$ShopUrlImpl;

  factory _ShopUrl.fromJson(Map<String, dynamic> json) = _$ShopUrlImpl.fromJson;

  @override
  String? get url;
  @override
  int? get status;
  @override
  @JsonKey(ignore: true)
  _$$ShopUrlImplCopyWith<_$ShopUrlImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
