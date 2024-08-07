// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'class_link_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ClassLinkResponse _$ClassLinkResponseFromJson(Map<String, dynamic> json) {
  return _ClassLinkResponse.fromJson(json);
}

/// @nodoc
mixin _$ClassLinkResponse {
  int? get status => throw _privateConstructorUsedError;
  List<ClassLink>? get classLinks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClassLinkResponseCopyWith<ClassLinkResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClassLinkResponseCopyWith<$Res> {
  factory $ClassLinkResponseCopyWith(
          ClassLinkResponse value, $Res Function(ClassLinkResponse) then) =
      _$ClassLinkResponseCopyWithImpl<$Res, ClassLinkResponse>;
  @useResult
  $Res call({int? status, List<ClassLink>? classLinks});
}

/// @nodoc
class _$ClassLinkResponseCopyWithImpl<$Res, $Val extends ClassLinkResponse>
    implements $ClassLinkResponseCopyWith<$Res> {
  _$ClassLinkResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? classLinks = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      classLinks: freezed == classLinks
          ? _value.classLinks
          : classLinks // ignore: cast_nullable_to_non_nullable
              as List<ClassLink>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClassLinkResponseImplCopyWith<$Res>
    implements $ClassLinkResponseCopyWith<$Res> {
  factory _$$ClassLinkResponseImplCopyWith(_$ClassLinkResponseImpl value,
          $Res Function(_$ClassLinkResponseImpl) then) =
      __$$ClassLinkResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? status, List<ClassLink>? classLinks});
}

/// @nodoc
class __$$ClassLinkResponseImplCopyWithImpl<$Res>
    extends _$ClassLinkResponseCopyWithImpl<$Res, _$ClassLinkResponseImpl>
    implements _$$ClassLinkResponseImplCopyWith<$Res> {
  __$$ClassLinkResponseImplCopyWithImpl(_$ClassLinkResponseImpl _value,
      $Res Function(_$ClassLinkResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? classLinks = freezed,
  }) {
    return _then(_$ClassLinkResponseImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      classLinks: freezed == classLinks
          ? _value._classLinks
          : classLinks // ignore: cast_nullable_to_non_nullable
              as List<ClassLink>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$ClassLinkResponseImpl implements _ClassLinkResponse {
  const _$ClassLinkResponseImpl(
      {this.status, final List<ClassLink>? classLinks})
      : _classLinks = classLinks;

  factory _$ClassLinkResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClassLinkResponseImplFromJson(json);

  @override
  final int? status;
  final List<ClassLink>? _classLinks;
  @override
  List<ClassLink>? get classLinks {
    final value = _classLinks;
    if (value == null) return null;
    if (_classLinks is EqualUnmodifiableListView) return _classLinks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ClassLinkResponse(status: $status, classLinks: $classLinks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClassLinkResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._classLinks, _classLinks));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_classLinks));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClassLinkResponseImplCopyWith<_$ClassLinkResponseImpl> get copyWith =>
      __$$ClassLinkResponseImplCopyWithImpl<_$ClassLinkResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClassLinkResponseImplToJson(
      this,
    );
  }
}

abstract class _ClassLinkResponse implements ClassLinkResponse {
  const factory _ClassLinkResponse(
      {final int? status,
      final List<ClassLink>? classLinks}) = _$ClassLinkResponseImpl;

  factory _ClassLinkResponse.fromJson(Map<String, dynamic> json) =
      _$ClassLinkResponseImpl.fromJson;

