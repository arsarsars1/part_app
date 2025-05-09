// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) {
  return _UserResponse.fromJson(json);
}

/// @nodoc
mixin _$UserResponse {
  User? get user => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;

  /// Serializes this UserResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserResponseCopyWith<UserResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserResponseCopyWith<$Res> {
  factory $UserResponseCopyWith(
          UserResponse value, $Res Function(UserResponse) then) =
      _$UserResponseCopyWithImpl<$Res, UserResponse>;
  @useResult
  $Res call({User? user, String? token, String? message, int? status});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$UserResponseCopyWithImpl<$Res, $Val extends UserResponse>
    implements $UserResponseCopyWith<$Res> {
  _$UserResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? token = freezed,
    Object? message = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  /// Create a copy of UserResponse
  /// with the given fields replaced by the non-null parameter values.
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
abstract class _$$UserResponseImplCopyWith<$Res>
    implements $UserResponseCopyWith<$Res> {
  factory _$$UserResponseImplCopyWith(
          _$UserResponseImpl value, $Res Function(_$UserResponseImpl) then) =
      __$$UserResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({User? user, String? token, String? message, int? status});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$UserResponseImplCopyWithImpl<$Res>
    extends _$UserResponseCopyWithImpl<$Res, _$UserResponseImpl>
    implements _$$UserResponseImplCopyWith<$Res> {
  __$$UserResponseImplCopyWithImpl(
      _$UserResponseImpl _value, $Res Function(_$UserResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? token = freezed,
    Object? message = freezed,
    Object? status = freezed,
  }) {
    return _then(_$UserResponseImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$UserResponseImpl implements _UserResponse {
  const _$UserResponseImpl({this.user, this.token, this.message, this.status});

  factory _$UserResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserResponseImplFromJson(json);

  @override
  final User? user;
  @override
  final String? token;
  @override
  final String? message;
  @override
  final int? status;

  @override
  String toString() {
    return 'UserResponse(user: $user, token: $token, message: $message, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserResponseImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, user, token, message, status);

  /// Create a copy of UserResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserResponseImplCopyWith<_$UserResponseImpl> get copyWith =>
      __$$UserResponseImplCopyWithImpl<_$UserResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserResponseImplToJson(
      this,
    );
  }
}

abstract class _UserResponse implements UserResponse {
  const factory _UserResponse(
      {final User? user,
      final String? token,
      final String? message,
      final int? status}) = _$UserResponseImpl;

  factory _UserResponse.fromJson(Map<String, dynamic> json) =
      _$UserResponseImpl.fromJson;

  @override
  User? get user;
  @override
  String? get token;
  @override
  String? get message;
  @override
  int? get status;

  /// Create a copy of UserResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserResponseImplCopyWith<_$UserResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  int get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get countryCode => throw _privateConstructorUsedError;
  String? get mobileNo => throw _privateConstructorUsedError;
  String? get firebaseToken => throw _privateConstructorUsedError;
  int? get isActive => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  Admin? get adminDetail => throw _privateConstructorUsedError;
  List<Trainer>? get trainerDetail => throw _privateConstructorUsedError;
  List<StudentDetail>? get studentDetail => throw _privateConstructorUsedError;
  List<BranchManagerResponse>? get managerDetail =>
      throw _privateConstructorUsedError;

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {int id,
      String? name,
      String? countryCode,
      String? mobileNo,
      String? firebaseToken,
      int? isActive,
      DateTime? createdAt,
      DateTime? updatedAt,
      Admin? adminDetail,
      List<Trainer>? trainerDetail,
      List<StudentDetail>? studentDetail,
      List<BranchManagerResponse>? managerDetail});

  $AdminCopyWith<$Res>? get adminDetail;
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? countryCode = freezed,
    Object? mobileNo = freezed,
    Object? firebaseToken = freezed,
    Object? isActive = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? adminDetail = freezed,
    Object? trainerDetail = freezed,
    Object? studentDetail = freezed,
    Object? managerDetail = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNo: freezed == mobileNo
          ? _value.mobileNo
          : mobileNo // ignore: cast_nullable_to_non_nullable
              as String?,
      firebaseToken: freezed == firebaseToken
          ? _value.firebaseToken
          : firebaseToken // ignore: cast_nullable_to_non_nullable
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
      adminDetail: freezed == adminDetail
          ? _value.adminDetail
          : adminDetail // ignore: cast_nullable_to_non_nullable
              as Admin?,
      trainerDetail: freezed == trainerDetail
          ? _value.trainerDetail
          : trainerDetail // ignore: cast_nullable_to_non_nullable
              as List<Trainer>?,
      studentDetail: freezed == studentDetail
          ? _value.studentDetail
          : studentDetail // ignore: cast_nullable_to_non_nullable
              as List<StudentDetail>?,
      managerDetail: freezed == managerDetail
          ? _value.managerDetail
          : managerDetail // ignore: cast_nullable_to_non_nullable
              as List<BranchManagerResponse>?,
    ) as $Val);
  }

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AdminCopyWith<$Res>? get adminDetail {
    if (_value.adminDetail == null) {
      return null;
    }

    return $AdminCopyWith<$Res>(_value.adminDetail!, (value) {
      return _then(_value.copyWith(adminDetail: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String? name,
      String? countryCode,
      String? mobileNo,
      String? firebaseToken,
      int? isActive,
      DateTime? createdAt,
      DateTime? updatedAt,
      Admin? adminDetail,
      List<Trainer>? trainerDetail,
      List<StudentDetail>? studentDetail,
      List<BranchManagerResponse>? managerDetail});

  @override
  $AdminCopyWith<$Res>? get adminDetail;
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? countryCode = freezed,
    Object? mobileNo = freezed,
    Object? firebaseToken = freezed,
    Object? isActive = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? adminDetail = freezed,
    Object? trainerDetail = freezed,
    Object? studentDetail = freezed,
    Object? managerDetail = freezed,
  }) {
    return _then(_$UserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNo: freezed == mobileNo
          ? _value.mobileNo
          : mobileNo // ignore: cast_nullable_to_non_nullable
              as String?,
      firebaseToken: freezed == firebaseToken
          ? _value.firebaseToken
          : firebaseToken // ignore: cast_nullable_to_non_nullable
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
      adminDetail: freezed == adminDetail
          ? _value.adminDetail
          : adminDetail // ignore: cast_nullable_to_non_nullable
              as Admin?,
      trainerDetail: freezed == trainerDetail
          ? _value._trainerDetail
          : trainerDetail // ignore: cast_nullable_to_non_nullable
              as List<Trainer>?,
      studentDetail: freezed == studentDetail
          ? _value._studentDetail
          : studentDetail // ignore: cast_nullable_to_non_nullable
              as List<StudentDetail>?,
      managerDetail: freezed == managerDetail
          ? _value._managerDetail
          : managerDetail // ignore: cast_nullable_to_non_nullable
              as List<BranchManagerResponse>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$UserImpl implements _User {
  const _$UserImpl(
      {required this.id,
      this.name,
      this.countryCode,
      this.mobileNo,
      this.firebaseToken,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.adminDetail,
      final List<Trainer>? trainerDetail,
      final List<StudentDetail>? studentDetail,
      final List<BranchManagerResponse>? managerDetail})
      : _trainerDetail = trainerDetail,
        _studentDetail = studentDetail,
        _managerDetail = managerDetail;

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final int id;
  @override
  final String? name;
  @override
  final String? countryCode;
  @override
  final String? mobileNo;
  @override
  final String? firebaseToken;
  @override
  final int? isActive;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final Admin? adminDetail;
  final List<Trainer>? _trainerDetail;
  @override
  List<Trainer>? get trainerDetail {
    final value = _trainerDetail;
    if (value == null) return null;
    if (_trainerDetail is EqualUnmodifiableListView) return _trainerDetail;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<StudentDetail>? _studentDetail;
  @override
  List<StudentDetail>? get studentDetail {
    final value = _studentDetail;
    if (value == null) return null;
    if (_studentDetail is EqualUnmodifiableListView) return _studentDetail;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<BranchManagerResponse>? _managerDetail;
  @override
  List<BranchManagerResponse>? get managerDetail {
    final value = _managerDetail;
    if (value == null) return null;
    if (_managerDetail is EqualUnmodifiableListView) return _managerDetail;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'User(id: $id, name: $name, countryCode: $countryCode, mobileNo: $mobileNo, firebaseToken: $firebaseToken, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt, adminDetail: $adminDetail, trainerDetail: $trainerDetail, studentDetail: $studentDetail, managerDetail: $managerDetail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.mobileNo, mobileNo) ||
                other.mobileNo == mobileNo) &&
            (identical(other.firebaseToken, firebaseToken) ||
                other.firebaseToken == firebaseToken) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.adminDetail, adminDetail) ||
                other.adminDetail == adminDetail) &&
            const DeepCollectionEquality()
                .equals(other._trainerDetail, _trainerDetail) &&
            const DeepCollectionEquality()
                .equals(other._studentDetail, _studentDetail) &&
            const DeepCollectionEquality()
                .equals(other._managerDetail, _managerDetail));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      countryCode,
      mobileNo,
      firebaseToken,
      isActive,
      createdAt,
      updatedAt,
      adminDetail,
      const DeepCollectionEquality().hash(_trainerDetail),
      const DeepCollectionEquality().hash(_studentDetail),
      const DeepCollectionEquality().hash(_managerDetail));

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {required final int id,
      final String? name,
      final String? countryCode,
      final String? mobileNo,
      final String? firebaseToken,
      final int? isActive,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      final Admin? adminDetail,
      final List<Trainer>? trainerDetail,
      final List<StudentDetail>? studentDetail,
      final List<BranchManagerResponse>? managerDetail}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  int get id;
  @override
  String? get name;
  @override
  String? get countryCode;
  @override
  String? get mobileNo;
  @override
  String? get firebaseToken;
  @override
  int? get isActive;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  Admin? get adminDetail;
  @override
  List<Trainer>? get trainerDetail;
  @override
  List<StudentDetail>? get studentDetail;
  @override
  List<BranchManagerResponse>? get managerDetail;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Admin _$AdminFromJson(Map<String, dynamic> json) {
  return _Admin.fromJson(json);
}

/// @nodoc
mixin _$Admin {
  int get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  int? get userId => throw _privateConstructorUsedError;
  String? get whatsappNo => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  DateTime? get dob => throw _privateConstructorUsedError;
  DateTime? get doj => throw _privateConstructorUsedError;
  String? get profilePic => throw _privateConstructorUsedError;
  String? get profilePicType => throw _privateConstructorUsedError;
  int? get isActive => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  Academy? get academy => throw _privateConstructorUsedError;

  /// Serializes this Admin to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Admin
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdminCopyWith<Admin> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminCopyWith<$Res> {
  factory $AdminCopyWith(Admin value, $Res Function(Admin) then) =
      _$AdminCopyWithImpl<$Res, Admin>;
  @useResult
  $Res call(
      {int id,
      String? name,
      int? userId,
      String? whatsappNo,
      String? email,
      String? gender,
      DateTime? dob,
      DateTime? doj,
      String? profilePic,
      String? profilePicType,
      int? isActive,
      DateTime? createdAt,
      DateTime? updatedAt,
      Academy? academy});

  $AcademyCopyWith<$Res>? get academy;
}

/// @nodoc
class _$AdminCopyWithImpl<$Res, $Val extends Admin>
    implements $AdminCopyWith<$Res> {
  _$AdminCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Admin
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? userId = freezed,
    Object? whatsappNo = freezed,
    Object? email = freezed,
    Object? gender = freezed,
    Object? dob = freezed,
    Object? doj = freezed,
    Object? profilePic = freezed,
    Object? profilePicType = freezed,
    Object? isActive = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? academy = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      whatsappNo: freezed == whatsappNo
          ? _value.whatsappNo
          : whatsappNo // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      doj: freezed == doj
          ? _value.doj
          : doj // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      profilePic: freezed == profilePic
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePicType: freezed == profilePicType
          ? _value.profilePicType
          : profilePicType // ignore: cast_nullable_to_non_nullable
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
      academy: freezed == academy
          ? _value.academy
          : academy // ignore: cast_nullable_to_non_nullable
              as Academy?,
    ) as $Val);
  }

  /// Create a copy of Admin
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AcademyCopyWith<$Res>? get academy {
    if (_value.academy == null) {
      return null;
    }

    return $AcademyCopyWith<$Res>(_value.academy!, (value) {
      return _then(_value.copyWith(academy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AdminImplCopyWith<$Res> implements $AdminCopyWith<$Res> {
  factory _$$AdminImplCopyWith(
          _$AdminImpl value, $Res Function(_$AdminImpl) then) =
      __$$AdminImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String? name,
      int? userId,
      String? whatsappNo,
      String? email,
      String? gender,
      DateTime? dob,
      DateTime? doj,
      String? profilePic,
      String? profilePicType,
      int? isActive,
      DateTime? createdAt,
      DateTime? updatedAt,
      Academy? academy});

  @override
  $AcademyCopyWith<$Res>? get academy;
}

/// @nodoc
class __$$AdminImplCopyWithImpl<$Res>
    extends _$AdminCopyWithImpl<$Res, _$AdminImpl>
    implements _$$AdminImplCopyWith<$Res> {
  __$$AdminImplCopyWithImpl(
      _$AdminImpl _value, $Res Function(_$AdminImpl) _then)
      : super(_value, _then);

  /// Create a copy of Admin
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? userId = freezed,
    Object? whatsappNo = freezed,
    Object? email = freezed,
    Object? gender = freezed,
    Object? dob = freezed,
    Object? doj = freezed,
    Object? profilePic = freezed,
    Object? profilePicType = freezed,
    Object? isActive = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? academy = freezed,
  }) {
    return _then(_$AdminImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      whatsappNo: freezed == whatsappNo
          ? _value.whatsappNo
          : whatsappNo // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      doj: freezed == doj
          ? _value.doj
          : doj // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      profilePic: freezed == profilePic
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePicType: freezed == profilePicType
          ? _value.profilePicType
          : profilePicType // ignore: cast_nullable_to_non_nullable
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
      academy: freezed == academy
          ? _value.academy
          : academy // ignore: cast_nullable_to_non_nullable
              as Academy?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$AdminImpl implements _Admin {
  const _$AdminImpl(
      {required this.id,
      this.name,
      this.userId,
      this.whatsappNo,
      this.email,
      this.gender,
      this.dob,
      this.doj,
      this.profilePic,
      this.profilePicType,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.academy});

  factory _$AdminImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdminImplFromJson(json);

  @override
  final int id;
  @override
  final String? name;
  @override
  final int? userId;
  @override
  final String? whatsappNo;
  @override
  final String? email;
  @override
  final String? gender;
  @override
  final DateTime? dob;
  @override
  final DateTime? doj;
  @override
  final String? profilePic;
  @override
  final String? profilePicType;
  @override
  final int? isActive;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final Academy? academy;

  @override
  String toString() {
    return 'Admin(id: $id, name: $name, userId: $userId, whatsappNo: $whatsappNo, email: $email, gender: $gender, dob: $dob, doj: $doj, profilePic: $profilePic, profilePicType: $profilePicType, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt, academy: $academy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.whatsappNo, whatsappNo) ||
                other.whatsappNo == whatsappNo) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            (identical(other.doj, doj) || other.doj == doj) &&
            (identical(other.profilePic, profilePic) ||
                other.profilePic == profilePic) &&
            (identical(other.profilePicType, profilePicType) ||
                other.profilePicType == profilePicType) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.academy, academy) || other.academy == academy));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      userId,
      whatsappNo,
      email,
      gender,
      dob,
      doj,
      profilePic,
      profilePicType,
      isActive,
      createdAt,
      updatedAt,
      academy);

  /// Create a copy of Admin
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminImplCopyWith<_$AdminImpl> get copyWith =>
      __$$AdminImplCopyWithImpl<_$AdminImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdminImplToJson(
      this,
    );
  }
}

abstract class _Admin implements Admin {
  const factory _Admin(
      {required final int id,
      final String? name,
      final int? userId,
      final String? whatsappNo,
      final String? email,
      final String? gender,
      final DateTime? dob,
      final DateTime? doj,
      final String? profilePic,
      final String? profilePicType,
      final int? isActive,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      final Academy? academy}) = _$AdminImpl;

  factory _Admin.fromJson(Map<String, dynamic> json) = _$AdminImpl.fromJson;

  @override
  int get id;
  @override
  String? get name;
  @override
  int? get userId;
  @override
  String? get whatsappNo;
  @override
  String? get email;
  @override
  String? get gender;
  @override
  DateTime? get dob;
  @override
  DateTime? get doj;
  @override
  String? get profilePic;
  @override
  String? get profilePicType;
  @override
  int? get isActive;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  Academy? get academy;

  /// Create a copy of Admin
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminImplCopyWith<_$AdminImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Academy _$AcademyFromJson(Map<String, dynamic> json) {
  return _Academy.fromJson(json);
}

/// @nodoc
mixin _$Academy {
  int get id => throw _privateConstructorUsedError;
  String? get academyName => throw _privateConstructorUsedError;
  int? get countryId => throw _privateConstructorUsedError;
  int? get userId => throw _privateConstructorUsedError;
  int? get stateId => throw _privateConstructorUsedError;
  int? get districtId => throw _privateConstructorUsedError;
  int? get academyTypeId => throw _privateConstructorUsedError;
  int? get membershipId => throw _privateConstructorUsedError;
  DateTime? get subscriptionDateTime => throw _privateConstructorUsedError;
  DateTime? get paidOnDate => throw _privateConstructorUsedError;
  DateTime? get validTillDate => throw _privateConstructorUsedError;
  int? get maxNoOfStudents => throw _privateConstructorUsedError;
  int? get maxNoOfBranches => throw _privateConstructorUsedError;
  int? get createdBy => throw _privateConstructorUsedError;
  dynamic get updatedBy => throw _privateConstructorUsedError;
  String? get createdFrom => throw _privateConstructorUsedError;
  int? get isActive => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  MembershipDetails? get membership => throw _privateConstructorUsedError;

  /// Serializes this Academy to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Academy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AcademyCopyWith<Academy> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AcademyCopyWith<$Res> {
  factory $AcademyCopyWith(Academy value, $Res Function(Academy) then) =
      _$AcademyCopyWithImpl<$Res, Academy>;
  @useResult
  $Res call(
      {int id,
      String? academyName,
      int? countryId,
      int? userId,
      int? stateId,
      int? districtId,
      int? academyTypeId,
      int? membershipId,
      DateTime? subscriptionDateTime,
      DateTime? paidOnDate,
      DateTime? validTillDate,
      int? maxNoOfStudents,
      int? maxNoOfBranches,
      int? createdBy,
      dynamic updatedBy,
      String? createdFrom,
      int? isActive,
      DateTime? createdAt,
      DateTime? updatedAt,
      MembershipDetails? membership});

  $MembershipDetailsCopyWith<$Res>? get membership;
}

/// @nodoc
class _$AcademyCopyWithImpl<$Res, $Val extends Academy>
    implements $AcademyCopyWith<$Res> {
  _$AcademyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Academy
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? academyName = freezed,
    Object? countryId = freezed,
    Object? userId = freezed,
    Object? stateId = freezed,
    Object? districtId = freezed,
    Object? academyTypeId = freezed,
    Object? membershipId = freezed,
    Object? subscriptionDateTime = freezed,
    Object? paidOnDate = freezed,
    Object? validTillDate = freezed,
    Object? maxNoOfStudents = freezed,
    Object? maxNoOfBranches = freezed,
    Object? createdBy = freezed,
    Object? updatedBy = freezed,
    Object? createdFrom = freezed,
    Object? isActive = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? membership = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      academyName: freezed == academyName
          ? _value.academyName
          : academyName // ignore: cast_nullable_to_non_nullable
              as String?,
      countryId: freezed == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      stateId: freezed == stateId
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as int?,
      districtId: freezed == districtId
          ? _value.districtId
          : districtId // ignore: cast_nullable_to_non_nullable
              as int?,
      academyTypeId: freezed == academyTypeId
          ? _value.academyTypeId
          : academyTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      membershipId: freezed == membershipId
          ? _value.membershipId
          : membershipId // ignore: cast_nullable_to_non_nullable
              as int?,
      subscriptionDateTime: freezed == subscriptionDateTime
          ? _value.subscriptionDateTime
          : subscriptionDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      paidOnDate: freezed == paidOnDate
          ? _value.paidOnDate
          : paidOnDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      validTillDate: freezed == validTillDate
          ? _value.validTillDate
          : validTillDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      maxNoOfStudents: freezed == maxNoOfStudents
          ? _value.maxNoOfStudents
          : maxNoOfStudents // ignore: cast_nullable_to_non_nullable
              as int?,
      maxNoOfBranches: freezed == maxNoOfBranches
          ? _value.maxNoOfBranches
          : maxNoOfBranches // ignore: cast_nullable_to_non_nullable
              as int?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdFrom: freezed == createdFrom
          ? _value.createdFrom
          : createdFrom // ignore: cast_nullable_to_non_nullable
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
      membership: freezed == membership
          ? _value.membership
          : membership // ignore: cast_nullable_to_non_nullable
              as MembershipDetails?,
    ) as $Val);
  }

  /// Create a copy of Academy
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MembershipDetailsCopyWith<$Res>? get membership {
    if (_value.membership == null) {
      return null;
    }

    return $MembershipDetailsCopyWith<$Res>(_value.membership!, (value) {
      return _then(_value.copyWith(membership: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AcademyImplCopyWith<$Res> implements $AcademyCopyWith<$Res> {
  factory _$$AcademyImplCopyWith(
          _$AcademyImpl value, $Res Function(_$AcademyImpl) then) =
      __$$AcademyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String? academyName,
      int? countryId,
      int? userId,
      int? stateId,
      int? districtId,
      int? academyTypeId,
      int? membershipId,
      DateTime? subscriptionDateTime,
      DateTime? paidOnDate,
      DateTime? validTillDate,
      int? maxNoOfStudents,
      int? maxNoOfBranches,
      int? createdBy,
      dynamic updatedBy,
      String? createdFrom,
      int? isActive,
      DateTime? createdAt,
      DateTime? updatedAt,
      MembershipDetails? membership});

  @override
  $MembershipDetailsCopyWith<$Res>? get membership;
}

/// @nodoc
class __$$AcademyImplCopyWithImpl<$Res>
    extends _$AcademyCopyWithImpl<$Res, _$AcademyImpl>
    implements _$$AcademyImplCopyWith<$Res> {
  __$$AcademyImplCopyWithImpl(
      _$AcademyImpl _value, $Res Function(_$AcademyImpl) _then)
      : super(_value, _then);

  /// Create a copy of Academy
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? academyName = freezed,
    Object? countryId = freezed,
    Object? userId = freezed,
    Object? stateId = freezed,
    Object? districtId = freezed,
    Object? academyTypeId = freezed,
    Object? membershipId = freezed,
    Object? subscriptionDateTime = freezed,
    Object? paidOnDate = freezed,
    Object? validTillDate = freezed,
    Object? maxNoOfStudents = freezed,
    Object? maxNoOfBranches = freezed,
    Object? createdBy = freezed,
    Object? updatedBy = freezed,
    Object? createdFrom = freezed,
    Object? isActive = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? membership = freezed,
  }) {
    return _then(_$AcademyImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      academyName: freezed == academyName
          ? _value.academyName
          : academyName // ignore: cast_nullable_to_non_nullable
              as String?,
      countryId: freezed == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      stateId: freezed == stateId
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as int?,
      districtId: freezed == districtId
          ? _value.districtId
          : districtId // ignore: cast_nullable_to_non_nullable
              as int?,
      academyTypeId: freezed == academyTypeId
          ? _value.academyTypeId
          : academyTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      membershipId: freezed == membershipId
          ? _value.membershipId
          : membershipId // ignore: cast_nullable_to_non_nullable
              as int?,
      subscriptionDateTime: freezed == subscriptionDateTime
          ? _value.subscriptionDateTime
          : subscriptionDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      paidOnDate: freezed == paidOnDate
          ? _value.paidOnDate
          : paidOnDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      validTillDate: freezed == validTillDate
          ? _value.validTillDate
          : validTillDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      maxNoOfStudents: freezed == maxNoOfStudents
          ? _value.maxNoOfStudents
          : maxNoOfStudents // ignore: cast_nullable_to_non_nullable
              as int?,
      maxNoOfBranches: freezed == maxNoOfBranches
          ? _value.maxNoOfBranches
          : maxNoOfBranches // ignore: cast_nullable_to_non_nullable
              as int?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdFrom: freezed == createdFrom
          ? _value.createdFrom
          : createdFrom // ignore: cast_nullable_to_non_nullable
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
      membership: freezed == membership
          ? _value.membership
          : membership // ignore: cast_nullable_to_non_nullable
              as MembershipDetails?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$AcademyImpl implements _Academy {
  const _$AcademyImpl(
      {required this.id,
      this.academyName,
      this.countryId,
      this.userId,
      this.stateId,
      this.districtId,
      this.academyTypeId,
      this.membershipId,
      this.subscriptionDateTime,
      this.paidOnDate,
      this.validTillDate,
      this.maxNoOfStudents,
      this.maxNoOfBranches,
      this.createdBy,
      this.updatedBy,
      this.createdFrom,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.membership});

  factory _$AcademyImpl.fromJson(Map<String, dynamic> json) =>
      _$$AcademyImplFromJson(json);

  @override
  final int id;
  @override
  final String? academyName;
  @override
  final int? countryId;
  @override
  final int? userId;
  @override
  final int? stateId;
  @override
  final int? districtId;
  @override
  final int? academyTypeId;
  @override
  final int? membershipId;
  @override
  final DateTime? subscriptionDateTime;
  @override
  final DateTime? paidOnDate;
  @override
  final DateTime? validTillDate;
  @override
  final int? maxNoOfStudents;
  @override
  final int? maxNoOfBranches;
  @override
  final int? createdBy;
  @override
  final dynamic updatedBy;
  @override
  final String? createdFrom;
  @override
  final int? isActive;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final MembershipDetails? membership;

  @override
  String toString() {
    return 'Academy(id: $id, academyName: $academyName, countryId: $countryId, userId: $userId, stateId: $stateId, districtId: $districtId, academyTypeId: $academyTypeId, membershipId: $membershipId, subscriptionDateTime: $subscriptionDateTime, paidOnDate: $paidOnDate, validTillDate: $validTillDate, maxNoOfStudents: $maxNoOfStudents, maxNoOfBranches: $maxNoOfBranches, createdBy: $createdBy, updatedBy: $updatedBy, createdFrom: $createdFrom, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt, membership: $membership)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AcademyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.academyName, academyName) ||
                other.academyName == academyName) &&
            (identical(other.countryId, countryId) ||
                other.countryId == countryId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.stateId, stateId) || other.stateId == stateId) &&
            (identical(other.districtId, districtId) ||
                other.districtId == districtId) &&
            (identical(other.academyTypeId, academyTypeId) ||
                other.academyTypeId == academyTypeId) &&
            (identical(other.membershipId, membershipId) ||
                other.membershipId == membershipId) &&
            (identical(other.subscriptionDateTime, subscriptionDateTime) ||
                other.subscriptionDateTime == subscriptionDateTime) &&
            (identical(other.paidOnDate, paidOnDate) ||
                other.paidOnDate == paidOnDate) &&
            (identical(other.validTillDate, validTillDate) ||
                other.validTillDate == validTillDate) &&
            (identical(other.maxNoOfStudents, maxNoOfStudents) ||
                other.maxNoOfStudents == maxNoOfStudents) &&
            (identical(other.maxNoOfBranches, maxNoOfBranches) ||
                other.maxNoOfBranches == maxNoOfBranches) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            const DeepCollectionEquality().equals(other.updatedBy, updatedBy) &&
            (identical(other.createdFrom, createdFrom) ||
                other.createdFrom == createdFrom) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.membership, membership) ||
                other.membership == membership));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        academyName,
        countryId,
        userId,
        stateId,
        districtId,
        academyTypeId,
        membershipId,
        subscriptionDateTime,
        paidOnDate,
        validTillDate,
        maxNoOfStudents,
        maxNoOfBranches,
        createdBy,
        const DeepCollectionEquality().hash(updatedBy),
        createdFrom,
        isActive,
        createdAt,
        updatedAt,
        membership
      ]);

  /// Create a copy of Academy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AcademyImplCopyWith<_$AcademyImpl> get copyWith =>
      __$$AcademyImplCopyWithImpl<_$AcademyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AcademyImplToJson(
      this,
    );
  }
}

