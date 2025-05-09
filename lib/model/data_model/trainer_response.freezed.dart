// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trainer_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TrainerResponse _$TrainerResponseFromJson(Map<String, dynamic> json) {
  return _TrainerResponse.fromJson(json);
}

/// @nodoc
mixin _$TrainerResponse {
  int get status => throw _privateConstructorUsedError;
  Datum? get trainers => throw _privateConstructorUsedError;
  Trainer? get trainer => throw _privateConstructorUsedError;

  /// Serializes this TrainerResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TrainerResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TrainerResponseCopyWith<TrainerResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrainerResponseCopyWith<$Res> {
  factory $TrainerResponseCopyWith(
          TrainerResponse value, $Res Function(TrainerResponse) then) =
      _$TrainerResponseCopyWithImpl<$Res, TrainerResponse>;
  @useResult
  $Res call({int status, Datum? trainers, Trainer? trainer});

  $DatumCopyWith<$Res>? get trainers;
  $TrainerCopyWith<$Res>? get trainer;
}

/// @nodoc
class _$TrainerResponseCopyWithImpl<$Res, $Val extends TrainerResponse>
    implements $TrainerResponseCopyWith<$Res> {
  _$TrainerResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TrainerResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? trainers = freezed,
    Object? trainer = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      trainers: freezed == trainers
          ? _value.trainers
          : trainers // ignore: cast_nullable_to_non_nullable
              as Datum?,
      trainer: freezed == trainer
          ? _value.trainer
          : trainer // ignore: cast_nullable_to_non_nullable
              as Trainer?,
    ) as $Val);
  }

  /// Create a copy of TrainerResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DatumCopyWith<$Res>? get trainers {
    if (_value.trainers == null) {
      return null;
    }

    return $DatumCopyWith<$Res>(_value.trainers!, (value) {
      return _then(_value.copyWith(trainers: value) as $Val);
    });
  }

  /// Create a copy of TrainerResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TrainerCopyWith<$Res>? get trainer {
    if (_value.trainer == null) {
      return null;
    }

    return $TrainerCopyWith<$Res>(_value.trainer!, (value) {
      return _then(_value.copyWith(trainer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TrainerResponseImplCopyWith<$Res>
    implements $TrainerResponseCopyWith<$Res> {
  factory _$$TrainerResponseImplCopyWith(_$TrainerResponseImpl value,
          $Res Function(_$TrainerResponseImpl) then) =
      __$$TrainerResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int status, Datum? trainers, Trainer? trainer});

  @override
  $DatumCopyWith<$Res>? get trainers;
  @override
  $TrainerCopyWith<$Res>? get trainer;
}

/// @nodoc
class __$$TrainerResponseImplCopyWithImpl<$Res>
    extends _$TrainerResponseCopyWithImpl<$Res, _$TrainerResponseImpl>
    implements _$$TrainerResponseImplCopyWith<$Res> {
  __$$TrainerResponseImplCopyWithImpl(
      _$TrainerResponseImpl _value, $Res Function(_$TrainerResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of TrainerResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? trainers = freezed,
    Object? trainer = freezed,
  }) {
    return _then(_$TrainerResponseImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      trainers: freezed == trainers
          ? _value.trainers
          : trainers // ignore: cast_nullable_to_non_nullable
              as Datum?,
      trainer: freezed == trainer
          ? _value.trainer
          : trainer // ignore: cast_nullable_to_non_nullable
              as Trainer?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$TrainerResponseImpl implements _TrainerResponse {
  const _$TrainerResponseImpl(
      {required this.status, this.trainers, this.trainer});

  factory _$TrainerResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrainerResponseImplFromJson(json);

  @override
  final int status;
  @override
  final Datum? trainers;
  @override
  final Trainer? trainer;

  @override
  String toString() {
    return 'TrainerResponse(status: $status, trainers: $trainers, trainer: $trainer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrainerResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.trainers, trainers) ||
                other.trainers == trainers) &&
            (identical(other.trainer, trainer) || other.trainer == trainer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, trainers, trainer);

  /// Create a copy of TrainerResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TrainerResponseImplCopyWith<_$TrainerResponseImpl> get copyWith =>
      __$$TrainerResponseImplCopyWithImpl<_$TrainerResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrainerResponseImplToJson(
      this,
    );
  }
}

abstract class _TrainerResponse implements TrainerResponse {
  const factory _TrainerResponse(
      {required final int status,
      final Datum? trainers,
      final Trainer? trainer}) = _$TrainerResponseImpl;

  factory _TrainerResponse.fromJson(Map<String, dynamic> json) =
      _$TrainerResponseImpl.fromJson;

  @override
  int get status;
  @override
  Datum? get trainers;
  @override
  Trainer? get trainer;

  /// Create a copy of TrainerResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TrainerResponseImplCopyWith<_$TrainerResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Datum _$DatumFromJson(Map<String, dynamic> json) {
  return _Datum.fromJson(json);
}

/// @nodoc
mixin _$Datum {
  int? get currentPage => throw _privateConstructorUsedError;
  List<Trainer> get data => throw _privateConstructorUsedError;
  int? get from => throw _privateConstructorUsedError;
  int? get perPage => throw _privateConstructorUsedError;
  int? get to => throw _privateConstructorUsedError;
  String? get nextPageUrl => throw _privateConstructorUsedError;

  /// Serializes this Datum to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Datum
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DatumCopyWith<Datum> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DatumCopyWith<$Res> {
  factory $DatumCopyWith(Datum value, $Res Function(Datum) then) =
      _$DatumCopyWithImpl<$Res, Datum>;
  @useResult
  $Res call(
      {int? currentPage,
      List<Trainer> data,
      int? from,
      int? perPage,
      int? to,
      String? nextPageUrl});
}

/// @nodoc
class _$DatumCopyWithImpl<$Res, $Val extends Datum>
    implements $DatumCopyWith<$Res> {
  _$DatumCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Datum
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = freezed,
    Object? data = null,
    Object? from = freezed,
    Object? perPage = freezed,
    Object? to = freezed,
    Object? nextPageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      currentPage: freezed == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Trainer>,
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
      nextPageUrl: freezed == nextPageUrl
          ? _value.nextPageUrl
          : nextPageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
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
      {int? currentPage,
      List<Trainer> data,
      int? from,
      int? perPage,
      int? to,
      String? nextPageUrl});
}

/// @nodoc
class __$$DatumImplCopyWithImpl<$Res>
    extends _$DatumCopyWithImpl<$Res, _$DatumImpl>
    implements _$$DatumImplCopyWith<$Res> {
  __$$DatumImplCopyWithImpl(
      _$DatumImpl _value, $Res Function(_$DatumImpl) _then)
      : super(_value, _then);

  /// Create a copy of Datum
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = freezed,
    Object? data = null,
    Object? from = freezed,
    Object? perPage = freezed,
    Object? to = freezed,
    Object? nextPageUrl = freezed,
  }) {
    return _then(_$DatumImpl(
      currentPage: freezed == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int?,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Trainer>,
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
      nextPageUrl: freezed == nextPageUrl
          ? _value.nextPageUrl
          : nextPageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$DatumImpl implements _Datum {
  const _$DatumImpl(
      {this.currentPage,
      required final List<Trainer> data,
      this.from,
      this.perPage,
      this.to,
      this.nextPageUrl})
      : _data = data;

  factory _$DatumImpl.fromJson(Map<String, dynamic> json) =>
      _$$DatumImplFromJson(json);

  @override
  final int? currentPage;
  final List<Trainer> _data;
  @override
  List<Trainer> get data {
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
  final String? nextPageUrl;

  @override
  String toString() {
    return 'Datum(currentPage: $currentPage, data: $data, from: $from, perPage: $perPage, to: $to, nextPageUrl: $nextPageUrl)';
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
            (identical(other.to, to) || other.to == to) &&
            (identical(other.nextPageUrl, nextPageUrl) ||
                other.nextPageUrl == nextPageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentPage,
      const DeepCollectionEquality().hash(_data),
      from,
      perPage,
      to,
      nextPageUrl);

  /// Create a copy of Datum
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      required final List<Trainer> data,
      final int? from,
      final int? perPage,
      final int? to,
      final String? nextPageUrl}) = _$DatumImpl;

  factory _Datum.fromJson(Map<String, dynamic> json) = _$DatumImpl.fromJson;

  @override
  int? get currentPage;
  @override
  List<Trainer> get data;
  @override
  int? get from;
  @override
  int? get perPage;
  @override
  int? get to;
  @override
  String? get nextPageUrl;

  /// Create a copy of Datum
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DatumImplCopyWith<_$DatumImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Trainer _$TrainerFromJson(Map<String, dynamic> json) {
  return _Trainer.fromJson(json);
}

/// @nodoc
mixin _$Trainer {
  int get id => throw _privateConstructorUsedError;
  int? get userId => throw _privateConstructorUsedError;
  int? get academyId => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  DateTime? get dob => throw _privateConstructorUsedError;
  DateTime? get doj => throw _privateConstructorUsedError;
  String? get whatsappNo => throw _privateConstructorUsedError;
  String? get mobileNo => throw _privateConstructorUsedError;
  String? get countryCode => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get upiId => throw _privateConstructorUsedError;
  String? get salaryType => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get expertise => throw _privateConstructorUsedError;
  int? get salaryDate => throw _privateConstructorUsedError;
  int? get salaryAmount => throw _privateConstructorUsedError;
  String? get profilePic => throw _privateConstructorUsedError;
  String? get profilePicType => throw _privateConstructorUsedError;
  int? get trainerDetailId => throw _privateConstructorUsedError;
  int? get isActive => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  Academy? get academy => throw _privateConstructorUsedError;
  List<Branch>? get branches => throw _privateConstructorUsedError;
  @JsonKey(name: 'document_1')
  String? get document1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'document_2')
  String? get document2 => throw _privateConstructorUsedError;
  List<Trainer>? get trainerDetail => throw _privateConstructorUsedError;

  /// Serializes this Trainer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Trainer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TrainerCopyWith<Trainer> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrainerCopyWith<$Res> {
  factory $TrainerCopyWith(Trainer value, $Res Function(Trainer) then) =
      _$TrainerCopyWithImpl<$Res, Trainer>;
  @useResult
  $Res call(
      {int id,
      int? userId,
      int? academyId,
      String? gender,
      DateTime? dob,
      DateTime? doj,
      String? whatsappNo,
      String? mobileNo,
      String? countryCode,
      String? name,
      String? email,
      String? upiId,
      String? salaryType,
      String? address,
      String? expertise,
      int? salaryDate,
      int? salaryAmount,
      String? profilePic,
      String? profilePicType,
      int? trainerDetailId,
      int? isActive,
      User? user,
      Academy? academy,
      List<Branch>? branches,
      @JsonKey(name: 'document_1') String? document1,
      @JsonKey(name: 'document_2') String? document2,
      List<Trainer>? trainerDetail});

  $UserCopyWith<$Res>? get user;
  $AcademyCopyWith<$Res>? get academy;
}

/// @nodoc
class _$TrainerCopyWithImpl<$Res, $Val extends Trainer>
    implements $TrainerCopyWith<$Res> {
  _$TrainerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Trainer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? academyId = freezed,
    Object? gender = freezed,
    Object? dob = freezed,
    Object? doj = freezed,
    Object? whatsappNo = freezed,
    Object? mobileNo = freezed,
    Object? countryCode = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? upiId = freezed,
    Object? salaryType = freezed,
    Object? address = freezed,
    Object? expertise = freezed,
    Object? salaryDate = freezed,
    Object? salaryAmount = freezed,
    Object? profilePic = freezed,
    Object? profilePicType = freezed,
    Object? trainerDetailId = freezed,
    Object? isActive = freezed,
    Object? user = freezed,
    Object? academy = freezed,
    Object? branches = freezed,
    Object? document1 = freezed,
    Object? document2 = freezed,
    Object? trainerDetail = freezed,
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
      mobileNo: freezed == mobileNo
          ? _value.mobileNo
          : mobileNo // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      upiId: freezed == upiId
          ? _value.upiId
          : upiId // ignore: cast_nullable_to_non_nullable
              as String?,
      salaryType: freezed == salaryType
          ? _value.salaryType
          : salaryType // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      expertise: freezed == expertise
          ? _value.expertise
          : expertise // ignore: cast_nullable_to_non_nullable
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
      trainerDetailId: freezed == trainerDetailId
          ? _value.trainerDetailId
          : trainerDetailId // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      academy: freezed == academy
          ? _value.academy
          : academy // ignore: cast_nullable_to_non_nullable
              as Academy?,
      branches: freezed == branches
          ? _value.branches
          : branches // ignore: cast_nullable_to_non_nullable
              as List<Branch>?,
      document1: freezed == document1
          ? _value.document1
          : document1 // ignore: cast_nullable_to_non_nullable
              as String?,
      document2: freezed == document2
          ? _value.document2
          : document2 // ignore: cast_nullable_to_non_nullable
              as String?,
      trainerDetail: freezed == trainerDetail
          ? _value.trainerDetail
          : trainerDetail // ignore: cast_nullable_to_non_nullable
              as List<Trainer>?,
    ) as $Val);
  }

  /// Create a copy of Trainer
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

  /// Create a copy of Trainer
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
abstract class _$$TrainerImplCopyWith<$Res> implements $TrainerCopyWith<$Res> {
  factory _$$TrainerImplCopyWith(
          _$TrainerImpl value, $Res Function(_$TrainerImpl) then) =
      __$$TrainerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int? userId,
      int? academyId,
      String? gender,
      DateTime? dob,
      DateTime? doj,
      String? whatsappNo,
      String? mobileNo,
      String? countryCode,
      String? name,
      String? email,
      String? upiId,
      String? salaryType,
      String? address,
      String? expertise,
      int? salaryDate,
      int? salaryAmount,
      String? profilePic,
      String? profilePicType,
      int? trainerDetailId,
      int? isActive,
      User? user,
      Academy? academy,
      List<Branch>? branches,
      @JsonKey(name: 'document_1') String? document1,
      @JsonKey(name: 'document_2') String? document2,
      List<Trainer>? trainerDetail});

  @override
  $UserCopyWith<$Res>? get user;
  @override
  $AcademyCopyWith<$Res>? get academy;
}

/// @nodoc
class __$$TrainerImplCopyWithImpl<$Res>
    extends _$TrainerCopyWithImpl<$Res, _$TrainerImpl>
    implements _$$TrainerImplCopyWith<$Res> {
  __$$TrainerImplCopyWithImpl(
      _$TrainerImpl _value, $Res Function(_$TrainerImpl) _then)
      : super(_value, _then);

  /// Create a copy of Trainer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? academyId = freezed,
    Object? gender = freezed,
    Object? dob = freezed,
    Object? doj = freezed,
    Object? whatsappNo = freezed,
    Object? mobileNo = freezed,
    Object? countryCode = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? upiId = freezed,
    Object? salaryType = freezed,
    Object? address = freezed,
    Object? expertise = freezed,
    Object? salaryDate = freezed,
    Object? salaryAmount = freezed,
    Object? profilePic = freezed,
    Object? profilePicType = freezed,
    Object? trainerDetailId = freezed,
    Object? isActive = freezed,
    Object? user = freezed,
    Object? academy = freezed,
    Object? branches = freezed,
    Object? document1 = freezed,
    Object? document2 = freezed,
    Object? trainerDetail = freezed,
  }) {
    return _then(_$TrainerImpl(
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
      mobileNo: freezed == mobileNo
          ? _value.mobileNo
          : mobileNo // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      upiId: freezed == upiId
          ? _value.upiId
          : upiId // ignore: cast_nullable_to_non_nullable
              as String?,
      salaryType: freezed == salaryType
          ? _value.salaryType
          : salaryType // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      expertise: freezed == expertise
          ? _value.expertise
          : expertise // ignore: cast_nullable_to_non_nullable
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
      trainerDetailId: freezed == trainerDetailId
          ? _value.trainerDetailId
          : trainerDetailId // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      academy: freezed == academy
          ? _value.academy
          : academy // ignore: cast_nullable_to_non_nullable
              as Academy?,
      branches: freezed == branches
          ? _value._branches
          : branches // ignore: cast_nullable_to_non_nullable
              as List<Branch>?,
      document1: freezed == document1
          ? _value.document1
          : document1 // ignore: cast_nullable_to_non_nullable
              as String?,
      document2: freezed == document2
          ? _value.document2
          : document2 // ignore: cast_nullable_to_non_nullable
              as String?,
      trainerDetail: freezed == trainerDetail
          ? _value._trainerDetail
          : trainerDetail // ignore: cast_nullable_to_non_nullable
              as List<Trainer>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$TrainerImpl implements _Trainer {
  const _$TrainerImpl(
      {required this.id,
      this.userId,
      this.academyId,
      this.gender,
      this.dob,
      this.doj,
      this.whatsappNo,
      this.mobileNo,
      this.countryCode,
      this.name,
      this.email,
      this.upiId,
      this.salaryType,
      this.address,
      this.expertise,
      this.salaryDate,
      this.salaryAmount,
      this.profilePic,
      this.profilePicType,
      this.trainerDetailId,
      this.isActive,
      this.user,
      this.academy,
      final List<Branch>? branches,
      @JsonKey(name: 'document_1') this.document1,
      @JsonKey(name: 'document_2') this.document2,
      final List<Trainer>? trainerDetail})
      : _branches = branches,
        _trainerDetail = trainerDetail;

  factory _$TrainerImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrainerImplFromJson(json);

  @override
  final int id;
  @override
  final int? userId;
  @override
  final int? academyId;
  @override
  final String? gender;
  @override
  final DateTime? dob;
  @override
  final DateTime? doj;
  @override
  final String? whatsappNo;
  @override
  final String? mobileNo;
  @override
  final String? countryCode;
  @override
  final String? name;
  @override
  final String? email;
  @override
  final String? upiId;
  @override
  final String? salaryType;
  @override
  final String? address;
  @override
  final String? expertise;
  @override
  final int? salaryDate;
  @override
  final int? salaryAmount;
  @override
  final String? profilePic;
  @override
  final String? profilePicType;
  @override
  final int? trainerDetailId;
  @override
  final int? isActive;
  @override
  final User? user;
  @override
  final Academy? academy;
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
  @JsonKey(name: 'document_1')
  final String? document1;
  @override
  @JsonKey(name: 'document_2')
  final String? document2;
  final List<Trainer>? _trainerDetail;
  @override
  List<Trainer>? get trainerDetail {
    final value = _trainerDetail;
    if (value == null) return null;
    if (_trainerDetail is EqualUnmodifiableListView) return _trainerDetail;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Trainer(id: $id, userId: $userId, academyId: $academyId, gender: $gender, dob: $dob, doj: $doj, whatsappNo: $whatsappNo, mobileNo: $mobileNo, countryCode: $countryCode, name: $name, email: $email, upiId: $upiId, salaryType: $salaryType, address: $address, expertise: $expertise, salaryDate: $salaryDate, salaryAmount: $salaryAmount, profilePic: $profilePic, profilePicType: $profilePicType, trainerDetailId: $trainerDetailId, isActive: $isActive, user: $user, academy: $academy, branches: $branches, document1: $document1, document2: $document2, trainerDetail: $trainerDetail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrainerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.academyId, academyId) ||
                other.academyId == academyId) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            (identical(other.doj, doj) || other.doj == doj) &&
            (identical(other.whatsappNo, whatsappNo) ||
                other.whatsappNo == whatsappNo) &&
            (identical(other.mobileNo, mobileNo) ||
                other.mobileNo == mobileNo) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.upiId, upiId) || other.upiId == upiId) &&
            (identical(other.salaryType, salaryType) ||
                other.salaryType == salaryType) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.expertise, expertise) ||
                other.expertise == expertise) &&
            (identical(other.salaryDate, salaryDate) ||
                other.salaryDate == salaryDate) &&
            (identical(other.salaryAmount, salaryAmount) ||
                other.salaryAmount == salaryAmount) &&
            (identical(other.profilePic, profilePic) ||
                other.profilePic == profilePic) &&
            (identical(other.profilePicType, profilePicType) ||
                other.profilePicType == profilePicType) &&
            (identical(other.trainerDetailId, trainerDetailId) ||
                other.trainerDetailId == trainerDetailId) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.academy, academy) || other.academy == academy) &&
            const DeepCollectionEquality().equals(other._branches, _branches) &&
            (identical(other.document1, document1) ||
                other.document1 == document1) &&
            (identical(other.document2, document2) ||
                other.document2 == document2) &&
            const DeepCollectionEquality()
                .equals(other._trainerDetail, _trainerDetail));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        userId,
        academyId,
        gender,
        dob,
        doj,
        whatsappNo,
        mobileNo,
        countryCode,
        name,
        email,
        upiId,
        salaryType,
        address,
        expertise,
        salaryDate,
        salaryAmount,
        profilePic,
        profilePicType,
        trainerDetailId,
        isActive,
        user,
        academy,
        const DeepCollectionEquality().hash(_branches),
        document1,
        document2,
        const DeepCollectionEquality().hash(_trainerDetail)
      ]);

  /// Create a copy of Trainer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TrainerImplCopyWith<_$TrainerImpl> get copyWith =>
      __$$TrainerImplCopyWithImpl<_$TrainerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrainerImplToJson(
      this,
    );
  }
}