  @override
  int? get status;
  @override
  List<ClassLink>? get classLinks;
  @override
  @JsonKey(ignore: true)
  _$$ClassLinkResponseImplCopyWith<_$ClassLinkResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ClassLink _$ClassLinkFromJson(Map<String, dynamic> json) {
  return _ClassLink.fromJson(json);
}

/// @nodoc
mixin _$ClassLink {
  int? get id => throw _privateConstructorUsedError;
  int? get batchId => throw _privateConstructorUsedError;
  String? get link => throw _privateConstructorUsedError;
  String? get service => throw _privateConstructorUsedError;
  DateTime? get classDate => throw _privateConstructorUsedError;
  String? get startTime => throw _privateConstructorUsedError;
  String? get endTime => throw _privateConstructorUsedError;
  String? get addedByType => throw _privateConstructorUsedError;
  int? get addedById => throw _privateConstructorUsedError;
  String? get batchName => throw _privateConstructorUsedError;
  String? get branchName => throw _privateConstructorUsedError;
  String? get courseName => throw _privateConstructorUsedError;
  String? get subjectName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClassLinkCopyWith<ClassLink> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClassLinkCopyWith<$Res> {
  factory $ClassLinkCopyWith(ClassLink value, $Res Function(ClassLink) then) =
      _$ClassLinkCopyWithImpl<$Res, ClassLink>;
  @useResult
  $Res call(
      {int? id,
      int? batchId,
      String? link,
      String? service,
      DateTime? classDate,
      String? startTime,
      String? endTime,
      String? addedByType,
      int? addedById,
      String? batchName,
      String? branchName,
      String? courseName,
      String? subjectName});
}

/// @nodoc
class _$ClassLinkCopyWithImpl<$Res, $Val extends ClassLink>
    implements $ClassLinkCopyWith<$Res> {
  _$ClassLinkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? batchId = freezed,
    Object? link = freezed,
    Object? service = freezed,
    Object? classDate = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? addedByType = freezed,
    Object? addedById = freezed,
    Object? batchName = freezed,
    Object? branchName = freezed,
    Object? courseName = freezed,
    Object? subjectName = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      batchId: freezed == batchId
          ? _value.batchId
          : batchId // ignore: cast_nullable_to_non_nullable
              as int?,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      service: freezed == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as String?,
      classDate: freezed == classDate
          ? _value.classDate
          : classDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      addedByType: freezed == addedByType
          ? _value.addedByType
          : addedByType // ignore: cast_nullable_to_non_nullable
              as String?,
      addedById: freezed == addedById
          ? _value.addedById
          : addedById // ignore: cast_nullable_to_non_nullable
              as int?,
      batchName: freezed == batchName
          ? _value.batchName
          : batchName // ignore: cast_nullable_to_non_nullable
              as String?,
      branchName: freezed == branchName
          ? _value.branchName
          : branchName // ignore: cast_nullable_to_non_nullable
              as String?,
      courseName: freezed == courseName
          ? _value.courseName
          : courseName // ignore: cast_nullable_to_non_nullable
              as String?,
      subjectName: freezed == subjectName
          ? _value.subjectName
          : subjectName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClassLinkImplCopyWith<$Res>
    implements $ClassLinkCopyWith<$Res> {
  factory _$$ClassLinkImplCopyWith(
          _$ClassLinkImpl value, $Res Function(_$ClassLinkImpl) then) =
      __$$ClassLinkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? batchId,
      String? link,
      String? service,
      DateTime? classDate,
      String? startTime,
      String? endTime,
      String? addedByType,
      int? addedById,
      String? batchName,
      String? branchName,
      String? courseName,
      String? subjectName});
}

/// @nodoc
class __$$ClassLinkImplCopyWithImpl<$Res>
    extends _$ClassLinkCopyWithImpl<$Res, _$ClassLinkImpl>
    implements _$$ClassLinkImplCopyWith<$Res> {
  __$$ClassLinkImplCopyWithImpl(
      _$ClassLinkImpl _value, $Res Function(_$ClassLinkImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? batchId = freezed,
    Object? link = freezed,
    Object? service = freezed,
    Object? classDate = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? addedByType = freezed,
    Object? addedById = freezed,
    Object? batchName = freezed,
    Object? branchName = freezed,
    Object? courseName = freezed,
    Object? subjectName = freezed,
  }) {
    return _then(_$ClassLinkImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      batchId: freezed == batchId
          ? _value.batchId
          : batchId // ignore: cast_nullable_to_non_nullable
              as int?,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      service: freezed == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as String?,
      classDate: freezed == classDate
          ? _value.classDate
          : classDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      addedByType: freezed == addedByType
          ? _value.addedByType
          : addedByType // ignore: cast_nullable_to_non_nullable
              as String?,
      addedById: freezed == addedById
          ? _value.addedById
          : addedById // ignore: cast_nullable_to_non_nullable
              as int?,
      batchName: freezed == batchName
          ? _value.batchName
          : batchName // ignore: cast_nullable_to_non_nullable
              as String?,
      branchName: freezed == branchName
          ? _value.branchName
          : branchName // ignore: cast_nullable_to_non_nullable
              as String?,
      courseName: freezed == courseName
          ? _value.courseName
          : courseName // ignore: cast_nullable_to_non_nullable
              as String?,
      subjectName: freezed == subjectName
          ? _value.subjectName
          : subjectName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$ClassLinkImpl implements _ClassLink {
  const _$ClassLinkImpl(
      {this.id,
      this.batchId,
      this.link,
      this.service,
      this.classDate,
      this.startTime,
      this.endTime,
      this.addedByType,
      this.addedById,
      this.batchName,
      this.branchName,
      this.courseName,
      this.subjectName});

  factory _$ClassLinkImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClassLinkImplFromJson(json);

  @override
  final int? id;
  @override
  final int? batchId;
  @override
  final String? link;
  @override
  final String? service;
  @override
  final DateTime? classDate;
  @override
  final String? startTime;
  @override
  final String? endTime;
  @override
  final String? addedByType;
  @override
  final int? addedById;
  @override
  final String? batchName;
  @override
  final String? branchName;
  @override
  final String? courseName;
  @override
  final String? subjectName;

  @override
  String toString() {
    return 'ClassLink(id: $id, batchId: $batchId, link: $link, service: $service, classDate: $classDate, startTime: $startTime, endTime: $endTime, addedByType: $addedByType, addedById: $addedById, batchName: $batchName, branchName: $branchName, courseName: $courseName, subjectName: $subjectName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClassLinkImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.batchId, batchId) || other.batchId == batchId) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.service, service) || other.service == service) &&
            (identical(other.classDate, classDate) ||
                other.classDate == classDate) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.addedByType, addedByType) ||
                other.addedByType == addedByType) &&
            (identical(other.addedById, addedById) ||
                other.addedById == addedById) &&
            (identical(other.batchName, batchName) ||
                other.batchName == batchName) &&
            (identical(other.branchName, branchName) ||
                other.branchName == branchName) &&
            (identical(other.courseName, courseName) ||
                other.courseName == courseName) &&
            (identical(other.subjectName, subjectName) ||
                other.subjectName == subjectName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      batchId,
      link,
      service,
      classDate,
      startTime,
      endTime,
      addedByType,
      addedById,
      batchName,
      branchName,
      courseName,
      subjectName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClassLinkImplCopyWith<_$ClassLinkImpl> get copyWith =>
      __$$ClassLinkImplCopyWithImpl<_$ClassLinkImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClassLinkImplToJson(
      this,
    );
  }
}

abstract class _ClassLink implements ClassLink {
  const factory _ClassLink(
      {final int? id,
      final int? batchId,
      final String? link,
      final String? service,
      final DateTime? classDate,
      final String? startTime,
      final String? endTime,
      final String? addedByType,
      final int? addedById,
      final String? batchName,
      final String? branchName,
      final String? courseName,
      final String? subjectName}) = _$ClassLinkImpl;

  factory _ClassLink.fromJson(Map<String, dynamic> json) =
      _$ClassLinkImpl.fromJson;

  @override
  int? get id;
  @override
  int? get batchId;
  @override
  String? get link;
  @override
  String? get service;
  @override
  DateTime? get classDate;
  @override
  String? get startTime;
  @override
  String? get endTime;
  @override
  String? get addedByType;
  @override
  int? get addedById;
  @override
  String? get batchName;
  @override
  String? get branchName;
  @override
  String? get courseName;
  @override
  String? get subjectName;
  @override
  @JsonKey(ignore: true)
  _$$ClassLinkImplCopyWith<_$ClassLinkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
