// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'leads_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LeadsResponse _$LeadsResponseFromJson(Map<String, dynamic> json) {
  return _LeadsResponse.fromJson(json);
}

/// @nodoc
mixin _$LeadsResponse {
  int? get status => throw _privateConstructorUsedError;
  Leads? get leads => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeadsResponseCopyWith<LeadsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadsResponseCopyWith<$Res> {
  factory $LeadsResponseCopyWith(
          LeadsResponse value, $Res Function(LeadsResponse) then) =
      _$LeadsResponseCopyWithImpl<$Res, LeadsResponse>;
  @useResult
  $Res call({int? status, Leads? leads});

  $LeadsCopyWith<$Res>? get leads;
}

/// @nodoc
class _$LeadsResponseCopyWithImpl<$Res, $Val extends LeadsResponse>
    implements $LeadsResponseCopyWith<$Res> {
  _$LeadsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? leads = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      leads: freezed == leads
          ? _value.leads
          : leads // ignore: cast_nullable_to_non_nullable
              as Leads?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LeadsCopyWith<$Res>? get leads {
    if (_value.leads == null) {
      return null;
    }

    return $LeadsCopyWith<$Res>(_value.leads!, (value) {
      return _then(_value.copyWith(leads: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_LeadsResponseCopyWith<$Res>
    implements $LeadsResponseCopyWith<$Res> {
  factory _$$_LeadsResponseCopyWith(
          _$_LeadsResponse value, $Res Function(_$_LeadsResponse) then) =
      __$$_LeadsResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? status, Leads? leads});

  @override
  $LeadsCopyWith<$Res>? get leads;
}

/// @nodoc
class __$$_LeadsResponseCopyWithImpl<$Res>
    extends _$LeadsResponseCopyWithImpl<$Res, _$_LeadsResponse>
    implements _$$_LeadsResponseCopyWith<$Res> {
  __$$_LeadsResponseCopyWithImpl(
      _$_LeadsResponse _value, $Res Function(_$_LeadsResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? leads = freezed,
  }) {
    return _then(_$_LeadsResponse(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      leads: freezed == leads
          ? _value.leads
          : leads // ignore: cast_nullable_to_non_nullable
              as Leads?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_LeadsResponse implements _LeadsResponse {
  const _$_LeadsResponse({this.status, this.leads});

  factory _$_LeadsResponse.fromJson(Map<String, dynamic> json) =>
      _$$_LeadsResponseFromJson(json);

  @override
  final int? status;
  @override
  final Leads? leads;

  @override
  String toString() {
    return 'LeadsResponse(status: $status, leads: $leads)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LeadsResponse &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.leads, leads) || other.leads == leads));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, leads);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LeadsResponseCopyWith<_$_LeadsResponse> get copyWith =>
      __$$_LeadsResponseCopyWithImpl<_$_LeadsResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LeadsResponseToJson(
      this,
    );
  }
}

abstract class _LeadsResponse implements LeadsResponse {
  const factory _LeadsResponse({final int? status, final Leads? leads}) =
      _$_LeadsResponse;

  factory _LeadsResponse.fromJson(Map<String, dynamic> json) =
      _$_LeadsResponse.fromJson;

  @override
  int? get status;
  @override
  Leads? get leads;
  @override
  @JsonKey(ignore: true)
  _$$_LeadsResponseCopyWith<_$_LeadsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

Leads _$LeadsFromJson(Map<String, dynamic> json) {
  return _Leads.fromJson(json);
}

/// @nodoc
mixin _$Leads {
  int? get currentPage => throw _privateConstructorUsedError;
  List<Lead>? get data => throw _privateConstructorUsedError;
  String? get firstPageUrl => throw _privateConstructorUsedError;
  int? get from => throw _privateConstructorUsedError;
  String? get nextPageUrl => throw _privateConstructorUsedError;
  String? get path => throw _privateConstructorUsedError;
  int? get perPage => throw _privateConstructorUsedError;
  String? get prevPageUrl => throw _privateConstructorUsedError;
  int? get to => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeadsCopyWith<Leads> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadsCopyWith<$Res> {
  factory $LeadsCopyWith(Leads value, $Res Function(Leads) then) =
      _$LeadsCopyWithImpl<$Res, Leads>;
  @useResult
  $Res call(
      {int? currentPage,
      List<Lead>? data,
      String? firstPageUrl,
      int? from,
      String? nextPageUrl,
      String? path,
      int? perPage,
      String? prevPageUrl,
      int? to});
}

/// @nodoc
class _$LeadsCopyWithImpl<$Res, $Val extends Leads>
    implements $LeadsCopyWith<$Res> {
  _$LeadsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = freezed,
    Object? data = freezed,
    Object? firstPageUrl = freezed,
    Object? from = freezed,
    Object? nextPageUrl = freezed,
    Object? path = freezed,
    Object? perPage = freezed,
    Object? prevPageUrl = freezed,
    Object? to = freezed,
  }) {
    return _then(_value.copyWith(
      currentPage: freezed == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Lead>?,
      firstPageUrl: freezed == firstPageUrl
          ? _value.firstPageUrl
          : firstPageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as int?,
      nextPageUrl: freezed == nextPageUrl
          ? _value.nextPageUrl
          : nextPageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
      perPage: freezed == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int?,
      prevPageUrl: freezed == prevPageUrl
          ? _value.prevPageUrl
          : prevPageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LeadsCopyWith<$Res> implements $LeadsCopyWith<$Res> {
  factory _$$_LeadsCopyWith(_$_Leads value, $Res Function(_$_Leads) then) =
      __$$_LeadsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? currentPage,
      List<Lead>? data,
      String? firstPageUrl,
      int? from,
      String? nextPageUrl,
      String? path,
      int? perPage,
      String? prevPageUrl,
      int? to});
}

/// @nodoc
class __$$_LeadsCopyWithImpl<$Res> extends _$LeadsCopyWithImpl<$Res, _$_Leads>
    implements _$$_LeadsCopyWith<$Res> {
  __$$_LeadsCopyWithImpl(_$_Leads _value, $Res Function(_$_Leads) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = freezed,
    Object? data = freezed,
    Object? firstPageUrl = freezed,
    Object? from = freezed,
    Object? nextPageUrl = freezed,
    Object? path = freezed,
    Object? perPage = freezed,
    Object? prevPageUrl = freezed,
    Object? to = freezed,
  }) {
    return _then(_$_Leads(
      currentPage: freezed == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Lead>?,
      firstPageUrl: freezed == firstPageUrl
          ? _value.firstPageUrl
          : firstPageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as int?,
      nextPageUrl: freezed == nextPageUrl
          ? _value.nextPageUrl
          : nextPageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
      perPage: freezed == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int?,
      prevPageUrl: freezed == prevPageUrl
          ? _value.prevPageUrl
          : prevPageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Leads implements _Leads {
  const _$_Leads(
      {this.currentPage,
      final List<Lead>? data,
      this.firstPageUrl,
      this.from,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to})
      : _data = data;

  factory _$_Leads.fromJson(Map<String, dynamic> json) =>
      _$$_LeadsFromJson(json);

  @override
  final int? currentPage;
  final List<Lead>? _data;
  @override
  List<Lead>? get data {
    final value = _data;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? firstPageUrl;
  @override
  final int? from;
  @override
  final String? nextPageUrl;
  @override
  final String? path;
  @override
  final int? perPage;
  @override
  final String? prevPageUrl;
  @override
  final int? to;

  @override
  String toString() {
    return 'Leads(currentPage: $currentPage, data: $data, firstPageUrl: $firstPageUrl, from: $from, nextPageUrl: $nextPageUrl, path: $path, perPage: $perPage, prevPageUrl: $prevPageUrl, to: $to)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Leads &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.firstPageUrl, firstPageUrl) ||
                other.firstPageUrl == firstPageUrl) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.nextPageUrl, nextPageUrl) ||
                other.nextPageUrl == nextPageUrl) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.prevPageUrl, prevPageUrl) ||
                other.prevPageUrl == prevPageUrl) &&
            (identical(other.to, to) || other.to == to));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentPage,
      const DeepCollectionEquality().hash(_data),
      firstPageUrl,
      from,
      nextPageUrl,
      path,
      perPage,
      prevPageUrl,
      to);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LeadsCopyWith<_$_Leads> get copyWith =>
      __$$_LeadsCopyWithImpl<_$_Leads>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LeadsToJson(
      this,
    );
  }
}

abstract class _Leads implements Leads {
  const factory _Leads(
      {final int? currentPage,
      final List<Lead>? data,
      final String? firstPageUrl,
      final int? from,
      final String? nextPageUrl,
      final String? path,
      final int? perPage,
      final String? prevPageUrl,
      final int? to}) = _$_Leads;

  factory _Leads.fromJson(Map<String, dynamic> json) = _$_Leads.fromJson;

  @override
  int? get currentPage;
  @override
  List<Lead>? get data;
  @override
  String? get firstPageUrl;
  @override
  int? get from;
  @override
  String? get nextPageUrl;
  @override
  String? get path;
  @override
  int? get perPage;
  @override
  String? get prevPageUrl;
  @override
  int? get to;
  @override
  @JsonKey(ignore: true)
  _$$_LeadsCopyWith<_$_Leads> get copyWith =>
      throw _privateConstructorUsedError;
}

Lead _$LeadFromJson(Map<String, dynamic> json) {
  return _Lead.fromJson(json);
}

/// @nodoc
mixin _$Lead {
  int? get id => throw _privateConstructorUsedError;
  int? get academyId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get age => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  String? get countryCode => throw _privateConstructorUsedError;
  String? get mobileNo => throw _privateConstructorUsedError;
  String? get whatsapp => throw _privateConstructorUsedError;
  int? get branchId => throw _privateConstructorUsedError;
  int? get batchId => throw _privateConstructorUsedError;
  String? get leadStatus => throw _privateConstructorUsedError;
  String? get assignedToType => throw _privateConstructorUsedError;
  int? get assignedToId => throw _privateConstructorUsedError;
  Branch? get branch => throw _privateConstructorUsedError;
  Batch? get batch => throw _privateConstructorUsedError;
  List<FollowUp>? get followUps => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeadCopyWith<Lead> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadCopyWith<$Res> {
  factory $LeadCopyWith(Lead value, $Res Function(Lead) then) =
      _$LeadCopyWithImpl<$Res, Lead>;
  @useResult
  $Res call(
      {int? id,
      int? academyId,
      String? name,
      String? age,
      String? gender,
      String? countryCode,
      String? mobileNo,
      String? whatsapp,
      int? branchId,
      int? batchId,
      String? leadStatus,
      String? assignedToType,
      int? assignedToId,
      Branch? branch,
      Batch? batch,
      List<FollowUp>? followUps});

  $BranchCopyWith<$Res>? get branch;
  $BatchCopyWith<$Res>? get batch;
}

/// @nodoc
class _$LeadCopyWithImpl<$Res, $Val extends Lead>
    implements $LeadCopyWith<$Res> {
  _$LeadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? academyId = freezed,
    Object? name = freezed,
    Object? age = freezed,
    Object? gender = freezed,
    Object? countryCode = freezed,
    Object? mobileNo = freezed,
    Object? whatsapp = freezed,
    Object? branchId = freezed,
    Object? batchId = freezed,
    Object? leadStatus = freezed,
    Object? assignedToType = freezed,
    Object? assignedToId = freezed,
    Object? branch = freezed,
    Object? batch = freezed,
    Object? followUps = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      academyId: freezed == academyId
          ? _value.academyId
          : academyId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNo: freezed == mobileNo
          ? _value.mobileNo
          : mobileNo // ignore: cast_nullable_to_non_nullable
              as String?,
      whatsapp: freezed == whatsapp
          ? _value.whatsapp
          : whatsapp // ignore: cast_nullable_to_non_nullable
              as String?,
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as int?,
      batchId: freezed == batchId
          ? _value.batchId
          : batchId // ignore: cast_nullable_to_non_nullable
              as int?,
      leadStatus: freezed == leadStatus
          ? _value.leadStatus
          : leadStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedToType: freezed == assignedToType
          ? _value.assignedToType
          : assignedToType // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedToId: freezed == assignedToId
          ? _value.assignedToId
          : assignedToId // ignore: cast_nullable_to_non_nullable
              as int?,
      branch: freezed == branch
          ? _value.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as Branch?,
      batch: freezed == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as Batch?,
      followUps: freezed == followUps
          ? _value.followUps
          : followUps // ignore: cast_nullable_to_non_nullable
              as List<FollowUp>?,
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

  @override
  @pragma('vm:prefer-inline')
  $BatchCopyWith<$Res>? get batch {
    if (_value.batch == null) {
      return null;
    }

    return $BatchCopyWith<$Res>(_value.batch!, (value) {
      return _then(_value.copyWith(batch: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_LeadCopyWith<$Res> implements $LeadCopyWith<$Res> {
  factory _$$_LeadCopyWith(_$_Lead value, $Res Function(_$_Lead) then) =
      __$$_LeadCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? academyId,
      String? name,
      String? age,
      String? gender,
      String? countryCode,
      String? mobileNo,
      String? whatsapp,
      int? branchId,
      int? batchId,
      String? leadStatus,
      String? assignedToType,
      int? assignedToId,
      Branch? branch,
      Batch? batch,
      List<FollowUp>? followUps});

  @override
  $BranchCopyWith<$Res>? get branch;
  @override
  $BatchCopyWith<$Res>? get batch;
}

/// @nodoc
class __$$_LeadCopyWithImpl<$Res> extends _$LeadCopyWithImpl<$Res, _$_Lead>
    implements _$$_LeadCopyWith<$Res> {
  __$$_LeadCopyWithImpl(_$_Lead _value, $Res Function(_$_Lead) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? academyId = freezed,
    Object? name = freezed,
    Object? age = freezed,
    Object? gender = freezed,
    Object? countryCode = freezed,
    Object? mobileNo = freezed,
    Object? whatsapp = freezed,
    Object? branchId = freezed,
    Object? batchId = freezed,
    Object? leadStatus = freezed,
    Object? assignedToType = freezed,
    Object? assignedToId = freezed,
    Object? branch = freezed,
    Object? batch = freezed,
    Object? followUps = freezed,
  }) {
    return _then(_$_Lead(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      academyId: freezed == academyId
          ? _value.academyId
          : academyId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNo: freezed == mobileNo
          ? _value.mobileNo
          : mobileNo // ignore: cast_nullable_to_non_nullable
              as String?,
      whatsapp: freezed == whatsapp
          ? _value.whatsapp
          : whatsapp // ignore: cast_nullable_to_non_nullable
              as String?,
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as int?,
      batchId: freezed == batchId
          ? _value.batchId
          : batchId // ignore: cast_nullable_to_non_nullable
              as int?,
      leadStatus: freezed == leadStatus
          ? _value.leadStatus
          : leadStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedToType: freezed == assignedToType
          ? _value.assignedToType
          : assignedToType // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedToId: freezed == assignedToId
          ? _value.assignedToId
          : assignedToId // ignore: cast_nullable_to_non_nullable
              as int?,
      branch: freezed == branch
          ? _value.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as Branch?,
      batch: freezed == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as Batch?,
      followUps: freezed == followUps
          ? _value._followUps
          : followUps // ignore: cast_nullable_to_non_nullable
              as List<FollowUp>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Lead implements _Lead {
  const _$_Lead(
      {this.id,
      this.academyId,
      this.name,
      this.age,
      this.gender,
      this.countryCode,
      this.mobileNo,
      this.whatsapp,
      this.branchId,
      this.batchId,
      this.leadStatus,
      this.assignedToType,
      this.assignedToId,
      this.branch,
      this.batch,
      final List<FollowUp>? followUps})
      : _followUps = followUps;

  factory _$_Lead.fromJson(Map<String, dynamic> json) => _$$_LeadFromJson(json);

  @override
  final int? id;
  @override
  final int? academyId;
  @override
  final String? name;
  @override
  final String? age;
  @override
  final String? gender;
  @override
  final String? countryCode;
  @override
  final String? mobileNo;
  @override
  final String? whatsapp;
  @override
  final int? branchId;
  @override
  final int? batchId;
  @override
  final String? leadStatus;
  @override
  final String? assignedToType;
  @override
  final int? assignedToId;
  @override
  final Branch? branch;
  @override
  final Batch? batch;
  final List<FollowUp>? _followUps;
  @override
  List<FollowUp>? get followUps {
    final value = _followUps;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Lead(id: $id, academyId: $academyId, name: $name, age: $age, gender: $gender, countryCode: $countryCode, mobileNo: $mobileNo, whatsapp: $whatsapp, branchId: $branchId, batchId: $batchId, leadStatus: $leadStatus, assignedToType: $assignedToType, assignedToId: $assignedToId, branch: $branch, batch: $batch, followUps: $followUps)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Lead &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.academyId, academyId) ||
                other.academyId == academyId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.mobileNo, mobileNo) ||
                other.mobileNo == mobileNo) &&
            (identical(other.whatsapp, whatsapp) ||
                other.whatsapp == whatsapp) &&
            (identical(other.branchId, branchId) ||
                other.branchId == branchId) &&
            (identical(other.batchId, batchId) || other.batchId == batchId) &&
            (identical(other.leadStatus, leadStatus) ||
                other.leadStatus == leadStatus) &&
            (identical(other.assignedToType, assignedToType) ||
                other.assignedToType == assignedToType) &&
            (identical(other.assignedToId, assignedToId) ||
                other.assignedToId == assignedToId) &&
            (identical(other.branch, branch) || other.branch == branch) &&
            (identical(other.batch, batch) || other.batch == batch) &&
            const DeepCollectionEquality()
                .equals(other._followUps, _followUps));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      academyId,
      name,
      age,
      gender,
      countryCode,
      mobileNo,
      whatsapp,
      branchId,
      batchId,
      leadStatus,
      assignedToType,
      assignedToId,
      branch,
      batch,
      const DeepCollectionEquality().hash(_followUps));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LeadCopyWith<_$_Lead> get copyWith =>
      __$$_LeadCopyWithImpl<_$_Lead>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LeadToJson(
      this,
    );
  }
}

abstract class _Lead implements Lead {
  const factory _Lead(
      {final int? id,
      final int? academyId,
      final String? name,
      final String? age,
      final String? gender,
      final String? countryCode,
      final String? mobileNo,
      final String? whatsapp,
      final int? branchId,
      final int? batchId,
      final String? leadStatus,
      final String? assignedToType,
      final int? assignedToId,
      final Branch? branch,
      final Batch? batch,
      final List<FollowUp>? followUps}) = _$_Lead;

  factory _Lead.fromJson(Map<String, dynamic> json) = _$_Lead.fromJson;

  @override
  int? get id;
  @override
  int? get academyId;
  @override
  String? get name;
  @override
  String? get age;
  @override
  String? get gender;
  @override
  String? get countryCode;
  @override
  String? get mobileNo;
  @override
  String? get whatsapp;
  @override
  int? get branchId;
  @override
  int? get batchId;
  @override
  String? get leadStatus;
  @override
  String? get assignedToType;
  @override
  int? get assignedToId;
  @override
  Branch? get branch;
  @override
  Batch? get batch;
  @override
  List<FollowUp>? get followUps;
  @override
  @JsonKey(ignore: true)
  _$$_LeadCopyWith<_$_Lead> get copyWith => throw _privateConstructorUsedError;
}

Batch _$BatchFromJson(Map<String, dynamic> json) {
  return _Batch.fromJson(json);
}

/// @nodoc
mixin _$Batch {
  int? get id => throw _privateConstructorUsedError;
  String? get batchName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BatchCopyWith<Batch> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BatchCopyWith<$Res> {
  factory $BatchCopyWith(Batch value, $Res Function(Batch) then) =
      _$BatchCopyWithImpl<$Res, Batch>;
  @useResult
  $Res call({int? id, String? batchName});
}

/// @nodoc
class _$BatchCopyWithImpl<$Res, $Val extends Batch>
    implements $BatchCopyWith<$Res> {
  _$BatchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? batchName = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      batchName: freezed == batchName
          ? _value.batchName
          : batchName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BatchCopyWith<$Res> implements $BatchCopyWith<$Res> {
  factory _$$_BatchCopyWith(_$_Batch value, $Res Function(_$_Batch) then) =
      __$$_BatchCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? batchName});
}

/// @nodoc
class __$$_BatchCopyWithImpl<$Res> extends _$BatchCopyWithImpl<$Res, _$_Batch>
    implements _$$_BatchCopyWith<$Res> {
  __$$_BatchCopyWithImpl(_$_Batch _value, $Res Function(_$_Batch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? batchName = freezed,
  }) {
    return _then(_$_Batch(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      batchName: freezed == batchName
          ? _value.batchName
          : batchName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Batch implements _Batch {
  const _$_Batch({this.id, this.batchName});

  factory _$_Batch.fromJson(Map<String, dynamic> json) =>
      _$$_BatchFromJson(json);

  @override
  final int? id;
  @override
  final String? batchName;

  @override
  String toString() {
    return 'Batch(id: $id, batchName: $batchName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Batch &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.batchName, batchName) ||
                other.batchName == batchName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, batchName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BatchCopyWith<_$_Batch> get copyWith =>
      __$$_BatchCopyWithImpl<_$_Batch>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BatchToJson(
      this,
    );
  }
}

abstract class _Batch implements Batch {
  const factory _Batch({final int? id, final String? batchName}) = _$_Batch;

  factory _Batch.fromJson(Map<String, dynamic> json) = _$_Batch.fromJson;

  @override
  int? get id;
  @override
  String? get batchName;
  @override
  @JsonKey(ignore: true)
  _$$_BatchCopyWith<_$_Batch> get copyWith =>
      throw _privateConstructorUsedError;
}

FollowUp _$FollowUpFromJson(Map<String, dynamic> json) {
  return _FollowUp.fromJson(json);
}

/// @nodoc
mixin _$FollowUp {
  int? get id => throw _privateConstructorUsedError;
  int? get leadId => throw _privateConstructorUsedError;
  String? get assignedToType => throw _privateConstructorUsedError;
  int? get assignedToId => throw _privateConstructorUsedError;
  DateTime? get followUpDate => throw _privateConstructorUsedError;
  String? get followUpTime => throw _privateConstructorUsedError;
  String? get followUpComment => throw _privateConstructorUsedError;
  String? get followUpStatus => throw _privateConstructorUsedError;
  AssignedTo? get assignedTo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FollowUpCopyWith<FollowUp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowUpCopyWith<$Res> {
  factory $FollowUpCopyWith(FollowUp value, $Res Function(FollowUp) then) =
      _$FollowUpCopyWithImpl<$Res, FollowUp>;
  @useResult
  $Res call(
      {int? id,
      int? leadId,
      String? assignedToType,
      int? assignedToId,
      DateTime? followUpDate,
      String? followUpTime,
      String? followUpComment,
      String? followUpStatus,
      AssignedTo? assignedTo});

  $AssignedToCopyWith<$Res>? get assignedTo;
}

/// @nodoc
class _$FollowUpCopyWithImpl<$Res, $Val extends FollowUp>
    implements $FollowUpCopyWith<$Res> {
  _$FollowUpCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? leadId = freezed,
    Object? assignedToType = freezed,
    Object? assignedToId = freezed,
    Object? followUpDate = freezed,
    Object? followUpTime = freezed,
    Object? followUpComment = freezed,
    Object? followUpStatus = freezed,
    Object? assignedTo = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      leadId: freezed == leadId
          ? _value.leadId
          : leadId // ignore: cast_nullable_to_non_nullable
              as int?,
      assignedToType: freezed == assignedToType
          ? _value.assignedToType
          : assignedToType // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedToId: freezed == assignedToId
          ? _value.assignedToId
          : assignedToId // ignore: cast_nullable_to_non_nullable
              as int?,
      followUpDate: freezed == followUpDate
          ? _value.followUpDate
          : followUpDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      followUpTime: freezed == followUpTime
          ? _value.followUpTime
          : followUpTime // ignore: cast_nullable_to_non_nullable
              as String?,
      followUpComment: freezed == followUpComment
          ? _value.followUpComment
          : followUpComment // ignore: cast_nullable_to_non_nullable
              as String?,
      followUpStatus: freezed == followUpStatus
          ? _value.followUpStatus
          : followUpStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedTo: freezed == assignedTo
          ? _value.assignedTo
          : assignedTo // ignore: cast_nullable_to_non_nullable
              as AssignedTo?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AssignedToCopyWith<$Res>? get assignedTo {
    if (_value.assignedTo == null) {
      return null;
    }

    return $AssignedToCopyWith<$Res>(_value.assignedTo!, (value) {
      return _then(_value.copyWith(assignedTo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FollowUpCopyWith<$Res> implements $FollowUpCopyWith<$Res> {
  factory _$$_FollowUpCopyWith(
          _$_FollowUp value, $Res Function(_$_FollowUp) then) =
      __$$_FollowUpCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? leadId,
      String? assignedToType,
      int? assignedToId,
      DateTime? followUpDate,
      String? followUpTime,
      String? followUpComment,
      String? followUpStatus,
      AssignedTo? assignedTo});

  @override
  $AssignedToCopyWith<$Res>? get assignedTo;
}

/// @nodoc
class __$$_FollowUpCopyWithImpl<$Res>
    extends _$FollowUpCopyWithImpl<$Res, _$_FollowUp>
    implements _$$_FollowUpCopyWith<$Res> {
  __$$_FollowUpCopyWithImpl(
      _$_FollowUp _value, $Res Function(_$_FollowUp) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? leadId = freezed,
    Object? assignedToType = freezed,
    Object? assignedToId = freezed,
    Object? followUpDate = freezed,
    Object? followUpTime = freezed,
    Object? followUpComment = freezed,
    Object? followUpStatus = freezed,
    Object? assignedTo = freezed,
  }) {
    return _then(_$_FollowUp(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      leadId: freezed == leadId
          ? _value.leadId
          : leadId // ignore: cast_nullable_to_non_nullable
              as int?,
      assignedToType: freezed == assignedToType
          ? _value.assignedToType
          : assignedToType // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedToId: freezed == assignedToId
          ? _value.assignedToId
          : assignedToId // ignore: cast_nullable_to_non_nullable
              as int?,
      followUpDate: freezed == followUpDate
          ? _value.followUpDate
          : followUpDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      followUpTime: freezed == followUpTime
          ? _value.followUpTime
          : followUpTime // ignore: cast_nullable_to_non_nullable
              as String?,
      followUpComment: freezed == followUpComment
          ? _value.followUpComment
          : followUpComment // ignore: cast_nullable_to_non_nullable
              as String?,
      followUpStatus: freezed == followUpStatus
          ? _value.followUpStatus
          : followUpStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedTo: freezed == assignedTo
          ? _value.assignedTo
          : assignedTo // ignore: cast_nullable_to_non_nullable
              as AssignedTo?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_FollowUp implements _FollowUp {
  const _$_FollowUp(
      {this.id,
      this.leadId,
      this.assignedToType,
      this.assignedToId,
      this.followUpDate,
      this.followUpTime,
      this.followUpComment,
      this.followUpStatus,
      this.assignedTo});

  factory _$_FollowUp.fromJson(Map<String, dynamic> json) =>
      _$$_FollowUpFromJson(json);

  @override
  final int? id;
  @override
  final int? leadId;
  @override
  final String? assignedToType;
  @override
  final int? assignedToId;
  @override
  final DateTime? followUpDate;
  @override
  final String? followUpTime;
  @override
  final String? followUpComment;
  @override
  final String? followUpStatus;
  @override
  final AssignedTo? assignedTo;

  @override
  String toString() {
    return 'FollowUp(id: $id, leadId: $leadId, assignedToType: $assignedToType, assignedToId: $assignedToId, followUpDate: $followUpDate, followUpTime: $followUpTime, followUpComment: $followUpComment, followUpStatus: $followUpStatus, assignedTo: $assignedTo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FollowUp &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.leadId, leadId) || other.leadId == leadId) &&
            (identical(other.assignedToType, assignedToType) ||
                other.assignedToType == assignedToType) &&
            (identical(other.assignedToId, assignedToId) ||
                other.assignedToId == assignedToId) &&
            (identical(other.followUpDate, followUpDate) ||
                other.followUpDate == followUpDate) &&
            (identical(other.followUpTime, followUpTime) ||
                other.followUpTime == followUpTime) &&
            (identical(other.followUpComment, followUpComment) ||
                other.followUpComment == followUpComment) &&
            (identical(other.followUpStatus, followUpStatus) ||
                other.followUpStatus == followUpStatus) &&
            (identical(other.assignedTo, assignedTo) ||
                other.assignedTo == assignedTo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      leadId,
      assignedToType,
      assignedToId,
      followUpDate,
      followUpTime,
      followUpComment,
      followUpStatus,
      assignedTo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FollowUpCopyWith<_$_FollowUp> get copyWith =>
      __$$_FollowUpCopyWithImpl<_$_FollowUp>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FollowUpToJson(
      this,
    );
  }
}

abstract class _FollowUp implements FollowUp {
  const factory _FollowUp(
      {final int? id,
      final int? leadId,
      final String? assignedToType,
      final int? assignedToId,
      final DateTime? followUpDate,
      final String? followUpTime,
      final String? followUpComment,
      final String? followUpStatus,
      final AssignedTo? assignedTo}) = _$_FollowUp;

  factory _FollowUp.fromJson(Map<String, dynamic> json) = _$_FollowUp.fromJson;

  @override
  int? get id;
  @override
  int? get leadId;
  @override
  String? get assignedToType;
  @override
  int? get assignedToId;
  @override
  DateTime? get followUpDate;
  @override
  String? get followUpTime;
  @override
  String? get followUpComment;
  @override
  String? get followUpStatus;
  @override
  AssignedTo? get assignedTo;
  @override
  @JsonKey(ignore: true)
  _$$_FollowUpCopyWith<_$_FollowUp> get copyWith =>
      throw _privateConstructorUsedError;
}

AssignedTo _$AssignedToFromJson(Map<String, dynamic> json) {
  return _AssignedTo.fromJson(json);
}

/// @nodoc
mixin _$AssignedTo {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  List<Branch>? get branches => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AssignedToCopyWith<AssignedTo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssignedToCopyWith<$Res> {
  factory $AssignedToCopyWith(
          AssignedTo value, $Res Function(AssignedTo) then) =
      _$AssignedToCopyWithImpl<$Res, AssignedTo>;
  @useResult
  $Res call({int? id, String? name, List<Branch>? branches});
}

/// @nodoc
class _$AssignedToCopyWithImpl<$Res, $Val extends AssignedTo>
    implements $AssignedToCopyWith<$Res> {
  _$AssignedToCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? branches = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      branches: freezed == branches
          ? _value.branches
          : branches // ignore: cast_nullable_to_non_nullable
              as List<Branch>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AssignedToCopyWith<$Res>
    implements $AssignedToCopyWith<$Res> {
  factory _$$_AssignedToCopyWith(
          _$_AssignedTo value, $Res Function(_$_AssignedTo) then) =
      __$$_AssignedToCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name, List<Branch>? branches});
}

/// @nodoc
class __$$_AssignedToCopyWithImpl<$Res>
    extends _$AssignedToCopyWithImpl<$Res, _$_AssignedTo>
    implements _$$_AssignedToCopyWith<$Res> {
  __$$_AssignedToCopyWithImpl(
      _$_AssignedTo _value, $Res Function(_$_AssignedTo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? branches = freezed,
  }) {
    return _then(_$_AssignedTo(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      branches: freezed == branches
          ? _value._branches
          : branches // ignore: cast_nullable_to_non_nullable
              as List<Branch>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_AssignedTo implements _AssignedTo {
  const _$_AssignedTo({this.id, this.name, final List<Branch>? branches})
      : _branches = branches;

  factory _$_AssignedTo.fromJson(Map<String, dynamic> json) =>
      _$$_AssignedToFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  final List<Branch>? _branches;
  @override
  List<Branch>? get branches {
    final value = _branches;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AssignedTo(id: $id, name: $name, branches: $branches)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AssignedTo &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._branches, _branches));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, const DeepCollectionEquality().hash(_branches));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AssignedToCopyWith<_$_AssignedTo> get copyWith =>
      __$$_AssignedToCopyWithImpl<_$_AssignedTo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AssignedToToJson(
      this,
    );
  }
}

abstract class _AssignedTo implements AssignedTo {
  const factory _AssignedTo(
      {final int? id,
      final String? name,
      final List<Branch>? branches}) = _$_AssignedTo;

  factory _AssignedTo.fromJson(Map<String, dynamic> json) =
      _$_AssignedTo.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  List<Branch>? get branches;
  @override
  @JsonKey(ignore: true)
  _$$_AssignedToCopyWith<_$_AssignedTo> get copyWith =>
      throw _privateConstructorUsedError;
}

Pivot _$PivotFromJson(Map<String, dynamic> json) {
  return _Pivot.fromJson(json);
}

/// @nodoc
mixin _$Pivot {
  int? get trainerDetailId => throw _privateConstructorUsedError;
  int? get branchId => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PivotCopyWith<Pivot> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PivotCopyWith<$Res> {
  factory $PivotCopyWith(Pivot value, $Res Function(Pivot) then) =
      _$PivotCopyWithImpl<$Res, Pivot>;
  @useResult
  $Res call(
      {int? trainerDetailId,
      int? branchId,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$PivotCopyWithImpl<$Res, $Val extends Pivot>
    implements $PivotCopyWith<$Res> {
  _$PivotCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trainerDetailId = freezed,
    Object? branchId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      trainerDetailId: freezed == trainerDetailId
          ? _value.trainerDetailId
          : trainerDetailId // ignore: cast_nullable_to_non_nullable
              as int?,
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_PivotCopyWith<$Res> implements $PivotCopyWith<$Res> {
  factory _$$_PivotCopyWith(_$_Pivot value, $Res Function(_$_Pivot) then) =
      __$$_PivotCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? trainerDetailId,
      int? branchId,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$_PivotCopyWithImpl<$Res> extends _$PivotCopyWithImpl<$Res, _$_Pivot>
    implements _$$_PivotCopyWith<$Res> {
  __$$_PivotCopyWithImpl(_$_Pivot _value, $Res Function(_$_Pivot) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trainerDetailId = freezed,
    Object? branchId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_Pivot(
      trainerDetailId: freezed == trainerDetailId
          ? _value.trainerDetailId
          : trainerDetailId // ignore: cast_nullable_to_non_nullable
              as int?,
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
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
class _$_Pivot implements _Pivot {
  const _$_Pivot(
      {this.trainerDetailId, this.branchId, this.createdAt, this.updatedAt});

  factory _$_Pivot.fromJson(Map<String, dynamic> json) =>
      _$$_PivotFromJson(json);

  @override
  final int? trainerDetailId;
  @override
  final int? branchId;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Pivot(trainerDetailId: $trainerDetailId, branchId: $branchId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Pivot &&
            (identical(other.trainerDetailId, trainerDetailId) ||
                other.trainerDetailId == trainerDetailId) &&
            (identical(other.branchId, branchId) ||
                other.branchId == branchId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, trainerDetailId, branchId, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PivotCopyWith<_$_Pivot> get copyWith =>
      __$$_PivotCopyWithImpl<_$_Pivot>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PivotToJson(
      this,
    );
  }
}

abstract class _Pivot implements Pivot {
  const factory _Pivot(
      {final int? trainerDetailId,
      final int? branchId,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$_Pivot;

  factory _Pivot.fromJson(Map<String, dynamic> json) = _$_Pivot.fromJson;

  @override
  int? get trainerDetailId;
  @override
  int? get branchId;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_PivotCopyWith<_$_Pivot> get copyWith =>
      throw _privateConstructorUsedError;
}