abstract class _Academy implements Academy {
  const factory _Academy(
      {required final int id,
      final String? academyName,
      final int? countryId,
      final int? userId,
      final int? stateId,
      final int? districtId,
      final int? academyTypeId,
      final int? membershipId,
      final DateTime? subscriptionDateTime,
      final DateTime? paidOnDate,
      final DateTime? validTillDate,
      final int? maxNoOfStudents,
      final int? maxNoOfBranches,
      final int? createdBy,
      final dynamic updatedBy,
      final String? createdFrom,
      final int? isActive,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      final MembershipDetails? membership}) = _$AcademyImpl;

  factory _Academy.fromJson(Map<String, dynamic> json) = _$AcademyImpl.fromJson;

  @override
  int get id;
  @override
  String? get academyName;
  @override
  int? get countryId;
  @override
  int? get userId;
  @override
  int? get stateId;
  @override
  int? get districtId;
  @override
  int? get academyTypeId;
  @override
  int? get membershipId;
  @override
  DateTime? get subscriptionDateTime;
  @override
  DateTime? get paidOnDate;
  @override
  DateTime? get validTillDate;
  @override
  int? get maxNoOfStudents;
  @override
  int? get maxNoOfBranches;
  @override
  int? get createdBy;
  @override
  dynamic get updatedBy;
  @override
  String? get createdFrom;
  @override
  int? get isActive;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  MembershipDetails? get membership;

