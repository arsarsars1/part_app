// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'branch_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BranchResponse _$BranchResponseFromJson(Map<String, dynamic> json) {
  return _BranchResponse.fromJson(json);
}

/// @nodoc
mixin _$BranchResponse {
  int get status => throw _privateConstructorUsedError;
  List<Branch>? get branches => throw _privateConstructorUsedError;
  Branch? get branch => throw _privateConstructorUsedError;

  /// Serializes this BranchResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BranchResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BranchResponseCopyWith<BranchResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BranchResponseCopyWith<$Res> {
  factory $BranchResponseCopyWith(
          BranchResponse value, $Res Function(BranchResponse) then) =
      _$BranchResponseCopyWithImpl<$Res, BranchResponse>;
  @useResult
  $Res call({int status, List<Branch>? branches, Branch? branch});

  $BranchCopyWith<$Res>? get branch;
}

/// @nodoc
class _$BranchResponseCopyWithImpl<$Res, $Val extends BranchResponse>
    implements $BranchResponseCopyWith<$Res> {
  _$BranchResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BranchResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? branches = freezed,
    Object? branch = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      branches: freezed == branches
          ? _value.branches
          : branches // ignore: cast_nullable_to_non_nullable
              as List<Branch>?,
      branch: freezed == branch
          ? _value.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as Branch?,
    ) as $Val);
  }

  /// Create a copy of BranchResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BranchCopyWith<$Res>? get branch {
    if (_value.branch == null) {
      return null;
    }

    return $BranchCopyWith<$Res>(_value.branch!, (value) {
      return _then(_value.copyWith(branch: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BranchResponseImplCopyWith<$Res>
    implements $BranchResponseCopyWith<$Res> {
  factory _$$BranchResponseImplCopyWith(_$BranchResponseImpl value,
          $Res Function(_$BranchResponseImpl) then) =
      __$$BranchResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int status, List<Branch>? branches, Branch? branch});

  @override
  $BranchCopyWith<$Res>? get branch;
}

/// @nodoc
class __$$BranchResponseImplCopyWithImpl<$Res>
    extends _$BranchResponseCopyWithImpl<$Res, _$BranchResponseImpl>
    implements _$$BranchResponseImplCopyWith<$Res> {
  __$$BranchResponseImplCopyWithImpl(
      _$BranchResponseImpl _value, $Res Function(_$BranchResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of BranchResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? branches = freezed,
    Object? branch = freezed,
  }) {
    return _then(_$BranchResponseImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      branches: freezed == branches
          ? _value._branches
          : branches // ignore: cast_nullable_to_non_nullable
              as List<Branch>?,
      branch: freezed == branch
          ? _value.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as Branch?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$BranchResponseImpl implements _BranchResponse {
  const _$BranchResponseImpl(
      {required this.status, final List<Branch>? branches, this.branch})
      : _branches = branches;

  factory _$BranchResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BranchResponseImplFromJson(json);

  @override
  final int status;
  final List<Branch>? _branches;
  @override
  List<Branch>? get branches {
    final value = _branches;
    if (value == null) return null;
    if (_branches is EqualUnmodifiableListView) return _branches;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Branch? branch;

  @override
  String toString() {
    return 'BranchResponse(status: $status, branches: $branches, branch: $branch)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BranchResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._branches, _branches) &&
            (identical(other.branch, branch) || other.branch == branch));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(_branches), branch);

  /// Create a copy of BranchResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BranchResponseImplCopyWith<_$BranchResponseImpl> get copyWith =>
      __$$BranchResponseImplCopyWithImpl<_$BranchResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BranchResponseImplToJson(
      this,
    );
  }
}

abstract class _BranchResponse implements BranchResponse {
  const factory _BranchResponse(
      {required final int status,
      final List<Branch>? branches,
      final Branch? branch}) = _$BranchResponseImpl;

  factory _BranchResponse.fromJson(Map<String, dynamic> json) =
      _$BranchResponseImpl.fromJson;

  @override
  int get status;
  @override
  List<Branch>? get branches;
  @override
  Branch? get branch;

  /// Create a copy of BranchResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BranchResponseImplCopyWith<_$BranchResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Branch _$BranchFromJson(Map<String, dynamic> json) {
  return _Branch.fromJson(json);
}

/// @nodoc
mixin _$Branch {
  int get id => throw _privateConstructorUsedError;
  String? get branchName => throw _privateConstructorUsedError;
  int? get academyId => throw _privateConstructorUsedError;
  int? get countryId => throw _privateConstructorUsedError;
  int? get stateId => throw _privateConstructorUsedError;
  int? get districtId => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  int? get pincode => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  int? get isActive => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  Country? get country => throw _privateConstructorUsedError;
  District? get state => throw _privateConstructorUsedError;
  District? get district => throw _privateConstructorUsedError;
  Manager? get managerDetail => throw _privateConstructorUsedError;

  /// Serializes this Branch to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Branch
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BranchCopyWith<Branch> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BranchCopyWith<$Res> {
  factory $BranchCopyWith(Branch value, $Res Function(Branch) then) =
      _$BranchCopyWithImpl<$Res, Branch>;
  @useResult
  $Res call(
      {int id,
      String? branchName,
      int? academyId,
      int? countryId,
      int? stateId,
      int? districtId,
      String? address,
      int? pincode,
      String? currency,
      int? isActive,
      DateTime? createdAt,
      DateTime? updatedAt,
      Country? country,
      District? state,
      District? district,
      Manager? managerDetail});

  $CountryCopyWith<$Res>? get country;
  $DistrictCopyWith<$Res>? get state;
  $DistrictCopyWith<$Res>? get district;
  $ManagerCopyWith<$Res>? get managerDetail;
}

/// @nodoc
class _$BranchCopyWithImpl<$Res, $Val extends Branch>
    implements $BranchCopyWith<$Res> {
  _$BranchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Branch
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? branchName = freezed,
    Object? academyId = freezed,
    Object? countryId = freezed,
    Object? stateId = freezed,
    Object? districtId = freezed,
    Object? address = freezed,
    Object? pincode = freezed,
    Object? currency = freezed,
    Object? isActive = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? country = freezed,
    Object? state = freezed,
    Object? district = freezed,
    Object? managerDetail = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      branchName: freezed == branchName
          ? _value.branchName
          : branchName // ignore: cast_nullable_to_non_nullable
              as String?,
      academyId: freezed == academyId
          ? _value.academyId
          : academyId // ignore: cast_nullable_to_non_nullable
              as int?,
      countryId: freezed == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as int?,
      stateId: freezed == stateId
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as int?,
      districtId: freezed == districtId
          ? _value.districtId
          : districtId // ignore: cast_nullable_to_non_nullable
              as int?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      pincode: freezed == pincode
          ? _value.pincode
          : pincode // ignore: cast_nullable_to_non_nullable
              as int?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
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
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as Country?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as District?,
      district: freezed == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as District?,
      managerDetail: freezed == managerDetail
          ? _value.managerDetail
          : managerDetail // ignore: cast_nullable_to_non_nullable
              as Manager?,
    ) as $Val);
  }

  /// Create a copy of Branch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CountryCopyWith<$Res>? get country {
    if (_value.country == null) {
      return null;
    }

    return $CountryCopyWith<$Res>(_value.country!, (value) {
      return _then(_value.copyWith(country: value) as $Val);
    });
  }

  /// Create a copy of Branch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DistrictCopyWith<$Res>? get state {
    if (_value.state == null) {
      return null;
    }

    return $DistrictCopyWith<$Res>(_value.state!, (value) {
      return _then(_value.copyWith(state: value) as $Val);
    });
  }

  /// Create a copy of Branch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DistrictCopyWith<$Res>? get district {
    if (_value.district == null) {
      return null;
    }

    return $DistrictCopyWith<$Res>(_value.district!, (value) {
      return _then(_value.copyWith(district: value) as $Val);
    });
  }

  /// Create a copy of Branch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ManagerCopyWith<$Res>? get managerDetail {
    if (_value.managerDetail == null) {
      return null;
    }

    return $ManagerCopyWith<$Res>(_value.managerDetail!, (value) {
      return _then(_value.copyWith(managerDetail: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BranchImplCopyWith<$Res> implements $BranchCopyWith<$Res> {
  factory _$$BranchImplCopyWith(
          _$BranchImpl value, $Res Function(_$BranchImpl) then) =
      __$$BranchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String? branchName,
      int? academyId,
      int? countryId,
      int? stateId,
      int? districtId,
      String? address,
      int? pincode,
      String? currency,
      int? isActive,
      DateTime? createdAt,
      DateTime? updatedAt,
      Country? country,
      District? state,
      District? district,
      Manager? managerDetail});

  @override
  $CountryCopyWith<$Res>? get country;
  @override
  $DistrictCopyWith<$Res>? get state;
  @override
  $DistrictCopyWith<$Res>? get district;
  @override
  $ManagerCopyWith<$Res>? get managerDetail;
}

/// @nodoc
class __$$BranchImplCopyWithImpl<$Res>
    extends _$BranchCopyWithImpl<$Res, _$BranchImpl>
    implements _$$BranchImplCopyWith<$Res> {
  __$$BranchImplCopyWithImpl(
      _$BranchImpl _value, $Res Function(_$BranchImpl) _then)
      : super(_value, _then);

  /// Create a copy of Branch
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? branchName = freezed,
    Object? academyId = freezed,
    Object? countryId = freezed,
    Object? stateId = freezed,
    Object? districtId = freezed,
    Object? address = freezed,
    Object? pincode = freezed,
    Object? currency = freezed,
    Object? isActive = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? country = freezed,
    Object? state = freezed,
    Object? district = freezed,
    Object? managerDetail = freezed,
  }) {
    return _then(_$BranchImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      branchName: freezed == branchName
          ? _value.branchName
          : branchName // ignore: cast_nullable_to_non_nullable
              as String?,
      academyId: freezed == academyId
          ? _value.academyId
          : academyId // ignore: cast_nullable_to_non_nullable
              as int?,
      countryId: freezed == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as int?,
      stateId: freezed == stateId
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as int?,
      districtId: freezed == districtId
          ? _value.districtId
          : districtId // ignore: cast_nullable_to_non_nullable
              as int?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      pincode: freezed == pincode
          ? _value.pincode
          : pincode // ignore: cast_nullable_to_non_nullable
              as int?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
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
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as Country?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as District?,
      district: freezed == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as District?,
      managerDetail: freezed == managerDetail
          ? _value.managerDetail
          : managerDetail // ignore: cast_nullable_to_non_nullable
              as Manager?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$BranchImpl implements _Branch {
  const _$BranchImpl(
      {required this.id,
      this.branchName,
      this.academyId,
      this.countryId,
      this.stateId,
      this.districtId,
      this.address,
      this.pincode,
      this.currency,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.country,
      this.state,
      this.district,
      this.managerDetail});

  factory _$BranchImpl.fromJson(Map<String, dynamic> json) =>
      _$$BranchImplFromJson(json);

  @override
  final int id;
  @override
  final String? branchName;
  @override
  final int? academyId;
  @override
  final int? countryId;
  @override
  final int? stateId;
  @override
  final int? districtId;
  @override
  final String? address;
  @override
  final int? pincode;
  @override
  final String? currency;
  @override
  final int? isActive;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final Country? country;
  @override
  final District? state;
  @override
  final District? district;
  @override
  final Manager? managerDetail;

  @override
  String toString() {
    return 'Branch(id: $id, branchName: $branchName, academyId: $academyId, countryId: $countryId, stateId: $stateId, districtId: $districtId, address: $address, pincode: $pincode, currency: $currency, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt, country: $country, state: $state, district: $district, managerDetail: $managerDetail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BranchImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.branchName, branchName) ||
                other.branchName == branchName) &&
            (identical(other.academyId, academyId) ||
                other.academyId == academyId) &&
            (identical(other.countryId, countryId) ||
                other.countryId == countryId) &&
            (identical(other.stateId, stateId) || other.stateId == stateId) &&
            (identical(other.districtId, districtId) ||
                other.districtId == districtId) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.pincode, pincode) || other.pincode == pincode) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.district, district) ||
                other.district == district) &&
            (identical(other.managerDetail, managerDetail) ||
                other.managerDetail == managerDetail));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      branchName,
      academyId,
      countryId,
      stateId,
      districtId,
      address,
      pincode,
      currency,
      isActive,
      createdAt,
      updatedAt,
      country,
      state,
      district,
      managerDetail);

  /// Create a copy of Branch
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BranchImplCopyWith<_$BranchImpl> get copyWith =>
      __$$BranchImplCopyWithImpl<_$BranchImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BranchImplToJson(
      this,
    );
  }
}

abstract class _Branch implements Branch {
  const factory _Branch(
      {required final int id,
      final String? branchName,
      final int? academyId,
      final int? countryId,
      final int? stateId,
      final int? districtId,
      final String? address,
      final int? pincode,
      final String? currency,
      final int? isActive,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      final Country? country,
      final District? state,
      final District? district,
      final Manager? managerDetail}) = _$BranchImpl;

  factory _Branch.fromJson(Map<String, dynamic> json) = _$BranchImpl.fromJson;

  @override
  int get id;
  @override
  String? get branchName;
  @override
  int? get academyId;
  @override
  int? get countryId;
  @override
  int? get stateId;
  @override
  int? get districtId;
  @override
  String? get address;
  @override
  int? get pincode;
  @override
  String? get currency;
  @override
  int? get isActive;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  Country? get country;
  @override
  District? get state;
  @override
  District? get district;
  @override
  Manager? get managerDetail;

  /// Create a copy of Branch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BranchImplCopyWith<_$BranchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
