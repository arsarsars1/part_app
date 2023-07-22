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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) {
  return _UserResponse.fromJson(json);
}

/// @nodoc
mixin _$UserResponse {
  User? get user => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
abstract class _$$_UserResponseCopyWith<$Res>
    implements $UserResponseCopyWith<$Res> {
  factory _$$_UserResponseCopyWith(
          _$_UserResponse value, $Res Function(_$_UserResponse) then) =
      __$$_UserResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({User? user, String? token, String? message, int? status});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$_UserResponseCopyWithImpl<$Res>
    extends _$UserResponseCopyWithImpl<$Res, _$_UserResponse>
    implements _$$_UserResponseCopyWith<$Res> {
  __$$_UserResponseCopyWithImpl(
      _$_UserResponse _value, $Res Function(_$_UserResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? token = freezed,
    Object? message = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_UserResponse(
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
class _$_UserResponse implements _UserResponse {
  const _$_UserResponse({this.user, this.token, this.message, this.status});

  factory _$_UserResponse.fromJson(Map<String, dynamic> json) =>
      _$$_UserResponseFromJson(json);

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserResponse &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, user, token, message, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserResponseCopyWith<_$_UserResponse> get copyWith =>
      __$$_UserResponseCopyWithImpl<_$_UserResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserResponseToJson(
      this,
    );
  }
}

abstract class _UserResponse implements UserResponse {
  const factory _UserResponse(
      {final User? user,
      final String? token,
      final String? message,
      final int? status}) = _$_UserResponse;

  factory _UserResponse.fromJson(Map<String, dynamic> json) =
      _$_UserResponse.fromJson;

  @override
  User? get user;
  @override
  String? get token;
  @override
  String? get message;
  @override
  int? get status;
  @override
  @JsonKey(ignore: true)
  _$$_UserResponseCopyWith<_$_UserResponse> get copyWith =>
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
  List<dynamic>? get managerDetail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
      List<dynamic>? managerDetail});

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
              as List<dynamic>?,
    ) as $Val);
  }

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
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
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
      List<dynamic>? managerDetail});

  @override
  $AdminCopyWith<$Res>? get adminDetail;
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res, _$_User>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, _then);

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
    return _then(_$_User(
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
              as List<dynamic>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_User implements _User {
  const _$_User(
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
      final List<dynamic>? managerDetail})
      : _trainerDetail = trainerDetail,
        _studentDetail = studentDetail,
        _managerDetail = managerDetail;

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

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

  final List<dynamic>? _managerDetail;
  @override
  List<dynamic>? get managerDetail {
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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
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

  @JsonKey(ignore: true)
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(
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
      final List<dynamic>? managerDetail}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

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
  List<dynamic>? get managerDetail;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
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

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
abstract class _$$_AdminCopyWith<$Res> implements $AdminCopyWith<$Res> {
  factory _$$_AdminCopyWith(_$_Admin value, $Res Function(_$_Admin) then) =
      __$$_AdminCopyWithImpl<$Res>;
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
class __$$_AdminCopyWithImpl<$Res> extends _$AdminCopyWithImpl<$Res, _$_Admin>
    implements _$$_AdminCopyWith<$Res> {
  __$$_AdminCopyWithImpl(_$_Admin _value, $Res Function(_$_Admin) _then)
      : super(_value, _then);

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
    return _then(_$_Admin(
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
class _$_Admin implements _Admin {
  const _$_Admin(
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

  factory _$_Admin.fromJson(Map<String, dynamic> json) =>
      _$$_AdminFromJson(json);

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Admin &&
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

  @JsonKey(ignore: true)
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AdminCopyWith<_$_Admin> get copyWith =>
      __$$_AdminCopyWithImpl<_$_Admin>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AdminToJson(
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
      final Academy? academy}) = _$_Admin;

  factory _Admin.fromJson(Map<String, dynamic> json) = _$_Admin.fromJson;

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
  @override
  @JsonKey(ignore: true)
  _$$_AdminCopyWith<_$_Admin> get copyWith =>
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

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
      DateTime? updatedAt});
}

/// @nodoc
class _$AcademyCopyWithImpl<$Res, $Val extends Academy>
    implements $AcademyCopyWith<$Res> {
  _$AcademyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AcademyCopyWith<$Res> implements $AcademyCopyWith<$Res> {
  factory _$$_AcademyCopyWith(
          _$_Academy value, $Res Function(_$_Academy) then) =
      __$$_AcademyCopyWithImpl<$Res>;
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
      DateTime? updatedAt});
}

/// @nodoc
class __$$_AcademyCopyWithImpl<$Res>
    extends _$AcademyCopyWithImpl<$Res, _$_Academy>
    implements _$$_AcademyCopyWith<$Res> {
  __$$_AcademyCopyWithImpl(_$_Academy _value, $Res Function(_$_Academy) _then)
      : super(_value, _then);

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
  }) {
    return _then(_$_Academy(
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
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Academy implements _Academy {
  const _$_Academy(
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
      this.updatedAt});

  factory _$_Academy.fromJson(Map<String, dynamic> json) =>
      _$$_AcademyFromJson(json);

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
  String toString() {
    return 'Academy(id: $id, academyName: $academyName, countryId: $countryId, userId: $userId, stateId: $stateId, districtId: $districtId, academyTypeId: $academyTypeId, membershipId: $membershipId, subscriptionDateTime: $subscriptionDateTime, paidOnDate: $paidOnDate, validTillDate: $validTillDate, maxNoOfStudents: $maxNoOfStudents, maxNoOfBranches: $maxNoOfBranches, createdBy: $createdBy, updatedBy: $updatedBy, createdFrom: $createdFrom, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Academy &&
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
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
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
        updatedAt
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AcademyCopyWith<_$_Academy> get copyWith =>
      __$$_AcademyCopyWithImpl<_$_Academy>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AcademyToJson(
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
      final DateTime? updatedAt}) = _$_Academy;

  factory _Academy.fromJson(Map<String, dynamic> json) = _$_Academy.fromJson;

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
  @JsonKey(ignore: true)
  _$$_AcademyCopyWith<_$_Academy> get copyWith =>
      throw _privateConstructorUsedError;
}
