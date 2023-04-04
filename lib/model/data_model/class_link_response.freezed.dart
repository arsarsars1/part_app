// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'class_link_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
abstract class _$$_ClassLinkResponseCopyWith<$Res>
    implements $ClassLinkResponseCopyWith<$Res> {
  factory _$$_ClassLinkResponseCopyWith(_$_ClassLinkResponse value,
          $Res Function(_$_ClassLinkResponse) then) =
      __$$_ClassLinkResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? status, List<ClassLink>? classLinks});
}

/// @nodoc
class __$$_ClassLinkResponseCopyWithImpl<$Res>
    extends _$ClassLinkResponseCopyWithImpl<$Res, _$_ClassLinkResponse>
    implements _$$_ClassLinkResponseCopyWith<$Res> {
  __$$_ClassLinkResponseCopyWithImpl(
      _$_ClassLinkResponse _value, $Res Function(_$_ClassLinkResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? classLinks = freezed,
  }) {
    return _then(_$_ClassLinkResponse(
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
class _$_ClassLinkResponse implements _ClassLinkResponse {
  const _$_ClassLinkResponse({this.status, final List<ClassLink>? classLinks})
      : _classLinks = classLinks;

  factory _$_ClassLinkResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ClassLinkResponseFromJson(json);

  @override
  final int? status;
  final List<ClassLink>? _classLinks;
  @override
  List<ClassLink>? get classLinks {
    final value = _classLinks;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ClassLinkResponse(status: $status, classLinks: $classLinks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ClassLinkResponse &&
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
  _$$_ClassLinkResponseCopyWith<_$_ClassLinkResponse> get copyWith =>
      __$$_ClassLinkResponseCopyWithImpl<_$_ClassLinkResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ClassLinkResponseToJson(
      this,
    );
  }
}

abstract class _ClassLinkResponse implements ClassLinkResponse {
  const factory _ClassLinkResponse(
      {final int? status,
      final List<ClassLink>? classLinks}) = _$_ClassLinkResponse;

  factory _ClassLinkResponse.fromJson(Map<String, dynamic> json) =
      _$_ClassLinkResponse.fromJson;

  @override
  int? get status;
  @override
  List<ClassLink>? get classLinks;
  @override
  @JsonKey(ignore: true)
  _$$_ClassLinkResponseCopyWith<_$_ClassLinkResponse> get copyWith =>
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
  DateTime? get batchDate => throw _privateConstructorUsedError;
  String? get addedByType => throw _privateConstructorUsedError;
  int? get addedById => throw _privateConstructorUsedError;

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
      DateTime? batchDate,
      String? addedByType,
      int? addedById});
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
    Object? batchDate = freezed,
    Object? addedByType = freezed,
    Object? addedById = freezed,
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
      batchDate: freezed == batchDate
          ? _value.batchDate
          : batchDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      addedByType: freezed == addedByType
          ? _value.addedByType
          : addedByType // ignore: cast_nullable_to_non_nullable
              as String?,
      addedById: freezed == addedById
          ? _value.addedById
          : addedById // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ClassLinkCopyWith<$Res> implements $ClassLinkCopyWith<$Res> {
  factory _$$_ClassLinkCopyWith(
          _$_ClassLink value, $Res Function(_$_ClassLink) then) =
      __$$_ClassLinkCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? batchId,
      String? link,
      String? service,
      DateTime? batchDate,
      String? addedByType,
      int? addedById});
}

/// @nodoc
class __$$_ClassLinkCopyWithImpl<$Res>
    extends _$ClassLinkCopyWithImpl<$Res, _$_ClassLink>
    implements _$$_ClassLinkCopyWith<$Res> {
  __$$_ClassLinkCopyWithImpl(
      _$_ClassLink _value, $Res Function(_$_ClassLink) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? batchId = freezed,
    Object? link = freezed,
    Object? service = freezed,
    Object? batchDate = freezed,
    Object? addedByType = freezed,
    Object? addedById = freezed,
  }) {
    return _then(_$_ClassLink(
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
      batchDate: freezed == batchDate
          ? _value.batchDate
          : batchDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      addedByType: freezed == addedByType
          ? _value.addedByType
          : addedByType // ignore: cast_nullable_to_non_nullable
              as String?,
      addedById: freezed == addedById
          ? _value.addedById
          : addedById // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_ClassLink implements _ClassLink {
  const _$_ClassLink(
      {this.id,
      this.batchId,
      this.link,
      this.service,
      this.batchDate,
      this.addedByType,
      this.addedById});

  factory _$_ClassLink.fromJson(Map<String, dynamic> json) =>
      _$$_ClassLinkFromJson(json);

  @override
  final int? id;
  @override
  final int? batchId;
  @override
  final String? link;
  @override
  final String? service;
  @override
  final DateTime? batchDate;
  @override
  final String? addedByType;
  @override
  final int? addedById;

  @override
  String toString() {
    return 'ClassLink(id: $id, batchId: $batchId, link: $link, service: $service, batchDate: $batchDate, addedByType: $addedByType, addedById: $addedById)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ClassLink &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.batchId, batchId) || other.batchId == batchId) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.service, service) || other.service == service) &&
            (identical(other.batchDate, batchDate) ||
                other.batchDate == batchDate) &&
            (identical(other.addedByType, addedByType) ||
                other.addedByType == addedByType) &&
            (identical(other.addedById, addedById) ||
                other.addedById == addedById));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, batchId, link, service,
      batchDate, addedByType, addedById);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ClassLinkCopyWith<_$_ClassLink> get copyWith =>
      __$$_ClassLinkCopyWithImpl<_$_ClassLink>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ClassLinkToJson(
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
      final DateTime? batchDate,
      final String? addedByType,
      final int? addedById}) = _$_ClassLink;

  factory _ClassLink.fromJson(Map<String, dynamic> json) =
      _$_ClassLink.fromJson;

  @override
  int? get id;
  @override
  int? get batchId;
  @override
  String? get link;
  @override
  String? get service;
  @override
  DateTime? get batchDate;
  @override
  String? get addedByType;
  @override
  int? get addedById;
  @override
  @JsonKey(ignore: true)
  _$$_ClassLinkCopyWith<_$_ClassLink> get copyWith =>
      throw _privateConstructorUsedError;
}
