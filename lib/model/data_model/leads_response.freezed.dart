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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LeadsResponse _$LeadsResponseFromJson(Map<String, dynamic> json) {
  return _LeadsResponse.fromJson(json);
}

/// @nodoc
mixin _$LeadsResponse {
  int? get status => throw _privateConstructorUsedError;
  Leads? get leads => throw _privateConstructorUsedError;
  Lead? get lead => throw _privateConstructorUsedError;

  /// Serializes this LeadsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LeadsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LeadsResponseCopyWith<LeadsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadsResponseCopyWith<$Res> {
  factory $LeadsResponseCopyWith(
          LeadsResponse value, $Res Function(LeadsResponse) then) =
      _$LeadsResponseCopyWithImpl<$Res, LeadsResponse>;
  @useResult
  $Res call({int? status, Leads? leads, Lead? lead});

  $LeadsCopyWith<$Res>? get leads;
  $LeadCopyWith<$Res>? get lead;
}

/// @nodoc
class _$LeadsResponseCopyWithImpl<$Res, $Val extends LeadsResponse>
    implements $LeadsResponseCopyWith<$Res> {
  _$LeadsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LeadsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? leads = freezed,
    Object? lead = freezed,
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
      lead: freezed == lead
          ? _value.lead
          : lead // ignore: cast_nullable_to_non_nullable
              as Lead?,
    ) as $Val);
  }

  /// Create a copy of LeadsResponse
  /// with the given fields replaced by the non-null parameter values.
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

  /// Create a copy of LeadsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LeadCopyWith<$Res>? get lead {
    if (_value.lead == null) {
      return null;
    }

    return $LeadCopyWith<$Res>(_value.lead!, (value) {
      return _then(_value.copyWith(lead: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LeadsResponseImplCopyWith<$Res>
    implements $LeadsResponseCopyWith<$Res> {
  factory _$$LeadsResponseImplCopyWith(
          _$LeadsResponseImpl value, $Res Function(_$LeadsResponseImpl) then) =
      __$$LeadsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? status, Leads? leads, Lead? lead});

  @override
  $LeadsCopyWith<$Res>? get leads;
  @override
  $LeadCopyWith<$Res>? get lead;
}

/// @nodoc
class __$$LeadsResponseImplCopyWithImpl<$Res>
    extends _$LeadsResponseCopyWithImpl<$Res, _$LeadsResponseImpl>
    implements _$$LeadsResponseImplCopyWith<$Res> {
  __$$LeadsResponseImplCopyWithImpl(
      _$LeadsResponseImpl _value, $Res Function(_$LeadsResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of LeadsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? leads = freezed,
    Object? lead = freezed,
  }) {
    return _then(_$LeadsResponseImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      leads: freezed == leads
          ? _value.leads
          : leads // ignore: cast_nullable_to_non_nullable
              as Leads?,
      lead: freezed == lead
          ? _value.lead
          : lead // ignore: cast_nullable_to_non_nullable
              as Lead?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$LeadsResponseImpl implements _LeadsResponse {
  const _$LeadsResponseImpl({this.status, this.leads, this.lead});

  factory _$LeadsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadsResponseImplFromJson(json);

  @override
  final int? status;
  @override
  final Leads? leads;
  @override
  final Lead? lead;

  @override
  String toString() {
    return 'LeadsResponse(status: $status, leads: $leads, lead: $lead)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadsResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.leads, leads) || other.leads == leads) &&
            (identical(other.lead, lead) || other.lead == lead));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, leads, lead);

  /// Create a copy of LeadsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadsResponseImplCopyWith<_$LeadsResponseImpl> get copyWith =>
      __$$LeadsResponseImplCopyWithImpl<_$LeadsResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadsResponseImplToJson(
      this,
    );
  }
}

abstract class _LeadsResponse implements LeadsResponse {
  const factory _LeadsResponse(
      {final int? status,
      final Leads? leads,
      final Lead? lead}) = _$LeadsResponseImpl;

  factory _LeadsResponse.fromJson(Map<String, dynamic> json) =
      _$LeadsResponseImpl.fromJson;

  @override
  int? get status;
  @override
  Leads? get leads;
  @override
  Lead? get lead;

  /// Create a copy of LeadsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LeadsResponseImplCopyWith<_$LeadsResponseImpl> get copyWith =>
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

  /// Serializes this Leads to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Leads
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of Leads
  /// with the given fields replaced by the non-null parameter values.
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
abstract class _$$LeadsImplCopyWith<$Res> implements $LeadsCopyWith<$Res> {
  factory _$$LeadsImplCopyWith(
          _$LeadsImpl value, $Res Function(_$LeadsImpl) then) =
      __$$LeadsImplCopyWithImpl<$Res>;
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
class __$$LeadsImplCopyWithImpl<$Res>
    extends _$LeadsCopyWithImpl<$Res, _$LeadsImpl>
    implements _$$LeadsImplCopyWith<$Res> {
  __$$LeadsImplCopyWithImpl(
      _$LeadsImpl _value, $Res Function(_$LeadsImpl) _then)
      : super(_value, _then);

  /// Create a copy of Leads
  /// with the given fields replaced by the non-null parameter values.
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
    return _then(_$LeadsImpl(
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
class _$LeadsImpl implements _Leads {
  const _$LeadsImpl(
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

  factory _$LeadsImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadsImplFromJson(json);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadsImpl &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of Leads
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadsImplCopyWith<_$LeadsImpl> get copyWith =>
      __$$LeadsImplCopyWithImpl<_$LeadsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadsImplToJson(
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
      final int? to}) = _$LeadsImpl;

  factory _Leads.fromJson(Map<String, dynamic> json) = _$LeadsImpl.fromJson;

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

  /// Create a copy of Leads
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LeadsImplCopyWith<_$LeadsImpl> get copyWith =>
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

  /// Serializes this Lead to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Lead
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of Lead
  /// with the given fields replaced by the non-null parameter values.
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

  /// Create a copy of Lead
  /// with the given fields replaced by the non-null parameter values.
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

  /// Create a copy of Lead
  /// with the given fields replaced by the non-null parameter values.
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

  /// Create a copy of Lead
  /// with the given fields replaced by the non-null parameter values.
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
abstract class _$$LeadImplCopyWith<$Res> implements $LeadCopyWith<$Res> {
  factory _$$LeadImplCopyWith(
          _$LeadImpl value, $Res Function(_$LeadImpl) then) =
      __$$LeadImplCopyWithImpl<$Res>;
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
class __$$LeadImplCopyWithImpl<$Res>
    extends _$LeadCopyWithImpl<$Res, _$LeadImpl>
    implements _$$LeadImplCopyWith<$Res> {
  __$$LeadImplCopyWithImpl(_$LeadImpl _value, $Res Function(_$LeadImpl) _then)
      : super(_value, _then);

  /// Create a copy of Lead
  /// with the given fields replaced by the non-null parameter values.
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
    return _then(_$LeadImpl(
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
class _$LeadImpl implements _Lead {
  const _$LeadImpl(
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

  factory _$LeadImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadImplFromJson(json);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadImpl &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of Lead
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadImplCopyWith<_$LeadImpl> get copyWith =>
      __$$LeadImplCopyWithImpl<_$LeadImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadImplToJson(
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
      final List<FollowUp>? followUps}) = _$LeadImpl;

  factory _Lead.fromJson(Map<String, dynamic> json) = _$LeadImpl.fromJson;

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

  /// Create a copy of Lead
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LeadImplCopyWith<_$LeadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AssignedTo _$AssignedToFromJson(Map<String, dynamic> json) {
  return _AssignedTo.fromJson(json);
}

/// @nodoc
mixin _$AssignedTo {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  List<BranchElement>? get branches => throw _privateConstructorUsedError;

  /// Serializes this AssignedTo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AssignedTo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of AssignedTo
  /// with the given fields replaced by the non-null parameter values.
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
abstract class _$$AssignedToImplCopyWith<$Res>
    implements $AssignedToCopyWith<$Res> {
  factory _$$AssignedToImplCopyWith(
          _$AssignedToImpl value, $Res Function(_$AssignedToImpl) then) =
      __$$AssignedToImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name, List<BranchElement>? branches});
}

/// @nodoc
class __$$AssignedToImplCopyWithImpl<$Res>
    extends _$AssignedToCopyWithImpl<$Res, _$AssignedToImpl>
    implements _$$AssignedToImplCopyWith<$Res> {
  __$$AssignedToImplCopyWithImpl(
      _$AssignedToImpl _value, $Res Function(_$AssignedToImpl) _then)
      : super(_value, _then);

  /// Create a copy of AssignedTo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? branches = freezed,
  }) {
    return _then(_$AssignedToImpl(
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
class _$AssignedToImpl implements _AssignedTo {
  const _$AssignedToImpl(
      {this.id, this.name, final List<BranchElement>? branches})
      : _branches = branches;

  factory _$AssignedToImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssignedToImplFromJson(json);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssignedToImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._branches, _branches));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, const DeepCollectionEquality().hash(_branches));

  /// Create a copy of AssignedTo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AssignedToImplCopyWith<_$AssignedToImpl> get copyWith =>
      __$$AssignedToImplCopyWithImpl<_$AssignedToImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AssignedToImplToJson(
      this,
    );
  }
}

abstract class _AssignedTo implements AssignedTo {
  const factory _AssignedTo(
      {final int? id,
      final String? name,
      final List<BranchElement>? branches}) = _$AssignedToImpl;

  factory _AssignedTo.fromJson(Map<String, dynamic> json) =
      _$AssignedToImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  List<BranchElement>? get branches;

  /// Create a copy of AssignedTo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AssignedToImplCopyWith<_$AssignedToImpl> get copyWith =>
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

  /// Serializes this BranchElement to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BranchElement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of BranchElement
  /// with the given fields replaced by the non-null parameter values.
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

  /// Create a copy of BranchElement
  /// with the given fields replaced by the non-null parameter values.
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

  /// Create a copy of BranchElement
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

  /// Create a copy of BranchElement
  /// with the given fields replaced by the non-null parameter values.
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

  /// Create a copy of BranchElement
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

  /// Create a copy of BranchElement
  /// with the given fields replaced by the non-null parameter values.
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
abstract class _$$BranchElementImplCopyWith<$Res>
    implements $BranchElementCopyWith<$Res> {
  factory _$$BranchElementImplCopyWith(
          _$BranchElementImpl value, $Res Function(_$BranchElementImpl) then) =
      __$$BranchElementImplCopyWithImpl<$Res>;
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
class __$$BranchElementImplCopyWithImpl<$Res>
    extends _$BranchElementCopyWithImpl<$Res, _$BranchElementImpl>
    implements _$$BranchElementImplCopyWith<$Res> {
  __$$BranchElementImplCopyWithImpl(
      _$BranchElementImpl _value, $Res Function(_$BranchElementImpl) _then)
      : super(_value, _then);

  /// Create a copy of BranchElement
  /// with the given fields replaced by the non-null parameter values.
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
    return _then(_$BranchElementImpl(
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
class _$BranchElementImpl implements _BranchElement {
  const _$BranchElementImpl(
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

  factory _$BranchElementImpl.fromJson(Map<String, dynamic> json) =>
      _$$BranchElementImplFromJson(json);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BranchElementImpl &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of BranchElement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BranchElementImplCopyWith<_$BranchElementImpl> get copyWith =>
      __$$BranchElementImplCopyWithImpl<_$BranchElementImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BranchElementImplToJson(
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
      final Timezone? timezone}) = _$BranchElementImpl;

  factory _BranchElement.fromJson(Map<String, dynamic> json) =
      _$BranchElementImpl.fromJson;

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

  /// Create a copy of BranchElement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BranchElementImplCopyWith<_$BranchElementImpl> get copyWith =>
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

  /// Serializes this Country to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Country
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of Country
  /// with the given fields replaced by the non-null parameter values.
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
abstract class _$$CountryImplCopyWith<$Res> implements $CountryCopyWith<$Res> {
  factory _$$CountryImplCopyWith(
          _$CountryImpl value, $Res Function(_$CountryImpl) then) =
      __$$CountryImplCopyWithImpl<$Res>;
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
class __$$CountryImplCopyWithImpl<$Res>
    extends _$CountryCopyWithImpl<$Res, _$CountryImpl>
    implements _$$CountryImplCopyWith<$Res> {
  __$$CountryImplCopyWithImpl(
      _$CountryImpl _value, $Res Function(_$CountryImpl) _then)
      : super(_value, _then);

  /// Create a copy of Country
  /// with the given fields replaced by the non-null parameter values.
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
    return _then(_$CountryImpl(
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
class _$CountryImpl implements _Country {
  const _$CountryImpl(
      {this.id,
      this.name,
      this.currency,
      this.currencySymbol,
      this.currencyCode,
      this.timezone,
      this.currencySubUnit});

  factory _$CountryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CountryImplFromJson(json);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CountryImpl &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, currency,
      currencySymbol, currencyCode, timezone, currencySubUnit);

  /// Create a copy of Country
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CountryImplCopyWith<_$CountryImpl> get copyWith =>
      __$$CountryImplCopyWithImpl<_$CountryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CountryImplToJson(
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
      final String? currencySubUnit}) = _$CountryImpl;

  factory _Country.fromJson(Map<String, dynamic> json) = _$CountryImpl.fromJson;

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

  /// Create a copy of Country
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CountryImplCopyWith<_$CountryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

District _$DistrictFromJson(Map<String, dynamic> json) {
  return _District.fromJson(json);
}

/// @nodoc
mixin _$District {
  int? get id => throw _privateConstructorUsedError;
  String? get districtName => throw _privateConstructorUsedError;

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

  /// Create a copy of District
  /// with the given fields replaced by the non-null parameter values.
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
abstract class _$$DistrictImplCopyWith<$Res>
    implements $DistrictCopyWith<$Res> {
  factory _$$DistrictImplCopyWith(
          _$DistrictImpl value, $Res Function(_$DistrictImpl) then) =
      __$$DistrictImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? districtName});
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
    Object? id = freezed,
    Object? districtName = freezed,
  }) {
    return _then(_$DistrictImpl(
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
class _$DistrictImpl implements _District {
  const _$DistrictImpl({this.id, this.districtName});

  factory _$DistrictImpl.fromJson(Map<String, dynamic> json) =>
      _$$DistrictImplFromJson(json);

  @override
  final int? id;
  @override
  final String? districtName;

  @override
  String toString() {
    return 'District(id: $id, districtName: $districtName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DistrictImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.districtName, districtName) ||
                other.districtName == districtName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, districtName);

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
  const factory _District({final int? id, final String? districtName}) =
      _$DistrictImpl;

  factory _District.fromJson(Map<String, dynamic> json) =
      _$DistrictImpl.fromJson;

  @override
  int? get id;
  @override
  String? get districtName;

  /// Create a copy of District
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DistrictImplCopyWith<_$DistrictImpl> get copyWith =>
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

  /// Serializes this Pivot to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Pivot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of Pivot
  /// with the given fields replaced by the non-null parameter values.
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
abstract class _$$PivotImplCopyWith<$Res> implements $PivotCopyWith<$Res> {
  factory _$$PivotImplCopyWith(
          _$PivotImpl value, $Res Function(_$PivotImpl) then) =
      __$$PivotImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? trainerDetailId,
      int? branchId,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$PivotImplCopyWithImpl<$Res>
    extends _$PivotCopyWithImpl<$Res, _$PivotImpl>
    implements _$$PivotImplCopyWith<$Res> {
  __$$PivotImplCopyWithImpl(
      _$PivotImpl _value, $Res Function(_$PivotImpl) _then)
      : super(_value, _then);

  /// Create a copy of Pivot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trainerDetailId = freezed,
    Object? branchId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$PivotImpl(
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
class _$PivotImpl implements _Pivot {
  const _$PivotImpl(
      {this.trainerDetailId, this.branchId, this.createdAt, this.updatedAt});

  factory _$PivotImpl.fromJson(Map<String, dynamic> json) =>
      _$$PivotImplFromJson(json);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PivotImpl &&
            (identical(other.trainerDetailId, trainerDetailId) ||
                other.trainerDetailId == trainerDetailId) &&
            (identical(other.branchId, branchId) ||
                other.branchId == branchId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, trainerDetailId, branchId, createdAt, updatedAt);

  /// Create a copy of Pivot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PivotImplCopyWith<_$PivotImpl> get copyWith =>
      __$$PivotImplCopyWithImpl<_$PivotImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PivotImplToJson(
      this,
    );
  }
}

abstract class _Pivot implements Pivot {
  const factory _Pivot(
      {final int? trainerDetailId,
      final int? branchId,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$PivotImpl;

  factory _Pivot.fromJson(Map<String, dynamic> json) = _$PivotImpl.fromJson;

  @override
  int? get trainerDetailId;
  @override
  int? get branchId;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of Pivot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PivotImplCopyWith<_$PivotImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StateDetail _$StateDetailFromJson(Map<String, dynamic> json) {
  return _StateDetail.fromJson(json);
}

/// @nodoc
mixin _$StateDetail {
  int? get id => throw _privateConstructorUsedError;
  String? get stateName => throw _privateConstructorUsedError;

  /// Serializes this StateDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StateDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of StateDetail
  /// with the given fields replaced by the non-null parameter values.
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
abstract class _$$StateDetailImplCopyWith<$Res>
    implements $StateDetailCopyWith<$Res> {
  factory _$$StateDetailImplCopyWith(
          _$StateDetailImpl value, $Res Function(_$StateDetailImpl) then) =
      __$$StateDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? stateName});
}

/// @nodoc
class __$$StateDetailImplCopyWithImpl<$Res>
    extends _$StateDetailCopyWithImpl<$Res, _$StateDetailImpl>
    implements _$$StateDetailImplCopyWith<$Res> {
  __$$StateDetailImplCopyWithImpl(
      _$StateDetailImpl _value, $Res Function(_$StateDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of StateDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? stateName = freezed,
  }) {
    return _then(_$StateDetailImpl(
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
class _$StateDetailImpl implements _StateDetail {
  const _$StateDetailImpl({this.id, this.stateName});

  factory _$StateDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$StateDetailImplFromJson(json);

  @override
  final int? id;
  @override
  final String? stateName;

  @override
  String toString() {
    return 'StateDetail(id: $id, stateName: $stateName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StateDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.stateName, stateName) ||
                other.stateName == stateName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, stateName);

  /// Create a copy of StateDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StateDetailImplCopyWith<_$StateDetailImpl> get copyWith =>
      __$$StateDetailImplCopyWithImpl<_$StateDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StateDetailImplToJson(
      this,
    );
  }
}

abstract class _StateDetail implements StateDetail {
  const factory _StateDetail({final int? id, final String? stateName}) =
      _$StateDetailImpl;

  factory _StateDetail.fromJson(Map<String, dynamic> json) =
      _$StateDetailImpl.fromJson;

  @override
  int? get id;
  @override
  String? get stateName;

  /// Create a copy of StateDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StateDetailImplCopyWith<_$StateDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Timezone _$TimezoneFromJson(Map<String, dynamic> json) {
  return _Timezone.fromJson(json);
}

/// @nodoc
mixin _$Timezone {
  int? get id => throw _privateConstructorUsedError;
  String? get timezone => throw _privateConstructorUsedError;

  /// Serializes this Timezone to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Timezone
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of Timezone
  /// with the given fields replaced by the non-null parameter values.
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
abstract class _$$TimezoneImplCopyWith<$Res>
    implements $TimezoneCopyWith<$Res> {
  factory _$$TimezoneImplCopyWith(
          _$TimezoneImpl value, $Res Function(_$TimezoneImpl) then) =
      __$$TimezoneImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? timezone});
}

/// @nodoc
class __$$TimezoneImplCopyWithImpl<$Res>
    extends _$TimezoneCopyWithImpl<$Res, _$TimezoneImpl>
    implements _$$TimezoneImplCopyWith<$Res> {
  __$$TimezoneImplCopyWithImpl(
      _$TimezoneImpl _value, $Res Function(_$TimezoneImpl) _then)
      : super(_value, _then);

  /// Create a copy of Timezone
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? timezone = freezed,
  }) {
    return _then(_$TimezoneImpl(
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
class _$TimezoneImpl implements _Timezone {
  const _$TimezoneImpl({this.id, this.timezone});

  factory _$TimezoneImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimezoneImplFromJson(json);

  @override
  final int? id;
  @override
  final String? timezone;

  @override
  String toString() {
    return 'Timezone(id: $id, timezone: $timezone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimezoneImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, timezone);

  /// Create a copy of Timezone
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimezoneImplCopyWith<_$TimezoneImpl> get copyWith =>
      __$$TimezoneImplCopyWithImpl<_$TimezoneImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimezoneImplToJson(
      this,
    );
  }
}

abstract class _Timezone implements Timezone {
  const factory _Timezone({final int? id, final String? timezone}) =
      _$TimezoneImpl;

  factory _Timezone.fromJson(Map<String, dynamic> json) =
      _$TimezoneImpl.fromJson;

  @override
  int? get id;
  @override
  String? get timezone;

  /// Create a copy of Timezone
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimezoneImplCopyWith<_$TimezoneImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Batch _$BatchFromJson(Map<String, dynamic> json) {
  return _Batch.fromJson(json);
}

/// @nodoc
mixin _$Batch {
  int? get id => throw _privateConstructorUsedError;
  String? get batchName => throw _privateConstructorUsedError;

  /// Serializes this Batch to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Batch
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of Batch
  /// with the given fields replaced by the non-null parameter values.
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
abstract class _$$BatchImplCopyWith<$Res> implements $BatchCopyWith<$Res> {
  factory _$$BatchImplCopyWith(
          _$BatchImpl value, $Res Function(_$BatchImpl) then) =
      __$$BatchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? batchName});
}

/// @nodoc
class __$$BatchImplCopyWithImpl<$Res>
    extends _$BatchCopyWithImpl<$Res, _$BatchImpl>
    implements _$$BatchImplCopyWith<$Res> {
  __$$BatchImplCopyWithImpl(
      _$BatchImpl _value, $Res Function(_$BatchImpl) _then)
      : super(_value, _then);

  /// Create a copy of Batch
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? batchName = freezed,
  }) {
    return _then(_$BatchImpl(
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
class _$BatchImpl implements _Batch {
  const _$BatchImpl({this.id, this.batchName});

  factory _$BatchImpl.fromJson(Map<String, dynamic> json) =>
      _$$BatchImplFromJson(json);

  @override
  final int? id;
  @override
  final String? batchName;

  @override
  String toString() {
    return 'Batch(id: $id, batchName: $batchName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BatchImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.batchName, batchName) ||
                other.batchName == batchName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, batchName);

  /// Create a copy of Batch
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BatchImplCopyWith<_$BatchImpl> get copyWith =>
      __$$BatchImplCopyWithImpl<_$BatchImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BatchImplToJson(
      this,
    );
  }
}

abstract class _Batch implements Batch {
  const factory _Batch({final int? id, final String? batchName}) = _$BatchImpl;

  factory _Batch.fromJson(Map<String, dynamic> json) = _$BatchImpl.fromJson;

  @override
  int? get id;
  @override
  String? get batchName;

  /// Create a copy of Batch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BatchImplCopyWith<_$BatchImpl> get copyWith =>
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

  /// Serializes this DatumBranch to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DatumBranch
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of DatumBranch
  /// with the given fields replaced by the non-null parameter values.
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

  /// Create a copy of DatumBranch
  /// with the given fields replaced by the non-null parameter values.
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

  /// Create a copy of DatumBranch
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
}

/// @nodoc
abstract class _$$DatumBranchImplCopyWith<$Res>
    implements $DatumBranchCopyWith<$Res> {
  factory _$$DatumBranchImplCopyWith(
          _$DatumBranchImpl value, $Res Function(_$DatumBranchImpl) then) =
      __$$DatumBranchImplCopyWithImpl<$Res>;
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
class __$$DatumBranchImplCopyWithImpl<$Res>
    extends _$DatumBranchCopyWithImpl<$Res, _$DatumBranchImpl>
    implements _$$DatumBranchImplCopyWith<$Res> {
  __$$DatumBranchImplCopyWithImpl(
      _$DatumBranchImpl _value, $Res Function(_$DatumBranchImpl) _then)
      : super(_value, _then);

  /// Create a copy of DatumBranch
  /// with the given fields replaced by the non-null parameter values.
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
    return _then(_$DatumBranchImpl(
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
class _$DatumBranchImpl implements _DatumBranch {
  const _$DatumBranchImpl(
      {this.id,
      this.branchName,
      this.stateId,
      this.districtId,
      this.state,
      this.district,
      this.timezone});

  factory _$DatumBranchImpl.fromJson(Map<String, dynamic> json) =>
      _$$DatumBranchImplFromJson(json);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DatumBranchImpl &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of DatumBranch
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DatumBranchImplCopyWith<_$DatumBranchImpl> get copyWith =>
      __$$DatumBranchImplCopyWithImpl<_$DatumBranchImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DatumBranchImplToJson(
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
      final dynamic timezone}) = _$DatumBranchImpl;

  factory _DatumBranch.fromJson(Map<String, dynamic> json) =
      _$DatumBranchImpl.fromJson;

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

  /// Create a copy of DatumBranch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DatumBranchImplCopyWith<_$DatumBranchImpl> get copyWith =>
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

  /// Serializes this FollowUp to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FollowUp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of FollowUp
  /// with the given fields replaced by the non-null parameter values.
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

  /// Create a copy of FollowUp
  /// with the given fields replaced by the non-null parameter values.
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
abstract class _$$FollowUpImplCopyWith<$Res>
    implements $FollowUpCopyWith<$Res> {
  factory _$$FollowUpImplCopyWith(
          _$FollowUpImpl value, $Res Function(_$FollowUpImpl) then) =
      __$$FollowUpImplCopyWithImpl<$Res>;
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
class __$$FollowUpImplCopyWithImpl<$Res>
    extends _$FollowUpCopyWithImpl<$Res, _$FollowUpImpl>
    implements _$$FollowUpImplCopyWith<$Res> {
  __$$FollowUpImplCopyWithImpl(
      _$FollowUpImpl _value, $Res Function(_$FollowUpImpl) _then)
      : super(_value, _then);

  /// Create a copy of FollowUp
  /// with the given fields replaced by the non-null parameter values.
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
    return _then(_$FollowUpImpl(
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
class _$FollowUpImpl implements _FollowUp {
  const _$FollowUpImpl(
      {this.id,
      this.leadId,
      this.assignedToType,
      this.assignedToId,
      this.followUpDate,
      this.followUpTime,
      this.followUpComment,
      this.followUpStatus,
      this.assignedTo});

  factory _$FollowUpImpl.fromJson(Map<String, dynamic> json) =>
      _$$FollowUpImplFromJson(json);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowUpImpl &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of FollowUp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowUpImplCopyWith<_$FollowUpImpl> get copyWith =>
      __$$FollowUpImplCopyWithImpl<_$FollowUpImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FollowUpImplToJson(
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
      final AssignedTo? assignedTo}) = _$FollowUpImpl;

  factory _FollowUp.fromJson(Map<String, dynamic> json) =
      _$FollowUpImpl.fromJson;

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

  /// Create a copy of FollowUp
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FollowUpImplCopyWith<_$FollowUpImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
