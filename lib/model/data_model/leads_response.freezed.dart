// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
  dynamic get nextPageUrl => throw _privateConstructorUsedError;
  String? get path => throw _privateConstructorUsedError;
  int? get perPage => throw _privateConstructorUsedError;
  dynamic get prevPageUrl => throw _privateConstructorUsedError;
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
      dynamic nextPageUrl,
      String? path,
      int? perPage,
      dynamic prevPageUrl,
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
              as dynamic,
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
              as dynamic,
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
      dynamic nextPageUrl,
      String? path,
      int? perPage,
      dynamic prevPageUrl,
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
              as dynamic,
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
              as dynamic,
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
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? firstPageUrl;
  @override
  final int? from;
  @override
  final dynamic nextPageUrl;
  @override
  final String? path;
  @override
  final int? perPage;
  @override
  final dynamic prevPageUrl;
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
            const DeepCollectionEquality()
                .equals(other.nextPageUrl, nextPageUrl) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            const DeepCollectionEquality()
                .equals(other.prevPageUrl, prevPageUrl) &&
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
      const DeepCollectionEquality().hash(nextPageUrl),
      path,
      perPage,
      const DeepCollectionEquality().hash(prevPageUrl),
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
      final dynamic nextPageUrl,
      final String? path,
      final int? perPage,
      final dynamic prevPageUrl,
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
  dynamic get nextPageUrl;
  @override
  String? get path;
  @override
  int? get perPage;
  @override
  dynamic get prevPageUrl;
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
  String? get profilePic => throw _privateConstructorUsedError;
  String? get countryCode => throw _privateConstructorUsedError;
  String? get mobileNo => throw _privateConstructorUsedError;
  dynamic get whatsapp => throw _privateConstructorUsedError;
  int? get branchId => throw _privateConstructorUsedError;
  int? get batchId => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get leadStatus => throw _privateConstructorUsedError;
  String? get assignedToType => throw _privateConstructorUsedError;
  int? get assignedToId => throw _privateConstructorUsedError;
  DateTime? get addedOn => throw _privateConstructorUsedError;
  DatumBranch? get branch => throw _privateConstructorUsedError;
  Batch? get batch => throw _privateConstructorUsedError;
  AssignedTo? get assignedTo => throw _privateConstructorUsedError;
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
      String? profilePic,
      String? countryCode,
      String? mobileNo,
      dynamic whatsapp,
      int? branchId,
      int? batchId,
      String? email,
      String? leadStatus,
      String? assignedToType,
      int? assignedToId,
      DateTime? addedOn,
      DatumBranch? branch,
      Batch? batch,
      AssignedTo? assignedTo,
      List<FollowUp>? followUps});

  $DatumBranchCopyWith<$Res>? get branch;
  $BatchCopyWith<$Res>? get batch;
  $AssignedToCopyWith<$Res>? get assignedTo;
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
    Object? profilePic = freezed,
    Object? countryCode = freezed,
    Object? mobileNo = freezed,
    Object? whatsapp = freezed,
    Object? branchId = freezed,
    Object? batchId = freezed,
    Object? email = freezed,
    Object? leadStatus = freezed,
    Object? assignedToType = freezed,
    Object? assignedToId = freezed,
    Object? addedOn = freezed,
    Object? branch = freezed,
    Object? batch = freezed,
    Object? assignedTo = freezed,
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
      profilePic: freezed == profilePic
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
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
              as dynamic,
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as int?,
      batchId: freezed == batchId
          ? _value.batchId
          : batchId // ignore: cast_nullable_to_non_nullable
              as int?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
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
      addedOn: freezed == addedOn
          ? _value.addedOn
          : addedOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      branch: freezed == branch
          ? _value.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as DatumBranch?,
      batch: freezed == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as Batch?,
      assignedTo: freezed == assignedTo
          ? _value.assignedTo
          : assignedTo // ignore: cast_nullable_to_non_nullable
              as AssignedTo?,
      followUps: freezed == followUps
          ? _value.followUps
          : followUps // ignore: cast_nullable_to_non_nullable
              as List<FollowUp>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DatumBranchCopyWith<$Res>? get branch {
    if (_value.branch == null) {
      return null;
    }

    return $DatumBranchCopyWith<$Res>(_value.branch!, (value) {
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
      String? profilePic,
      String? countryCode,
      String? mobileNo,
      dynamic whatsapp,
      int? branchId,
      int? batchId,
      String? email,
      String? leadStatus,
      String? assignedToType,
      int? assignedToId,
      DateTime? addedOn,
      DatumBranch? branch,
      Batch? batch,
      AssignedTo? assignedTo,
      List<FollowUp>? followUps});

  @override
  $DatumBranchCopyWith<$Res>? get branch;
  @override
  $BatchCopyWith<$Res>? get batch;
  @override
  $AssignedToCopyWith<$Res>? get assignedTo;
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
    Object? profilePic = freezed,
    Object? countryCode = freezed,
    Object? mobileNo = freezed,
    Object? whatsapp = freezed,
    Object? branchId = freezed,
    Object? batchId = freezed,
    Object? email = freezed,
    Object? leadStatus = freezed,
    Object? assignedToType = freezed,
    Object? assignedToId = freezed,
    Object? addedOn = freezed,
    Object? branch = freezed,
    Object? batch = freezed,
    Object? assignedTo = freezed,
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
      profilePic: freezed == profilePic
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
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
              as dynamic,
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as int?,
      batchId: freezed == batchId
          ? _value.batchId
          : batchId // ignore: cast_nullable_to_non_nullable
              as int?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
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
      addedOn: freezed == addedOn
          ? _value.addedOn
          : addedOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      branch: freezed == branch
          ? _value.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as DatumBranch?,
      batch: freezed == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as Batch?,
      assignedTo: freezed == assignedTo
          ? _value.assignedTo
          : assignedTo // ignore: cast_nullable_to_non_nullable
              as AssignedTo?,
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
      this.profilePic,
      this.countryCode,
      this.mobileNo,
      this.whatsapp,
      this.branchId,
      this.batchId,
      this.email,
      this.leadStatus,
      this.assignedToType,
      this.assignedToId,
      this.addedOn,
      this.branch,
      this.batch,
      this.assignedTo,
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
  final String? profilePic;
  @override
  final String? countryCode;
  @override
  final String? mobileNo;
  @override
  final dynamic whatsapp;
  @override
  final int? branchId;
  @override
  final int? batchId;
  @override
  final String? email;
  @override
  final String? leadStatus;
  @override
  final String? assignedToType;
  @override
  final int? assignedToId;
  @override
  final DateTime? addedOn;
  @override
  final DatumBranch? branch;
  @override
  final Batch? batch;
  @override
  final AssignedTo? assignedTo;
  final List<FollowUp>? _followUps;
  @override
  List<FollowUp>? get followUps {
    final value = _followUps;
    if (value == null) return null;
    if (_followUps is EqualUnmodifiableListView) return _followUps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Lead(id: $id, academyId: $academyId, name: $name, age: $age, gender: $gender, profilePic: $profilePic, countryCode: $countryCode, mobileNo: $mobileNo, whatsapp: $whatsapp, branchId: $branchId, batchId: $batchId, email: $email, leadStatus: $leadStatus, assignedToType: $assignedToType, assignedToId: $assignedToId, addedOn: $addedOn, branch: $branch, batch: $batch, assignedTo: $assignedTo, followUps: $followUps)';
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
            (identical(other.profilePic, profilePic) ||
                other.profilePic == profilePic) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.mobileNo, mobileNo) ||
                other.mobileNo == mobileNo) &&
            const DeepCollectionEquality().equals(other.whatsapp, whatsapp) &&
            (identical(other.branchId, branchId) ||
                other.branchId == branchId) &&
            (identical(other.batchId, batchId) || other.batchId == batchId) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.leadStatus, leadStatus) ||
                other.leadStatus == leadStatus) &&
            (identical(other.assignedToType, assignedToType) ||
                other.assignedToType == assignedToType) &&
            (identical(other.assignedToId, assignedToId) ||
                other.assignedToId == assignedToId) &&
            (identical(other.addedOn, addedOn) || other.addedOn == addedOn) &&
            (identical(other.branch, branch) || other.branch == branch) &&
            (identical(other.batch, batch) || other.batch == batch) &&
            (identical(other.assignedTo, assignedTo) ||
                other.assignedTo == assignedTo) &&
            const DeepCollectionEquality()
                .equals(other._followUps, _followUps));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        academyId,
        name,
        age,
        gender,
        profilePic,
        countryCode,
        mobileNo,
        const DeepCollectionEquality().hash(whatsapp),
        branchId,
        batchId,
        email,
        leadStatus,
        assignedToType,
        assignedToId,
        addedOn,
        branch,
        batch,
        assignedTo,
        const DeepCollectionEquality().hash(_followUps)
      ]);

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
      final String? profilePic,
      final String? countryCode,
      final String? mobileNo,
      final dynamic whatsapp,
      final int? branchId,
      final int? batchId,
      final String? email,
      final String? leadStatus,
      final String? assignedToType,
      final int? assignedToId,
      final DateTime? addedOn,
      final DatumBranch? branch,
      final Batch? batch,
      final AssignedTo? assignedTo,
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
  String? get profilePic;
  @override
  String? get countryCode;
  @override
  String? get mobileNo;
  @override
  dynamic get whatsapp;
  @override
  int? get branchId;
  @override
  int? get batchId;
  @override
  String? get email;
  @override
  String? get leadStatus;
  @override
  String? get assignedToType;
  @override
  int? get assignedToId;
  @override
  DateTime? get addedOn;
  @override
  DatumBranch? get branch;
  @override
  Batch? get batch;
  @override
  AssignedTo? get assignedTo;
  @override
  List<FollowUp>? get followUps;
  @override
  @JsonKey(ignore: true)
  _$$_LeadCopyWith<_$_Lead> get copyWith => throw _privateConstructorUsedError;
}

