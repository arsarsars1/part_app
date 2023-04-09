// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'class_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ClassResponse _$ClassResponseFromJson(Map<String, dynamic> json) {
  return _ClassResponse.fromJson(json);
}

/// @nodoc
mixin _$ClassResponse {
  int? get status => throw _privateConstructorUsedError;
  List<Class>? get classes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClassResponseCopyWith<ClassResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClassResponseCopyWith<$Res> {
  factory $ClassResponseCopyWith(
          ClassResponse value, $Res Function(ClassResponse) then) =
      _$ClassResponseCopyWithImpl<$Res, ClassResponse>;
  @useResult
  $Res call({int? status, List<Class>? classes});
}

/// @nodoc
class _$ClassResponseCopyWithImpl<$Res, $Val extends ClassResponse>
    implements $ClassResponseCopyWith<$Res> {
  _$ClassResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? classes = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      classes: freezed == classes
          ? _value.classes
          : classes // ignore: cast_nullable_to_non_nullable
              as List<Class>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ClassResponseCopyWith<$Res>
    implements $ClassResponseCopyWith<$Res> {
  factory _$$_ClassResponseCopyWith(
          _$_ClassResponse value, $Res Function(_$_ClassResponse) then) =
      __$$_ClassResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? status, List<Class>? classes});
}

/// @nodoc
class __$$_ClassResponseCopyWithImpl<$Res>
    extends _$ClassResponseCopyWithImpl<$Res, _$_ClassResponse>
    implements _$$_ClassResponseCopyWith<$Res> {
  __$$_ClassResponseCopyWithImpl(
      _$_ClassResponse _value, $Res Function(_$_ClassResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? classes = freezed,
  }) {
    return _then(_$_ClassResponse(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      classes: freezed == classes
          ? _value._classes
          : classes // ignore: cast_nullable_to_non_nullable
              as List<Class>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_ClassResponse implements _ClassResponse {
  const _$_ClassResponse({this.status, final List<Class>? classes})
      : _classes = classes;

  factory _$_ClassResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ClassResponseFromJson(json);

  @override
  final int? status;
  final List<Class>? _classes;
  @override
  List<Class>? get classes {
    final value = _classes;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ClassResponse(status: $status, classes: $classes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ClassResponse &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._classes, _classes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_classes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ClassResponseCopyWith<_$_ClassResponse> get copyWith =>
      __$$_ClassResponseCopyWithImpl<_$_ClassResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ClassResponseToJson(
      this,
    );
  }
}

abstract class _ClassResponse implements ClassResponse {
  const factory _ClassResponse(
      {final int? status, final List<Class>? classes}) = _$_ClassResponse;

  factory _ClassResponse.fromJson(Map<String, dynamic> json) =
      _$_ClassResponse.fromJson;

  @override
  int? get status;
  @override
  List<Class>? get classes;
  @override
  @JsonKey(ignore: true)
  _$$_ClassResponseCopyWith<_$_ClassResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

Class _$ClassFromJson(Map<String, dynamic> json) {
  return _Class.fromJson(json);
}

/// @nodoc
mixin _$Class {
  String? get startTime => throw _privateConstructorUsedError;
  String? get endTime => throw _privateConstructorUsedError;
  bool? get rescheduled => throw _privateConstructorUsedError;
  DateTime? get oldDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClassCopyWith<Class> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClassCopyWith<$Res> {
  factory $ClassCopyWith(Class value, $Res Function(Class) then) =
      _$ClassCopyWithImpl<$Res, Class>;
  @useResult
  $Res call(
      {String? startTime,
      String? endTime,
      bool? rescheduled,
      DateTime? oldDate});
}

/// @nodoc
class _$ClassCopyWithImpl<$Res, $Val extends Class>
    implements $ClassCopyWith<$Res> {
  _$ClassCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? rescheduled = freezed,
    Object? oldDate = freezed,
  }) {
    return _then(_value.copyWith(
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      rescheduled: freezed == rescheduled
          ? _value.rescheduled
          : rescheduled // ignore: cast_nullable_to_non_nullable
              as bool?,
      oldDate: freezed == oldDate
          ? _value.oldDate
          : oldDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ClassCopyWith<$Res> implements $ClassCopyWith<$Res> {
  factory _$$_ClassCopyWith(_$_Class value, $Res Function(_$_Class) then) =
      __$$_ClassCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? startTime,
      String? endTime,
      bool? rescheduled,
      DateTime? oldDate});
}

/// @nodoc
class __$$_ClassCopyWithImpl<$Res> extends _$ClassCopyWithImpl<$Res, _$_Class>
    implements _$$_ClassCopyWith<$Res> {
  __$$_ClassCopyWithImpl(_$_Class _value, $Res Function(_$_Class) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? rescheduled = freezed,
    Object? oldDate = freezed,
  }) {
    return _then(_$_Class(
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      rescheduled: freezed == rescheduled
          ? _value.rescheduled
          : rescheduled // ignore: cast_nullable_to_non_nullable
              as bool?,
      oldDate: freezed == oldDate
          ? _value.oldDate
          : oldDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Class implements _Class {
  const _$_Class(
      {this.startTime, this.endTime, this.rescheduled, this.oldDate});

  factory _$_Class.fromJson(Map<String, dynamic> json) =>
      _$$_ClassFromJson(json);

  @override
  final String? startTime;
  @override
  final String? endTime;
  @override
  final bool? rescheduled;
  @override
  final DateTime? oldDate;

  @override
  String toString() {
    return 'Class(startTime: $startTime, endTime: $endTime, rescheduled: $rescheduled, oldDate: $oldDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Class &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.rescheduled, rescheduled) ||
                other.rescheduled == rescheduled) &&
            (identical(other.oldDate, oldDate) || other.oldDate == oldDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, startTime, endTime, rescheduled, oldDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ClassCopyWith<_$_Class> get copyWith =>
      __$$_ClassCopyWithImpl<_$_Class>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ClassToJson(
      this,
    );
  }
}

abstract class _Class implements Class {
  const factory _Class(
      {final String? startTime,
      final String? endTime,
      final bool? rescheduled,
      final DateTime? oldDate}) = _$_Class;

  factory _Class.fromJson(Map<String, dynamic> json) = _$_Class.fromJson;

  @override
  String? get startTime;
  @override
  String? get endTime;
  @override
  bool? get rescheduled;
  @override
  DateTime? get oldDate;
  @override
  @JsonKey(ignore: true)
  _$$_ClassCopyWith<_$_Class> get copyWith =>
      throw _privateConstructorUsedError;
}
