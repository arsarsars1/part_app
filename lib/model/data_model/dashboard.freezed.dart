// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Dashboard _$DashboardFromJson(Map<String, dynamic> json) {
  return _Dashboard.fromJson(json);
}

/// @nodoc
mixin _$Dashboard {
  int? get status => throw _privateConstructorUsedError;
  int? get unreadNotificationsCount => throw _privateConstructorUsedError;
  int? get totalStudents => throw _privateConstructorUsedError;
  String? get totalPaymentsDaily => throw _privateConstructorUsedError;
  String? get totalPaymentsMonthly => throw _privateConstructorUsedError;
  List<Banner>? get banners => throw _privateConstructorUsedError;

  /// Serializes this Dashboard to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Dashboard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DashboardCopyWith<Dashboard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardCopyWith<$Res> {
  factory $DashboardCopyWith(Dashboard value, $Res Function(Dashboard) then) =
      _$DashboardCopyWithImpl<$Res, Dashboard>;
  @useResult
  $Res call(
      {int? status,
      int? unreadNotificationsCount,
      int? totalStudents,
      String? totalPaymentsDaily,
      String? totalPaymentsMonthly,
      List<Banner>? banners});
}

/// @nodoc
class _$DashboardCopyWithImpl<$Res, $Val extends Dashboard>
    implements $DashboardCopyWith<$Res> {
  _$DashboardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Dashboard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? unreadNotificationsCount = freezed,
    Object? totalStudents = freezed,
    Object? totalPaymentsDaily = freezed,
    Object? totalPaymentsMonthly = freezed,
    Object? banners = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      unreadNotificationsCount: freezed == unreadNotificationsCount
          ? _value.unreadNotificationsCount
          : unreadNotificationsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      totalStudents: freezed == totalStudents
          ? _value.totalStudents
          : totalStudents // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPaymentsDaily: freezed == totalPaymentsDaily
          ? _value.totalPaymentsDaily
          : totalPaymentsDaily // ignore: cast_nullable_to_non_nullable
              as String?,
      totalPaymentsMonthly: freezed == totalPaymentsMonthly
          ? _value.totalPaymentsMonthly
          : totalPaymentsMonthly // ignore: cast_nullable_to_non_nullable
              as String?,
      banners: freezed == banners
          ? _value.banners
          : banners // ignore: cast_nullable_to_non_nullable
              as List<Banner>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DashboardImplCopyWith<$Res>
    implements $DashboardCopyWith<$Res> {
  factory _$$DashboardImplCopyWith(
          _$DashboardImpl value, $Res Function(_$DashboardImpl) then) =
      __$$DashboardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? status,
      int? unreadNotificationsCount,
      int? totalStudents,
      String? totalPaymentsDaily,
      String? totalPaymentsMonthly,
      List<Banner>? banners});
}