AssignedTo _$AssignedToFromJson(Map<String, dynamic> json) {
  return _AssignedTo.fromJson(json);
}

/// @nodoc
mixin _$AssignedTo {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  List<BranchElement>? get branches => throw _privateConstructorUsedError;

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
  $Res call({int? id, String? name, List<BranchElement>? branches});
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
              as List<BranchElement>?,
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
  $Res call({int? id, String? name, List<BranchElement>? branches});
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
              as List<BranchElement>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_AssignedTo implements _AssignedTo {
  const _$_AssignedTo({this.id, this.name, final List<BranchElement>? branches})
      : _branches = branches;

  factory _$_AssignedTo.fromJson(Map<String, dynamic> json) =>
      _$$_AssignedToFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  final List<BranchElement>? _branches;
  @override
  List<BranchElement>? get branches {
    final value = _branches;
    if (value == null) return null;
    if (_branches is EqualUnmodifiableListView) return _branches;
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
      final List<BranchElement>? branches}) = _$_AssignedTo;

  factory _AssignedTo.fromJson(Map<String, dynamic> json) =
      _$_AssignedTo.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  List<BranchElement>? get branches;
  @override
  @JsonKey(ignore: true)
  _$$_AssignedToCopyWith<_$_AssignedTo> get copyWith =>
      throw _privateConstructorUsedError;
}

