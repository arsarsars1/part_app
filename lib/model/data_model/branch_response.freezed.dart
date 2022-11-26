// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'branch_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BranchResponse _$BranchResponseFromJson(Map<String, dynamic> json) {
  return _BranchResponse.fromJson(json);
}

/// @nodoc
mixin _$BranchResponse {
  int get status => throw _privateConstructorUsedError;
  List<Branch>? get branches => throw _privateConstructorUsedError;
  Branch? get branch => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
abstract class _$$_BranchResponseCopyWith<$Res>
    implements $BranchResponseCopyWith<$Res> {
  factory _$$_BranchResponseCopyWith(
          _$_BranchResponse value, $Res Function(_$_BranchResponse) then) =
      __$$_BranchResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int status, List<Branch>? branches, Branch? branch});

  @override
  $BranchCopyWith<$Res>? get branch;
}

/// @nodoc
class __$$_BranchResponseCopyWithImpl<$Res>
    extends _$BranchResponseCopyWithImpl<$Res, _$_BranchResponse>
    implements _$$_BranchResponseCopyWith<$Res> {
  __$$_BranchResponseCopyWithImpl(
      _$_BranchResponse _value, $Res Function(_$_BranchResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? branches = freezed,
    Object? branch = freezed,
  }) {
    return _then(_$_BranchResponse(
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
class _$_BranchResponse implements _BranchResponse {
  const _$_BranchResponse(
      {required this.status, final List<Branch>? branches, this.branch})
      : _branches = branches;

  factory _$_BranchResponse.fromJson(Map<String, dynamic> json) =>
      _$$_BranchResponseFromJson(json);

  @override
  final int status;
  final List<Branch>? _branches;
  @override
  List<Branch>? get branches {
    final value = _branches;
    if (value == null) return null;
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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BranchResponse &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._branches, _branches) &&
            (identical(other.branch, branch) || other.branch == branch));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(_branches), branch);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BranchResponseCopyWith<_$_BranchResponse> get copyWith =>
      __$$_BranchResponseCopyWithImpl<_$_BranchResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BranchResponseToJson(
      this,
    );
  }
}

abstract class _BranchResponse implements BranchResponse {
  const factory _BranchResponse(
      {required final int status,
      final List<Branch>? branches,
      final Branch? branch}) = _$_BranchResponse;

  factory _BranchResponse.fromJson(Map<String, dynamic> json) =
      _$_BranchResponse.fromJson;

  @override
  int get status;
  @override
  List<Branch>? get branches;
  @override
  Branch? get branch;
  @override
  @JsonKey(ignore: true)
  _$$_BranchResponseCopyWith<_$_BranchResponse> get copyWith =>
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
  ManagerDetail? get managerDetail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
      ManagerDetail? managerDetail});

  $CountryCopyWith<$Res>? get country;
  $DistrictCopyWith<$Res>? get state;
  $DistrictCopyWith<$Res>? get district;
  $ManagerDetailCopyWith<$Res>? get managerDetail;
}

