// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manager_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ManagerResponse _$ManagerResponseFromJson(Map<String, dynamic> json) {
  return _ManagerResponse.fromJson(json);
}

/// @nodoc
mixin _$ManagerResponse {
  int get status => throw _privateConstructorUsedError;
  Datum? get managers => throw _privateConstructorUsedError;
  Manager? get manager => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ManagerResponseCopyWith<ManagerResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManagerResponseCopyWith<$Res> {
  factory $ManagerResponseCopyWith(
          ManagerResponse value, $Res Function(ManagerResponse) then) =
      _$ManagerResponseCopyWithImpl<$Res, ManagerResponse>;
  @useResult
  $Res call({int status, Datum? managers, Manager? manager});

  $DatumCopyWith<$Res>? get managers;
  $ManagerCopyWith<$Res>? get manager;
}

/// @nodoc
class _$ManagerResponseCopyWithImpl<$Res, $Val extends ManagerResponse>
    implements $ManagerResponseCopyWith<$Res> {
  _$ManagerResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? managers = freezed,
    Object? manager = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      managers: freezed == managers
          ? _value.managers
          : managers // ignore: cast_nullable_to_non_nullable
              as Datum?,
      manager: freezed == manager
          ? _value.manager
          : manager // ignore: cast_nullable_to_non_nullable
              as Manager?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DatumCopyWith<$Res>? get managers {
    if (_value.managers == null) {
      return null;
    }

    return $DatumCopyWith<$Res>(_value.managers!, (value) {
      return _then(_value.copyWith(managers: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ManagerCopyWith<$Res>? get manager {
    if (_value.manager == null) {
      return null;
    }

    return $ManagerCopyWith<$Res>(_value.manager!, (value) {
      return _then(_value.copyWith(manager: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ManagerResponseImplCopyWith<$Res>
    implements $ManagerResponseCopyWith<$Res> {
  factory _$$ManagerResponseImplCopyWith(_$ManagerResponseImpl value,
          $Res Function(_$ManagerResponseImpl) then) =
      __$$ManagerResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int status, Datum? managers, Manager? manager});

  @override
  $DatumCopyWith<$Res>? get managers;
  @override
  $ManagerCopyWith<$Res>? get manager;
}

/// @nodoc
class __$$ManagerResponseImplCopyWithImpl<$Res>
    extends _$ManagerResponseCopyWithImpl<$Res, _$ManagerResponseImpl>
    implements _$$ManagerResponseImplCopyWith<$Res> {
  __$$ManagerResponseImplCopyWithImpl(
      _$ManagerResponseImpl _value, $Res Function(_$ManagerResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? managers = freezed,
    Object? manager = freezed,
  }) {
    return _then(_$ManagerResponseImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      managers: freezed == managers
          ? _value.managers
          : managers // ignore: cast_nullable_to_non_nullable
              as Datum?,
      manager: freezed == manager
          ? _value.manager
          : manager // ignore: cast_nullable_to_non_nullable
              as Manager?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ManagerResponseImpl implements _ManagerResponse {
  const _$ManagerResponseImpl(
      {required this.status, this.managers, this.manager});

  factory _$ManagerResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ManagerResponseImplFromJson(json);

  @override
  final int status;
  @override
  final Datum? managers;
  @override
  final Manager? manager;

  @override
  String toString() {
    return 'ManagerResponse(status: $status, managers: $managers, manager: $manager)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ManagerResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.managers, managers) ||
                other.managers == managers) &&
            (identical(other.manager, manager) || other.manager == manager));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, managers, manager);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ManagerResponseImplCopyWith<_$ManagerResponseImpl> get copyWith =>
      __$$ManagerResponseImplCopyWithImpl<_$ManagerResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ManagerResponseImplToJson(
      this,
    );
  }
}

abstract class _ManagerResponse implements ManagerResponse {
  const factory _ManagerResponse(
      {required final int status,
      final Datum? managers,
      final Manager? manager}) = _$ManagerResponseImpl;

  factory _ManagerResponse.fromJson(Map<String, dynamic> json) =
      _$ManagerResponseImpl.fromJson;

  @override
  int get status;
  @override
  Datum? get managers;
  @override
  Manager? get manager;
  @override
  @JsonKey(ignore: true)
  _$$ManagerResponseImplCopyWith<_$ManagerResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Datum _$DatumFromJson(Map<String, dynamic> json) {
  return _Datum.fromJson(json);
}

/// @nodoc
mixin _$Datum {
  int? get currentPage => throw _privateConstructorUsedError;
  List<Manager> get data => throw _privateConstructorUsedError;
  int? get from => throw _privateConstructorUsedError;
  int? get perPage => throw _privateConstructorUsedError;
  int? get to => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DatumCopyWith<Datum> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DatumCopyWith<$Res> {
  factory $DatumCopyWith(Datum value, $Res Function(Datum) then) =
      _$DatumCopyWithImpl<$Res, Datum>;
  @useResult
  $Res call(
      {int? currentPage, List<Manager> data, int? from, int? perPage, int? to});
}

/// @nodoc
class _$DatumCopyWithImpl<$Res, $Val extends Datum>
    implements $DatumCopyWith<$Res> {
  _$DatumCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = freezed,
    Object? data = null,
    Object? from = freezed,
    Object? perPage = freezed,
    Object? to = freezed,
  }) {
    return _then(_value.copyWith(
      currentPage: freezed == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Manager>,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as int?,
      perPage: freezed == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DatumImplCopyWith<$Res> implements $DatumCopyWith<$Res> {
  factory _$$DatumImplCopyWith(
          _$DatumImpl value, $Res Function(_$DatumImpl) then) =
      __$$DatumImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? currentPage, List<Manager> data, int? from, int? perPage, int? to});
}

/// @nodoc
class __$$DatumImplCopyWithImpl<$Res>
    extends _$DatumCopyWithImpl<$Res, _$DatumImpl>
    implements _$$DatumImplCopyWith<$Res> {
  __$$DatumImplCopyWithImpl(
      _$DatumImpl _value, $Res Function(_$DatumImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = freezed,
    Object? data = null,
    Object? from = freezed,
    Object? perPage = freezed,
    Object? to = freezed,
  }) {
    return _then(_$DatumImpl(
      currentPage: freezed == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int?,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Manager>,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as int?,
      perPage: freezed == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$DatumImpl implements _Datum {
  const _$DatumImpl(
      {this.currentPage,
      required final List<Manager> data,
      this.from,
      this.perPage,
      this.to})
      : _data = data;

  factory _$DatumImpl.fromJson(Map<String, dynamic> json) =>
      _$$DatumImplFromJson(json);

  @override
  final int? currentPage;
  final List<Manager> _data;
  @override
  List<Manager> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final int? from;
  @override
  final int? perPage;
  @override
  final int? to;

  @override
  String toString() {
    return 'Datum(currentPage: $currentPage, data: $data, from: $from, perPage: $perPage, to: $to)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DatumImpl &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.to, to) || other.to == to));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, currentPage,
      const DeepCollectionEquality().hash(_data), from, perPage, to);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DatumImplCopyWith<_$DatumImpl> get copyWith =>
      __$$DatumImplCopyWithImpl<_$DatumImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DatumImplToJson(
      this,
    );
  }
}

abstract class _Datum implements Datum {
  const factory _Datum(
      {final int? currentPage,
      required final List<Manager> data,
      final int? from,
      final int? perPage,
      final int? to}) = _$DatumImpl;

  factory _Datum.fromJson(Map<String, dynamic> json) = _$DatumImpl.fromJson;

  @override
  int? get currentPage;
  @override
  List<Manager> get data;
  @override
  int? get from;
  @override
  int? get perPage;
  @override
  int? get to;
  @override
  @JsonKey(ignore: true)
  _$$DatumImplCopyWith<_$DatumImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Manager _$ManagerFromJson(Map<String, dynamic> json) {
  return _Manager.fromJson(json);
}

/// @nodoc
mixin _$Manager {
  int get id => throw _privateConstructorUsedError;
  int? get userId => throw _privateConstructorUsedError;
  int? get academyId => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get mobileNo => throw _privateConstructorUsedError;
  String? get countryCode => throw _privateConstructorUsedError;
  String? get upiId => throw _privateConstructorUsedError;
  DateTime? get dob => throw _privateConstructorUsedError;
  DateTime? get doj => throw _privateConstructorUsedError;
  String? get whatsappNo => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get salaryType => throw _privateConstructorUsedError;
  int? get salaryDate => throw _privateConstructorUsedError;
  int? get salaryAmount => throw _privateConstructorUsedError;
  String? get profilePic => throw _privateConstructorUsedError;
  String? get profilePicType => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get document_1 => throw _privateConstructorUsedError;
  String? get document_2 => throw _privateConstructorUsedError;
  int? get isActive => throw _privateConstructorUsedError;
  List<Manager>? get managerDetail => throw _privateConstructorUsedError;
  List<Branch>? get branches => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ManagerCopyWith<Manager> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManagerCopyWith<$Res> {
  factory $ManagerCopyWith(Manager value, $Res Function(Manager) then) =
      _$ManagerCopyWithImpl<$Res, Manager>;
  @useResult
  $Res call(
      {int id,
      int? userId,
      int? academyId,
      String? gender,
      String? name,
      String? mobileNo,
      String? countryCode,
      String? upiId,
      DateTime? dob,
      DateTime? doj,
      String? whatsappNo,
      String? email,
      String? salaryType,
      int? salaryDate,
      int? salaryAmount,
      String? profilePic,
      String? profilePicType,
      String? address,
      String? document_1,
      String? document_2,
      int? isActive,
      List<Manager>? managerDetail,
      List<Branch>? branches});
}

/// @nodoc
class _$ManagerCopyWithImpl<$Res, $Val extends Manager>
    implements $ManagerCopyWith<$Res> {
  _$ManagerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? academyId = freezed,
    Object? gender = freezed,
    Object? name = freezed,
    Object? mobileNo = freezed,
    Object? countryCode = freezed,
    Object? upiId = freezed,
    Object? dob = freezed,
    Object? doj = freezed,
    Object? whatsappNo = freezed,
    Object? email = freezed,
    Object? salaryType = freezed,
    Object? salaryDate = freezed,
    Object? salaryAmount = freezed,
    Object? profilePic = freezed,
    Object? profilePicType = freezed,
    Object? address = freezed,
    Object? document_1 = freezed,
    Object? document_2 = freezed,
    Object? isActive = freezed,
    Object? managerDetail = freezed,
    Object? branches = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      academyId: freezed == academyId
          ? _value.academyId
          : academyId // ignore: cast_nullable_to_non_nullable
              as int?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNo: freezed == mobileNo
          ? _value.mobileNo
          : mobileNo // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      upiId: freezed == upiId
          ? _value.upiId
          : upiId // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      doj: freezed == doj
          ? _value.doj
          : doj // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      whatsappNo: freezed == whatsappNo
          ? _value.whatsappNo
          : whatsappNo // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      salaryType: freezed == salaryType
          ? _value.salaryType
          : salaryType // ignore: cast_nullable_to_non_nullable
              as String?,
      salaryDate: freezed == salaryDate
          ? _value.salaryDate
          : salaryDate // ignore: cast_nullable_to_non_nullable
              as int?,
      salaryAmount: freezed == salaryAmount
          ? _value.salaryAmount
          : salaryAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      profilePic: freezed == profilePic
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePicType: freezed == profilePicType
          ? _value.profilePicType
          : profilePicType // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      document_1: freezed == document_1
          ? _value.document_1
          : document_1 // ignore: cast_nullable_to_non_nullable
              as String?,
      document_2: freezed == document_2
          ? _value.document_2
          : document_2 // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int?,
      managerDetail: freezed == managerDetail
          ? _value.managerDetail
          : managerDetail // ignore: cast_nullable_to_non_nullable
              as List<Manager>?,
      branches: freezed == branches
          ? _value.branches
          : branches // ignore: cast_nullable_to_non_nullable
              as List<Branch>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ManagerImplCopyWith<$Res> implements $ManagerCopyWith<$Res> {
  factory _$$ManagerImplCopyWith(
          _$ManagerImpl value, $Res Function(_$ManagerImpl) then) =
      __$$ManagerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int? userId,
      int? academyId,
      String? gender,
      String? name,
      String? mobileNo,
      String? countryCode,
      String? upiId,
      DateTime? dob,
      DateTime? doj,
      String? whatsappNo,
      String? email,
      String? salaryType,
      int? salaryDate,
      int? salaryAmount,
      String? profilePic,
      String? profilePicType,
      String? address,
      String? document_1,
      String? document_2,
      int? isActive,
      List<Manager>? managerDetail,
      List<Branch>? branches});
}

/// @nodoc
class __$$ManagerImplCopyWithImpl<$Res>
    extends _$ManagerCopyWithImpl<$Res, _$ManagerImpl>
    implements _$$ManagerImplCopyWith<$Res> {
  __$$ManagerImplCopyWithImpl(
      _$ManagerImpl _value, $Res Function(_$ManagerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? academyId = freezed,
    Object? gender = freezed,
    Object? name = freezed,
    Object? mobileNo = freezed,
    Object? countryCode = freezed,
    Object? upiId = freezed,
    Object? dob = freezed,
    Object? doj = freezed,
    Object? whatsappNo = freezed,
    Object? email = freezed,
    Object? salaryType = freezed,
    Object? salaryDate = freezed,
    Object? salaryAmount = freezed,
    Object? profilePic = freezed,
    Object? profilePicType = freezed,
    Object? address = freezed,
    Object? document_1 = freezed,
    Object? document_2 = freezed,
    Object? isActive = freezed,
    Object? managerDetail = freezed,
    Object? branches = freezed,
  }) {
    return _then(_$ManagerImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      academyId: freezed == academyId
          ? _value.academyId
          : academyId // ignore: cast_nullable_to_non_nullable
              as int?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNo: freezed == mobileNo
          ? _value.mobileNo
          : mobileNo // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      upiId: freezed == upiId
          ? _value.upiId
          : upiId // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      doj: freezed == doj
          ? _value.doj
          : doj // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      whatsappNo: freezed == whatsappNo
          ? _value.whatsappNo
          : whatsappNo // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      salaryType: freezed == salaryType
          ? _value.salaryType
          : salaryType // ignore: cast_nullable_to_non_nullable
              as String?,
      salaryDate: freezed == salaryDate
          ? _value.salaryDate
          : salaryDate // ignore: cast_nullable_to_non_nullable
              as int?,
      salaryAmount: freezed == salaryAmount
          ? _value.salaryAmount
          : salaryAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      profilePic: freezed == profilePic
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePicType: freezed == profilePicType
          ? _value.profilePicType
          : profilePicType // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      document_1: freezed == document_1
          ? _value.document_1
          : document_1 // ignore: cast_nullable_to_non_nullable
              as String?,
      document_2: freezed == document_2
          ? _value.document_2
          : document_2 // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int?,
      managerDetail: freezed == managerDetail
          ? _value._managerDetail
          : managerDetail // ignore: cast_nullable_to_non_nullable
              as List<Manager>?,
      branches: freezed == branches
          ? _value._branches
          : branches // ignore: cast_nullable_to_non_nullable
              as List<Branch>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$ManagerImpl implements _Manager {
  const _$ManagerImpl(
      {required this.id,
      this.userId,
      this.academyId,
      this.gender,
      this.name,
      this.mobileNo,
      this.countryCode,
      this.upiId,
      this.dob,
      this.doj,
      this.whatsappNo,
      this.email,
      this.salaryType,
      this.salaryDate,
      this.salaryAmount,
      this.profilePic,
      this.profilePicType,
      this.address,
      this.document_1,
      this.document_2,
      this.isActive,
      final List<Manager>? managerDetail,
      final List<Branch>? branches})
      : _managerDetail = managerDetail,
        _branches = branches;

  factory _$ManagerImpl.fromJson(Map<String, dynamic> json) =>
      _$$ManagerImplFromJson(json);

  @override
  final int id;
  @override
  final int? userId;
  @override
  final int? academyId;
  @override
  final String? gender;
  @override
  final String? name;
  @override
  final String? mobileNo;
  @override
  final String? countryCode;
  @override
  final String? upiId;
  @override
  final DateTime? dob;
  @override
  final DateTime? doj;
  @override
  final String? whatsappNo;
  @override
  final String? email;
  @override
  final String? salaryType;
  @override
  final int? salaryDate;
  @override
  final int? salaryAmount;
  @override
  final String? profilePic;
  @override
  final String? profilePicType;
  @override
  final String? address;
  @override
  final String? document_1;
  @override
  final String? document_2;
  @override
  final int? isActive;
  final List<Manager>? _managerDetail;
  @override
  List<Manager>? get managerDetail {
    final value = _managerDetail;
    if (value == null) return null;
    if (_managerDetail is EqualUnmodifiableListView) return _managerDetail;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

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
  String toString() {
    return 'Manager(id: $id, userId: $userId, academyId: $academyId, gender: $gender, name: $name, mobileNo: $mobileNo, countryCode: $countryCode, upiId: $upiId, dob: $dob, doj: $doj, whatsappNo: $whatsappNo, email: $email, salaryType: $salaryType, salaryDate: $salaryDate, salaryAmount: $salaryAmount, profilePic: $profilePic, profilePicType: $profilePicType, address: $address, document_1: $document_1, document_2: $document_2, isActive: $isActive, managerDetail: $managerDetail, branches: $branches)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ManagerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.academyId, academyId) ||
                other.academyId == academyId) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.mobileNo, mobileNo) ||
                other.mobileNo == mobileNo) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.upiId, upiId) || other.upiId == upiId) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            (identical(other.doj, doj) || other.doj == doj) &&
            (identical(other.whatsappNo, whatsappNo) ||
                other.whatsappNo == whatsappNo) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.salaryType, salaryType) ||
                other.salaryType == salaryType) &&
            (identical(other.salaryDate, salaryDate) ||
                other.salaryDate == salaryDate) &&
            (identical(other.salaryAmount, salaryAmount) ||
                other.salaryAmount == salaryAmount) &&
            (identical(other.profilePic, profilePic) ||
                other.profilePic == profilePic) &&
            (identical(other.profilePicType, profilePicType) ||
                other.profilePicType == profilePicType) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.document_1, document_1) ||
                other.document_1 == document_1) &&
            (identical(other.document_2, document_2) ||
                other.document_2 == document_2) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            const DeepCollectionEquality()
                .equals(other._managerDetail, _managerDetail) &&
            const DeepCollectionEquality().equals(other._branches, _branches));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        userId,
        academyId,
        gender,
        name,
        mobileNo,
        countryCode,
        upiId,
        dob,
        doj,
        whatsappNo,
        email,
        salaryType,
        salaryDate,
        salaryAmount,
        profilePic,
        profilePicType,
        address,
        document_1,
        document_2,
        isActive,
        const DeepCollectionEquality().hash(_managerDetail),
        const DeepCollectionEquality().hash(_branches)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ManagerImplCopyWith<_$ManagerImpl> get copyWith =>
      __$$ManagerImplCopyWithImpl<_$ManagerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ManagerImplToJson(
      this,
    );
  }
}

abstract class _Manager implements Manager {
  const factory _Manager(
      {required final int id,
      final int? userId,
      final int? academyId,
      final String? gender,
      final String? name,
      final String? mobileNo,
      final String? countryCode,
      final String? upiId,
      final DateTime? dob,
      final DateTime? doj,
      final String? whatsappNo,
      final String? email,
      final String? salaryType,
      final int? salaryDate,
      final int? salaryAmount,
      final String? profilePic,
      final String? profilePicType,
      final String? address,
      final String? document_1,
      final String? document_2,
      final int? isActive,
      final List<Manager>? managerDetail,
      final List<Branch>? branches}) = _$ManagerImpl;

  factory _Manager.fromJson(Map<String, dynamic> json) = _$ManagerImpl.fromJson;

  @override
  int get id;
  @override
  int? get userId;
  @override
  int? get academyId;
  @override
  String? get gender;
  @override
  String? get name;
  @override
  String? get mobileNo;
  @override
  String? get countryCode;
  @override
  String? get upiId;
  @override
  DateTime? get dob;
  @override
  DateTime? get doj;
  @override
  String? get whatsappNo;
  @override
  String? get email;
  @override
  String? get salaryType;
  @override
  int? get salaryDate;
  @override
  int? get salaryAmount;
  @override
  String? get profilePic;
  @override
  String? get profilePicType;
  @override
  String? get address;
  @override
  String? get document_1;
  @override
  String? get document_2;
  @override
  int? get isActive;
  @override
  List<Manager>? get managerDetail;
  @override
  List<Branch>? get branches;
  @override
  @JsonKey(ignore: true)
  _$$ManagerImplCopyWith<_$ManagerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