BranchElement _$BranchElementFromJson(Map<String, dynamic> json) {
  return _BranchElement.fromJson(json);
}

/// @nodoc
mixin _$BranchElement {
  int? get id => throw _privateConstructorUsedError;
  String? get branchName => throw _privateConstructorUsedError;
  int? get academyId => throw _privateConstructorUsedError;
  int? get countryId => throw _privateConstructorUsedError;
  dynamic get managerDetailId => throw _privateConstructorUsedError;
  int? get stateId => throw _privateConstructorUsedError;
  int? get districtId => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  int? get pincode => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  int? get isActive => throw _privateConstructorUsedError;
  Pivot? get pivot => throw _privateConstructorUsedError;
  Country? get country => throw _privateConstructorUsedError;
  StateDetail? get state => throw _privateConstructorUsedError;
  District? get district => throw _privateConstructorUsedError;
  Timezone? get timezone => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BranchElementCopyWith<BranchElement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BranchElementCopyWith<$Res> {
  factory $BranchElementCopyWith(
          BranchElement value, $Res Function(BranchElement) then) =
      _$BranchElementCopyWithImpl<$Res, BranchElement>;
  @useResult
  $Res call(
      {int? id,
      String? branchName,
      int? academyId,
      int? countryId,
      dynamic managerDetailId,
      int? stateId,
      int? districtId,
      String? address,
      int? pincode,
      String? currency,
      int? isActive,
      Pivot? pivot,
      Country? country,
      StateDetail? state,
      District? district,
      Timezone? timezone});

  $PivotCopyWith<$Res>? get pivot;
  $CountryCopyWith<$Res>? get country;
  $StateDetailCopyWith<$Res>? get state;
  $DistrictCopyWith<$Res>? get district;
  $TimezoneCopyWith<$Res>? get timezone;
}

/// @nodoc
class _$BranchElementCopyWithImpl<$Res, $Val extends BranchElement>
    implements $BranchElementCopyWith<$Res> {
  _$BranchElementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? branchName = freezed,
    Object? academyId = freezed,
    Object? countryId = freezed,
    Object? managerDetailId = freezed,
    Object? stateId = freezed,
    Object? districtId = freezed,
    Object? address = freezed,
    Object? pincode = freezed,
    Object? currency = freezed,
    Object? isActive = freezed,
    Object? pivot = freezed,
    Object? country = freezed,
    Object? state = freezed,
    Object? district = freezed,
    Object? timezone = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
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
      managerDetailId: freezed == managerDetailId
          ? _value.managerDetailId
          : managerDetailId // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
      pivot: freezed == pivot
          ? _value.pivot
          : pivot // ignore: cast_nullable_to_non_nullable
              as Pivot?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as Country?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as StateDetail?,
      district: freezed == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as District?,
      timezone: freezed == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as Timezone?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PivotCopyWith<$Res>? get pivot {
    if (_value.pivot == null) {
      return null;
    }

    return $PivotCopyWith<$Res>(_value.pivot!, (value) {
      return _then(_value.copyWith(pivot: value) as $Val);
    });
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
  $StateDetailCopyWith<$Res>? get state {
    if (_value.state == null) {
      return null;
    }

    return $StateDetailCopyWith<$Res>(_value.state!, (value) {
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
  $TimezoneCopyWith<$Res>? get timezone {
    if (_value.timezone == null) {
      return null;
    }

    return $TimezoneCopyWith<$Res>(_value.timezone!, (value) {
      return _then(_value.copyWith(timezone: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_BranchElementCopyWith<$Res>
    implements $BranchElementCopyWith<$Res> {
  factory _$$_BranchElementCopyWith(
          _$_BranchElement value, $Res Function(_$_BranchElement) then) =
      __$$_BranchElementCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? branchName,
      int? academyId,
      int? countryId,
      dynamic managerDetailId,
      int? stateId,
      int? districtId,
      String? address,
      int? pincode,
      String? currency,
      int? isActive,
      Pivot? pivot,
      Country? country,
      StateDetail? state,
      District? district,
      Timezone? timezone});

  @override
  $PivotCopyWith<$Res>? get pivot;
  @override
  $CountryCopyWith<$Res>? get country;
  @override
  $StateDetailCopyWith<$Res>? get state;
  @override
  $DistrictCopyWith<$Res>? get district;
  @override
  $TimezoneCopyWith<$Res>? get timezone;
}

/// @nodoc
class __$$_BranchElementCopyWithImpl<$Res>
    extends _$BranchElementCopyWithImpl<$Res, _$_BranchElement>
    implements _$$_BranchElementCopyWith<$Res> {
  __$$_BranchElementCopyWithImpl(
      _$_BranchElement _value, $Res Function(_$_BranchElement) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? branchName = freezed,
    Object? academyId = freezed,
    Object? countryId = freezed,
    Object? managerDetailId = freezed,
    Object? stateId = freezed,
    Object? districtId = freezed,
    Object? address = freezed,
    Object? pincode = freezed,
    Object? currency = freezed,
    Object? isActive = freezed,
    Object? pivot = freezed,
    Object? country = freezed,
    Object? state = freezed,
    Object? district = freezed,
    Object? timezone = freezed,
  }) {
    return _then(_$_BranchElement(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
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
      managerDetailId: freezed == managerDetailId
          ? _value.managerDetailId
          : managerDetailId // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
      pivot: freezed == pivot
          ? _value.pivot
          : pivot // ignore: cast_nullable_to_non_nullable
              as Pivot?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as Country?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as StateDetail?,
      district: freezed == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as District?,
      timezone: freezed == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as Timezone?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_BranchElement implements _BranchElement {
  const _$_BranchElement(
      {this.id,
      this.branchName,
      this.academyId,
      this.countryId,
      this.managerDetailId,
      this.stateId,
      this.districtId,
      this.address,
      this.pincode,
      this.currency,
      this.isActive,
      this.pivot,
      this.country,
      this.state,
      this.district,
      this.timezone});

  factory _$_BranchElement.fromJson(Map<String, dynamic> json) =>
      _$$_BranchElementFromJson(json);

  @override
  final int? id;
  @override
  final String? branchName;
  @override
  final int? academyId;
  @override
  final int? countryId;
  @override
  final dynamic managerDetailId;
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
  final Pivot? pivot;
  @override
  final Country? country;
  @override
  final StateDetail? state;
  @override
  final District? district;
  @override
  final Timezone? timezone;

  @override
  String toString() {
    return 'BranchElement(id: $id, branchName: $branchName, academyId: $academyId, countryId: $countryId, managerDetailId: $managerDetailId, stateId: $stateId, districtId: $districtId, address: $address, pincode: $pincode, currency: $currency, isActive: $isActive, pivot: $pivot, country: $country, state: $state, district: $district, timezone: $timezone)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BranchElement &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.branchName, branchName) ||
                other.branchName == branchName) &&
            (identical(other.academyId, academyId) ||
                other.academyId == academyId) &&
            (identical(other.countryId, countryId) ||
                other.countryId == countryId) &&
            const DeepCollectionEquality()
                .equals(other.managerDetailId, managerDetailId) &&
            (identical(other.stateId, stateId) || other.stateId == stateId) &&
            (identical(other.districtId, districtId) ||
                other.districtId == districtId) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.pincode, pincode) || other.pincode == pincode) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.pivot, pivot) || other.pivot == pivot) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.district, district) ||
                other.district == district) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      branchName,
      academyId,
      countryId,
      const DeepCollectionEquality().hash(managerDetailId),
      stateId,
      districtId,
      address,
      pincode,
      currency,
      isActive,
      pivot,
      country,
      state,
      district,
      timezone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BranchElementCopyWith<_$_BranchElement> get copyWith =>
      __$$_BranchElementCopyWithImpl<_$_BranchElement>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BranchElementToJson(
      this,
    );
  }
}

abstract class _BranchElement implements BranchElement {
  const factory _BranchElement(
      {final int? id,
      final String? branchName,
      final int? academyId,
      final int? countryId,
      final dynamic managerDetailId,
      final int? stateId,
      final int? districtId,
      final String? address,
      final int? pincode,
      final String? currency,
      final int? isActive,
      final Pivot? pivot,
      final Country? country,
      final StateDetail? state,
      final District? district,
      final Timezone? timezone}) = _$_BranchElement;

  factory _BranchElement.fromJson(Map<String, dynamic> json) =
      _$_BranchElement.fromJson;

  @override
  int? get id;
  @override
  String? get branchName;
  @override
  int? get academyId;
  @override
  int? get countryId;
  @override
  dynamic get managerDetailId;
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
  Pivot? get pivot;
  @override
  Country? get country;
  @override
  StateDetail? get state;
  @override
  District? get district;
  @override
  Timezone? get timezone;
  @override
  @JsonKey(ignore: true)
  _$$_BranchElementCopyWith<_$_BranchElement> get copyWith =>
      throw _privateConstructorUsedError;
}

Country _$CountryFromJson(Map<String, dynamic> json) {
  return _Country.fromJson(json);
}

/// @nodoc
mixin _$Country {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  String? get currencySymbol => throw _privateConstructorUsedError;
  String? get currencyCode => throw _privateConstructorUsedError;
  String? get timezone => throw _privateConstructorUsedError;
  String? get currencySubUnit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CountryCopyWith<Country> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryCopyWith<$Res> {
  factory $CountryCopyWith(Country value, $Res Function(Country) then) =
      _$CountryCopyWithImpl<$Res, Country>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? currency,
      String? currencySymbol,
      String? currencyCode,
      String? timezone,
      String? currencySubUnit});
}

/// @nodoc
class _$CountryCopyWithImpl<$Res, $Val extends Country>
    implements $CountryCopyWith<$Res> {
  _$CountryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? currency = freezed,
    Object? currencySymbol = freezed,
    Object? currencyCode = freezed,
    Object? timezone = freezed,
    Object? currencySubUnit = freezed,
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
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      currencySymbol: freezed == currencySymbol
          ? _value.currencySymbol
          : currencySymbol // ignore: cast_nullable_to_non_nullable
              as String?,
      currencyCode: freezed == currencyCode
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String?,
      timezone: freezed == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
      currencySubUnit: freezed == currencySubUnit
          ? _value.currencySubUnit
          : currencySubUnit // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CountryCopyWith<$Res> implements $CountryCopyWith<$Res> {
  factory _$$_CountryCopyWith(
          _$_Country value, $Res Function(_$_Country) then) =
      __$$_CountryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? currency,
      String? currencySymbol,
      String? currencyCode,
      String? timezone,
      String? currencySubUnit});
}

/// @nodoc
class __$$_CountryCopyWithImpl<$Res>
    extends _$CountryCopyWithImpl<$Res, _$_Country>
    implements _$$_CountryCopyWith<$Res> {
  __$$_CountryCopyWithImpl(_$_Country _value, $Res Function(_$_Country) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? currency = freezed,
    Object? currencySymbol = freezed,
    Object? currencyCode = freezed,
    Object? timezone = freezed,
    Object? currencySubUnit = freezed,
  }) {
    return _then(_$_Country(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      currencySymbol: freezed == currencySymbol
          ? _value.currencySymbol
          : currencySymbol // ignore: cast_nullable_to_non_nullable
              as String?,
      currencyCode: freezed == currencyCode
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String?,
      timezone: freezed == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
      currencySubUnit: freezed == currencySubUnit
          ? _value.currencySubUnit
          : currencySubUnit // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Country implements _Country {
  const _$_Country(
      {this.id,
      this.name,
      this.currency,
      this.currencySymbol,
      this.currencyCode,
      this.timezone,
      this.currencySubUnit});

  factory _$_Country.fromJson(Map<String, dynamic> json) =>
      _$$_CountryFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? currency;
  @override
  final String? currencySymbol;
  @override
  final String? currencyCode;
  @override
  final String? timezone;
  @override
  final String? currencySubUnit;

  @override
  String toString() {
    return 'Country(id: $id, name: $name, currency: $currency, currencySymbol: $currencySymbol, currencyCode: $currencyCode, timezone: $timezone, currencySubUnit: $currencySubUnit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Country &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.currencySymbol, currencySymbol) ||
                other.currencySymbol == currencySymbol) &&
            (identical(other.currencyCode, currencyCode) ||
                other.currencyCode == currencyCode) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            (identical(other.currencySubUnit, currencySubUnit) ||
                other.currencySubUnit == currencySubUnit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, currency,
      currencySymbol, currencyCode, timezone, currencySubUnit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CountryCopyWith<_$_Country> get copyWith =>
      __$$_CountryCopyWithImpl<_$_Country>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CountryToJson(
      this,
    );
  }
}

abstract class _Country implements Country {
  const factory _Country(
      {final int? id,
      final String? name,
      final String? currency,
      final String? currencySymbol,
      final String? currencyCode,
      final String? timezone,
      final String? currencySubUnit}) = _$_Country;

  factory _Country.fromJson(Map<String, dynamic> json) = _$_Country.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get currency;
  @override
  String? get currencySymbol;
  @override
  String? get currencyCode;
  @override
  String? get timezone;
  @override
  String? get currencySubUnit;
  @override
  @JsonKey(ignore: true)
  _$$_CountryCopyWith<_$_Country> get copyWith =>
      throw _privateConstructorUsedError;
}

District _$DistrictFromJson(Map<String, dynamic> json) {
  return _District.fromJson(json);
}

/// @nodoc
mixin _$District {
  int? get id => throw _privateConstructorUsedError;
  String? get districtName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DistrictCopyWith<District> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DistrictCopyWith<$Res> {
  factory $DistrictCopyWith(District value, $Res Function(District) then) =
      _$DistrictCopyWithImpl<$Res, District>;
  @useResult
  $Res call({int? id, String? districtName});
}

/// @nodoc
class _$DistrictCopyWithImpl<$Res, $Val extends District>
    implements $DistrictCopyWith<$Res> {
  _$DistrictCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? districtName = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      districtName: freezed == districtName
          ? _value.districtName
          : districtName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DistrictCopyWith<$Res> implements $DistrictCopyWith<$Res> {
  factory _$$_DistrictCopyWith(
          _$_District value, $Res Function(_$_District) then) =
      __$$_DistrictCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? districtName});
}

/// @nodoc
class __$$_DistrictCopyWithImpl<$Res>
    extends _$DistrictCopyWithImpl<$Res, _$_District>
    implements _$$_DistrictCopyWith<$Res> {
  __$$_DistrictCopyWithImpl(
      _$_District _value, $Res Function(_$_District) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? districtName = freezed,
  }) {
    return _then(_$_District(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      districtName: freezed == districtName
          ? _value.districtName
          : districtName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_District implements _District {
  const _$_District({this.id, this.districtName});

  factory _$_District.fromJson(Map<String, dynamic> json) =>
      _$$_DistrictFromJson(json);

  @override
  final int? id;
  @override
  final String? districtName;

  @override
  String toString() {
    return 'District(id: $id, districtName: $districtName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_District &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.districtName, districtName) ||
                other.districtName == districtName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, districtName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DistrictCopyWith<_$_District> get copyWith =>
      __$$_DistrictCopyWithImpl<_$_District>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DistrictToJson(
      this,
    );
  }
}

abstract class _District implements District {
  const factory _District({final int? id, final String? districtName}) =
      _$_District;

  factory _District.fromJson(Map<String, dynamic> json) = _$_District.fromJson;

  @override
  int? get id;
  @override
  String? get districtName;
  @override
  @JsonKey(ignore: true)
  _$$_DistrictCopyWith<_$_District> get copyWith =>
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

StateDetail _$StateDetailFromJson(Map<String, dynamic> json) {
  return _StateDetail.fromJson(json);
}

/// @nodoc
mixin _$StateDetail {
  int? get id => throw _privateConstructorUsedError;
  String? get stateName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StateDetailCopyWith<StateDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StateDetailCopyWith<$Res> {
  factory $StateDetailCopyWith(
          StateDetail value, $Res Function(StateDetail) then) =
      _$StateDetailCopyWithImpl<$Res, StateDetail>;
  @useResult
  $Res call({int? id, String? stateName});
}

/// @nodoc
class _$StateDetailCopyWithImpl<$Res, $Val extends StateDetail>
    implements $StateDetailCopyWith<$Res> {
  _$StateDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? stateName = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      stateName: freezed == stateName
          ? _value.stateName
          : stateName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StateDetailCopyWith<$Res>
    implements $StateDetailCopyWith<$Res> {
  factory _$$_StateDetailCopyWith(
          _$_StateDetail value, $Res Function(_$_StateDetail) then) =
      __$$_StateDetailCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? stateName});
}

/// @nodoc
class __$$_StateDetailCopyWithImpl<$Res>
    extends _$StateDetailCopyWithImpl<$Res, _$_StateDetail>
    implements _$$_StateDetailCopyWith<$Res> {
  __$$_StateDetailCopyWithImpl(
      _$_StateDetail _value, $Res Function(_$_StateDetail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? stateName = freezed,
  }) {
    return _then(_$_StateDetail(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      stateName: freezed == stateName
          ? _value.stateName
          : stateName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_StateDetail implements _StateDetail {
  const _$_StateDetail({this.id, this.stateName});

  factory _$_StateDetail.fromJson(Map<String, dynamic> json) =>
      _$$_StateDetailFromJson(json);

  @override
  final int? id;
  @override
  final String? stateName;

  @override
  String toString() {
    return 'StateDetail(id: $id, stateName: $stateName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StateDetail &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.stateName, stateName) ||
                other.stateName == stateName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, stateName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StateDetailCopyWith<_$_StateDetail> get copyWith =>
      __$$_StateDetailCopyWithImpl<_$_StateDetail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StateDetailToJson(
      this,
    );
  }
}

abstract class _StateDetail implements StateDetail {
  const factory _StateDetail({final int? id, final String? stateName}) =
      _$_StateDetail;

  factory _StateDetail.fromJson(Map<String, dynamic> json) =
      _$_StateDetail.fromJson;

  @override
  int? get id;
  @override
  String? get stateName;
  @override
  @JsonKey(ignore: true)
  _$$_StateDetailCopyWith<_$_StateDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

Timezone _$TimezoneFromJson(Map<String, dynamic> json) {
  return _Timezone.fromJson(json);
}

/// @nodoc
mixin _$Timezone {
  int? get id => throw _privateConstructorUsedError;
  String? get timezone => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimezoneCopyWith<Timezone> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimezoneCopyWith<$Res> {
  factory $TimezoneCopyWith(Timezone value, $Res Function(Timezone) then) =
      _$TimezoneCopyWithImpl<$Res, Timezone>;
  @useResult
  $Res call({int? id, String? timezone});
}

/// @nodoc
class _$TimezoneCopyWithImpl<$Res, $Val extends Timezone>
    implements $TimezoneCopyWith<$Res> {
  _$TimezoneCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? timezone = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      timezone: freezed == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TimezoneCopyWith<$Res> implements $TimezoneCopyWith<$Res> {
  factory _$$_TimezoneCopyWith(
          _$_Timezone value, $Res Function(_$_Timezone) then) =
      __$$_TimezoneCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? timezone});
}

/// @nodoc
class __$$_TimezoneCopyWithImpl<$Res>
    extends _$TimezoneCopyWithImpl<$Res, _$_Timezone>
    implements _$$_TimezoneCopyWith<$Res> {
  __$$_TimezoneCopyWithImpl(
      _$_Timezone _value, $Res Function(_$_Timezone) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? timezone = freezed,
  }) {
    return _then(_$_Timezone(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      timezone: freezed == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Timezone implements _Timezone {
  const _$_Timezone({this.id, this.timezone});

  factory _$_Timezone.fromJson(Map<String, dynamic> json) =>
      _$$_TimezoneFromJson(json);

  @override
  final int? id;
  @override
  final String? timezone;

  @override
  String toString() {
    return 'Timezone(id: $id, timezone: $timezone)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Timezone &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, timezone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TimezoneCopyWith<_$_Timezone> get copyWith =>
      __$$_TimezoneCopyWithImpl<_$_Timezone>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TimezoneToJson(
      this,
    );
  }
}

abstract class _Timezone implements Timezone {
  const factory _Timezone({final int? id, final String? timezone}) =
      _$_Timezone;

  factory _Timezone.fromJson(Map<String, dynamic> json) = _$_Timezone.fromJson;

  @override
  int? get id;
  @override
  String? get timezone;
  @override
  @JsonKey(ignore: true)
  _$$_TimezoneCopyWith<_$_Timezone> get copyWith =>
      throw _privateConstructorUsedError;
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

DatumBranch _$DatumBranchFromJson(Map<String, dynamic> json) {
  return _DatumBranch.fromJson(json);
}

/// @nodoc
mixin _$DatumBranch {
  int? get id => throw _privateConstructorUsedError;
  String? get branchName => throw _privateConstructorUsedError;
  int? get stateId => throw _privateConstructorUsedError;
  int? get districtId => throw _privateConstructorUsedError;
  StateDetail? get state => throw _privateConstructorUsedError;
  District? get district => throw _privateConstructorUsedError;
  dynamic get timezone => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DatumBranchCopyWith<DatumBranch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DatumBranchCopyWith<$Res> {
  factory $DatumBranchCopyWith(
          DatumBranch value, $Res Function(DatumBranch) then) =
      _$DatumBranchCopyWithImpl<$Res, DatumBranch>;
  @useResult
  $Res call(
      {int? id,
      String? branchName,
      int? stateId,
      int? districtId,
      StateDetail? state,
      District? district,
      dynamic timezone});

  $StateDetailCopyWith<$Res>? get state;
  $DistrictCopyWith<$Res>? get district;
}

/// @nodoc
class _$DatumBranchCopyWithImpl<$Res, $Val extends DatumBranch>
    implements $DatumBranchCopyWith<$Res> {
  _$DatumBranchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? branchName = freezed,
    Object? stateId = freezed,
    Object? districtId = freezed,
    Object? state = freezed,
    Object? district = freezed,
    Object? timezone = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      branchName: freezed == branchName
          ? _value.branchName
          : branchName // ignore: cast_nullable_to_non_nullable
              as String?,
      stateId: freezed == stateId
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as int?,
      districtId: freezed == districtId
          ? _value.districtId
          : districtId // ignore: cast_nullable_to_non_nullable
              as int?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as StateDetail?,
      district: freezed == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as District?,
      timezone: freezed == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StateDetailCopyWith<$Res>? get state {
    if (_value.state == null) {
      return null;
    }

    return $StateDetailCopyWith<$Res>(_value.state!, (value) {
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
}

/// @nodoc
abstract class _$$_DatumBranchCopyWith<$Res>
    implements $DatumBranchCopyWith<$Res> {
  factory _$$_DatumBranchCopyWith(
          _$_DatumBranch value, $Res Function(_$_DatumBranch) then) =
      __$$_DatumBranchCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? branchName,
      int? stateId,
      int? districtId,
      StateDetail? state,
      District? district,
      dynamic timezone});

  @override
  $StateDetailCopyWith<$Res>? get state;
  @override
  $DistrictCopyWith<$Res>? get district;
}

/// @nodoc
class __$$_DatumBranchCopyWithImpl<$Res>
    extends _$DatumBranchCopyWithImpl<$Res, _$_DatumBranch>
    implements _$$_DatumBranchCopyWith<$Res> {
  __$$_DatumBranchCopyWithImpl(
      _$_DatumBranch _value, $Res Function(_$_DatumBranch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? branchName = freezed,
    Object? stateId = freezed,
    Object? districtId = freezed,
    Object? state = freezed,
    Object? district = freezed,
    Object? timezone = freezed,
  }) {
    return _then(_$_DatumBranch(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      branchName: freezed == branchName
          ? _value.branchName
          : branchName // ignore: cast_nullable_to_non_nullable
              as String?,
      stateId: freezed == stateId
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as int?,
      districtId: freezed == districtId
          ? _value.districtId
          : districtId // ignore: cast_nullable_to_non_nullable
              as int?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as StateDetail?,
      district: freezed == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as District?,
      timezone: freezed == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_DatumBranch implements _DatumBranch {
  const _$_DatumBranch(
      {this.id,
      this.branchName,
      this.stateId,
      this.districtId,
      this.state,
      this.district,
      this.timezone});

  factory _$_DatumBranch.fromJson(Map<String, dynamic> json) =>
      _$$_DatumBranchFromJson(json);

  @override
  final int? id;
  @override
  final String? branchName;
  @override
  final int? stateId;
  @override
  final int? districtId;
  @override
  final StateDetail? state;
  @override
  final District? district;
  @override
  final dynamic timezone;

  @override
  String toString() {
    return 'DatumBranch(id: $id, branchName: $branchName, stateId: $stateId, districtId: $districtId, state: $state, district: $district, timezone: $timezone)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DatumBranch &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.branchName, branchName) ||
                other.branchName == branchName) &&
            (identical(other.stateId, stateId) || other.stateId == stateId) &&
            (identical(other.districtId, districtId) ||
                other.districtId == districtId) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.district, district) ||
                other.district == district) &&
            const DeepCollectionEquality().equals(other.timezone, timezone));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      branchName,
      stateId,
      districtId,
      state,
      district,
      const DeepCollectionEquality().hash(timezone));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DatumBranchCopyWith<_$_DatumBranch> get copyWith =>
      __$$_DatumBranchCopyWithImpl<_$_DatumBranch>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DatumBranchToJson(
      this,
    );
  }
}

abstract class _DatumBranch implements DatumBranch {
  const factory _DatumBranch(
      {final int? id,
      final String? branchName,
      final int? stateId,
      final int? districtId,
      final StateDetail? state,
      final District? district,
      final dynamic timezone}) = _$_DatumBranch;

  factory _DatumBranch.fromJson(Map<String, dynamic> json) =
      _$_DatumBranch.fromJson;

  @override
  int? get id;
  @override
  String? get branchName;
  @override
  int? get stateId;
  @override
  int? get districtId;
  @override
  StateDetail? get state;
  @override
  District? get district;
  @override
  dynamic get timezone;
  @override
  @JsonKey(ignore: true)
  _$$_DatumBranchCopyWith<_$_DatumBranch> get copyWith =>
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
  dynamic get followUpComment => throw _privateConstructorUsedError;
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
      dynamic followUpComment,
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
              as dynamic,
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
      dynamic followUpComment,
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
              as dynamic,
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
  final dynamic followUpComment;
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
            const DeepCollectionEquality()
                .equals(other.followUpComment, followUpComment) &&
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
      const DeepCollectionEquality().hash(followUpComment),
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
      final dynamic followUpComment,
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
  dynamic get followUpComment;
  @override
  String? get followUpStatus;
  @override
  AssignedTo? get assignedTo;
  @override
  @JsonKey(ignore: true)
  _$$_FollowUpCopyWith<_$_FollowUp> get copyWith =>
      throw _privateConstructorUsedError;
}