/// @nodoc
class __$$DashboardImplCopyWithImpl<$Res>
    extends _$DashboardCopyWithImpl<$Res, _$DashboardImpl>
    implements _$$DashboardImplCopyWith<$Res> {
  __$$DashboardImplCopyWithImpl(
      _$DashboardImpl _value, $Res Function(_$DashboardImpl) _then)
      : super(_value, _then);

  /// Create a copy of Dashboard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? unreadNotificationsCount = freezed,
    Object? totalStudents = freezed,
    Object? totalPaymentsDaily = freezed,
    Object? totalPaymentsMonthly = freezed,
    Object? banners = freezed,
  }) {
    return _then(_$DashboardImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      unreadNotificationsCount: freezed == unreadNotificationsCount
          ? _value.unreadNotificationsCount
          : unreadNotificationsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      totalStudents: freezed == totalStudents
          ? _value.totalStudents
          : totalStudents // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPaymentsDaily: freezed == totalPaymentsDaily
          ? _value.totalPaymentsDaily
          : totalPaymentsDaily // ignore: cast_nullable_to_non_nullable
              as String?,
      totalPaymentsMonthly: freezed == totalPaymentsMonthly
          ? _value.totalPaymentsMonthly
          : totalPaymentsMonthly // ignore: cast_nullable_to_non_nullable
              as String?,
      banners: freezed == banners
          ? _value._banners
          : banners // ignore: cast_nullable_to_non_nullable
              as List<Banner>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$DashboardImpl implements _Dashboard {
  const _$DashboardImpl(
      {this.status,
      this.unreadNotificationsCount,
      this.totalStudents,
      this.totalPaymentsDaily,
      this.totalPaymentsMonthly,
      final List<Banner>? banners})
      : _banners = banners;

  factory _$DashboardImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardImplFromJson(json);

  @override
  final int? status;
  @override
  final int? unreadNotificationsCount;
  @override
  final int? totalStudents;
  @override
  final String? totalPaymentsDaily;
  @override
  final String? totalPaymentsMonthly;
  final List<Banner>? _banners;
  @override
  List<Banner>? get banners {
    final value = _banners;
    if (value == null) return null;
    if (_banners is EqualUnmodifiableListView) return _banners;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Dashboard(status: $status, unreadNotificationsCount: $unreadNotificationsCount, totalStudents: $totalStudents, totalPaymentsDaily: $totalPaymentsDaily, totalPaymentsMonthly: $totalPaymentsMonthly, banners: $banners)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(
                    other.unreadNotificationsCount, unreadNotificationsCount) ||
                other.unreadNotificationsCount == unreadNotificationsCount) &&
            (identical(other.totalStudents, totalStudents) ||
                other.totalStudents == totalStudents) &&
            (identical(other.totalPaymentsDaily, totalPaymentsDaily) ||
                other.totalPaymentsDaily == totalPaymentsDaily) &&
            (identical(other.totalPaymentsMonthly, totalPaymentsMonthly) ||
                other.totalPaymentsMonthly == totalPaymentsMonthly) &&
            const DeepCollectionEquality().equals(other._banners, _banners));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      unreadNotificationsCount,
      totalStudents,
      totalPaymentsDaily,
      totalPaymentsMonthly,
      const DeepCollectionEquality().hash(_banners));

  /// Create a copy of Dashboard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardImplCopyWith<_$DashboardImpl> get copyWith =>
      __$$DashboardImplCopyWithImpl<_$DashboardImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardImplToJson(
      this,
    );
  }
}

abstract class _Dashboard implements Dashboard {
  const factory _Dashboard(
      {final int? status,
      final int? unreadNotificationsCount,
      final int? totalStudents,
      final String? totalPaymentsDaily,
      final String? totalPaymentsMonthly,
      final List<Banner>? banners}) = _$DashboardImpl;

  factory _Dashboard.fromJson(Map<String, dynamic> json) =
      _$DashboardImpl.fromJson;

  @override
  int? get status;
  @override
  int? get unreadNotificationsCount;
  @override
  int? get totalStudents;
  @override
  String? get totalPaymentsDaily;
  @override
  String? get totalPaymentsMonthly;
  @override
  List<Banner>? get banners;

  /// Create a copy of Dashboard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardImplCopyWith<_$DashboardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Banner _$BannerFromJson(Map<String, dynamic> json) {
  return _Banner.fromJson(json);
}