abstract class _Trainer implements Trainer {
  const factory _Trainer(
      {required final int id,
      final int? userId,
      final int? academyId,
      final String? gender,
      final DateTime? dob,
      final DateTime? doj,
      final String? whatsappNo,
      final String? mobileNo,
      final String? countryCode,
      final String? name,
      final String? email,
      final String? upiId,
      final String? salaryType,
      final String? address,
      final String? expertise,
      final int? salaryDate,
      final int? salaryAmount,
      final String? profilePic,
      final String? profilePicType,
      final int? trainerDetailId,
      final int? isActive,
      final User? user,
      final Academy? academy,
      final List<Branch>? branches,
      @JsonKey(name: 'document_1') final String? document1,
      @JsonKey(name: 'document_2') final String? document2,
      final List<Trainer>? trainerDetail}) = _$TrainerImpl;

  factory _Trainer.fromJson(Map<String, dynamic> json) = _$TrainerImpl.fromJson;

  @override
  int get id;
  @override
  int? get userId;
  @override
  int? get academyId;
  @override
  String? get gender;
  @override
  DateTime? get dob;
  @override
  DateTime? get doj;
  @override
  String? get whatsappNo;
  @override
  String? get mobileNo;
  @override
  String? get countryCode;
  @override
  String? get name;
  @override
  String? get email;
  @override
  String? get upiId;
  @override
  String? get salaryType;
  @override
  String? get address;
  @override
  String? get expertise;
  @override
  int? get salaryDate;
  @override
  int? get salaryAmount;
  @override
  String? get profilePic;
  @override
  String? get profilePicType;
  @override
  int? get trainerDetailId;
  @override
  int? get isActive;
  @override
  User? get user;
  @override
  Academy? get academy;
  @override
  List<Branch>? get branches;
  @override
  @JsonKey(name: 'document_1')
  String? get document1;
  @override
  @JsonKey(name: 'document_2')
  String? get document2;
  @override
  List<Trainer>? get trainerDetail;

