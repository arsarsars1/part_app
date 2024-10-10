// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reschedule_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RescheduleResponse _$RescheduleResponseFromJson(Map<String, dynamic> json) {
  return _RescheduleResponse.fromJson(json);
}

/// @nodoc
mixin _$RescheduleResponse {
  int? get status => throw _privateConstructorUsedError;
  List<RescheduledClass>? get rescheduledClasses =>
      throw _privateConstructorUsedError;

  /// Serializes this RescheduleResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RescheduleResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RescheduleResponseCopyWith<RescheduleResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RescheduleResponseCopyWith<$Res> {
  factory $RescheduleResponseCopyWith(
          RescheduleResponse value, $Res Function(RescheduleResponse) then) =
      _$RescheduleResponseCopyWithImpl<$Res, RescheduleResponse>;
  @useResult
  $Res call({int? status, List<RescheduledClass>? rescheduledClasses});
}

/// @nodoc
class _$RescheduleResponseCopyWithImpl<$Res, $Val extends RescheduleResponse>
    implements $RescheduleResponseCopyWith<$Res> {
  _$RescheduleResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RescheduleResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? rescheduledClasses = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      rescheduledClasses: freezed == rescheduledClasses
          ? _value.rescheduledClasses
          : rescheduledClasses // ignore: cast_nullable_to_non_nullable
              as List<RescheduledClass>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RescheduleResponseImplCopyWith<$Res>
    implements $RescheduleResponseCopyWith<$Res> {
  factory _$$RescheduleResponseImplCopyWith(_$RescheduleResponseImpl value,
          $Res Function(_$RescheduleResponseImpl) then) =
      __$$RescheduleResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? status, List<RescheduledClass>? rescheduledClasses});
}

