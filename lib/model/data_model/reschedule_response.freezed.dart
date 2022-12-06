// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'reschedule_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RescheduleResponse _$RescheduleResponseFromJson(Map<String, dynamic> json) {
  return _RescheduleResponse.fromJson(json);
}

/// @nodoc
mixin _$RescheduleResponse {
  int? get status => throw _privateConstructorUsedError;
  RescheduledClasses? get rescheduledClasses =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RescheduleResponseCopyWith<RescheduleResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RescheduleResponseCopyWith<$Res> {
  factory $RescheduleResponseCopyWith(
          RescheduleResponse value, $Res Function(RescheduleResponse) then) =
      _$RescheduleResponseCopyWithImpl<$Res, RescheduleResponse>;
  @useResult
  $Res call({int? status, RescheduledClasses? rescheduledClasses});

  $RescheduledClassesCopyWith<$Res>? get rescheduledClasses;
}

/// @nodoc
class _$RescheduleResponseCopyWithImpl<$Res, $Val extends RescheduleResponse>
    implements $RescheduleResponseCopyWith<$Res> {
  _$RescheduleResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
              as RescheduledClasses?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RescheduledClassesCopyWith<$Res>? get rescheduledClasses {
    if (_value.rescheduledClasses == null) {
      return null;
    }

    return $RescheduledClassesCopyWith<$Res>(_value.rescheduledClasses!,
        (value) {
      return _then(_value.copyWith(rescheduledClasses: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_RescheduleResponseCopyWith<$Res>
    implements $RescheduleResponseCopyWith<$Res> {
  factory _$$_RescheduleResponseCopyWith(_$_RescheduleResponse value,
          $Res Function(_$_RescheduleResponse) then) =
      __$$_RescheduleResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? status, RescheduledClasses? rescheduledClasses});

  @override
  $RescheduledClassesCopyWith<$Res>? get rescheduledClasses;
}

/// @nodoc
class __$$_RescheduleResponseCopyWithImpl<$Res>
    extends _$RescheduleResponseCopyWithImpl<$Res, _$_RescheduleResponse>
    implements _$$_RescheduleResponseCopyWith<$Res> {
  __$$_RescheduleResponseCopyWithImpl(
      _$_RescheduleResponse _value, $Res Function(_$_RescheduleResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? rescheduledClasses = freezed,
  }) {
    return _then(_$_RescheduleResponse(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      rescheduledClasses: freezed == rescheduledClasses
          ? _value.rescheduledClasses
          : rescheduledClasses // ignore: cast_nullable_to_non_nullable
              as RescheduledClasses?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_RescheduleResponse implements _RescheduleResponse {
  const _$_RescheduleResponse({this.status, this.rescheduledClasses});

  factory _$_RescheduleResponse.fromJson(Map<String, dynamic> json) =>
      _$$_RescheduleResponseFromJson(json);

  @override
  final int? status;
  @override
  final RescheduledClasses? rescheduledClasses;

  @override
  String toString() {
    return 'RescheduleResponse(status: $status, rescheduledClasses: $rescheduledClasses)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RescheduleResponse &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.rescheduledClasses, rescheduledClasses) ||
                other.rescheduledClasses == rescheduledClasses));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, rescheduledClasses);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RescheduleResponseCopyWith<_$_RescheduleResponse> get copyWith =>
      __$$_RescheduleResponseCopyWithImpl<_$_RescheduleResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RescheduleResponseToJson(
      this,
    );
  }
}

abstract class _RescheduleResponse implements RescheduleResponse {
  const factory _RescheduleResponse(
      {final int? status,
      final RescheduledClasses? rescheduledClasses}) = _$_RescheduleResponse;

  factory _RescheduleResponse.fromJson(Map<String, dynamic> json) =
      _$_RescheduleResponse.fromJson;

  @override
  int? get status;
  @override
  RescheduledClasses? get rescheduledClasses;
  @override
  @JsonKey(ignore: true)
  _$$_RescheduleResponseCopyWith<_$_RescheduleResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

RescheduledClasses _$RescheduledClassesFromJson(Map<String, dynamic> json) {
  return _RescheduledClasses.fromJson(json);
}

/// @nodoc
mixin _$RescheduledClasses {
  int? get currentPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  List<BatchDetail>? get batchDetails => throw _privateConstructorUsedError;
  String? get firstPageUrl => throw _privateConstructorUsedError;
  int? get from => throw _privateConstructorUsedError;
  String? get path => throw _privateConstructorUsedError;
  int? get perPage => throw _privateConstructorUsedError;
  int? get to => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
      @JsonKey(name: 'data') List<BatchDetail>? batchDetails,
      String? firstPageUrl,
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

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = freezed,
    Object? batchDetails = freezed,
    Object? firstPageUrl = freezed,
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
      batchDetails: freezed == batchDetails
          ? _value.batchDetails
          : batchDetails // ignore: cast_nullable_to_non_nullable
              as List<BatchDetail>?,
      firstPageUrl: freezed == firstPageUrl
          ? _value.firstPageUrl
          : firstPageUrl // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_RescheduledClassesCopyWith<$Res>
    implements $RescheduledClassesCopyWith<$Res> {
  factory _$$_RescheduledClassesCopyWith(_$_RescheduledClasses value,
          $Res Function(_$_RescheduledClasses) then) =
      __$$_RescheduledClassesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? currentPage,
      @JsonKey(name: 'data') List<BatchDetail>? batchDetails,
      String? firstPageUrl,
      int? from,
      String? path,
      int? perPage,
      int? to});
}

/// @nodoc
class __$$_RescheduledClassesCopyWithImpl<$Res>
    extends _$RescheduledClassesCopyWithImpl<$Res, _$_RescheduledClasses>
    implements _$$_RescheduledClassesCopyWith<$Res> {
  __$$_RescheduledClassesCopyWithImpl(
      _$_RescheduledClasses _value, $Res Function(_$_RescheduledClasses) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = freezed,
    Object? batchDetails = freezed,
    Object? firstPageUrl = freezed,
    Object? from = freezed,
    Object? path = freezed,
    Object? perPage = freezed,
    Object? to = freezed,
  }) {
    return _then(_$_RescheduledClasses(
      currentPage: freezed == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int?,
      batchDetails: freezed == batchDetails
          ? _value._batchDetails
          : batchDetails // ignore: cast_nullable_to_non_nullable
              as List<BatchDetail>?,
      firstPageUrl: freezed == firstPageUrl
          ? _value.firstPageUrl
          : firstPageUrl // ignore: cast_nullable_to_non_nullable
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
class _$_RescheduledClasses implements _RescheduledClasses {
  const _$_RescheduledClasses(
      {this.currentPage,
      @JsonKey(name: 'data') final List<BatchDetail>? batchDetails,
      this.firstPageUrl,
      this.from,
      this.path,
      this.perPage,
      this.to})
      : _batchDetails = batchDetails;

  factory _$_RescheduledClasses.fromJson(Map<String, dynamic> json) =>
      _$$_RescheduledClassesFromJson(json);

  @override
  final int? currentPage;
  final List<BatchDetail>? _batchDetails;
  @override
  @JsonKey(name: 'data')
  List<BatchDetail>? get batchDetails {
    final value = _batchDetails;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? firstPageUrl;
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
    return 'RescheduledClasses(currentPage: $currentPage, batchDetails: $batchDetails, firstPageUrl: $firstPageUrl, from: $from, path: $path, perPage: $perPage, to: $to)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RescheduledClasses &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            const DeepCollectionEquality()
                .equals(other._batchDetails, _batchDetails) &&
            (identical(other.firstPageUrl, firstPageUrl) ||
                other.firstPageUrl == firstPageUrl) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.to, to) || other.to == to));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentPage,
      const DeepCollectionEquality().hash(_batchDetails),
      firstPageUrl,
      from,
      path,
      perPage,
      to);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RescheduledClassesCopyWith<_$_RescheduledClasses> get copyWith =>
      __$$_RescheduledClassesCopyWithImpl<_$_RescheduledClasses>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RescheduledClassesToJson(
      this,
    );
  }
}

abstract class _RescheduledClasses implements RescheduledClasses {
  const factory _RescheduledClasses(
      {final int? currentPage,
      @JsonKey(name: 'data') final List<BatchDetail>? batchDetails,
      final String? firstPageUrl,
      final int? from,
      final String? path,
      final int? perPage,
      final int? to}) = _$_RescheduledClasses;

  factory _RescheduledClasses.fromJson(Map<String, dynamic> json) =
      _$_RescheduledClasses.fromJson;

  @override
  int? get currentPage;
  @override
  @JsonKey(name: 'data')
  List<BatchDetail>? get batchDetails;
  @override
  String? get firstPageUrl;
  @override
  int? get from;
  @override
  String? get path;
  @override
  int? get perPage;
  @override
  int? get to;
  @override
  @JsonKey(ignore: true)
  _$$_RescheduledClassesCopyWith<_$_RescheduledClasses> get copyWith =>
      throw _privateConstructorUsedError;
}