  /// Create a copy of Trainer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TrainerImplCopyWith<_$TrainerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Document _$DocumentFromJson(Map<String, dynamic> json) {
  return _Document.fromJson(json);
}

/// @nodoc
mixin _$Document {
  int? get id => throw _privateConstructorUsedError;
  int? get documentIndex => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get ofType => throw _privateConstructorUsedError;
  int? get ofId => throw _privateConstructorUsedError;
  int? get isAvailable => throw _privateConstructorUsedError;

  /// Serializes this Document to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Document
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DocumentCopyWith<Document> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocumentCopyWith<$Res> {
  factory $DocumentCopyWith(Document value, $Res Function(Document) then) =
      _$DocumentCopyWithImpl<$Res, Document>;
  @useResult
  $Res call(
      {int? id,
      int? documentIndex,
      String? image,
      String? ofType,
      int? ofId,
      int? isAvailable});
}

/// @nodoc
class _$DocumentCopyWithImpl<$Res, $Val extends Document>
    implements $DocumentCopyWith<$Res> {
  _$DocumentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Document
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? documentIndex = freezed,
    Object? image = freezed,
    Object? ofType = freezed,
    Object? ofId = freezed,
    Object? isAvailable = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      documentIndex: freezed == documentIndex
          ? _value.documentIndex
          : documentIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      ofType: freezed == ofType
          ? _value.ofType
          : ofType // ignore: cast_nullable_to_non_nullable
              as String?,
      ofId: freezed == ofId
          ? _value.ofId
          : ofId // ignore: cast_nullable_to_non_nullable
              as int?,
      isAvailable: freezed == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DocumentImplCopyWith<$Res>
    implements $DocumentCopyWith<$Res> {
  factory _$$DocumentImplCopyWith(
          _$DocumentImpl value, $Res Function(_$DocumentImpl) then) =
      __$$DocumentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? documentIndex,
      String? image,
      String? ofType,
      int? ofId,
      int? isAvailable});
}

