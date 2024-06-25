// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'students_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StudentsResponse _$StudentsResponseFromJson(Map<String, dynamic> json) {
  return _StudentsResponse.fromJson(json);
}

/// @nodoc
mixin _$StudentsResponse {
  int? get status => throw _privateConstructorUsedError;
  int? get activeStudentsCount => throw _privateConstructorUsedError;
  int? get inactiveStudentsCount => throw _privateConstructorUsedError;
  Students? get students => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StudentsResponseCopyWith<StudentsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentsResponseCopyWith<$Res> {
  factory $StudentsResponseCopyWith(
          StudentsResponse value, $Res Function(StudentsResponse) then) =
      _$StudentsResponseCopyWithImpl<$Res, StudentsResponse>;
  @useResult
  $Res call(
      {int? status,
      int? activeStudentsCount,
      int? inactiveStudentsCount,
      Students? students});

  $StudentsCopyWith<$Res>? get students;
}

/// @nodoc
class _$StudentsResponseCopyWithImpl<$Res, $Val extends StudentsResponse>
    implements $StudentsResponseCopyWith<$Res> {
  _$StudentsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? activeStudentsCount = freezed,
    Object? inactiveStudentsCount = freezed,
    Object? students = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      activeStudentsCount: freezed == activeStudentsCount
          ? _value.activeStudentsCount
          : activeStudentsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      inactiveStudentsCount: freezed == inactiveStudentsCount
          ? _value.inactiveStudentsCount
          : inactiveStudentsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      students: freezed == students
          ? _value.students
          : students // ignore: cast_nullable_to_non_nullable
              as Students?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StudentsCopyWith<$Res>? get students {
    if (_value.students == null) {
      return null;
    }

    return $StudentsCopyWith<$Res>(_value.students!, (value) {
      return _then(_value.copyWith(students: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StudentsResponseImplCopyWith<$Res>
    implements $StudentsResponseCopyWith<$Res> {
  factory _$$StudentsResponseImplCopyWith(_$StudentsResponseImpl value,
          $Res Function(_$StudentsResponseImpl) then) =
      __$$StudentsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? status,
      int? activeStudentsCount,
      int? inactiveStudentsCount,
      Students? students});

  @override
  $StudentsCopyWith<$Res>? get students;
}

/// @nodoc
class __$$StudentsResponseImplCopyWithImpl<$Res>
    extends _$StudentsResponseCopyWithImpl<$Res, _$StudentsResponseImpl>
    implements _$$StudentsResponseImplCopyWith<$Res> {
  __$$StudentsResponseImplCopyWithImpl(_$StudentsResponseImpl _value,
      $Res Function(_$StudentsResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? activeStudentsCount = freezed,
    Object? inactiveStudentsCount = freezed,
    Object? students = freezed,
  }) {
    return _then(_$StudentsResponseImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      activeStudentsCount: freezed == activeStudentsCount
          ? _value.activeStudentsCount
          : activeStudentsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      inactiveStudentsCount: freezed == inactiveStudentsCount
          ? _value.inactiveStudentsCount
          : inactiveStudentsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      students: freezed == students
          ? _value.students
          : students // ignore: cast_nullable_to_non_nullable
              as Students?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$StudentsResponseImpl implements _StudentsResponse {
  const _$StudentsResponseImpl(
      {this.status,
      this.activeStudentsCount,
      this.inactiveStudentsCount,
      this.students});

  factory _$StudentsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudentsResponseImplFromJson(json);

  @override
  final int? status;
  @override
  final int? activeStudentsCount;
  @override
  final int? inactiveStudentsCount;
  @override
  final Students? students;

  @override
  String toString() {
    return 'StudentsResponse(status: $status, activeStudentsCount: $activeStudentsCount, inactiveStudentsCount: $inactiveStudentsCount, students: $students)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentsResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.activeStudentsCount, activeStudentsCount) ||
                other.activeStudentsCount == activeStudentsCount) &&
            (identical(other.inactiveStudentsCount, inactiveStudentsCount) ||
                other.inactiveStudentsCount == inactiveStudentsCount) &&
            (identical(other.students, students) ||
                other.students == students));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, activeStudentsCount,
      inactiveStudentsCount, students);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentsResponseImplCopyWith<_$StudentsResponseImpl> get copyWith =>
      __$$StudentsResponseImplCopyWithImpl<_$StudentsResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StudentsResponseImplToJson(
      this,
    );
  }
}

abstract class _StudentsResponse implements StudentsResponse {
  const factory _StudentsResponse(
      {final int? status,
      final int? activeStudentsCount,
      final int? inactiveStudentsCount,
      final Students? students}) = _$StudentsResponseImpl;

  factory _StudentsResponse.fromJson(Map<String, dynamic> json) =
      _$StudentsResponseImpl.fromJson;

  @override
  int? get status;
  @override
  int? get activeStudentsCount;
  @override
  int? get inactiveStudentsCount;
  @override
  Students? get students;
  @override
  @JsonKey(ignore: true)
  _$$StudentsResponseImplCopyWith<_$StudentsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Students _$StudentsFromJson(Map<String, dynamic> json) {
  return _Students.fromJson(json);
}

/// @nodoc
mixin _$Students {
  int? get currentPage => throw _privateConstructorUsedError;
  List<Student>? get data => throw _privateConstructorUsedError;
  String? get firstPageUrl => throw _privateConstructorUsedError;
  String? get nextPageUrl => throw _privateConstructorUsedError;
  int? get from => throw _privateConstructorUsedError;
  String? get path => throw _privateConstructorUsedError;
  int? get perPage => throw _privateConstructorUsedError;
  int? get to => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StudentsCopyWith<Students> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentsCopyWith<$Res> {
  factory $StudentsCopyWith(Students value, $Res Function(Students) then) =
      _$StudentsCopyWithImpl<$Res, Students>;
  @useResult
  $Res call(
      {int? currentPage,
      List<Student>? data,
      String? firstPageUrl,
      String? nextPageUrl,
      int? from,
      String? path,
      int? perPage,
      int? to});
}

/// @nodoc
class _$StudentsCopyWithImpl<$Res, $Val extends Students>
    implements $StudentsCopyWith<$Res> {
  _$StudentsCopyWithImpl(this._value, this._then);

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
              as List<Student>?,
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
abstract class _$$StudentsImplCopyWith<$Res>
    implements $StudentsCopyWith<$Res> {
  factory _$$StudentsImplCopyWith(
          _$StudentsImpl value, $Res Function(_$StudentsImpl) then) =
      __$$StudentsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? currentPage,
      List<Student>? data,
      String? firstPageUrl,
      String? nextPageUrl,
      int? from,
      String? path,
      int? perPage,
      int? to});
}

/// @nodoc
class __$$StudentsImplCopyWithImpl<$Res>
    extends _$StudentsCopyWithImpl<$Res, _$StudentsImpl>
    implements _$$StudentsImplCopyWith<$Res> {
  __$$StudentsImplCopyWithImpl(
      _$StudentsImpl _value, $Res Function(_$StudentsImpl) _then)
      : super(_value, _then);

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
    return _then(_$StudentsImpl(
      currentPage: freezed == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Student>?,
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
class _$StudentsImpl implements _Students {
  const _$StudentsImpl(
      {this.currentPage,
      final List<Student>? data,
      this.firstPageUrl,
      this.nextPageUrl,
      this.from,
      this.path,
      this.perPage,
      this.to})
      : _data = data;

  factory _$StudentsImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudentsImplFromJson(json);

  @override
  final int? currentPage;
  final List<Student>? _data;
  @override
  List<Student>? get data {
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
    return 'Students(currentPage: $currentPage, data: $data, firstPageUrl: $firstPageUrl, nextPageUrl: $nextPageUrl, from: $from, path: $path, perPage: $perPage, to: $to)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentsImpl &&
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

  @JsonKey(ignore: true)
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentsImplCopyWith<_$StudentsImpl> get copyWith =>
      __$$StudentsImplCopyWithImpl<_$StudentsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StudentsImplToJson(
      this,
    );
  }
}

abstract class _Students implements Students {
  const factory _Students(
      {final int? currentPage,
      final List<Student>? data,
      final String? firstPageUrl,
      final String? nextPageUrl,
      final int? from,
      final String? path,
      final int? perPage,
      final int? to}) = _$StudentsImpl;

  factory _Students.fromJson(Map<String, dynamic> json) =
      _$StudentsImpl.fromJson;

  @override
  int? get currentPage;
  @override
  List<Student>? get data;
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
  @override
  @JsonKey(ignore: true)
  _$$StudentsImplCopyWith<_$StudentsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StudentResponse _$StudentResponseFromJson(Map<String, dynamic> json) {
  return _StudentResponse.fromJson(json);
}

/// @nodoc
mixin _$StudentResponse {
  int? get status => throw _privateConstructorUsedError;
  Student? get student => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StudentResponseCopyWith<StudentResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentResponseCopyWith<$Res> {
  factory $StudentResponseCopyWith(
          StudentResponse value, $Res Function(StudentResponse) then) =
      _$StudentResponseCopyWithImpl<$Res, StudentResponse>;
  @useResult
  $Res call({int? status, Student? student, String? message});

  $StudentCopyWith<$Res>? get student;
}

/// @nodoc
class _$StudentResponseCopyWithImpl<$Res, $Val extends StudentResponse>
    implements $StudentResponseCopyWith<$Res> {
  _$StudentResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? student = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      student: freezed == student
          ? _value.student
          : student // ignore: cast_nullable_to_non_nullable
              as Student?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StudentCopyWith<$Res>? get student {
    if (_value.student == null) {
      return null;
    }

    return $StudentCopyWith<$Res>(_value.student!, (value) {
      return _then(_value.copyWith(student: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StudentResponseImplCopyWith<$Res>
    implements $StudentResponseCopyWith<$Res> {
  factory _$$StudentResponseImplCopyWith(_$StudentResponseImpl value,
          $Res Function(_$StudentResponseImpl) then) =
      __$$StudentResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? status, Student? student, String? message});

  @override
  $StudentCopyWith<$Res>? get student;
}

/// @nodoc
class __$$StudentResponseImplCopyWithImpl<$Res>
    extends _$StudentResponseCopyWithImpl<$Res, _$StudentResponseImpl>
    implements _$$StudentResponseImplCopyWith<$Res> {
  __$$StudentResponseImplCopyWithImpl(
      _$StudentResponseImpl _value, $Res Function(_$StudentResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? student = freezed,
    Object? message = freezed,
  }) {
    return _then(_$StudentResponseImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      student: freezed == student
          ? _value.student
          : student // ignore: cast_nullable_to_non_nullable
              as Student?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StudentResponseImpl implements _StudentResponse {
  const _$StudentResponseImpl({this.status, this.student, this.message});

  factory _$StudentResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudentResponseImplFromJson(json);

  @override
  final int? status;
  @override
  final Student? student;
  @override
  final String? message;

  @override
  String toString() {
    return 'StudentResponse(status: $status, student: $student, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.student, student) || other.student == student) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, student, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentResponseImplCopyWith<_$StudentResponseImpl> get copyWith =>
      __$$StudentResponseImplCopyWithImpl<_$StudentResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StudentResponseImplToJson(
      this,
    );
  }
}

abstract class _StudentResponse implements StudentResponse {
  const factory _StudentResponse(
      {final int? status,
      final Student? student,
      final String? message}) = _$StudentResponseImpl;

  factory _StudentResponse.fromJson(Map<String, dynamic> json) =
      _$StudentResponseImpl.fromJson;

  @override
  int? get status;
  @override
  Student? get student;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$StudentResponseImplCopyWith<_$StudentResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Student _$StudentFromJson(Map<String, dynamic> json) {
  return _Student.fromJson(json);
}

/// @nodoc
mixin _$Student {
  int? get id => throw _privateConstructorUsedError;
  String? get countryCode => throw _privateConstructorUsedError;
  String? get mobileNo => throw _privateConstructorUsedError;
  int? get isActive => throw _privateConstructorUsedError;
  String? get mobileUnique => throw _privateConstructorUsedError;
  List<StudentDetail>? get studentDetail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StudentCopyWith<Student> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentCopyWith<$Res> {
  factory $StudentCopyWith(Student value, $Res Function(Student) then) =
      _$StudentCopyWithImpl<$Res, Student>;
  @useResult
  $Res call(
      {int? id,
      String? countryCode,
      String? mobileNo,
      int? isActive,
      String? mobileUnique,
      List<StudentDetail>? studentDetail});
}

/// @nodoc
class _$StudentCopyWithImpl<$Res, $Val extends Student>
    implements $StudentCopyWith<$Res> {
  _$StudentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? countryCode = freezed,
    Object? mobileNo = freezed,
    Object? isActive = freezed,
    Object? mobileUnique = freezed,
    Object? studentDetail = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNo: freezed == mobileNo
          ? _value.mobileNo
          : mobileNo // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int?,
      mobileUnique: freezed == mobileUnique
          ? _value.mobileUnique
          : mobileUnique // ignore: cast_nullable_to_non_nullable
              as String?,
      studentDetail: freezed == studentDetail
          ? _value.studentDetail
          : studentDetail // ignore: cast_nullable_to_non_nullable
              as List<StudentDetail>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StudentImplCopyWith<$Res> implements $StudentCopyWith<$Res> {
  factory _$$StudentImplCopyWith(
          _$StudentImpl value, $Res Function(_$StudentImpl) then) =
      __$$StudentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? countryCode,
      String? mobileNo,
      int? isActive,
      String? mobileUnique,
      List<StudentDetail>? studentDetail});
}

/// @nodoc
class __$$StudentImplCopyWithImpl<$Res>
    extends _$StudentCopyWithImpl<$Res, _$StudentImpl>
    implements _$$StudentImplCopyWith<$Res> {
  __$$StudentImplCopyWithImpl(
      _$StudentImpl _value, $Res Function(_$StudentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? countryCode = freezed,
    Object? mobileNo = freezed,
    Object? isActive = freezed,
    Object? mobileUnique = freezed,
    Object? studentDetail = freezed,
  }) {
    return _then(_$StudentImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNo: freezed == mobileNo
          ? _value.mobileNo
          : mobileNo // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int?,
      mobileUnique: freezed == mobileUnique
          ? _value.mobileUnique
          : mobileUnique // ignore: cast_nullable_to_non_nullable
              as String?,
      studentDetail: freezed == studentDetail
          ? _value._studentDetail
          : studentDetail // ignore: cast_nullable_to_non_nullable
              as List<StudentDetail>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$StudentImpl implements _Student {
  const _$StudentImpl(
      {this.id,
      this.countryCode,
      this.mobileNo,
      this.isActive,
      this.mobileUnique,
      final List<StudentDetail>? studentDetail})
      : _studentDetail = studentDetail;

  factory _$StudentImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudentImplFromJson(json);

  @override
  final int? id;
  @override
  final String? countryCode;
  @override
  final String? mobileNo;
  @override
  final int? isActive;
  @override
  final String? mobileUnique;
  final List<StudentDetail>? _studentDetail;
  @override
  List<StudentDetail>? get studentDetail {
    final value = _studentDetail;
    if (value == null) return null;
    if (_studentDetail is EqualUnmodifiableListView) return _studentDetail;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Student(id: $id, countryCode: $countryCode, mobileNo: $mobileNo, isActive: $isActive, mobileUnique: $mobileUnique, studentDetail: $studentDetail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.mobileNo, mobileNo) ||
                other.mobileNo == mobileNo) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.mobileUnique, mobileUnique) ||
                other.mobileUnique == mobileUnique) &&
            const DeepCollectionEquality()
                .equals(other._studentDetail, _studentDetail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      countryCode,
      mobileNo,
      isActive,
      mobileUnique,
      const DeepCollectionEquality().hash(_studentDetail));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentImplCopyWith<_$StudentImpl> get copyWith =>
      __$$StudentImplCopyWithImpl<_$StudentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StudentImplToJson(
      this,
    );
  }
}

abstract class _Student implements Student {
  const factory _Student(
      {final int? id,
      final String? countryCode,
      final String? mobileNo,
      final int? isActive,
      final String? mobileUnique,
      final List<StudentDetail>? studentDetail}) = _$StudentImpl;

  factory _Student.fromJson(Map<String, dynamic> json) = _$StudentImpl.fromJson;

  @override
  int? get id;
  @override
  String? get countryCode;
  @override
  String? get mobileNo;
  @override
  int? get isActive;
  @override
  String? get mobileUnique;
  @override
  List<StudentDetail>? get studentDetail;
  @override
  @JsonKey(ignore: true)
  _$$StudentImplCopyWith<_$StudentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StudentDetail _$StudentDetailFromJson(Map<String, dynamic> json) {
  return _StudentDetail.fromJson(json);
}

/// @nodoc
mixin _$StudentDetail {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get parentName => throw _privateConstructorUsedError;
  int? get userId => throw _privateConstructorUsedError;
  int? get academyId => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  DateTime? get dob => throw _privateConstructorUsedError;
  DateTime? get doj => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get whatsappNo => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get profilePic => throw _privateConstructorUsedError;
  int? get isActive => throw _privateConstructorUsedError;
  List<Batch>? get batches => throw _privateConstructorUsedError;
  PivotClass? get pivot => throw _privateConstructorUsedError;
  Academy? get academy => throw _privateConstructorUsedError;
  List<DiscontinuedBatch>? get discontinuedBatches =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StudentDetailCopyWith<StudentDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentDetailCopyWith<$Res> {
  factory $StudentDetailCopyWith(
          StudentDetail value, $Res Function(StudentDetail) then) =
      _$StudentDetailCopyWithImpl<$Res, StudentDetail>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? parentName,
      int? userId,
      int? academyId,
      String? gender,
      DateTime? dob,
      DateTime? doj,
      String? email,
      String? whatsappNo,
      String? address,
      String? profilePic,
      int? isActive,
      List<Batch>? batches,
      PivotClass? pivot,
      Academy? academy,
      List<DiscontinuedBatch>? discontinuedBatches});

  $PivotClassCopyWith<$Res>? get pivot;
  $AcademyCopyWith<$Res>? get academy;
}

/// @nodoc
class _$StudentDetailCopyWithImpl<$Res, $Val extends StudentDetail>
    implements $StudentDetailCopyWith<$Res> {
  _$StudentDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? parentName = freezed,
    Object? userId = freezed,
    Object? academyId = freezed,
    Object? gender = freezed,
    Object? dob = freezed,
    Object? doj = freezed,
    Object? email = freezed,
    Object? whatsappNo = freezed,
    Object? address = freezed,
    Object? profilePic = freezed,
    Object? isActive = freezed,
    Object? batches = freezed,
    Object? pivot = freezed,
    Object? academy = freezed,
    Object? discontinuedBatches = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      parentName: freezed == parentName
          ? _value.parentName
          : parentName // ignore: cast_nullable_to_non_nullable
              as String?,
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
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      whatsappNo: freezed == whatsappNo
          ? _value.whatsappNo
          : whatsappNo // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePic: freezed == profilePic
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int?,
      batches: freezed == batches
          ? _value.batches
          : batches // ignore: cast_nullable_to_non_nullable
              as List<Batch>?,
      pivot: freezed == pivot
          ? _value.pivot
          : pivot // ignore: cast_nullable_to_non_nullable
              as PivotClass?,
      academy: freezed == academy
          ? _value.academy
          : academy // ignore: cast_nullable_to_non_nullable
              as Academy?,
      discontinuedBatches: freezed == discontinuedBatches
          ? _value.discontinuedBatches
          : discontinuedBatches // ignore: cast_nullable_to_non_nullable
              as List<DiscontinuedBatch>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PivotClassCopyWith<$Res>? get pivot {
    if (_value.pivot == null) {
      return null;
    }

    return $PivotClassCopyWith<$Res>(_value.pivot!, (value) {
      return _then(_value.copyWith(pivot: value) as $Val);
    });
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
abstract class _$$StudentDetailImplCopyWith<$Res>
    implements $StudentDetailCopyWith<$Res> {
  factory _$$StudentDetailImplCopyWith(
          _$StudentDetailImpl value, $Res Function(_$StudentDetailImpl) then) =
      __$$StudentDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? parentName,
      int? userId,
      int? academyId,
      String? gender,
      DateTime? dob,
      DateTime? doj,
      String? email,
      String? whatsappNo,
      String? address,
      String? profilePic,
      int? isActive,
      List<Batch>? batches,
      PivotClass? pivot,
      Academy? academy,
      List<DiscontinuedBatch>? discontinuedBatches});

  @override
  $PivotClassCopyWith<$Res>? get pivot;
  @override
  $AcademyCopyWith<$Res>? get academy;
}

/// @nodoc
class __$$StudentDetailImplCopyWithImpl<$Res>
    extends _$StudentDetailCopyWithImpl<$Res, _$StudentDetailImpl>
    implements _$$StudentDetailImplCopyWith<$Res> {
  __$$StudentDetailImplCopyWithImpl(
      _$StudentDetailImpl _value, $Res Function(_$StudentDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? parentName = freezed,
    Object? userId = freezed,
    Object? academyId = freezed,
    Object? gender = freezed,
    Object? dob = freezed,
    Object? doj = freezed,
    Object? email = freezed,
    Object? whatsappNo = freezed,
    Object? address = freezed,
    Object? profilePic = freezed,
    Object? isActive = freezed,
    Object? batches = freezed,
    Object? pivot = freezed,
    Object? academy = freezed,
    Object? discontinuedBatches = freezed,
  }) {
    return _then(_$StudentDetailImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      parentName: freezed == parentName
          ? _value.parentName
          : parentName // ignore: cast_nullable_to_non_nullable
              as String?,
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
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      whatsappNo: freezed == whatsappNo
          ? _value.whatsappNo
          : whatsappNo // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePic: freezed == profilePic
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int?,
      batches: freezed == batches
          ? _value._batches
          : batches // ignore: cast_nullable_to_non_nullable
              as List<Batch>?,
      pivot: freezed == pivot
          ? _value.pivot
          : pivot // ignore: cast_nullable_to_non_nullable
              as PivotClass?,
      academy: freezed == academy
          ? _value.academy
          : academy // ignore: cast_nullable_to_non_nullable
              as Academy?,
      discontinuedBatches: freezed == discontinuedBatches
          ? _value._discontinuedBatches
          : discontinuedBatches // ignore: cast_nullable_to_non_nullable
              as List<DiscontinuedBatch>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$StudentDetailImpl implements _StudentDetail {
  const _$StudentDetailImpl(
      {this.id,
      this.name,
      this.parentName,
      this.userId,
      this.academyId,
      this.gender,
      this.dob,
      this.doj,
      this.email,
      this.whatsappNo,
      this.address,
      this.profilePic,
      this.isActive,
      final List<Batch>? batches,
      this.pivot,
      this.academy,
      final List<DiscontinuedBatch>? discontinuedBatches})
      : _batches = batches,
        _discontinuedBatches = discontinuedBatches;

  factory _$StudentDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudentDetailImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? parentName;
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
  final String? email;
  @override
  final String? whatsappNo;
  @override
  final String? address;
  @override
  final String? profilePic;
  @override
  final int? isActive;
  final List<Batch>? _batches;
  @override
  List<Batch>? get batches {
    final value = _batches;
    if (value == null) return null;
    if (_batches is EqualUnmodifiableListView) return _batches;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final PivotClass? pivot;
  @override
  final Academy? academy;
  final List<DiscontinuedBatch>? _discontinuedBatches;
  @override
  List<DiscontinuedBatch>? get discontinuedBatches {
    final value = _discontinuedBatches;
    if (value == null) return null;
    if (_discontinuedBatches is EqualUnmodifiableListView)
      return _discontinuedBatches;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'StudentDetail(id: $id, name: $name, parentName: $parentName, userId: $userId, academyId: $academyId, gender: $gender, dob: $dob, doj: $doj, email: $email, whatsappNo: $whatsappNo, address: $address, profilePic: $profilePic, isActive: $isActive, batches: $batches, pivot: $pivot, academy: $academy, discontinuedBatches: $discontinuedBatches)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.parentName, parentName) ||
                other.parentName == parentName) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.academyId, academyId) ||
                other.academyId == academyId) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            (identical(other.doj, doj) || other.doj == doj) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.whatsappNo, whatsappNo) ||
                other.whatsappNo == whatsappNo) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.profilePic, profilePic) ||
                other.profilePic == profilePic) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            const DeepCollectionEquality().equals(other._batches, _batches) &&
            (identical(other.pivot, pivot) || other.pivot == pivot) &&
            (identical(other.academy, academy) || other.academy == academy) &&
            const DeepCollectionEquality()
                .equals(other._discontinuedBatches, _discontinuedBatches));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      parentName,
      userId,
      academyId,
      gender,
      dob,
      doj,
      email,
      whatsappNo,
      address,
      profilePic,
      isActive,
      const DeepCollectionEquality().hash(_batches),
      pivot,
      academy,
      const DeepCollectionEquality().hash(_discontinuedBatches));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentDetailImplCopyWith<_$StudentDetailImpl> get copyWith =>
      __$$StudentDetailImplCopyWithImpl<_$StudentDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StudentDetailImplToJson(
      this,
    );
  }
}

abstract class _StudentDetail implements StudentDetail {
  const factory _StudentDetail(
          {final int? id,
          final String? name,
          final String? parentName,
          final int? userId,
          final int? academyId,
          final String? gender,
          final DateTime? dob,
          final DateTime? doj,
          final String? email,
          final String? whatsappNo,
          final String? address,
          final String? profilePic,
          final int? isActive,
          final List<Batch>? batches,
          final PivotClass? pivot,
          final Academy? academy,
          final List<DiscontinuedBatch>? discontinuedBatches}) =
      _$StudentDetailImpl;

  factory _StudentDetail.fromJson(Map<String, dynamic> json) =
      _$StudentDetailImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get parentName;
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
  String? get email;
  @override
  String? get whatsappNo;
  @override
  String? get address;
  @override
  String? get profilePic;
  @override
  int? get isActive;
  @override
  List<Batch>? get batches;
  @override
  PivotClass? get pivot;
  @override
  Academy? get academy;
  @override
  List<DiscontinuedBatch>? get discontinuedBatches;
  @override
  @JsonKey(ignore: true)
  _$$StudentDetailImplCopyWith<_$StudentDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DiscontinuedBatch _$DiscontinuedBatchFromJson(Map<String, dynamic> json) {
  return _DiscontinuedBatch.fromJson(json);
}

/// @nodoc
mixin _$DiscontinuedBatch {
  int? get id => throw _privateConstructorUsedError;
  String? get batchName => throw _privateConstructorUsedError;
  int? get academyId => throw _privateConstructorUsedError;
  int? get branchId => throw _privateConstructorUsedError;
  int? get courseId => throw _privateConstructorUsedError;
  int? get subjectId => throw _privateConstructorUsedError;
  String? get batchStatus => throw _privateConstructorUsedError;
  int? get feeAmount => throw _privateConstructorUsedError;
  int? get admissionFees => throw _privateConstructorUsedError;
  String? get shareToken => throw _privateConstructorUsedError;
  int? get isActive => throw _privateConstructorUsedError;
  PivotClass? get pivot => throw _privateConstructorUsedError;
  Course1? get course => throw _privateConstructorUsedError;
  Subject1? get subject => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiscontinuedBatchCopyWith<DiscontinuedBatch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscontinuedBatchCopyWith<$Res> {
  factory $DiscontinuedBatchCopyWith(
          DiscontinuedBatch value, $Res Function(DiscontinuedBatch) then) =
      _$DiscontinuedBatchCopyWithImpl<$Res, DiscontinuedBatch>;
  @useResult
  $Res call(
      {int? id,
      String? batchName,
      int? academyId,
      int? branchId,
      int? courseId,
      int? subjectId,
      String? batchStatus,
      int? feeAmount,
      int? admissionFees,
      String? shareToken,
      int? isActive,
      PivotClass? pivot,
      Course1? course,
      Subject1? subject});

  $PivotClassCopyWith<$Res>? get pivot;
  $Course1CopyWith<$Res>? get course;
  $Subject1CopyWith<$Res>? get subject;
}

/// @nodoc
class _$DiscontinuedBatchCopyWithImpl<$Res, $Val extends DiscontinuedBatch>
    implements $DiscontinuedBatchCopyWith<$Res> {
  _$DiscontinuedBatchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? batchName = freezed,
    Object? academyId = freezed,
    Object? branchId = freezed,
    Object? courseId = freezed,
    Object? subjectId = freezed,
    Object? batchStatus = freezed,
    Object? feeAmount = freezed,
    Object? admissionFees = freezed,
    Object? shareToken = freezed,
    Object? isActive = freezed,
    Object? pivot = freezed,
    Object? course = freezed,
    Object? subject = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      batchName: freezed == batchName
          ? _value.batchName
          : batchName // ignore: cast_nullable_to_non_nullable
              as String?,
      academyId: freezed == academyId
          ? _value.academyId
          : academyId // ignore: cast_nullable_to_non_nullable
              as int?,
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as int?,
      courseId: freezed == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as int?,
      subjectId: freezed == subjectId
          ? _value.subjectId
          : subjectId // ignore: cast_nullable_to_non_nullable
              as int?,
      batchStatus: freezed == batchStatus
          ? _value.batchStatus
          : batchStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      feeAmount: freezed == feeAmount
          ? _value.feeAmount
          : feeAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      admissionFees: freezed == admissionFees
          ? _value.admissionFees
          : admissionFees // ignore: cast_nullable_to_non_nullable
              as int?,
      shareToken: freezed == shareToken
          ? _value.shareToken
          : shareToken // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int?,
      pivot: freezed == pivot
          ? _value.pivot
          : pivot // ignore: cast_nullable_to_non_nullable
              as PivotClass?,
      course: freezed == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as Course1?,
      subject: freezed == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as Subject1?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PivotClassCopyWith<$Res>? get pivot {
    if (_value.pivot == null) {
      return null;
    }

    return $PivotClassCopyWith<$Res>(_value.pivot!, (value) {
      return _then(_value.copyWith(pivot: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $Course1CopyWith<$Res>? get course {
    if (_value.course == null) {
      return null;
    }

    return $Course1CopyWith<$Res>(_value.course!, (value) {
      return _then(_value.copyWith(course: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $Subject1CopyWith<$Res>? get subject {
    if (_value.subject == null) {
      return null;
    }

    return $Subject1CopyWith<$Res>(_value.subject!, (value) {
      return _then(_value.copyWith(subject: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DiscontinuedBatchImplCopyWith<$Res>
    implements $DiscontinuedBatchCopyWith<$Res> {
  factory _$$DiscontinuedBatchImplCopyWith(_$DiscontinuedBatchImpl value,
          $Res Function(_$DiscontinuedBatchImpl) then) =
      __$$DiscontinuedBatchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? batchName,
      int? academyId,
      int? branchId,
      int? courseId,
      int? subjectId,
      String? batchStatus,
      int? feeAmount,
      int? admissionFees,
      String? shareToken,
      int? isActive,
      PivotClass? pivot,
      Course1? course,
      Subject1? subject});

  @override
  $PivotClassCopyWith<$Res>? get pivot;
  @override
  $Course1CopyWith<$Res>? get course;
  @override
  $Subject1CopyWith<$Res>? get subject;
}

/// @nodoc
class __$$DiscontinuedBatchImplCopyWithImpl<$Res>
    extends _$DiscontinuedBatchCopyWithImpl<$Res, _$DiscontinuedBatchImpl>
    implements _$$DiscontinuedBatchImplCopyWith<$Res> {
  __$$DiscontinuedBatchImplCopyWithImpl(_$DiscontinuedBatchImpl _value,
      $Res Function(_$DiscontinuedBatchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? batchName = freezed,
    Object? academyId = freezed,
    Object? branchId = freezed,
    Object? courseId = freezed,
    Object? subjectId = freezed,
    Object? batchStatus = freezed,
    Object? feeAmount = freezed,
    Object? admissionFees = freezed,
    Object? shareToken = freezed,
    Object? isActive = freezed,
    Object? pivot = freezed,
    Object? course = freezed,
    Object? subject = freezed,
  }) {
    return _then(_$DiscontinuedBatchImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      batchName: freezed == batchName
          ? _value.batchName
          : batchName // ignore: cast_nullable_to_non_nullable
              as String?,
      academyId: freezed == academyId
          ? _value.academyId
          : academyId // ignore: cast_nullable_to_non_nullable
              as int?,
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as int?,
      courseId: freezed == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as int?,
      subjectId: freezed == subjectId
          ? _value.subjectId
          : subjectId // ignore: cast_nullable_to_non_nullable
              as int?,
      batchStatus: freezed == batchStatus
          ? _value.batchStatus
          : batchStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      feeAmount: freezed == feeAmount
          ? _value.feeAmount
          : feeAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      admissionFees: freezed == admissionFees
          ? _value.admissionFees
          : admissionFees // ignore: cast_nullable_to_non_nullable
              as int?,
      shareToken: freezed == shareToken
          ? _value.shareToken
          : shareToken // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int?,
      pivot: freezed == pivot
          ? _value.pivot
          : pivot // ignore: cast_nullable_to_non_nullable
              as PivotClass?,
      course: freezed == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as Course1?,
      subject: freezed == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as Subject1?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DiscontinuedBatchImpl implements _DiscontinuedBatch {
  const _$DiscontinuedBatchImpl(
      {this.id,
      this.batchName,
      this.academyId,
      this.branchId,
      this.courseId,
      this.subjectId,
      this.batchStatus,
      this.feeAmount,
      this.admissionFees,
      this.shareToken,
      this.isActive,
      this.pivot,
      this.course,
      this.subject});

  factory _$DiscontinuedBatchImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiscontinuedBatchImplFromJson(json);

  @override
  final int? id;
  @override
  final String? batchName;
  @override
  final int? academyId;
  @override
  final int? branchId;
  @override
  final int? courseId;
  @override
  final int? subjectId;
  @override
  final String? batchStatus;
  @override
  final int? feeAmount;
  @override
  final int? admissionFees;
  @override
  final String? shareToken;
  @override
  final int? isActive;
  @override
  final PivotClass? pivot;
  @override
  final Course1? course;
  @override
  final Subject1? subject;

  @override
  String toString() {
    return 'DiscontinuedBatch(id: $id, batchName: $batchName, academyId: $academyId, branchId: $branchId, courseId: $courseId, subjectId: $subjectId, batchStatus: $batchStatus, feeAmount: $feeAmount, admissionFees: $admissionFees, shareToken: $shareToken, isActive: $isActive, pivot: $pivot, course: $course, subject: $subject)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiscontinuedBatchImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.batchName, batchName) ||
                other.batchName == batchName) &&
            (identical(other.academyId, academyId) ||
                other.academyId == academyId) &&
            (identical(other.branchId, branchId) ||
                other.branchId == branchId) &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId) &&
            (identical(other.subjectId, subjectId) ||
                other.subjectId == subjectId) &&
            (identical(other.batchStatus, batchStatus) ||
                other.batchStatus == batchStatus) &&
            (identical(other.feeAmount, feeAmount) ||
                other.feeAmount == feeAmount) &&
            (identical(other.admissionFees, admissionFees) ||
                other.admissionFees == admissionFees) &&
            (identical(other.shareToken, shareToken) ||
                other.shareToken == shareToken) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.pivot, pivot) || other.pivot == pivot) &&
            (identical(other.course, course) || other.course == course) &&
            (identical(other.subject, subject) || other.subject == subject));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      batchName,
      academyId,
      branchId,
      courseId,
      subjectId,
      batchStatus,
      feeAmount,
      admissionFees,
      shareToken,
      isActive,
      pivot,
      course,
      subject);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DiscontinuedBatchImplCopyWith<_$DiscontinuedBatchImpl> get copyWith =>
      __$$DiscontinuedBatchImplCopyWithImpl<_$DiscontinuedBatchImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DiscontinuedBatchImplToJson(
      this,
    );
  }
}

abstract class _DiscontinuedBatch implements DiscontinuedBatch {
  const factory _DiscontinuedBatch(
      {final int? id,
      final String? batchName,
      final int? academyId,
      final int? branchId,
      final int? courseId,
      final int? subjectId,
      final String? batchStatus,
      final int? feeAmount,
      final int? admissionFees,
      final String? shareToken,
      final int? isActive,
      final PivotClass? pivot,
      final Course1? course,
      final Subject1? subject}) = _$DiscontinuedBatchImpl;

  factory _DiscontinuedBatch.fromJson(Map<String, dynamic> json) =
      _$DiscontinuedBatchImpl.fromJson;

  @override
  int? get id;
  @override
  String? get batchName;
  @override
  int? get academyId;
  @override
  int? get branchId;
  @override
  int? get courseId;
  @override
  int? get subjectId;
  @override
  String? get batchStatus;
  @override
  int? get feeAmount;
  @override
  int? get admissionFees;
  @override
  String? get shareToken;
  @override
  int? get isActive;
  @override
  PivotClass? get pivot;
  @override
  Course1? get course;
  @override
  Subject1? get subject;
  @override
  @JsonKey(ignore: true)
  _$$DiscontinuedBatchImplCopyWith<_$DiscontinuedBatchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Course1 _$Course1FromJson(Map<String, dynamic> json) {
  return _Course1.fromJson(json);
}

/// @nodoc
mixin _$Course1 {
  int? get id => throw _privateConstructorUsedError;
  int? get academyTypeId => throw _privateConstructorUsedError;
  String? get courseName => throw _privateConstructorUsedError;
  int? get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $Course1CopyWith<Course1> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Course1CopyWith<$Res> {
  factory $Course1CopyWith(Course1 value, $Res Function(Course1) then) =
      _$Course1CopyWithImpl<$Res, Course1>;
  @useResult
  $Res call({int? id, int? academyTypeId, String? courseName, int? isActive});
}

/// @nodoc
class _$Course1CopyWithImpl<$Res, $Val extends Course1>
    implements $Course1CopyWith<$Res> {
  _$Course1CopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? academyTypeId = freezed,
    Object? courseName = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      academyTypeId: freezed == academyTypeId
          ? _value.academyTypeId
          : academyTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      courseName: freezed == courseName
          ? _value.courseName
          : courseName // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$Course1ImplCopyWith<$Res> implements $Course1CopyWith<$Res> {
  factory _$$Course1ImplCopyWith(
          _$Course1Impl value, $Res Function(_$Course1Impl) then) =
      __$$Course1ImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, int? academyTypeId, String? courseName, int? isActive});
}

/// @nodoc
class __$$Course1ImplCopyWithImpl<$Res>
    extends _$Course1CopyWithImpl<$Res, _$Course1Impl>
    implements _$$Course1ImplCopyWith<$Res> {
  __$$Course1ImplCopyWithImpl(
      _$Course1Impl _value, $Res Function(_$Course1Impl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? academyTypeId = freezed,
    Object? courseName = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_$Course1Impl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      academyTypeId: freezed == academyTypeId
          ? _value.academyTypeId
          : academyTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      courseName: freezed == courseName
          ? _value.courseName
          : courseName // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$Course1Impl implements _Course1 {
  const _$Course1Impl(
      {this.id, this.academyTypeId, this.courseName, this.isActive});

  factory _$Course1Impl.fromJson(Map<String, dynamic> json) =>
      _$$Course1ImplFromJson(json);

  @override
  final int? id;
  @override
  final int? academyTypeId;
  @override
  final String? courseName;
  @override
  final int? isActive;

  @override
  String toString() {
    return 'Course1(id: $id, academyTypeId: $academyTypeId, courseName: $courseName, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Course1Impl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.academyTypeId, academyTypeId) ||
                other.academyTypeId == academyTypeId) &&
            (identical(other.courseName, courseName) ||
                other.courseName == courseName) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, academyTypeId, courseName, isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$Course1ImplCopyWith<_$Course1Impl> get copyWith =>
      __$$Course1ImplCopyWithImpl<_$Course1Impl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$Course1ImplToJson(
      this,
    );
  }
}

abstract class _Course1 implements Course1 {
  const factory _Course1(
      {final int? id,
      final int? academyTypeId,
      final String? courseName,
      final int? isActive}) = _$Course1Impl;

  factory _Course1.fromJson(Map<String, dynamic> json) = _$Course1Impl.fromJson;

  @override
  int? get id;
  @override
  int? get academyTypeId;
  @override
  String? get courseName;
  @override
  int? get isActive;
  @override
  @JsonKey(ignore: true)
  _$$Course1ImplCopyWith<_$Course1Impl> get copyWith =>
      throw _privateConstructorUsedError;
}

Subject1 _$Subject1FromJson(Map<String, dynamic> json) {
  return _Subject1.fromJson(json);
}

/// @nodoc
mixin _$Subject1 {
  int? get id => throw _privateConstructorUsedError;
  int? get courseId => throw _privateConstructorUsedError;
  String? get subjectName => throw _privateConstructorUsedError;
  int? get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $Subject1CopyWith<Subject1> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Subject1CopyWith<$Res> {
  factory $Subject1CopyWith(Subject1 value, $Res Function(Subject1) then) =
      _$Subject1CopyWithImpl<$Res, Subject1>;
  @useResult
  $Res call({int? id, int? courseId, String? subjectName, int? isActive});
}

/// @nodoc
class _$Subject1CopyWithImpl<$Res, $Val extends Subject1>
    implements $Subject1CopyWith<$Res> {
  _$Subject1CopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? courseId = freezed,
    Object? subjectName = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      courseId: freezed == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as int?,
      subjectName: freezed == subjectName
          ? _value.subjectName
          : subjectName // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$Subject1ImplCopyWith<$Res>
    implements $Subject1CopyWith<$Res> {
  factory _$$Subject1ImplCopyWith(
          _$Subject1Impl value, $Res Function(_$Subject1Impl) then) =
      __$$Subject1ImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, int? courseId, String? subjectName, int? isActive});
}

/// @nodoc
class __$$Subject1ImplCopyWithImpl<$Res>
    extends _$Subject1CopyWithImpl<$Res, _$Subject1Impl>
    implements _$$Subject1ImplCopyWith<$Res> {
  __$$Subject1ImplCopyWithImpl(
      _$Subject1Impl _value, $Res Function(_$Subject1Impl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? courseId = freezed,
    Object? subjectName = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_$Subject1Impl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      courseId: freezed == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as int?,
      subjectName: freezed == subjectName
          ? _value.subjectName
          : subjectName // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$Subject1Impl implements _Subject1 {
  const _$Subject1Impl(
      {this.id, this.courseId, this.subjectName, this.isActive});

  factory _$Subject1Impl.fromJson(Map<String, dynamic> json) =>
      _$$Subject1ImplFromJson(json);

  @override
  final int? id;
  @override
  final int? courseId;
  @override
  final String? subjectName;
  @override
  final int? isActive;

  @override
  String toString() {
    return 'Subject1(id: $id, courseId: $courseId, subjectName: $subjectName, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Subject1Impl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId) &&
            (identical(other.subjectName, subjectName) ||
                other.subjectName == subjectName) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, courseId, subjectName, isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$Subject1ImplCopyWith<_$Subject1Impl> get copyWith =>
      __$$Subject1ImplCopyWithImpl<_$Subject1Impl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$Subject1ImplToJson(
      this,
    );
  }
}

abstract class _Subject1 implements Subject1 {
  const factory _Subject1(
      {final int? id,
      final int? courseId,
      final String? subjectName,
      final int? isActive}) = _$Subject1Impl;

  factory _Subject1.fromJson(Map<String, dynamic> json) =
      _$Subject1Impl.fromJson;

  @override
  int? get id;
  @override
  int? get courseId;
  @override
  String? get subjectName;
  @override
  int? get isActive;
  @override
  @JsonKey(ignore: true)
  _$$Subject1ImplCopyWith<_$Subject1Impl> get copyWith =>
      throw _privateConstructorUsedError;
}