/// @nodoc
mixin _$Banner {
  int? get id => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get extUrl => throw _privateConstructorUsedError;
  String? get extUrlButtonText => throw _privateConstructorUsedError;
  DateTime? get startTime => throw _privateConstructorUsedError;
  DateTime? get endTime => throw _privateConstructorUsedError;
  int? get order => throw _privateConstructorUsedError;
  int? get academyTypeId => throw _privateConstructorUsedError;
  int? get isActive => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Banner to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Banner
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BannerCopyWith<Banner> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BannerCopyWith<$Res> {
  factory $BannerCopyWith(Banner value, $Res Function(Banner) then) =
      _$BannerCopyWithImpl<$Res, Banner>;
  @useResult
  $Res call(
      {int? id,
      String? description,
      String? imageUrl,
      String? extUrl,
      String? extUrlButtonText,
      DateTime? startTime,
      DateTime? endTime,
      int? order,
      int? academyTypeId,
      int? isActive,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$BannerCopyWithImpl<$Res, $Val extends Banner>
    implements $BannerCopyWith<$Res> {
  _$BannerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Banner
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? description = freezed,
    Object? imageUrl = freezed,
    Object? extUrl = freezed,
    Object? extUrlButtonText = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? order = freezed,
    Object? academyTypeId = freezed,
    Object? isActive = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      extUrl: freezed == extUrl
          ? _value.extUrl
          : extUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      extUrlButtonText: freezed == extUrlButtonText
          ? _value.extUrlButtonText
          : extUrlButtonText // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
      academyTypeId: freezed == academyTypeId
          ? _value.academyTypeId
          : academyTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
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
abstract class _$$BannerImplCopyWith<$Res> implements $BannerCopyWith<$Res> {
  factory _$$BannerImplCopyWith(
          _$BannerImpl value, $Res Function(_$BannerImpl) then) =
      __$$BannerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? description,
      String? imageUrl,
      String? extUrl,
      String? extUrlButtonText,
      DateTime? startTime,
      DateTime? endTime,
      int? order,
      int? academyTypeId,
      int? isActive,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$BannerImplCopyWithImpl<$Res>
    extends _$BannerCopyWithImpl<$Res, _$BannerImpl>
    implements _$$BannerImplCopyWith<$Res> {
  __$$BannerImplCopyWithImpl(
      _$BannerImpl _value, $Res Function(_$BannerImpl) _then)
      : super(_value, _then);

  /// Create a copy of Banner
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? description = freezed,
    Object? imageUrl = freezed,
    Object? extUrl = freezed,
    Object? extUrlButtonText = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? order = freezed,
    Object? academyTypeId = freezed,
    Object? isActive = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$BannerImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      extUrl: freezed == extUrl
          ? _value.extUrl
          : extUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      extUrlButtonText: freezed == extUrlButtonText
          ? _value.extUrlButtonText
          : extUrlButtonText // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
      academyTypeId: freezed == academyTypeId
          ? _value.academyTypeId
          : academyTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
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
class _$BannerImpl implements _Banner {
  const _$BannerImpl(
      {this.id,
      this.description,
      this.imageUrl,
      this.extUrl,
      this.extUrlButtonText,
      this.startTime,
      this.endTime,
      this.order,
      this.academyTypeId,
      this.isActive,
      this.createdAt,
      this.updatedAt});

  factory _$BannerImpl.fromJson(Map<String, dynamic> json) =>
      _$$BannerImplFromJson(json);

  @override
  final int? id;
  @override
  final String? description;
  @override
  final String? imageUrl;
  @override
  final String? extUrl;
  @override
  final String? extUrlButtonText;
  @override
  final DateTime? startTime;
  @override
  final DateTime? endTime;
  @override
  final int? order;
  @override
  final int? academyTypeId;
  @override
  final int? isActive;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Banner(id: $id, description: $description, imageUrl: $imageUrl, extUrl: $extUrl, extUrlButtonText: $extUrlButtonText, startTime: $startTime, endTime: $endTime, order: $order, academyTypeId: $academyTypeId, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BannerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.extUrl, extUrl) || other.extUrl == extUrl) &&
            (identical(other.extUrlButtonText, extUrlButtonText) ||
                other.extUrlButtonText == extUrlButtonText) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.academyTypeId, academyTypeId) ||
                other.academyTypeId == academyTypeId) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      description,
      imageUrl,
      extUrl,
      extUrlButtonText,
      startTime,
      endTime,
      order,
      academyTypeId,
      isActive,
      createdAt,
      updatedAt);

  /// Create a copy of Banner
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BannerImplCopyWith<_$BannerImpl> get copyWith =>
      __$$BannerImplCopyWithImpl<_$BannerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BannerImplToJson(
      this,
    );
  }
}

abstract class _Banner implements Banner {
  const factory _Banner(
      {final int? id,
      final String? description,
      final String? imageUrl,
      final String? extUrl,
      final String? extUrlButtonText,
      final DateTime? startTime,
      final DateTime? endTime,
      final int? order,
      final int? academyTypeId,
      final int? isActive,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$BannerImpl;

  factory _Banner.fromJson(Map<String, dynamic> json) = _$BannerImpl.fromJson;

  @override
  int? get id;
  @override
  String? get description;
  @override
  String? get imageUrl;
  @override
  String? get extUrl;
  @override
  String? get extUrlButtonText;
  @override
  DateTime? get startTime;
  @override
  DateTime? get endTime;
  @override
  int? get order;
  @override
  int? get academyTypeId;
  @override
  int? get isActive;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of Banner
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BannerImplCopyWith<_$BannerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