/// @nodoc
class __$$DocumentImplCopyWithImpl<$Res>
    extends _$DocumentCopyWithImpl<$Res, _$DocumentImpl>
    implements _$$DocumentImplCopyWith<$Res> {
  __$$DocumentImplCopyWithImpl(
      _$DocumentImpl _value, $Res Function(_$DocumentImpl) _then)
      : super(_value, _then);

  /// Create a copy of Document
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? documentIndex = freezed,
    Object? image = freezed,
    Object? ofType = freezed,
    Object? ofId = freezed,
    Object? isAvailable = freezed,
  }) {
    return _then(_$DocumentImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      documentIndex: freezed == documentIndex
          ? _value.documentIndex
          : documentIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      ofType: freezed == ofType
          ? _value.ofType
          : ofType // ignore: cast_nullable_to_non_nullable
              as String?,
      ofId: freezed == ofId
          ? _value.ofId
          : ofId // ignore: cast_nullable_to_non_nullable
              as int?,
      isAvailable: freezed == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DocumentImpl implements _Document {
  const _$DocumentImpl(
      {this.id,
      this.documentIndex,
      this.image,
      this.ofType,
      this.ofId,
      this.isAvailable});

  factory _$DocumentImpl.fromJson(Map<String, dynamic> json) =>
      _$$DocumentImplFromJson(json);

  @override
  final int? id;
  @override
  final int? documentIndex;
  @override
  final String? image;
  @override
  final String? ofType;
  @override
  final int? ofId;
  @override
  final int? isAvailable;

  @override
  String toString() {
    return 'Document(id: $id, documentIndex: $documentIndex, image: $image, ofType: $ofType, ofId: $ofId, isAvailable: $isAvailable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DocumentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.documentIndex, documentIndex) ||
                other.documentIndex == documentIndex) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.ofType, ofType) || other.ofType == ofType) &&
            (identical(other.ofId, ofId) || other.ofId == ofId) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, documentIndex, image, ofType, ofId, isAvailable);

  /// Create a copy of Document
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DocumentImplCopyWith<_$DocumentImpl> get copyWith =>
      __$$DocumentImplCopyWithImpl<_$DocumentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DocumentImplToJson(
      this,
    );
  }
}

abstract class _Document implements Document {
  const factory _Document(
      {final int? id,
      final int? documentIndex,
      final String? image,
      final String? ofType,
      final int? ofId,
      final int? isAvailable}) = _$DocumentImpl;

  factory _Document.fromJson(Map<String, dynamic> json) =
      _$DocumentImpl.fromJson;

  @override
  int? get id;
  @override
  int? get documentIndex;
  @override
  String? get image;
  @override
  String? get ofType;
  @override
  int? get ofId;
  @override
  int? get isAvailable;

  /// Create a copy of Document
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DocumentImplCopyWith<_$DocumentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