/// @nodoc
class _$BranchCopyWithImpl<$Res, $Val extends Branch>
    implements $BranchCopyWith<$Res> {
  _$BranchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
              as ManagerDetail?,
    ) as $Val);
  }

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

  @override
  @pragma('vm:prefer-inline')
  $ManagerDetailCopyWith<$Res>? get managerDetail {
    if (_value.managerDetail == null) {
      return null;
    }

    return $ManagerDetailCopyWith<$Res>(_value.managerDetail!, (value) {
      return _then(_value.copyWith(managerDetail: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_BranchCopyWith<$Res> implements $BranchCopyWith<$Res> {
  factory _$$_BranchCopyWith(_$_Branch value, $Res Function(_$_Branch) then) =
      __$$_BranchCopyWithImpl<$Res>;
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
      ManagerDetail? managerDetail});

  @override
  $CountryCopyWith<$Res>? get country;
  @override
  $DistrictCopyWith<$Res>? get state;
  @override
  $DistrictCopyWith<$Res>? get district;
  @override
  $ManagerDetailCopyWith<$Res>? get managerDetail;
}

/// @nodoc
class __$$_BranchCopyWithImpl<$Res>
    extends _$BranchCopyWithImpl<$Res, _$_Branch>
    implements _$$_BranchCopyWith<$Res> {
  __$$_BranchCopyWithImpl(_$_Branch _value, $Res Function(_$_Branch) _then)
      : super(_value, _then);

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
    return _then(_$_Branch(
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
              as ManagerDetail?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Branch implements _Branch {
  const _$_Branch(
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

  factory _$_Branch.fromJson(Map<String, dynamic> json) =>
      _$$_BranchFromJson(json);

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
  final ManagerDetail? managerDetail;

  @override
  String toString() {
    return 'Branch(id: $id, branchName: $branchName, academyId: $academyId, countryId: $countryId, stateId: $stateId, districtId: $districtId, address: $address, pincode: $pincode, currency: $currency, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt, country: $country, state: $state, district: $district, managerDetail: $managerDetail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Branch &&
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

  @JsonKey(ignore: true)
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BranchCopyWith<_$_Branch> get copyWith =>
      __$$_BranchCopyWithImpl<_$_Branch>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BranchToJson(
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
      final ManagerDetail? managerDetail}) = _$_Branch;

  factory _Branch.fromJson(Map<String, dynamic> json) = _$_Branch.fromJson;

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
  ManagerDetail? get managerDetail;
  @override
  @JsonKey(ignore: true)
  _$$_BranchCopyWith<_$_Branch> get copyWith =>
      throw _privateConstructorUsedError;
}

ManagerDetail _$ManagerDetailFromJson(Map<String, dynamic> json) {
  return _ManagerDetail.fromJson(json);
}

/// @nodoc
mixin _$ManagerDetail {
  int? get id => throw _privateConstructorUsedError;
  int? get userId => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ManagerDetailCopyWith<ManagerDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManagerDetailCopyWith<$Res> {
  factory $ManagerDetailCopyWith(
          ManagerDetail value, $Res Function(ManagerDetail) then) =
      _$ManagerDetailCopyWithImpl<$Res, ManagerDetail>;
  @useResult
  $Res call({int? id, int? userId, String? email, User? user});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$ManagerDetailCopyWithImpl<$Res, $Val extends ManagerDetail>
    implements $ManagerDetailCopyWith<$Res> {
  _$ManagerDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? email = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ManagerDetailCopyWith<$Res>
    implements $ManagerDetailCopyWith<$Res> {
  factory _$$_ManagerDetailCopyWith(
          _$_ManagerDetail value, $Res Function(_$_ManagerDetail) then) =
      __$$_ManagerDetailCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, int? userId, String? email, User? user});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$_ManagerDetailCopyWithImpl<$Res>
    extends _$ManagerDetailCopyWithImpl<$Res, _$_ManagerDetail>
    implements _$$_ManagerDetailCopyWith<$Res> {
  __$$_ManagerDetailCopyWithImpl(
      _$_ManagerDetail _value, $Res Function(_$_ManagerDetail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? email = freezed,
    Object? user = freezed,
  }) {
    return _then(_$_ManagerDetail(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_ManagerDetail implements _ManagerDetail {
  const _$_ManagerDetail({this.id, this.userId, this.email, this.user});

  factory _$_ManagerDetail.fromJson(Map<String, dynamic> json) =>
      _$$_ManagerDetailFromJson(json);

  @override
  final int? id;
  @override
  final int? userId;
  @override
  final String? email;
  @override
  final User? user;

  @override
  String toString() {
    return 'ManagerDetail(id: $id, userId: $userId, email: $email, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ManagerDetail &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, email, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ManagerDetailCopyWith<_$_ManagerDetail> get copyWith =>
      __$$_ManagerDetailCopyWithImpl<_$_ManagerDetail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ManagerDetailToJson(
      this,
    );
  }
}

abstract class _ManagerDetail implements ManagerDetail {
  const factory _ManagerDetail(
      {final int? id,
      final int? userId,
      final String? email,
      final User? user}) = _$_ManagerDetail;

  factory _ManagerDetail.fromJson(Map<String, dynamic> json) =
      _$_ManagerDetail.fromJson;

  @override
  int? get id;
  @override
  int? get userId;
  @override
  String? get email;
  @override
  User? get user;
  @override
  @JsonKey(ignore: true)
  _$$_ManagerDetailCopyWith<_$_ManagerDetail> get copyWith =>
      throw _privateConstructorUsedError;
}
