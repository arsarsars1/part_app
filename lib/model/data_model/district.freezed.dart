// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'district.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

District _$DistrictFromJson(Map<String, dynamic> json) {
  return _District.fromJson(json);
}

/// @nodoc
mixin _$District {
  String? get message => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String? get districtName => throw _privateConstructorUsedError;
  String? get stateName => throw _privateConstructorUsedError;

  /// Serializes this District to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of District
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DistrictCopyWith<District> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DistrictCopyWith<$Res> {
  factory $DistrictCopyWith(District value, $Res Function(District) then) =
      _$DistrictCopyWithImpl<$Res, District>;
  @useResult
  $Res call({String? message, int id, String? districtName, String? stateName});
}

/// @nodoc
class _$DistrictCopyWithImpl<$Res, $Val extends District>
    implements $DistrictCopyWith<$Res> {
  _$DistrictCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of District
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? id = null,
    Object? districtName = freezed,
    Object? stateName = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      districtName: freezed == districtName
          ? _value.districtName
          : districtName // ignore: cast_nullable_to_non_nullable
              as String?,
      stateName: freezed == stateName
          ? _value.stateName
          : stateName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DistrictImplCopyWith<$Res>
    implements $DistrictCopyWith<$Res> {
  factory _$$DistrictImplCopyWith(
          _$DistrictImpl value, $Res Function(_$DistrictImpl) then) =
      __$$DistrictImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, int id, String? districtName, String? stateName});
}

/// @nodoc
class __$$DistrictImplCopyWithImpl<$Res>
    extends _$DistrictCopyWithImpl<$Res, _$DistrictImpl>
    implements _$$DistrictImplCopyWith<$Res> {
  __$$DistrictImplCopyWithImpl(
      _$DistrictImpl _value, $Res Function(_$DistrictImpl) _then)
      : super(_value, _then);

  /// Create a copy of District
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? id = null,
    Object? districtName = freezed,
    Object? stateName = freezed,
  }) {
    return _then(_$DistrictImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      districtName: freezed == districtName
          ? _value.districtName
          : districtName // ignore: cast_nullable_to_non_nullable
              as String?,
      stateName: freezed == stateName
          ? _value.stateName
          : stateName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$DistrictImpl implements _District {
  const _$DistrictImpl(
      {this.message, required this.id, this.districtName, this.stateName});

  factory _$DistrictImpl.fromJson(Map<String, dynamic> json) =>
      _$$DistrictImplFromJson(json);

  @override
  final String? message;
  @override
  final int id;
  @override
  final String? districtName;
  @override
  final String? stateName;

  @override
  String toString() {
    return 'District(message: $message, id: $id, districtName: $districtName, stateName: $stateName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DistrictImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.districtName, districtName) ||
                other.districtName == districtName) &&
            (identical(other.stateName, stateName) ||
                other.stateName == stateName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, message, id, districtName, stateName);

  /// Create a copy of District
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DistrictImplCopyWith<_$DistrictImpl> get copyWith =>
      __$$DistrictImplCopyWithImpl<_$DistrictImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DistrictImplToJson(
      this,
    );
  }
}

abstract class _District implements District {
  const factory _District(
      {final String? message,
      required final int id,
      final String? districtName,
      final String? stateName}) = _$DistrictImpl;

  factory _District.fromJson(Map<String, dynamic> json) =
      _$DistrictImpl.fromJson;

  @override
  String? get message;
  @override
  int get id;
  @override
  String? get districtName;
  @override
  String? get stateName;

  /// Create a copy of District
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DistrictImplCopyWith<_$DistrictImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