/// @nodoc
class __$$RescheduleResponseImplCopyWithImpl<$Res>
    extends _$RescheduleResponseCopyWithImpl<$Res, _$RescheduleResponseImpl>
    implements _$$RescheduleResponseImplCopyWith<$Res> {
  __$$RescheduleResponseImplCopyWithImpl(_$RescheduleResponseImpl _value,
      $Res Function(_$RescheduleResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of RescheduleResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? rescheduledClasses = freezed,
  }) {
    return _then(_$RescheduleResponseImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      rescheduledClasses: freezed == rescheduledClasses
          ? _value._rescheduledClasses
          : rescheduledClasses // ignore: cast_nullable_to_non_nullable
              as List<RescheduledClass>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$RescheduleResponseImpl implements _RescheduleResponse {
  const _$RescheduleResponseImpl(
      {this.status, final List<RescheduledClass>? rescheduledClasses})
      : _rescheduledClasses = rescheduledClasses;

  factory _$RescheduleResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RescheduleResponseImplFromJson(json);

  @override
  final int? status;
  final List<RescheduledClass>? _rescheduledClasses;
  @override
  List<RescheduledClass>? get rescheduledClasses {
    final value = _rescheduledClasses;
    if (value == null) return null;
    if (_rescheduledClasses is EqualUnmodifiableListView)
      return _rescheduledClasses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'RescheduleResponse(status: $status, rescheduledClasses: $rescheduledClasses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RescheduleResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._rescheduledClasses, _rescheduledClasses));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(_rescheduledClasses));

  /// Create a copy of RescheduleResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RescheduleResponseImplCopyWith<_$RescheduleResponseImpl> get copyWith =>
      __$$RescheduleResponseImplCopyWithImpl<_$RescheduleResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RescheduleResponseImplToJson(
      this,
    );
  }
}

abstract class _RescheduleResponse implements RescheduleResponse {
  const factory _RescheduleResponse(
          {final int? status,
          final List<RescheduledClass>? rescheduledClasses}) =
      _$RescheduleResponseImpl;

  factory _RescheduleResponse.fromJson(Map<String, dynamic> json) =
      _$RescheduleResponseImpl.fromJson;

  @override
  int? get status;
  @override
  List<RescheduledClass>? get rescheduledClasses;

  /// Create a copy of RescheduleResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RescheduleResponseImplCopyWith<_$RescheduleResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RescheduledClasses _$RescheduledClassesFromJson(Map<String, dynamic> json) {
  return _RescheduledClasses.fromJson(json);
}

/// @nodoc
mixin _$RescheduledClasses {
  int? get currentPage => throw _privateConstructorUsedError;
  List<RescheduledClass>? get data => throw _privateConstructorUsedError;
  String? get firstPageUrl => throw _privateConstructorUsedError;
  String? get nextPageUrl => throw _privateConstructorUsedError;
  int? get from => throw _privateConstructorUsedError;
  String? get path => throw _privateConstructorUsedError;
  int? get perPage => throw _privateConstructorUsedError;
  int? get to => throw _privateConstructorUsedError;

  /// Serializes this RescheduledClasses to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RescheduledClasses
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RescheduledClassesCopyWith<RescheduledClasses> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RescheduledClassesCopyWith<$Res> {
  factory $RescheduledClassesCopyWith(
          RescheduledClasses value, $Res Function(RescheduledClasses) then) =
      _$RescheduledClassesCopyWithImpl<$Res, RescheduledClasses>;
  @useResult
  $Res call(
      {int? currentPage,
      List<RescheduledClass>? data,
      String? firstPageUrl,
      String? nextPageUrl,
      int? from,
      String? path,
      int? perPage,
      int? to});
}

/// @nodoc
class _$RescheduledClassesCopyWithImpl<$Res, $Val extends RescheduledClasses>
    implements $RescheduledClassesCopyWith<$Res> {
  _$RescheduledClassesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RescheduledClasses
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = freezed,
    Object? data = freezed,
    Object? firstPageUrl = freezed,
    Object? nextPageUrl = freezed,
    Object? from = freezed,
    Object? path = freezed,
    Object? perPage = freezed,
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
              as List<RescheduledClass>?,
      firstPageUrl: freezed == firstPageUrl
          ? _value.firstPageUrl
          : firstPageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      nextPageUrl: freezed == nextPageUrl
          ? _value.nextPageUrl
          : nextPageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as int?,
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$RescheduledClassesImplCopyWith<$Res>
    implements $RescheduledClassesCopyWith<$Res> {
  factory _$$RescheduledClassesImplCopyWith(_$RescheduledClassesImpl value,
          $Res Function(_$RescheduledClassesImpl) then) =
      __$$RescheduledClassesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? currentPage,
      List<RescheduledClass>? data,
      String? firstPageUrl,
      String? nextPageUrl,
      int? from,
      String? path,
      int? perPage,
      int? to});
}

/// @nodoc
class __$$RescheduledClassesImplCopyWithImpl<$Res>
    extends _$RescheduledClassesCopyWithImpl<$Res, _$RescheduledClassesImpl>
    implements _$$RescheduledClassesImplCopyWith<$Res> {
  __$$RescheduledClassesImplCopyWithImpl(_$RescheduledClassesImpl _value,
      $Res Function(_$RescheduledClassesImpl) _then)
      : super(_value, _then);

  /// Create a copy of RescheduledClasses
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = freezed,
    Object? data = freezed,
    Object? firstPageUrl = freezed,
    Object? nextPageUrl = freezed,
    Object? from = freezed,
    Object? path = freezed,
    Object? perPage = freezed,
    Object? to = freezed,
  }) {
    return _then(_$RescheduledClassesImpl(
      currentPage: freezed == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<RescheduledClass>?,
      firstPageUrl: freezed == firstPageUrl
          ? _value.firstPageUrl
          : firstPageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      nextPageUrl: freezed == nextPageUrl
          ? _value.nextPageUrl
          : nextPageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as int?,
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$RescheduledClassesImpl implements _RescheduledClasses {
  const _$RescheduledClassesImpl(
      {this.currentPage,
      final List<RescheduledClass>? data,
      this.firstPageUrl,
      this.nextPageUrl,
      this.from,
      this.path,
      this.perPage,
      this.to})
      : _data = data;

  factory _$RescheduledClassesImpl.fromJson(Map<String, dynamic> json) =>
      _$$RescheduledClassesImplFromJson(json);

  @override
  final int? currentPage;
  final List<RescheduledClass>? _data;
  @override
  List<RescheduledClass>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? firstPageUrl;
  @override
  final String? nextPageUrl;
  @override
  final int? from;
  @override
  final String? path;
  @override
  final int? perPage;
  @override
  final int? to;

  @override
  String toString() {
    return 'RescheduledClasses(currentPage: $currentPage, data: $data, firstPageUrl: $firstPageUrl, nextPageUrl: $nextPageUrl, from: $from, path: $path, perPage: $perPage, to: $to)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RescheduledClassesImpl &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.firstPageUrl, firstPageUrl) ||
                other.firstPageUrl == firstPageUrl) &&
            (identical(other.nextPageUrl, nextPageUrl) ||
                other.nextPageUrl == nextPageUrl) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.to, to) || other.to == to));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentPage,
      const DeepCollectionEquality().hash(_data),
      firstPageUrl,
      nextPageUrl,
      from,
      path,
      perPage,
      to);

  /// Create a copy of RescheduledClasses
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RescheduledClassesImplCopyWith<_$RescheduledClassesImpl> get copyWith =>
      __$$RescheduledClassesImplCopyWithImpl<_$RescheduledClassesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RescheduledClassesImplToJson(
      this,
    );
  }
}

