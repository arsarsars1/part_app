// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotificationList _$NotificationListFromJson(Map<String, dynamic> json) {
  return _NotificationList.fromJson(json);
}

/// @nodoc
mixin _$NotificationList {
  int? get status => throw _privateConstructorUsedError;
  Notifications? get notifications => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationListCopyWith<NotificationList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationListCopyWith<$Res> {
  factory $NotificationListCopyWith(
          NotificationList value, $Res Function(NotificationList) then) =
      _$NotificationListCopyWithImpl<$Res, NotificationList>;
  @useResult
  $Res call({int? status, Notifications? notifications});

  $NotificationsCopyWith<$Res>? get notifications;
}

/// @nodoc
class _$NotificationListCopyWithImpl<$Res, $Val extends NotificationList>
    implements $NotificationListCopyWith<$Res> {
  _$NotificationListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? notifications = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      notifications: freezed == notifications
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as Notifications?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NotificationsCopyWith<$Res>? get notifications {
    if (_value.notifications == null) {
      return null;
    }

    return $NotificationsCopyWith<$Res>(_value.notifications!, (value) {
      return _then(_value.copyWith(notifications: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_NotificationListCopyWith<$Res>
    implements $NotificationListCopyWith<$Res> {
  factory _$$_NotificationListCopyWith(
          _$_NotificationList value, $Res Function(_$_NotificationList) then) =
      __$$_NotificationListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? status, Notifications? notifications});

  @override
  $NotificationsCopyWith<$Res>? get notifications;
}

/// @nodoc
class __$$_NotificationListCopyWithImpl<$Res>
    extends _$NotificationListCopyWithImpl<$Res, _$_NotificationList>
    implements _$$_NotificationListCopyWith<$Res> {
  __$$_NotificationListCopyWithImpl(
      _$_NotificationList _value, $Res Function(_$_NotificationList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? notifications = freezed,
  }) {
    return _then(_$_NotificationList(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      notifications: freezed == notifications
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as Notifications?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotificationList implements _NotificationList {
  const _$_NotificationList({this.status, this.notifications});

  factory _$_NotificationList.fromJson(Map<String, dynamic> json) =>
      _$$_NotificationListFromJson(json);

  @override
  final int? status;
  @override
  final Notifications? notifications;

  @override
  String toString() {
    return 'NotificationList(status: $status, notifications: $notifications)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotificationList &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.notifications, notifications) ||
                other.notifications == notifications));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, notifications);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotificationListCopyWith<_$_NotificationList> get copyWith =>
      __$$_NotificationListCopyWithImpl<_$_NotificationList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotificationListToJson(
      this,
    );
  }
}

abstract class _NotificationList implements NotificationList {
  const factory _NotificationList(
      {final int? status,
      final Notifications? notifications}) = _$_NotificationList;

  factory _NotificationList.fromJson(Map<String, dynamic> json) =
      _$_NotificationList.fromJson;

  @override
  int? get status;
  @override
  Notifications? get notifications;
  @override
  @JsonKey(ignore: true)
  _$$_NotificationListCopyWith<_$_NotificationList> get copyWith =>
      throw _privateConstructorUsedError;
}

Notifications _$NotificationsFromJson(Map<String, dynamic> json) {
  return _Notifications.fromJson(json);
}

/// @nodoc
mixin _$Notifications {
  int? get currentPage => throw _privateConstructorUsedError;
  List<NotificationData>? get data => throw _privateConstructorUsedError;
  String? get firstPageUrl => throw _privateConstructorUsedError;
  int? get from => throw _privateConstructorUsedError;
  String? get nextPageUrl => throw _privateConstructorUsedError;
  String? get path => throw _privateConstructorUsedError;
  int? get perPage => throw _privateConstructorUsedError;
  dynamic get prevPageUrl => throw _privateConstructorUsedError;
  int? get to => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationsCopyWith<Notifications> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationsCopyWith<$Res> {
  factory $NotificationsCopyWith(
          Notifications value, $Res Function(Notifications) then) =
      _$NotificationsCopyWithImpl<$Res, Notifications>;
  @useResult
  $Res call(
      {int? currentPage,
      List<NotificationData>? data,
      String? firstPageUrl,
      int? from,
      String? nextPageUrl,
      String? path,
      int? perPage,
      dynamic prevPageUrl,
      int? to});
}

/// @nodoc
class _$NotificationsCopyWithImpl<$Res, $Val extends Notifications>
    implements $NotificationsCopyWith<$Res> {
  _$NotificationsCopyWithImpl(this._value, this._then);

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
              as List<NotificationData>?,
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
              as dynamic,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NotificationsCopyWith<$Res>
    implements $NotificationsCopyWith<$Res> {
  factory _$$_NotificationsCopyWith(
          _$_Notifications value, $Res Function(_$_Notifications) then) =
      __$$_NotificationsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? currentPage,
      List<NotificationData>? data,
      String? firstPageUrl,
      int? from,
      String? nextPageUrl,
      String? path,
      int? perPage,
      dynamic prevPageUrl,
      int? to});
}

/// @nodoc
class __$$_NotificationsCopyWithImpl<$Res>
    extends _$NotificationsCopyWithImpl<$Res, _$_Notifications>
    implements _$$_NotificationsCopyWith<$Res> {
  __$$_NotificationsCopyWithImpl(
      _$_Notifications _value, $Res Function(_$_Notifications) _then)
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
    return _then(_$_Notifications(
      currentPage: freezed == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<NotificationData>?,
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
class _$_Notifications implements _Notifications {
  const _$_Notifications(
      {this.currentPage,
      final List<NotificationData>? data,
      this.firstPageUrl,
      this.from,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to})
      : _data = data;

  factory _$_Notifications.fromJson(Map<String, dynamic> json) =>
      _$$_NotificationsFromJson(json);

  @override
  final int? currentPage;
  final List<NotificationData>? _data;
  @override
  List<NotificationData>? get data {
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
  final String? nextPageUrl;
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
    return 'Notifications(currentPage: $currentPage, data: $data, firstPageUrl: $firstPageUrl, from: $from, nextPageUrl: $nextPageUrl, path: $path, perPage: $perPage, prevPageUrl: $prevPageUrl, to: $to)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Notifications &&
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
      nextPageUrl,
      path,
      perPage,
      const DeepCollectionEquality().hash(prevPageUrl),
      to);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotificationsCopyWith<_$_Notifications> get copyWith =>
      __$$_NotificationsCopyWithImpl<_$_Notifications>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotificationsToJson(
      this,
    );
  }
}

abstract class _Notifications implements Notifications {
  const factory _Notifications(
      {final int? currentPage,
      final List<NotificationData>? data,
      final String? firstPageUrl,
      final int? from,
      final String? nextPageUrl,
      final String? path,
      final int? perPage,
      final dynamic prevPageUrl,
      final int? to}) = _$_Notifications;

  factory _Notifications.fromJson(Map<String, dynamic> json) =
      _$_Notifications.fromJson;

  @override
  int? get currentPage;
  @override
  List<NotificationData>? get data;
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
  dynamic get prevPageUrl;
  @override
  int? get to;
  @override
  @JsonKey(ignore: true)
  _$$_NotificationsCopyWith<_$_Notifications> get copyWith =>
      throw _privateConstructorUsedError;
}

NotificationData _$NotificationDataFromJson(Map<String, dynamic> json) {
  return _NotificationData.fromJson(json);
}

/// @nodoc
mixin _$NotificationData {
  String? get id => throw _privateConstructorUsedError;
  String? get screen => throw _privateConstructorUsedError;
  String? get entityType => throw _privateConstructorUsedError;
  int? get entityId => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get notifiableType => throw _privateConstructorUsedError;
  int? get notifiableId => throw _privateConstructorUsedError;
  Data? get data => throw _privateConstructorUsedError;
  DateTime? get addedOn => throw _privateConstructorUsedError;
  dynamic get readAt => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationDataCopyWith<NotificationData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationDataCopyWith<$Res> {
  factory $NotificationDataCopyWith(
          NotificationData value, $Res Function(NotificationData) then) =
      _$NotificationDataCopyWithImpl<$Res, NotificationData>;
  @useResult
  $Res call(
      {String? id,
      String? screen,
      String? entityType,
      int? entityId,
      String? type,
      String? notifiableType,
      int? notifiableId,
      Data? data,
      DateTime? addedOn,
      dynamic readAt,
      DateTime? createdAt,
      DateTime? updatedAt});

  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class _$NotificationDataCopyWithImpl<$Res, $Val extends NotificationData>
    implements $NotificationDataCopyWith<$Res> {
  _$NotificationDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? screen = freezed,
    Object? entityType = freezed,
    Object? entityId = freezed,
    Object? type = freezed,
    Object? notifiableType = freezed,
    Object? notifiableId = freezed,
    Object? data = freezed,
    Object? addedOn = freezed,
    Object? readAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      screen: freezed == screen
          ? _value.screen
          : screen // ignore: cast_nullable_to_non_nullable
              as String?,
      entityType: freezed == entityType
          ? _value.entityType
          : entityType // ignore: cast_nullable_to_non_nullable
              as String?,
      entityId: freezed == entityId
          ? _value.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      notifiableType: freezed == notifiableType
          ? _value.notifiableType
          : notifiableType // ignore: cast_nullable_to_non_nullable
              as String?,
      notifiableId: freezed == notifiableId
          ? _value.notifiableId
          : notifiableId // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data?,
      addedOn: freezed == addedOn
          ? _value.addedOn
          : addedOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      readAt: freezed == readAt
          ? _value.readAt
          : readAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
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

  @override
  @pragma('vm:prefer-inline')
  $DataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $DataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_NotificationDataCopyWith<$Res>
    implements $NotificationDataCopyWith<$Res> {
  factory _$$_NotificationDataCopyWith(
          _$_NotificationData value, $Res Function(_$_NotificationData) then) =
      __$$_NotificationDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? screen,
      String? entityType,
      int? entityId,
      String? type,
      String? notifiableType,
      int? notifiableId,
      Data? data,
      DateTime? addedOn,
      dynamic readAt,
      DateTime? createdAt,
      DateTime? updatedAt});

  @override
  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_NotificationDataCopyWithImpl<$Res>
    extends _$NotificationDataCopyWithImpl<$Res, _$_NotificationData>
    implements _$$_NotificationDataCopyWith<$Res> {
  __$$_NotificationDataCopyWithImpl(
      _$_NotificationData _value, $Res Function(_$_NotificationData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? screen = freezed,
    Object? entityType = freezed,
    Object? entityId = freezed,
    Object? type = freezed,
    Object? notifiableType = freezed,
    Object? notifiableId = freezed,
    Object? data = freezed,
    Object? addedOn = freezed,
    Object? readAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_NotificationData(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      screen: freezed == screen
          ? _value.screen
          : screen // ignore: cast_nullable_to_non_nullable
              as String?,
      entityType: freezed == entityType
          ? _value.entityType
          : entityType // ignore: cast_nullable_to_non_nullable
              as String?,
      entityId: freezed == entityId
          ? _value.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      notifiableType: freezed == notifiableType
          ? _value.notifiableType
          : notifiableType // ignore: cast_nullable_to_non_nullable
              as String?,
      notifiableId: freezed == notifiableId
          ? _value.notifiableId
          : notifiableId // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data?,
      addedOn: freezed == addedOn
          ? _value.addedOn
          : addedOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      readAt: freezed == readAt
          ? _value.readAt
          : readAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
class _$_NotificationData implements _NotificationData {
  const _$_NotificationData(
      {this.id,
      this.screen,
      this.entityType,
      this.entityId,
      this.type,
      this.notifiableType,
      this.notifiableId,
      this.data,
      this.addedOn,
      this.readAt,
      this.createdAt,
      this.updatedAt});

  factory _$_NotificationData.fromJson(Map<String, dynamic> json) =>
      _$$_NotificationDataFromJson(json);

  @override
  final String? id;
  @override
  final String? screen;
  @override
  final String? entityType;
  @override
  final int? entityId;
  @override
  final String? type;
  @override
  final String? notifiableType;
  @override
  final int? notifiableId;
  @override
  final Data? data;
  @override
  final DateTime? addedOn;
  @override
  final dynamic readAt;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'NotificationData(id: $id, screen: $screen, entityType: $entityType, entityId: $entityId, type: $type, notifiableType: $notifiableType, notifiableId: $notifiableId, data: $data, addedOn: $addedOn, readAt: $readAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotificationData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.screen, screen) || other.screen == screen) &&
            (identical(other.entityType, entityType) ||
                other.entityType == entityType) &&
            (identical(other.entityId, entityId) ||
                other.entityId == entityId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.notifiableType, notifiableType) ||
                other.notifiableType == notifiableType) &&
            (identical(other.notifiableId, notifiableId) ||
                other.notifiableId == notifiableId) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.addedOn, addedOn) || other.addedOn == addedOn) &&
            const DeepCollectionEquality().equals(other.readAt, readAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      screen,
      entityType,
      entityId,
      type,
      notifiableType,
      notifiableId,
      data,
      addedOn,
      const DeepCollectionEquality().hash(readAt),
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotificationDataCopyWith<_$_NotificationData> get copyWith =>
      __$$_NotificationDataCopyWithImpl<_$_NotificationData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotificationDataToJson(
      this,
    );
  }
}

abstract class _NotificationData implements NotificationData {
  const factory _NotificationData(
      {final String? id,
      final String? screen,
      final String? entityType,
      final int? entityId,
      final String? type,
      final String? notifiableType,
      final int? notifiableId,
      final Data? data,
      final DateTime? addedOn,
      final dynamic readAt,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$_NotificationData;

  factory _NotificationData.fromJson(Map<String, dynamic> json) =
      _$_NotificationData.fromJson;

  @override
  String? get id;
  @override
  String? get screen;
  @override
  String? get entityType;
  @override
  int? get entityId;
  @override
  String? get type;
  @override
  String? get notifiableType;
  @override
  int? get notifiableId;
  @override
  Data? get data;
  @override
  DateTime? get addedOn;
  @override
  dynamic get readAt;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_NotificationDataCopyWith<_$_NotificationData> get copyWith =>
      throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  String? get title => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String? get screen => throw _privateConstructorUsedError;
  String? get entityType => throw _privateConstructorUsedError;
  int? get entityId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataCopyWith<Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res, Data>;
  @useResult
  $Res call(
      {String? title,
      String? message,
      String? screen,
      String? entityType,
      int? entityId});
}

/// @nodoc
class _$DataCopyWithImpl<$Res, $Val extends Data>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? message = freezed,
    Object? screen = freezed,
    Object? entityType = freezed,
    Object? entityId = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      screen: freezed == screen
          ? _value.screen
          : screen // ignore: cast_nullable_to_non_nullable
              as String?,
      entityType: freezed == entityType
          ? _value.entityType
          : entityType // ignore: cast_nullable_to_non_nullable
              as String?,
      entityId: freezed == entityId
          ? _value.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DataCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$$_DataCopyWith(_$_Data value, $Res Function(_$_Data) then) =
      __$$_DataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? title,
      String? message,
      String? screen,
      String? entityType,
      int? entityId});
}

/// @nodoc
class __$$_DataCopyWithImpl<$Res> extends _$DataCopyWithImpl<$Res, _$_Data>
    implements _$$_DataCopyWith<$Res> {
  __$$_DataCopyWithImpl(_$_Data _value, $Res Function(_$_Data) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? message = freezed,
    Object? screen = freezed,
    Object? entityType = freezed,
    Object? entityId = freezed,
  }) {
    return _then(_$_Data(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      screen: freezed == screen
          ? _value.screen
          : screen // ignore: cast_nullable_to_non_nullable
              as String?,
      entityType: freezed == entityType
          ? _value.entityType
          : entityType // ignore: cast_nullable_to_non_nullable
              as String?,
      entityId: freezed == entityId
          ? _value.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Data implements _Data {
  const _$_Data(
      {this.title, this.message, this.screen, this.entityType, this.entityId});

  factory _$_Data.fromJson(Map<String, dynamic> json) => _$$_DataFromJson(json);

  @override
  final String? title;
  @override
  final String? message;
  @override
  final String? screen;
  @override
  final String? entityType;
  @override
  final int? entityId;

  @override
  String toString() {
    return 'Data(title: $title, message: $message, screen: $screen, entityType: $entityType, entityId: $entityId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Data &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.screen, screen) || other.screen == screen) &&
            (identical(other.entityType, entityType) ||
                other.entityType == entityType) &&
            (identical(other.entityId, entityId) ||
                other.entityId == entityId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, title, message, screen, entityType, entityId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DataCopyWith<_$_Data> get copyWith =>
      __$$_DataCopyWithImpl<_$_Data>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DataToJson(
      this,
    );
  }
}

abstract class _Data implements Data {
  const factory _Data(
      {final String? title,
      final String? message,
      final String? screen,
      final String? entityType,
      final int? entityId}) = _$_Data;

  factory _Data.fromJson(Map<String, dynamic> json) = _$_Data.fromJson;

  @override
  String? get title;
  @override
  String? get message;
  @override
  String? get screen;
  @override
  String? get entityType;
  @override
  int? get entityId;
  @override
  @JsonKey(ignore: true)
  _$$_DataCopyWith<_$_Data> get copyWith => throw _privateConstructorUsedError;
}
