// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'academy_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AcademyType _$AcademyTypeFromJson(Map<String, dynamic> json) {
  return _AcademyType.fromJson(json);
}

/// @nodoc
mixin _$AcademyType {
  int get id => throw _privateConstructorUsedError;
  String get academyType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AcademyTypeCopyWith<AcademyType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AcademyTypeCopyWith<$Res> {
  factory $AcademyTypeCopyWith(
          AcademyType value, $Res Function(AcademyType) then) =
      _$AcademyTypeCopyWithImpl<$Res, AcademyType>;
  @useResult
  $Res call({int id, String academyType});
}

/// @nodoc
class _$AcademyTypeCopyWithImpl<$Res, $Val extends AcademyType>
    implements $AcademyTypeCopyWith<$Res> {
  _$AcademyTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? academyType = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      academyType: null == academyType
          ? _value.academyType
          : academyType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AcademyTypeCopyWith<$Res>
    implements $AcademyTypeCopyWith<$Res> {
  factory _$$_AcademyTypeCopyWith(
          _$_AcademyType value, $Res Function(_$_AcademyType) then) =
      __$$_AcademyTypeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String academyType});
}

/// @nodoc
class __$$_AcademyTypeCopyWithImpl<$Res>
    extends _$AcademyTypeCopyWithImpl<$Res, _$_AcademyType>
    implements _$$_AcademyTypeCopyWith<$Res> {
  __$$_AcademyTypeCopyWithImpl(
      _$_AcademyType _value, $Res Function(_$_AcademyType) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? academyType = null,
  }) {
    return _then(_$_AcademyType(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      academyType: null == academyType
          ? _value.academyType
          : academyType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_AcademyType implements _AcademyType {
  const _$_AcademyType({required this.id, required this.academyType});

  factory _$_AcademyType.fromJson(Map<String, dynamic> json) =>
      _$$_AcademyTypeFromJson(json);

  @override
  final int id;
  @override
  final String academyType;

  @override
  String toString() {
    return 'AcademyType(id: $id, academyType: $academyType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AcademyType &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.academyType, academyType) ||
                other.academyType == academyType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, academyType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AcademyTypeCopyWith<_$_AcademyType> get copyWith =>
      __$$_AcademyTypeCopyWithImpl<_$_AcademyType>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AcademyTypeToJson(
      this,
    );
  }
}

abstract class _AcademyType implements AcademyType {
  const factory _AcademyType(
      {required final int id,
      required final String academyType}) = _$_AcademyType;

  factory _AcademyType.fromJson(Map<String, dynamic> json) =
      _$_AcademyType.fromJson;

  @override
  int get id;
  @override
  String get academyType;
  @override
  @JsonKey(ignore: true)
  _$$_AcademyTypeCopyWith<_$_AcademyType> get copyWith =>
      throw _privateConstructorUsedError;
}
