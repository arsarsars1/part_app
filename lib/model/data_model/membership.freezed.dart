// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'membership.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Membership _$MembershipFromJson(Map<String, dynamic> json) {
  return _Membership.fromJson(json);
}

/// @nodoc
mixin _$Membership {
  int get id => throw _privateConstructorUsedError;
  String? get membershipType => throw _privateConstructorUsedError;
  String? get period => throw _privateConstructorUsedError;
  String? get paymentType => throw _privateConstructorUsedError;
  int? get duration => throw _privateConstructorUsedError;
  int? get amount => throw _privateConstructorUsedError;
  int? get finalAmount => throw _privateConstructorUsedError;
  int? get maxNoOfStudents => throw _privateConstructorUsedError;
  int? get maxNoOfBranches => throw _privateConstructorUsedError;
  int? get isActive => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Membership to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Membership
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MembershipCopyWith<Membership> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MembershipCopyWith<$Res> {
  factory $MembershipCopyWith(
          Membership value, $Res Function(Membership) then) =
      _$MembershipCopyWithImpl<$Res, Membership>;
  @useResult
  $Res call(
      {int id,
      String? membershipType,
      String? period,
      String? paymentType,
      int? duration,
      int? amount,
      int? finalAmount,
      int? maxNoOfStudents,
      int? maxNoOfBranches,
      int? isActive,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$MembershipCopyWithImpl<$Res, $Val extends Membership>
    implements $MembershipCopyWith<$Res> {
  _$MembershipCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Membership
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? membershipType = freezed,
    Object? period = freezed,
    Object? paymentType = freezed,
    Object? duration = freezed,
    Object? amount = freezed,
    Object? finalAmount = freezed,
    Object? maxNoOfStudents = freezed,
    Object? maxNoOfBranches = freezed,
    Object? isActive = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      membershipType: freezed == membershipType
          ? _value.membershipType
          : membershipType // ignore: cast_nullable_to_non_nullable
              as String?,
      period: freezed == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentType: freezed == paymentType
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      finalAmount: freezed == finalAmount
          ? _value.finalAmount
          : finalAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      maxNoOfStudents: freezed == maxNoOfStudents
          ? _value.maxNoOfStudents
          : maxNoOfStudents // ignore: cast_nullable_to_non_nullable
              as int?,
      maxNoOfBranches: freezed == maxNoOfBranches
          ? _value.maxNoOfBranches
          : maxNoOfBranches // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MembershipImplCopyWith<$Res>
    implements $MembershipCopyWith<$Res> {
  factory _$$MembershipImplCopyWith(
          _$MembershipImpl value, $Res Function(_$MembershipImpl) then) =
      __$$MembershipImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String? membershipType,
      String? period,
      String? paymentType,
      int? duration,
      int? amount,
      int? finalAmount,
      int? maxNoOfStudents,
      int? maxNoOfBranches,
      int? isActive,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$MembershipImplCopyWithImpl<$Res>
    extends _$MembershipCopyWithImpl<$Res, _$MembershipImpl>
    implements _$$MembershipImplCopyWith<$Res> {
  __$$MembershipImplCopyWithImpl(
      _$MembershipImpl _value, $Res Function(_$MembershipImpl) _then)
      : super(_value, _then);

  /// Create a copy of Membership
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? membershipType = freezed,
    Object? period = freezed,
    Object? paymentType = freezed,
    Object? duration = freezed,
    Object? amount = freezed,
    Object? finalAmount = freezed,
    Object? maxNoOfStudents = freezed,
    Object? maxNoOfBranches = freezed,
    Object? isActive = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$MembershipImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      membershipType: freezed == membershipType
          ? _value.membershipType
          : membershipType // ignore: cast_nullable_to_non_nullable
              as String?,
      period: freezed == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentType: freezed == paymentType
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      finalAmount: freezed == finalAmount
          ? _value.finalAmount
          : finalAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      maxNoOfStudents: freezed == maxNoOfStudents
          ? _value.maxNoOfStudents
          : maxNoOfStudents // ignore: cast_nullable_to_non_nullable
              as int?,
      maxNoOfBranches: freezed == maxNoOfBranches
          ? _value.maxNoOfBranches
          : maxNoOfBranches // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$MembershipImpl implements _Membership {
  const _$MembershipImpl(
      {required this.id,
      this.membershipType,
      this.period,
      this.paymentType,
      this.duration,
      this.amount,
      this.finalAmount,
      this.maxNoOfStudents,
      this.maxNoOfBranches,
      this.isActive,
      this.createdAt,
      this.updatedAt});

  factory _$MembershipImpl.fromJson(Map<String, dynamic> json) =>
      _$$MembershipImplFromJson(json);

  @override
  final int id;
  @override
  final String? membershipType;
  @override
  final String? period;
  @override
  final String? paymentType;
  @override
  final int? duration;
  @override
  final int? amount;
  @override
  final int? finalAmount;
  @override
  final int? maxNoOfStudents;
  @override
  final int? maxNoOfBranches;
  @override
  final int? isActive;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Membership(id: $id, membershipType: $membershipType, period: $period, paymentType: $paymentType, duration: $duration, amount: $amount, finalAmount: $finalAmount, maxNoOfStudents: $maxNoOfStudents, maxNoOfBranches: $maxNoOfBranches, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MembershipImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.membershipType, membershipType) ||
                other.membershipType == membershipType) &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.paymentType, paymentType) ||
                other.paymentType == paymentType) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.finalAmount, finalAmount) ||
                other.finalAmount == finalAmount) &&
            (identical(other.maxNoOfStudents, maxNoOfStudents) ||
                other.maxNoOfStudents == maxNoOfStudents) &&
            (identical(other.maxNoOfBranches, maxNoOfBranches) ||
                other.maxNoOfBranches == maxNoOfBranches) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      membershipType,
      period,
      paymentType,
      duration,
      amount,
      finalAmount,
      maxNoOfStudents,
      maxNoOfBranches,
      isActive,
      createdAt,
      updatedAt);

  /// Create a copy of Membership
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MembershipImplCopyWith<_$MembershipImpl> get copyWith =>
      __$$MembershipImplCopyWithImpl<_$MembershipImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MembershipImplToJson(
      this,
    );
  }
}

abstract class _Membership implements Membership {
  const factory _Membership(
      {required final int id,
      final String? membershipType,
      final String? period,
      final String? paymentType,
      final int? duration,
      final int? amount,
      final int? finalAmount,
      final int? maxNoOfStudents,
      final int? maxNoOfBranches,
      final int? isActive,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$MembershipImpl;

  factory _Membership.fromJson(Map<String, dynamic> json) =
      _$MembershipImpl.fromJson;

  @override
  int get id;
  @override
  String? get membershipType;
  @override
  String? get period;
  @override
  String? get paymentType;
  @override
  int? get duration;
  @override
  int? get amount;
  @override
  int? get finalAmount;
  @override
  int? get maxNoOfStudents;
  @override
  int? get maxNoOfBranches;
  @override
  int? get isActive;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of Membership
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MembershipImplCopyWith<_$MembershipImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