abstract class _RescheduledClasses implements RescheduledClasses {
  const factory _RescheduledClasses(
      {final int? currentPage,
      final List<RescheduledClass>? data,
      final String? firstPageUrl,
      final String? nextPageUrl,
      final int? from,
      final String? path,
      final int? perPage,
      final int? to}) = _$RescheduledClassesImpl;

  factory _RescheduledClasses.fromJson(Map<String, dynamic> json) =
      _$RescheduledClassesImpl.fromJson;

  @override
  int? get currentPage;
  @override
  List<RescheduledClass>? get data;
  @override
  String? get firstPageUrl;
  @override
  String? get nextPageUrl;
  @override
  int? get from;
  @override
  String? get path;
  @override
  int? get perPage;
  @override
  int? get to;

  /// Create a copy of RescheduledClasses
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RescheduledClassesImplCopyWith<_$RescheduledClassesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RescheduledClass _$RescheduledClassFromJson(Map<String, dynamic> json) {
  return _RescheduledClass.fromJson(json);
}

/// @nodoc
mixin _$RescheduledClass {
  int? get id => throw _privateConstructorUsedError;
  int? get batchId => throw _privateConstructorUsedError;
  DateTime? get oldDate => throw _privateConstructorUsedError;
  String? get oldStartTime => throw _privateConstructorUsedError;
  String? get oldEndTime => throw _privateConstructorUsedError;
  DateTime? get newDate => throw _privateConstructorUsedError;
  String? get newStartTime => throw _privateConstructorUsedError;
  String? get newEndTime => throw _privateConstructorUsedError;
  String? get rescheduledByType => throw _privateConstructorUsedError;
  int? get rescheduledById => throw _privateConstructorUsedError;
  dynamic get cancelledDate => throw _privateConstructorUsedError;
  dynamic get cancelledStartTime => throw _privateConstructorUsedError;
  dynamic get cancelledEndTime => throw _privateConstructorUsedError;

  /// Serializes this RescheduledClass to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RescheduledClass
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RescheduledClassCopyWith<RescheduledClass> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RescheduledClassCopyWith<$Res> {
  factory $RescheduledClassCopyWith(
          RescheduledClass value, $Res Function(RescheduledClass) then) =
      _$RescheduledClassCopyWithImpl<$Res, RescheduledClass>;
  @useResult
  $Res call(
      {int? id,
      int? batchId,
      DateTime? oldDate,
      String? oldStartTime,
      String? oldEndTime,
      DateTime? newDate,
      String? newStartTime,
      String? newEndTime,
      String? rescheduledByType,
      int? rescheduledById,
      dynamic cancelledDate,
      dynamic cancelledStartTime,
      dynamic cancelledEndTime});
}

/// @nodoc
class _$RescheduledClassCopyWithImpl<$Res, $Val extends RescheduledClass>
    implements $RescheduledClassCopyWith<$Res> {
  _$RescheduledClassCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RescheduledClass
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? batchId = freezed,
    Object? oldDate = freezed,
    Object? oldStartTime = freezed,
    Object? oldEndTime = freezed,
    Object? newDate = freezed,
    Object? newStartTime = freezed,
    Object? newEndTime = freezed,
    Object? rescheduledByType = freezed,
    Object? rescheduledById = freezed,
    Object? cancelledDate = freezed,
    Object? cancelledStartTime = freezed,
    Object? cancelledEndTime = freezed,
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
      oldDate: freezed == oldDate
          ? _value.oldDate
          : oldDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      oldStartTime: freezed == oldStartTime
          ? _value.oldStartTime
          : oldStartTime // ignore: cast_nullable_to_non_nullable
              as String?,
      oldEndTime: freezed == oldEndTime
          ? _value.oldEndTime
          : oldEndTime // ignore: cast_nullable_to_non_nullable
              as String?,
      newDate: freezed == newDate
          ? _value.newDate
          : newDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      newStartTime: freezed == newStartTime
          ? _value.newStartTime
          : newStartTime // ignore: cast_nullable_to_non_nullable
              as String?,
      newEndTime: freezed == newEndTime
          ? _value.newEndTime
          : newEndTime // ignore: cast_nullable_to_non_nullable
              as String?,
      rescheduledByType: freezed == rescheduledByType
          ? _value.rescheduledByType
          : rescheduledByType // ignore: cast_nullable_to_non_nullable
              as String?,
      rescheduledById: freezed == rescheduledById
          ? _value.rescheduledById
          : rescheduledById // ignore: cast_nullable_to_non_nullable
              as int?,
      cancelledDate: freezed == cancelledDate
          ? _value.cancelledDate
          : cancelledDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      cancelledStartTime: freezed == cancelledStartTime
          ? _value.cancelledStartTime
          : cancelledStartTime // ignore: cast_nullable_to_non_nullable
              as dynamic,
      cancelledEndTime: freezed == cancelledEndTime
          ? _value.cancelledEndTime
          : cancelledEndTime // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RescheduledClassImplCopyWith<$Res>
    implements $RescheduledClassCopyWith<$Res> {
  factory _$$RescheduledClassImplCopyWith(_$RescheduledClassImpl value,
          $Res Function(_$RescheduledClassImpl) then) =
      __$$RescheduledClassImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? batchId,
      DateTime? oldDate,
      String? oldStartTime,
      String? oldEndTime,
      DateTime? newDate,
      String? newStartTime,
      String? newEndTime,
      String? rescheduledByType,
      int? rescheduledById,
      dynamic cancelledDate,
      dynamic cancelledStartTime,
      dynamic cancelledEndTime});
}

/// @nodoc
class __$$RescheduledClassImplCopyWithImpl<$Res>
    extends _$RescheduledClassCopyWithImpl<$Res, _$RescheduledClassImpl>
    implements _$$RescheduledClassImplCopyWith<$Res> {
  __$$RescheduledClassImplCopyWithImpl(_$RescheduledClassImpl _value,
      $Res Function(_$RescheduledClassImpl) _then)
      : super(_value, _then);

  /// Create a copy of RescheduledClass
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? batchId = freezed,
    Object? oldDate = freezed,
    Object? oldStartTime = freezed,
    Object? oldEndTime = freezed,
    Object? newDate = freezed,
    Object? newStartTime = freezed,
    Object? newEndTime = freezed,
    Object? rescheduledByType = freezed,
    Object? rescheduledById = freezed,
    Object? cancelledDate = freezed,
    Object? cancelledStartTime = freezed,
    Object? cancelledEndTime = freezed,
  }) {
    return _then(_$RescheduledClassImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      batchId: freezed == batchId
          ? _value.batchId
          : batchId // ignore: cast_nullable_to_non_nullable
              as int?,
      oldDate: freezed == oldDate
          ? _value.oldDate
          : oldDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      oldStartTime: freezed == oldStartTime
          ? _value.oldStartTime
          : oldStartTime // ignore: cast_nullable_to_non_nullable
              as String?,
      oldEndTime: freezed == oldEndTime
          ? _value.oldEndTime
          : oldEndTime // ignore: cast_nullable_to_non_nullable
              as String?,
      newDate: freezed == newDate
          ? _value.newDate
          : newDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      newStartTime: freezed == newStartTime
          ? _value.newStartTime
          : newStartTime // ignore: cast_nullable_to_non_nullable
              as String?,
      newEndTime: freezed == newEndTime
          ? _value.newEndTime
          : newEndTime // ignore: cast_nullable_to_non_nullable
              as String?,
      rescheduledByType: freezed == rescheduledByType
          ? _value.rescheduledByType
          : rescheduledByType // ignore: cast_nullable_to_non_nullable
              as String?,
      rescheduledById: freezed == rescheduledById
          ? _value.rescheduledById
          : rescheduledById // ignore: cast_nullable_to_non_nullable
              as int?,
      cancelledDate: freezed == cancelledDate
          ? _value.cancelledDate
          : cancelledDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      cancelledStartTime: freezed == cancelledStartTime
          ? _value.cancelledStartTime
          : cancelledStartTime // ignore: cast_nullable_to_non_nullable
              as dynamic,
      cancelledEndTime: freezed == cancelledEndTime
          ? _value.cancelledEndTime
          : cancelledEndTime // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$RescheduledClassImpl implements _RescheduledClass {
  const _$RescheduledClassImpl(
      {this.id,
      this.batchId,
      this.oldDate,
      this.oldStartTime,
      this.oldEndTime,
      this.newDate,
      this.newStartTime,
      this.newEndTime,
      this.rescheduledByType,
      this.rescheduledById,
      this.cancelledDate,
      this.cancelledStartTime,
      this.cancelledEndTime});

  factory _$RescheduledClassImpl.fromJson(Map<String, dynamic> json) =>
      _$$RescheduledClassImplFromJson(json);

  @override
  final int? id;
  @override
  final int? batchId;
  @override
  final DateTime? oldDate;
  @override
  final String? oldStartTime;
  @override
  final String? oldEndTime;
  @override
  final DateTime? newDate;
  @override
  final String? newStartTime;
  @override
  final String? newEndTime;
  @override
  final String? rescheduledByType;
  @override
  final int? rescheduledById;
  @override
  final dynamic cancelledDate;
  @override
  final dynamic cancelledStartTime;
  @override
  final dynamic cancelledEndTime;

  @override
  String toString() {
    return 'RescheduledClass(id: $id, batchId: $batchId, oldDate: $oldDate, oldStartTime: $oldStartTime, oldEndTime: $oldEndTime, newDate: $newDate, newStartTime: $newStartTime, newEndTime: $newEndTime, rescheduledByType: $rescheduledByType, rescheduledById: $rescheduledById, cancelledDate: $cancelledDate, cancelledStartTime: $cancelledStartTime, cancelledEndTime: $cancelledEndTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RescheduledClassImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.batchId, batchId) || other.batchId == batchId) &&
            (identical(other.oldDate, oldDate) || other.oldDate == oldDate) &&
            (identical(other.oldStartTime, oldStartTime) ||
                other.oldStartTime == oldStartTime) &&
            (identical(other.oldEndTime, oldEndTime) ||
                other.oldEndTime == oldEndTime) &&
            (identical(other.newDate, newDate) || other.newDate == newDate) &&
            (identical(other.newStartTime, newStartTime) ||
                other.newStartTime == newStartTime) &&
            (identical(other.newEndTime, newEndTime) ||
                other.newEndTime == newEndTime) &&
            (identical(other.rescheduledByType, rescheduledByType) ||
                other.rescheduledByType == rescheduledByType) &&
            (identical(other.rescheduledById, rescheduledById) ||
                other.rescheduledById == rescheduledById) &&
            const DeepCollectionEquality()
                .equals(other.cancelledDate, cancelledDate) &&
            const DeepCollectionEquality()
                .equals(other.cancelledStartTime, cancelledStartTime) &&
            const DeepCollectionEquality()
                .equals(other.cancelledEndTime, cancelledEndTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      batchId,
      oldDate,
      oldStartTime,
      oldEndTime,
      newDate,
      newStartTime,
      newEndTime,
      rescheduledByType,
      rescheduledById,
      const DeepCollectionEquality().hash(cancelledDate),
      const DeepCollectionEquality().hash(cancelledStartTime),
      const DeepCollectionEquality().hash(cancelledEndTime));

  /// Create a copy of RescheduledClass
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RescheduledClassImplCopyWith<_$RescheduledClassImpl> get copyWith =>
      __$$RescheduledClassImplCopyWithImpl<_$RescheduledClassImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RescheduledClassImplToJson(
      this,
    );
  }
}

abstract class _RescheduledClass implements RescheduledClass {
  const factory _RescheduledClass(
      {final int? id,
      final int? batchId,
      final DateTime? oldDate,
      final String? oldStartTime,
      final String? oldEndTime,
      final DateTime? newDate,
      final String? newStartTime,
      final String? newEndTime,
      final String? rescheduledByType,
      final int? rescheduledById,
      final dynamic cancelledDate,
      final dynamic cancelledStartTime,
      final dynamic cancelledEndTime}) = _$RescheduledClassImpl;

  factory _RescheduledClass.fromJson(Map<String, dynamic> json) =
      _$RescheduledClassImpl.fromJson;

  @override
  int? get id;
  @override
  int? get batchId;
  @override
  DateTime? get oldDate;
  @override
  String? get oldStartTime;
  @override
  String? get oldEndTime;
  @override
  DateTime? get newDate;
  @override
  String? get newStartTime;
  @override
  String? get newEndTime;
  @override
  String? get rescheduledByType;
  @override
  int? get rescheduledById;
  @override
  dynamic get cancelledDate;
  @override
  dynamic get cancelledStartTime;
  @override
  dynamic get cancelledEndTime;

  /// Create a copy of RescheduledClass
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RescheduledClassImplCopyWith<_$RescheduledClassImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
