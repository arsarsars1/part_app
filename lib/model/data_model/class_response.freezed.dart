// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
abstract class _$$ClassResponseImplCopyWith<$Res>
    implements $ClassResponseCopyWith<$Res> {
  factory _$$ClassResponseImplCopyWith(
          _$ClassResponseImpl value, $Res Function(_$ClassResponseImpl) then) =
      __$$ClassResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? status, List<Class>? classes});
}

/// @nodoc
class __$$ClassResponseImplCopyWithImpl<$Res>
    extends _$ClassResponseCopyWithImpl<$Res, _$ClassResponseImpl>
    implements _$$ClassResponseImplCopyWith<$Res> {
  __$$ClassResponseImplCopyWithImpl(
      _$ClassResponseImpl _value, $Res Function(_$ClassResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? classes = freezed,
  }) {
    return _then(_$ClassResponseImpl(
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
class _$ClassResponseImpl implements _ClassResponse {
  const _$ClassResponseImpl({this.status, final List<Class>? classes})
      : _classes = classes;

  factory _$ClassResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClassResponseImplFromJson(json);

  @override
  final int? status;
  final List<Class>? _classes;
  @override
  List<Class>? get classes {
    final value = _classes;
    if (value == null) return null;
    if (_classes is EqualUnmodifiableListView) return _classes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ClassResponse(status: $status, classes: $classes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClassResponseImpl &&
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
  _$$ClassResponseImplCopyWith<_$ClassResponseImpl> get copyWith =>
      __$$ClassResponseImplCopyWithImpl<_$ClassResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClassResponseImplToJson(
      this,
    );
  }
}

abstract class _ClassResponse implements ClassResponse {
  const factory _ClassResponse(
      {final int? status, final List<Class>? classes}) = _$ClassResponseImpl;

  factory _ClassResponse.fromJson(Map<String, dynamic> json) =
      _$ClassResponseImpl.fromJson;

  @override
  int? get status;
  @override
  List<Class>? get classes;
  @override
  @JsonKey(ignore: true)
  _$$ClassResponseImplCopyWith<_$ClassResponseImpl> get copyWith =>
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
  int? get batchId => throw _privateConstructorUsedError;
  String? get batchName => throw _privateConstructorUsedError;
  int? get activeStudentsCount => throw _privateConstructorUsedError;
  int? get inactiveStudentsCount => throw _privateConstructorUsedError;
  String? get courseName => throw _privateConstructorUsedError;
  String? get subjectName => throw _privateConstructorUsedError;
  String? get branchName => throw _privateConstructorUsedError;
  String? get trainers => throw _privateConstructorUsedError;

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
      DateTime? oldDate,
      int? batchId,
      String? batchName,
      int? activeStudentsCount,
      int? inactiveStudentsCount,
      String? courseName,
      String? subjectName,
      String? branchName,
      String? trainers});
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
    Object? batchId = freezed,
    Object? batchName = freezed,
    Object? activeStudentsCount = freezed,
    Object? inactiveStudentsCount = freezed,
    Object? courseName = freezed,
    Object? subjectName = freezed,
    Object? branchName = freezed,
    Object? trainers = freezed,
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
      batchId: freezed == batchId
          ? _value.batchId
          : batchId // ignore: cast_nullable_to_non_nullable
              as int?,
      batchName: freezed == batchName
          ? _value.batchName
          : batchName // ignore: cast_nullable_to_non_nullable
              as String?,
      activeStudentsCount: freezed == activeStudentsCount
          ? _value.activeStudentsCount
          : activeStudentsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      inactiveStudentsCount: freezed == inactiveStudentsCount
          ? _value.inactiveStudentsCount
          : inactiveStudentsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      courseName: freezed == courseName
          ? _value.courseName
          : courseName // ignore: cast_nullable_to_non_nullable
              as String?,
      subjectName: freezed == subjectName
          ? _value.subjectName
          : subjectName // ignore: cast_nullable_to_non_nullable
              as String?,
      branchName: freezed == branchName
          ? _value.branchName
          : branchName // ignore: cast_nullable_to_non_nullable
              as String?,
      trainers: freezed == trainers
          ? _value.trainers
          : trainers // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClassImplCopyWith<$Res> implements $ClassCopyWith<$Res> {
  factory _$$ClassImplCopyWith(
          _$ClassImpl value, $Res Function(_$ClassImpl) then) =
      __$$ClassImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? startTime,
      String? endTime,
      bool? rescheduled,
      DateTime? oldDate,
      int? batchId,
      String? batchName,
      int? activeStudentsCount,
      int? inactiveStudentsCount,
      String? courseName,
      String? subjectName,
      String? branchName,
      String? trainers});
}

/// @nodoc
class __$$ClassImplCopyWithImpl<$Res>
    extends _$ClassCopyWithImpl<$Res, _$ClassImpl>
    implements _$$ClassImplCopyWith<$Res> {
  __$$ClassImplCopyWithImpl(
      _$ClassImpl _value, $Res Function(_$ClassImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? rescheduled = freezed,
    Object? oldDate = freezed,
    Object? batchId = freezed,
    Object? batchName = freezed,
    Object? activeStudentsCount = freezed,
    Object? inactiveStudentsCount = freezed,
    Object? courseName = freezed,
    Object? subjectName = freezed,
    Object? branchName = freezed,
    Object? trainers = freezed,
  }) {
    return _then(_$ClassImpl(
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
      batchId: freezed == batchId
          ? _value.batchId
          : batchId // ignore: cast_nullable_to_non_nullable
              as int?,
      batchName: freezed == batchName
          ? _value.batchName
          : batchName // ignore: cast_nullable_to_non_nullable
              as String?,
      activeStudentsCount: freezed == activeStudentsCount
          ? _value.activeStudentsCount
          : activeStudentsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      inactiveStudentsCount: freezed == inactiveStudentsCount
          ? _value.inactiveStudentsCount
          : inactiveStudentsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      courseName: freezed == courseName
          ? _value.courseName
          : courseName // ignore: cast_nullable_to_non_nullable
              as String?,
      subjectName: freezed == subjectName
          ? _value.subjectName
          : subjectName // ignore: cast_nullable_to_non_nullable
              as String?,
      branchName: freezed == branchName
          ? _value.branchName
          : branchName // ignore: cast_nullable_to_non_nullable
              as String?,
      trainers: freezed == trainers
          ? _value.trainers
          : trainers // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$ClassImpl implements _Class {
  const _$ClassImpl(
      {this.startTime,
      this.endTime,
      this.rescheduled,
      this.oldDate,
      this.batchId,
      this.batchName,
      this.activeStudentsCount,
      this.inactiveStudentsCount,
      this.courseName,
      this.subjectName,
      this.branchName,
      this.trainers});

  factory _$ClassImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClassImplFromJson(json);

  @override
  final String? startTime;
  @override
  final String? endTime;
  @override
  final bool? rescheduled;
  @override
  final DateTime? oldDate;
  @override
  final int? batchId;
  @override
  final String? batchName;
  @override
  final int? activeStudentsCount;
  @override
  final int? inactiveStudentsCount;
  @override
  final String? courseName;
  @override
  final String? subjectName;
  @override
  final String? branchName;
  @override
  final String? trainers;

  @override
  String toString() {
    return 'Class(startTime: $startTime, endTime: $endTime, rescheduled: $rescheduled, oldDate: $oldDate, batchId: $batchId, batchName: $batchName, activeStudentsCount: $activeStudentsCount, inactiveStudentsCount: $inactiveStudentsCount, courseName: $courseName, subjectName: $subjectName, branchName: $branchName, trainers: $trainers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClassImpl &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.rescheduled, rescheduled) ||
                other.rescheduled == rescheduled) &&
            (identical(other.oldDate, oldDate) || other.oldDate == oldDate) &&
            (identical(other.batchId, batchId) || other.batchId == batchId) &&
            (identical(other.batchName, batchName) ||
                other.batchName == batchName) &&
            (identical(other.activeStudentsCount, activeStudentsCount) ||
                other.activeStudentsCount == activeStudentsCount) &&
            (identical(other.inactiveStudentsCount, inactiveStudentsCount) ||
                other.inactiveStudentsCount == inactiveStudentsCount) &&
            (identical(other.courseName, courseName) ||
                other.courseName == courseName) &&
            (identical(other.subjectName, subjectName) ||
                other.subjectName == subjectName) &&
            (identical(other.branchName, branchName) ||
                other.branchName == branchName) &&
            (identical(other.trainers, trainers) ||
                other.trainers == trainers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      startTime,
      endTime,
      rescheduled,
      oldDate,
      batchId,
      batchName,
      activeStudentsCount,
      inactiveStudentsCount,
      courseName,
      subjectName,
      branchName,
      trainers);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClassImplCopyWith<_$ClassImpl> get copyWith =>
      __$$ClassImplCopyWithImpl<_$ClassImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClassImplToJson(
      this,
    );
  }
}

abstract class _Class implements Class {
  const factory _Class(
      {final String? startTime,
      final String? endTime,
      final bool? rescheduled,
      final DateTime? oldDate,
      final int? batchId,
      final String? batchName,
      final int? activeStudentsCount,
      final int? inactiveStudentsCount,
      final String? courseName,
      final String? subjectName,
      final String? branchName,
      final String? trainers}) = _$ClassImpl;

  factory _Class.fromJson(Map<String, dynamic> json) = _$ClassImpl.fromJson;

  @override
  String? get startTime;
  @override
  String? get endTime;
  @override
  bool? get rescheduled;
  @override
  DateTime? get oldDate;
  @override
  int? get batchId;
  @override
  String? get batchName;
  @override
  int? get activeStudentsCount;
  @override
  int? get inactiveStudentsCount;
  @override
  String? get courseName;
  @override
  String? get subjectName;
  @override
  String? get branchName;
  @override
  String? get trainers;
  @override
  @JsonKey(ignore: true)
  _$$ClassImplCopyWith<_$ClassImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