  /// Create a copy of Academy
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AcademyImplCopyWith<_$AcademyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MembershipDetails _$MembershipDetailsFromJson(Map<String, dynamic> json) {
  return _MembershipDetails.fromJson(json);
}

/// @nodoc
mixin _$MembershipDetails {
  int? get id => throw _privateConstructorUsedError;
  String? get membershipType => throw _privateConstructorUsedError;
  int? get countryId => throw _privateConstructorUsedError;
  String? get period => throw _privateConstructorUsedError;
  String? get paymentType => throw _privateConstructorUsedError;
  int? get duration => throw _privateConstructorUsedError;
  int? get amount => throw _privateConstructorUsedError;
  int? get maxNoOfStudents => throw _privateConstructorUsedError;
  int? get maxNoOfBatches => throw _privateConstructorUsedError;
  int? get maxNoOfBranches => throw _privateConstructorUsedError;
  int? get isDiscounted => throw _privateConstructorUsedError;
  dynamic get discountType => throw _privateConstructorUsedError;
  int? get discountAmount => throw _privateConstructorUsedError;
  dynamic get discountPercentage => throw _privateConstructorUsedError;
  int? get sgst => throw _privateConstructorUsedError;
  int? get cgst => throw _privateConstructorUsedError;
  int? get finalAmount => throw _privateConstructorUsedError;
  int? get isActive => throw _privateConstructorUsedError;

  /// Serializes this MembershipDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MembershipDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MembershipDetailsCopyWith<MembershipDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MembershipDetailsCopyWith<$Res> {
  factory $MembershipDetailsCopyWith(
          MembershipDetails value, $Res Function(MembershipDetails) then) =
      _$MembershipDetailsCopyWithImpl<$Res, MembershipDetails>;
  @useResult
  $Res call(
      {int? id,
      String? membershipType,
      int? countryId,
      String? period,
      String? paymentType,
      int? duration,
      int? amount,
      int? maxNoOfStudents,
      int? maxNoOfBatches,
      int? maxNoOfBranches,
      int? isDiscounted,
      dynamic discountType,
      int? discountAmount,
      dynamic discountPercentage,
      int? sgst,
      int? cgst,
      int? finalAmount,
      int? isActive});
}

/// @nodoc
class _$MembershipDetailsCopyWithImpl<$Res, $Val extends MembershipDetails>
    implements $MembershipDetailsCopyWith<$Res> {
  _$MembershipDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MembershipDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? membershipType = freezed,
    Object? countryId = freezed,
    Object? period = freezed,
    Object? paymentType = freezed,
    Object? duration = freezed,
    Object? amount = freezed,
    Object? maxNoOfStudents = freezed,
    Object? maxNoOfBatches = freezed,
    Object? maxNoOfBranches = freezed,
    Object? isDiscounted = freezed,
    Object? discountType = freezed,
    Object? discountAmount = freezed,
    Object? discountPercentage = freezed,
    Object? sgst = freezed,
    Object? cgst = freezed,
    Object? finalAmount = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      membershipType: freezed == membershipType
          ? _value.membershipType
          : membershipType // ignore: cast_nullable_to_non_nullable
              as String?,
      countryId: freezed == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as int?,
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
      maxNoOfStudents: freezed == maxNoOfStudents
          ? _value.maxNoOfStudents
          : maxNoOfStudents // ignore: cast_nullable_to_non_nullable
              as int?,
      maxNoOfBatches: freezed == maxNoOfBatches
          ? _value.maxNoOfBatches
          : maxNoOfBatches // ignore: cast_nullable_to_non_nullable
              as int?,
      maxNoOfBranches: freezed == maxNoOfBranches
          ? _value.maxNoOfBranches
          : maxNoOfBranches // ignore: cast_nullable_to_non_nullable
              as int?,
      isDiscounted: freezed == isDiscounted
          ? _value.isDiscounted
          : isDiscounted // ignore: cast_nullable_to_non_nullable
              as int?,
      discountType: freezed == discountType
          ? _value.discountType
          : discountType // ignore: cast_nullable_to_non_nullable
              as dynamic,
      discountAmount: freezed == discountAmount
          ? _value.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      discountPercentage: freezed == discountPercentage
          ? _value.discountPercentage
          : discountPercentage // ignore: cast_nullable_to_non_nullable
              as dynamic,
      sgst: freezed == sgst
          ? _value.sgst
          : sgst // ignore: cast_nullable_to_non_nullable
              as int?,
      cgst: freezed == cgst
          ? _value.cgst
          : cgst // ignore: cast_nullable_to_non_nullable
              as int?,
      finalAmount: freezed == finalAmount
          ? _value.finalAmount
          : finalAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MembershipDetailsImplCopyWith<$Res>
    implements $MembershipDetailsCopyWith<$Res> {
  factory _$$MembershipDetailsImplCopyWith(_$MembershipDetailsImpl value,
          $Res Function(_$MembershipDetailsImpl) then) =
      __$$MembershipDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? membershipType,
      int? countryId,
      String? period,
      String? paymentType,
      int? duration,
      int? amount,
      int? maxNoOfStudents,
      int? maxNoOfBatches,
      int? maxNoOfBranches,
      int? isDiscounted,
      dynamic discountType,
      int? discountAmount,
      dynamic discountPercentage,
      int? sgst,
      int? cgst,
      int? finalAmount,
      int? isActive});
}

