// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'branch_trainer_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BranchTrainerResponse _$BranchTrainerResponseFromJson(
    Map<String, dynamic> json) {
  return _BranchTrainerResponse.fromJson(json);
}

/// @nodoc
mixin _$BranchTrainerResponse {
  int get status => throw _privateConstructorUsedError;
  List<Trainer>? get trainers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BranchTrainerResponseCopyWith<BranchTrainerResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BranchTrainerResponseCopyWith<$Res> {
  factory $BranchTrainerResponseCopyWith(BranchTrainerResponse value,
          $Res Function(BranchTrainerResponse) then) =
      _$BranchTrainerResponseCopyWithImpl<$Res, BranchTrainerResponse>;
  @useResult
  $Res call({int status, List<Trainer>? trainers});
}

/// @nodoc
class _$BranchTrainerResponseCopyWithImpl<$Res,
        $Val extends BranchTrainerResponse>
    implements $BranchTrainerResponseCopyWith<$Res> {
  _$BranchTrainerResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? trainers = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      trainers: freezed == trainers
          ? _value.trainers
          : trainers // ignore: cast_nullable_to_non_nullable
              as List<Trainer>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BranchTrainerResponseCopyWith<$Res>
    implements $BranchTrainerResponseCopyWith<$Res> {
  factory _$$_BranchTrainerResponseCopyWith(_$_BranchTrainerResponse value,
          $Res Function(_$_BranchTrainerResponse) then) =
      __$$_BranchTrainerResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int status, List<Trainer>? trainers});
}

/// @nodoc
class __$$_BranchTrainerResponseCopyWithImpl<$Res>
    extends _$BranchTrainerResponseCopyWithImpl<$Res, _$_BranchTrainerResponse>
    implements _$$_BranchTrainerResponseCopyWith<$Res> {
  __$$_BranchTrainerResponseCopyWithImpl(_$_BranchTrainerResponse _value,
      $Res Function(_$_BranchTrainerResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? trainers = freezed,
  }) {
    return _then(_$_BranchTrainerResponse(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      trainers: freezed == trainers
          ? _value._trainers
          : trainers // ignore: cast_nullable_to_non_nullable
              as List<Trainer>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_BranchTrainerResponse implements _BranchTrainerResponse {
  const _$_BranchTrainerResponse(
      {required this.status, final List<Trainer>? trainers})
      : _trainers = trainers;

  factory _$_BranchTrainerResponse.fromJson(Map<String, dynamic> json) =>
      _$$_BranchTrainerResponseFromJson(json);

  @override
  final int status;
  final List<Trainer>? _trainers;
  @override
  List<Trainer>? get trainers {
    final value = _trainers;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'BranchTrainerResponse(status: $status, trainers: $trainers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BranchTrainerResponse &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._trainers, _trainers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_trainers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BranchTrainerResponseCopyWith<_$_BranchTrainerResponse> get copyWith =>
      __$$_BranchTrainerResponseCopyWithImpl<_$_BranchTrainerResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BranchTrainerResponseToJson(
      this,
    );
  }
}

abstract class _BranchTrainerResponse implements BranchTrainerResponse {
  const factory _BranchTrainerResponse(
      {required final int status,
      final List<Trainer>? trainers}) = _$_BranchTrainerResponse;

  factory _BranchTrainerResponse.fromJson(Map<String, dynamic> json) =
      _$_BranchTrainerResponse.fromJson;

  @override
  int get status;
  @override
  List<Trainer>? get trainers;
  @override
  @JsonKey(ignore: true)
  _$$_BranchTrainerResponseCopyWith<_$_BranchTrainerResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
