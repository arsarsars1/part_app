// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'branch_trainer_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BranchTrainerResponse _$BranchTrainerResponseFromJson(
    Map<String, dynamic> json) {
  return _BranchTrainerResponse.fromJson(json);
}

/// @nodoc
mixin _$BranchTrainerResponse {
  int get status => throw _privateConstructorUsedError;
  List<Trainer>? get trainers => throw _privateConstructorUsedError;

  /// Serializes this BranchTrainerResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BranchTrainerResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of BranchTrainerResponse
  /// with the given fields replaced by the non-null parameter values.
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
abstract class _$$BranchTrainerResponseImplCopyWith<$Res>
    implements $BranchTrainerResponseCopyWith<$Res> {
  factory _$$BranchTrainerResponseImplCopyWith(
          _$BranchTrainerResponseImpl value,
          $Res Function(_$BranchTrainerResponseImpl) then) =
      __$$BranchTrainerResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int status, List<Trainer>? trainers});
}

/// @nodoc
class __$$BranchTrainerResponseImplCopyWithImpl<$Res>
    extends _$BranchTrainerResponseCopyWithImpl<$Res,
        _$BranchTrainerResponseImpl>
    implements _$$BranchTrainerResponseImplCopyWith<$Res> {
  __$$BranchTrainerResponseImplCopyWithImpl(_$BranchTrainerResponseImpl _value,
      $Res Function(_$BranchTrainerResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of BranchTrainerResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? trainers = freezed,
  }) {
    return _then(_$BranchTrainerResponseImpl(
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
class _$BranchTrainerResponseImpl implements _BranchTrainerResponse {
  const _$BranchTrainerResponseImpl(
      {required this.status, final List<Trainer>? trainers})
      : _trainers = trainers;

  factory _$BranchTrainerResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BranchTrainerResponseImplFromJson(json);

  @override
  final int status;
  final List<Trainer>? _trainers;
  @override
  List<Trainer>? get trainers {
    final value = _trainers;
    if (value == null) return null;
    if (_trainers is EqualUnmodifiableListView) return _trainers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'BranchTrainerResponse(status: $status, trainers: $trainers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BranchTrainerResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._trainers, _trainers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_trainers));

  /// Create a copy of BranchTrainerResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BranchTrainerResponseImplCopyWith<_$BranchTrainerResponseImpl>
      get copyWith => __$$BranchTrainerResponseImplCopyWithImpl<
          _$BranchTrainerResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BranchTrainerResponseImplToJson(
      this,
    );
  }
}

abstract class _BranchTrainerResponse implements BranchTrainerResponse {
  const factory _BranchTrainerResponse(
      {required final int status,
      final List<Trainer>? trainers}) = _$BranchTrainerResponseImpl;

  factory _BranchTrainerResponse.fromJson(Map<String, dynamic> json) =
      _$BranchTrainerResponseImpl.fromJson;

  @override
  int get status;
  @override
  List<Trainer>? get trainers;

  /// Create a copy of BranchTrainerResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BranchTrainerResponseImplCopyWith<_$BranchTrainerResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