/// @nodoc
class __$$MembershipDetailsImplCopyWithImpl<$Res>
    extends _$MembershipDetailsCopyWithImpl<$Res, _$MembershipDetailsImpl>
    implements _$$MembershipDetailsImplCopyWith<$Res> {
  __$$MembershipDetailsImplCopyWithImpl(_$MembershipDetailsImpl _value,
      $Res Function(_$MembershipDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of MembershipDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? membershipType = freezed,
    Object? countryId = freezed,
    Object? period = freezed,
    Object? paymentType = freezed,
    Object? duration = freezed,
    Object? amount = freezed,
    Object? maxNoOfStudents = freezed,
    Object? maxNoOfBatches = freezed,
    Object? maxNoOfBranches = freezed,
    Object? isDiscounted = freezed,
    Object? discountType = freezed,
    Object? discountAmount = freezed,
    Object? discountPercentage = freezed,
    Object? sgst = freezed,
    Object? cgst = freezed,
    Object? finalAmount = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_$MembershipDetailsImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      membershipType: freezed == membershipType
          ? _value.membershipType
          : membershipType // ignore: cast_nullable_to_non_nullable
              as String?,
      countryId: freezed == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as int?,
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
      maxNoOfStudents: freezed == maxNoOfStudents
          ? _value.maxNoOfStudents
          : maxNoOfStudents // ignore: cast_nullable_to_non_nullable
              as int?,
      maxNoOfBatches: freezed == maxNoOfBatches
          ? _value.maxNoOfBatches
          : maxNoOfBatches // ignore: cast_nullable_to_non_nullable
              as int?,
      maxNoOfBranches: freezed == maxNoOfBranches
          ? _value.maxNoOfBranches
          : maxNoOfBranches // ignore: cast_nullable_to_non_nullable
              as int?,
      isDiscounted: freezed == isDiscounted
          ? _value.isDiscounted
          : isDiscounted // ignore: cast_nullable_to_non_nullable
              as int?,
      discountType: freezed == discountType
          ? _value.discountType
          : discountType // ignore: cast_nullable_to_non_nullable
              as dynamic,
      discountAmount: freezed == discountAmount
          ? _value.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      discountPercentage: freezed == discountPercentage
          ? _value.discountPercentage
          : discountPercentage // ignore: cast_nullable_to_non_nullable
              as dynamic,
      sgst: freezed == sgst
          ? _value.sgst
          : sgst // ignore: cast_nullable_to_non_nullable
              as int?,
      cgst: freezed == cgst
          ? _value.cgst
          : cgst // ignore: cast_nullable_to_non_nullable
              as int?,
      finalAmount: freezed == finalAmount
          ? _value.finalAmount
          : finalAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$MembershipDetailsImpl implements _MembershipDetails {
  const _$MembershipDetailsImpl(
      {this.id,
      this.membershipType,
      this.countryId,
      this.period,
      this.paymentType,
      this.duration,
      this.amount,
      this.maxNoOfStudents,
      this.maxNoOfBatches,
      this.maxNoOfBranches,
      this.isDiscounted,
      this.discountType,
      this.discountAmount,
      this.discountPercentage,
      this.sgst,
      this.cgst,
      this.finalAmount,
      this.isActive});

  factory _$MembershipDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$MembershipDetailsImplFromJson(json);

  @override
  final int? id;
  @override
  final String? membershipType;
  @override
  final int? countryId;
  @override
  final String? period;
  @override
  final String? paymentType;
  @override
  final int? duration;
  @override
  final int? amount;
  @override
  final int? maxNoOfStudents;
  @override
  final int? maxNoOfBatches;
  @override
  final int? maxNoOfBranches;
  @override
  final int? isDiscounted;
  @override
  final dynamic discountType;
  @override
  final int? discountAmount;
  @override
  final dynamic discountPercentage;
  @override
  final int? sgst;
  @override
  final int? cgst;
  @override
  final int? finalAmount;
  @override
  final int? isActive;

  @override
  String toString() {
    return 'MembershipDetails(id: $id, membershipType: $membershipType, countryId: $countryId, period: $period, paymentType: $paymentType, duration: $duration, amount: $amount, maxNoOfStudents: $maxNoOfStudents, maxNoOfBatches: $maxNoOfBatches, maxNoOfBranches: $maxNoOfBranches, isDiscounted: $isDiscounted, discountType: $discountType, discountAmount: $discountAmount, discountPercentage: $discountPercentage, sgst: $sgst, cgst: $cgst, finalAmount: $finalAmount, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MembershipDetailsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.membershipType, membershipType) ||
                other.membershipType == membershipType) &&
            (identical(other.countryId, countryId) ||
                other.countryId == countryId) &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.paymentType, paymentType) ||
                other.paymentType == paymentType) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.maxNoOfStudents, maxNoOfStudents) ||
                other.maxNoOfStudents == maxNoOfStudents) &&
            (identical(other.maxNoOfBatches, maxNoOfBatches) ||
                other.maxNoOfBatches == maxNoOfBatches) &&
            (identical(other.maxNoOfBranches, maxNoOfBranches) ||
                other.maxNoOfBranches == maxNoOfBranches) &&
            (identical(other.isDiscounted, isDiscounted) ||
                other.isDiscounted == isDiscounted) &&
            const DeepCollectionEquality()
                .equals(other.discountType, discountType) &&
            (identical(other.discountAmount, discountAmount) ||
                other.discountAmount == discountAmount) &&
            const DeepCollectionEquality()
                .equals(other.discountPercentage, discountPercentage) &&
            (identical(other.sgst, sgst) || other.sgst == sgst) &&
            (identical(other.cgst, cgst) || other.cgst == cgst) &&
            (identical(other.finalAmount, finalAmount) ||
                other.finalAmount == finalAmount) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      membershipType,
      countryId,
      period,
      paymentType,
      duration,
      amount,
      maxNoOfStudents,
      maxNoOfBatches,
      maxNoOfBranches,
      isDiscounted,
      const DeepCollectionEquality().hash(discountType),
      discountAmount,
      const DeepCollectionEquality().hash(discountPercentage),
      sgst,
      cgst,
      finalAmount,
      isActive);

  /// Create a copy of MembershipDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MembershipDetailsImplCopyWith<_$MembershipDetailsImpl> get copyWith =>
      __$$MembershipDetailsImplCopyWithImpl<_$MembershipDetailsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MembershipDetailsImplToJson(
      this,
    );
  }
}

abstract class _MembershipDetails implements MembershipDetails {
  const factory _MembershipDetails(
      {final int? id,
      final String? membershipType,
      final int? countryId,
      final String? period,
      final String? paymentType,
      final int? duration,
      final int? amount,
      final int? maxNoOfStudents,
      final int? maxNoOfBatches,
      final int? maxNoOfBranches,
      final int? isDiscounted,
      final dynamic discountType,
      final int? discountAmount,
      final dynamic discountPercentage,
      final int? sgst,
      final int? cgst,
      final int? finalAmount,
      final int? isActive}) = _$MembershipDetailsImpl;

  factory _MembershipDetails.fromJson(Map<String, dynamic> json) =
      _$MembershipDetailsImpl.fromJson;

  @override
  int? get id;
  @override
  String? get membershipType;
  @override
  int? get countryId;
  @override
  String? get period;
  @override
  String? get paymentType;
  @override
  int? get duration;
  @override
  int? get amount;
  @override
  int? get maxNoOfStudents;
  @override
  int? get maxNoOfBatches;
  @override
  int? get maxNoOfBranches;
  @override
  int? get isDiscounted;
  @override
  dynamic get discountType;
  @override
  int? get discountAmount;
  @override
  dynamic get discountPercentage;
  @override
  int? get sgst;
  @override
  int? get cgst;
  @override
  int? get finalAmount;
  @override
  int? get isActive;

  /// Create a copy of MembershipDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MembershipDetailsImplCopyWith<_$MembershipDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
