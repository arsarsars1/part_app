// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'student_dashboard.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StudentDashboard _$StudentDashboardFromJson(Map<String, dynamic> json) {
  return _StudentDashboard.fromJson(json);
}

/// @nodoc
mixin _$StudentDashboard {
  List<ClassDetails>? get classes => throw _privateConstructorUsedError;
  List<FeeInvoice>? get batchFeeInvoices => throw _privateConstructorUsedError;
  List<FeeInvoice>? get admissionFeeInvoice =>
      throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StudentDashboardCopyWith<StudentDashboard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentDashboardCopyWith<$Res> {
  factory $StudentDashboardCopyWith(
          StudentDashboard value, $Res Function(StudentDashboard) then) =
      _$StudentDashboardCopyWithImpl<$Res, StudentDashboard>;
  @useResult
  $Res call(
      {List<ClassDetails>? classes,
      List<FeeInvoice>? batchFeeInvoices,
      List<FeeInvoice>? admissionFeeInvoice,
      int? status});
}

/// @nodoc
class _$StudentDashboardCopyWithImpl<$Res, $Val extends StudentDashboard>
    implements $StudentDashboardCopyWith<$Res> {
  _$StudentDashboardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? classes = freezed,
    Object? batchFeeInvoices = freezed,
    Object? admissionFeeInvoice = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      classes: freezed == classes
          ? _value.classes
          : classes // ignore: cast_nullable_to_non_nullable
              as List<ClassDetails>?,
      batchFeeInvoices: freezed == batchFeeInvoices
          ? _value.batchFeeInvoices
          : batchFeeInvoices // ignore: cast_nullable_to_non_nullable
              as List<FeeInvoice>?,
      admissionFeeInvoice: freezed == admissionFeeInvoice
          ? _value.admissionFeeInvoice
          : admissionFeeInvoice // ignore: cast_nullable_to_non_nullable
              as List<FeeInvoice>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StudentDashboardCopyWith<$Res>
    implements $StudentDashboardCopyWith<$Res> {
  factory _$$_StudentDashboardCopyWith(
          _$_StudentDashboard value, $Res Function(_$_StudentDashboard) then) =
      __$$_StudentDashboardCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ClassDetails>? classes,
      List<FeeInvoice>? batchFeeInvoices,
      List<FeeInvoice>? admissionFeeInvoice,
      int? status});
}

/// @nodoc
class __$$_StudentDashboardCopyWithImpl<$Res>
    extends _$StudentDashboardCopyWithImpl<$Res, _$_StudentDashboard>
    implements _$$_StudentDashboardCopyWith<$Res> {
  __$$_StudentDashboardCopyWithImpl(
      _$_StudentDashboard _value, $Res Function(_$_StudentDashboard) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? classes = freezed,
    Object? batchFeeInvoices = freezed,
    Object? admissionFeeInvoice = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_StudentDashboard(
      classes: freezed == classes
          ? _value._classes
          : classes // ignore: cast_nullable_to_non_nullable
              as List<ClassDetails>?,
      batchFeeInvoices: freezed == batchFeeInvoices
          ? _value._batchFeeInvoices
          : batchFeeInvoices // ignore: cast_nullable_to_non_nullable
              as List<FeeInvoice>?,
      admissionFeeInvoice: freezed == admissionFeeInvoice
          ? _value._admissionFeeInvoice
          : admissionFeeInvoice // ignore: cast_nullable_to_non_nullable
              as List<FeeInvoice>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_StudentDashboard implements _StudentDashboard {
  const _$_StudentDashboard(
      {final List<ClassDetails>? classes,
      final List<FeeInvoice>? batchFeeInvoices,
      final List<FeeInvoice>? admissionFeeInvoice,
      this.status})
      : _classes = classes,
        _batchFeeInvoices = batchFeeInvoices,
        _admissionFeeInvoice = admissionFeeInvoice;

  factory _$_StudentDashboard.fromJson(Map<String, dynamic> json) =>
      _$$_StudentDashboardFromJson(json);

  final List<ClassDetails>? _classes;
  @override
  List<ClassDetails>? get classes {
    final value = _classes;
    if (value == null) return null;
    if (_classes is EqualUnmodifiableListView) return _classes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<FeeInvoice>? _batchFeeInvoices;
  @override
  List<FeeInvoice>? get batchFeeInvoices {
    final value = _batchFeeInvoices;
    if (value == null) return null;
    if (_batchFeeInvoices is EqualUnmodifiableListView)
      return _batchFeeInvoices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<FeeInvoice>? _admissionFeeInvoice;
  @override
  List<FeeInvoice>? get admissionFeeInvoice {
    final value = _admissionFeeInvoice;
    if (value == null) return null;
    if (_admissionFeeInvoice is EqualUnmodifiableListView)
      return _admissionFeeInvoice;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? status;

  @override
  String toString() {
    return 'StudentDashboard(classes: $classes, batchFeeInvoices: $batchFeeInvoices, admissionFeeInvoice: $admissionFeeInvoice, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StudentDashboard &&
            const DeepCollectionEquality().equals(other._classes, _classes) &&
            const DeepCollectionEquality()
                .equals(other._batchFeeInvoices, _batchFeeInvoices) &&
            const DeepCollectionEquality()
                .equals(other._admissionFeeInvoice, _admissionFeeInvoice) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_classes),
      const DeepCollectionEquality().hash(_batchFeeInvoices),
      const DeepCollectionEquality().hash(_admissionFeeInvoice),
      status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StudentDashboardCopyWith<_$_StudentDashboard> get copyWith =>
      __$$_StudentDashboardCopyWithImpl<_$_StudentDashboard>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StudentDashboardToJson(
      this,
    );
  }
}

abstract class _StudentDashboard implements StudentDashboard {
  const factory _StudentDashboard(
      {final List<ClassDetails>? classes,
      final List<FeeInvoice>? batchFeeInvoices,
      final List<FeeInvoice>? admissionFeeInvoice,
      final int? status}) = _$_StudentDashboard;

  factory _StudentDashboard.fromJson(Map<String, dynamic> json) =
      _$_StudentDashboard.fromJson;

  @override
  List<ClassDetails>? get classes;
  @override
  List<FeeInvoice>? get batchFeeInvoices;
  @override
  List<FeeInvoice>? get admissionFeeInvoice;
  @override
  int? get status;
  @override
  @JsonKey(ignore: true)
  _$$_StudentDashboardCopyWith<_$_StudentDashboard> get copyWith =>
      throw _privateConstructorUsedError;
}

FeeInvoice _$FeeInvoiceFromJson(Map<String, dynamic> json) {
  return _FeeInvoice.fromJson(json);
}

/// @nodoc
mixin _$FeeInvoice {
  int? get id => throw _privateConstructorUsedError;
  int? get studentDetailId => throw _privateConstructorUsedError;
  int? get academyId => throw _privateConstructorUsedError;
  int? get branchId => throw _privateConstructorUsedError;
  String? get branchName => throw _privateConstructorUsedError;
  int? get batchId => throw _privateConstructorUsedError;
  String? get batchName => throw _privateConstructorUsedError;
  String? get courseName => throw _privateConstructorUsedError;
  String? get subjectName => throw _privateConstructorUsedError;
  String? get payableAmount => throw _privateConstructorUsedError;
  int? get reminderCount => throw _privateConstructorUsedError;
  int? get writtenOffStatus => throw _privateConstructorUsedError;
  DateTime? get writtenOffDate => throw _privateConstructorUsedError;
  String? get writtenOffAmount => throw _privateConstructorUsedError;
  String? get writtenOffRemarks => throw _privateConstructorUsedError;
  String? get writeOffByType => throw _privateConstructorUsedError;
  String? get writeOffById => throw _privateConstructorUsedError;
  String? get paymentStatus => throw _privateConstructorUsedError;
  String? get feeType => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  String? get currencyCode => throw _privateConstructorUsedError;
  String? get currencySymbol => throw _privateConstructorUsedError;
  By? get writeOffBy => throw _privateConstructorUsedError;
  StudentDetail? get studentDetail => throw _privateConstructorUsedError;
  List<dynamic>? get payments => throw _privateConstructorUsedError;
  List<dynamic>? get paymentsTotal => throw _privateConstructorUsedError;
  Batch? get batch => throw _privateConstructorUsedError;
  DateTime? get paymentDueDate => throw _privateConstructorUsedError;
  String? get writtenOffByType => throw _privateConstructorUsedError;
  int? get writtenOffById => throw _privateConstructorUsedError;
  int? get month => throw _privateConstructorUsedError;
  int? get year => throw _privateConstructorUsedError;
  int? get cycle => throw _privateConstructorUsedError;
  By? get writtenOffBy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeeInvoiceCopyWith<FeeInvoice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeeInvoiceCopyWith<$Res> {
  factory $FeeInvoiceCopyWith(
          FeeInvoice value, $Res Function(FeeInvoice) then) =
      _$FeeInvoiceCopyWithImpl<$Res, FeeInvoice>;
  @useResult
  $Res call(
      {int? id,
      int? studentDetailId,
      int? academyId,
      int? branchId,
      String? branchName,
      int? batchId,
      String? batchName,
      String? courseName,
      String? subjectName,
      String? payableAmount,
      int? reminderCount,
      int? writtenOffStatus,
      DateTime? writtenOffDate,
      String? writtenOffAmount,
      String? writtenOffRemarks,
      String? writeOffByType,
      String? writeOffById,
      String? paymentStatus,
      String? feeType,
      String? currency,
      String? currencyCode,
      String? currencySymbol,
      By? writeOffBy,
      StudentDetail? studentDetail,
      List<dynamic>? payments,
      List<dynamic>? paymentsTotal,
      Batch? batch,
      DateTime? paymentDueDate,
      String? writtenOffByType,
      int? writtenOffById,
      int? month,
      int? year,
      int? cycle,
      By? writtenOffBy});

  $StudentDetailCopyWith<$Res>? get studentDetail;
  $BatchCopyWith<$Res>? get batch;
}

/// @nodoc
class _$FeeInvoiceCopyWithImpl<$Res, $Val extends FeeInvoice>
    implements $FeeInvoiceCopyWith<$Res> {
  _$FeeInvoiceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? studentDetailId = freezed,
    Object? academyId = freezed,
    Object? branchId = freezed,
    Object? branchName = freezed,
    Object? batchId = freezed,
    Object? batchName = freezed,
    Object? courseName = freezed,
    Object? subjectName = freezed,
    Object? payableAmount = freezed,
    Object? reminderCount = freezed,
    Object? writtenOffStatus = freezed,
    Object? writtenOffDate = freezed,
    Object? writtenOffAmount = freezed,
    Object? writtenOffRemarks = freezed,
    Object? writeOffByType = freezed,
    Object? writeOffById = freezed,
    Object? paymentStatus = freezed,
    Object? feeType = freezed,
    Object? currency = freezed,
    Object? currencyCode = freezed,
    Object? currencySymbol = freezed,
    Object? writeOffBy = freezed,
    Object? studentDetail = freezed,
    Object? payments = freezed,
    Object? paymentsTotal = freezed,
    Object? batch = freezed,
    Object? paymentDueDate = freezed,
    Object? writtenOffByType = freezed,
    Object? writtenOffById = freezed,
    Object? month = freezed,
    Object? year = freezed,
    Object? cycle = freezed,
    Object? writtenOffBy = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      studentDetailId: freezed == studentDetailId
          ? _value.studentDetailId
          : studentDetailId // ignore: cast_nullable_to_non_nullable
              as int?,
      academyId: freezed == academyId
          ? _value.academyId
          : academyId // ignore: cast_nullable_to_non_nullable
              as int?,
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as int?,
      branchName: freezed == branchName
          ? _value.branchName
          : branchName // ignore: cast_nullable_to_non_nullable
              as String?,
      batchId: freezed == batchId
          ? _value.batchId
          : batchId // ignore: cast_nullable_to_non_nullable
              as int?,
      batchName: freezed == batchName
          ? _value.batchName
          : batchName // ignore: cast_nullable_to_non_nullable
              as String?,
      courseName: freezed == courseName
          ? _value.courseName
          : courseName // ignore: cast_nullable_to_non_nullable
              as String?,
      subjectName: freezed == subjectName
          ? _value.subjectName
          : subjectName // ignore: cast_nullable_to_non_nullable
              as String?,
      payableAmount: freezed == payableAmount
          ? _value.payableAmount
          : payableAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      reminderCount: freezed == reminderCount
          ? _value.reminderCount
          : reminderCount // ignore: cast_nullable_to_non_nullable
              as int?,
      writtenOffStatus: freezed == writtenOffStatus
          ? _value.writtenOffStatus
          : writtenOffStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      writtenOffDate: freezed == writtenOffDate
          ? _value.writtenOffDate
          : writtenOffDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      writtenOffAmount: freezed == writtenOffAmount
          ? _value.writtenOffAmount
          : writtenOffAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      writtenOffRemarks: freezed == writtenOffRemarks
          ? _value.writtenOffRemarks
          : writtenOffRemarks // ignore: cast_nullable_to_non_nullable
              as String?,
      writeOffByType: freezed == writeOffByType
          ? _value.writeOffByType
          : writeOffByType // ignore: cast_nullable_to_non_nullable
              as String?,
      writeOffById: freezed == writeOffById
          ? _value.writeOffById
          : writeOffById // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentStatus: freezed == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      feeType: freezed == feeType
          ? _value.feeType
          : feeType // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      currencyCode: freezed == currencyCode
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String?,
      currencySymbol: freezed == currencySymbol
          ? _value.currencySymbol
          : currencySymbol // ignore: cast_nullable_to_non_nullable
              as String?,
      writeOffBy: freezed == writeOffBy
          ? _value.writeOffBy
          : writeOffBy // ignore: cast_nullable_to_non_nullable
              as By?,
      studentDetail: freezed == studentDetail
          ? _value.studentDetail
          : studentDetail // ignore: cast_nullable_to_non_nullable
              as StudentDetail?,
      payments: freezed == payments
          ? _value.payments
          : payments // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      paymentsTotal: freezed == paymentsTotal
          ? _value.paymentsTotal
          : paymentsTotal // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      batch: freezed == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as Batch?,
      paymentDueDate: freezed == paymentDueDate
          ? _value.paymentDueDate
          : paymentDueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      writtenOffByType: freezed == writtenOffByType
          ? _value.writtenOffByType
          : writtenOffByType // ignore: cast_nullable_to_non_nullable
              as String?,
      writtenOffById: freezed == writtenOffById
          ? _value.writtenOffById
          : writtenOffById // ignore: cast_nullable_to_non_nullable
              as int?,
      month: freezed == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int?,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      cycle: freezed == cycle
          ? _value.cycle
          : cycle // ignore: cast_nullable_to_non_nullable
              as int?,
      writtenOffBy: freezed == writtenOffBy
          ? _value.writtenOffBy
          : writtenOffBy // ignore: cast_nullable_to_non_nullable
              as By?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StudentDetailCopyWith<$Res>? get studentDetail {
    if (_value.studentDetail == null) {
      return null;
    }

    return $StudentDetailCopyWith<$Res>(_value.studentDetail!, (value) {
      return _then(_value.copyWith(studentDetail: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BatchCopyWith<$Res>? get batch {
    if (_value.batch == null) {
      return null;
    }

    return $BatchCopyWith<$Res>(_value.batch!, (value) {
      return _then(_value.copyWith(batch: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FeeInvoiceCopyWith<$Res>
    implements $FeeInvoiceCopyWith<$Res> {
  factory _$$_FeeInvoiceCopyWith(
          _$_FeeInvoice value, $Res Function(_$_FeeInvoice) then) =
      __$$_FeeInvoiceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? studentDetailId,
      int? academyId,
      int? branchId,
      String? branchName,
      int? batchId,
      String? batchName,
      String? courseName,
      String? subjectName,
      String? payableAmount,
      int? reminderCount,
      int? writtenOffStatus,
      DateTime? writtenOffDate,
      String? writtenOffAmount,
      String? writtenOffRemarks,
      String? writeOffByType,
      String? writeOffById,
      String? paymentStatus,
      String? feeType,
      String? currency,
      String? currencyCode,
      String? currencySymbol,
      By? writeOffBy,
      StudentDetail? studentDetail,
      List<dynamic>? payments,
      List<dynamic>? paymentsTotal,
      Batch? batch,
      DateTime? paymentDueDate,
      String? writtenOffByType,
      int? writtenOffById,
      int? month,
      int? year,
      int? cycle,
      By? writtenOffBy});

  @override
  $StudentDetailCopyWith<$Res>? get studentDetail;
  @override
  $BatchCopyWith<$Res>? get batch;
}

/// @nodoc
class __$$_FeeInvoiceCopyWithImpl<$Res>
    extends _$FeeInvoiceCopyWithImpl<$Res, _$_FeeInvoice>
    implements _$$_FeeInvoiceCopyWith<$Res> {
  __$$_FeeInvoiceCopyWithImpl(
      _$_FeeInvoice _value, $Res Function(_$_FeeInvoice) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? studentDetailId = freezed,
    Object? academyId = freezed,
    Object? branchId = freezed,
    Object? branchName = freezed,
    Object? batchId = freezed,
    Object? batchName = freezed,
    Object? courseName = freezed,
    Object? subjectName = freezed,
    Object? payableAmount = freezed,
    Object? reminderCount = freezed,
    Object? writtenOffStatus = freezed,
    Object? writtenOffDate = freezed,
    Object? writtenOffAmount = freezed,
    Object? writtenOffRemarks = freezed,
    Object? writeOffByType = freezed,
    Object? writeOffById = freezed,
    Object? paymentStatus = freezed,
    Object? feeType = freezed,
    Object? currency = freezed,
    Object? currencyCode = freezed,
    Object? currencySymbol = freezed,
    Object? writeOffBy = freezed,
    Object? studentDetail = freezed,
    Object? payments = freezed,
    Object? paymentsTotal = freezed,
    Object? batch = freezed,
    Object? paymentDueDate = freezed,
    Object? writtenOffByType = freezed,
    Object? writtenOffById = freezed,
    Object? month = freezed,
    Object? year = freezed,
    Object? cycle = freezed,
    Object? writtenOffBy = freezed,
  }) {
    return _then(_$_FeeInvoice(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      studentDetailId: freezed == studentDetailId
          ? _value.studentDetailId
          : studentDetailId // ignore: cast_nullable_to_non_nullable
              as int?,
      academyId: freezed == academyId
          ? _value.academyId
          : academyId // ignore: cast_nullable_to_non_nullable
              as int?,
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as int?,
      branchName: freezed == branchName
          ? _value.branchName
          : branchName // ignore: cast_nullable_to_non_nullable
              as String?,
      batchId: freezed == batchId
          ? _value.batchId
          : batchId // ignore: cast_nullable_to_non_nullable
              as int?,
      batchName: freezed == batchName
          ? _value.batchName
          : batchName // ignore: cast_nullable_to_non_nullable
              as String?,
      courseName: freezed == courseName
          ? _value.courseName
          : courseName // ignore: cast_nullable_to_non_nullable
              as String?,
      subjectName: freezed == subjectName
          ? _value.subjectName
          : subjectName // ignore: cast_nullable_to_non_nullable
              as String?,
      payableAmount: freezed == payableAmount
          ? _value.payableAmount
          : payableAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      reminderCount: freezed == reminderCount
          ? _value.reminderCount
          : reminderCount // ignore: cast_nullable_to_non_nullable
              as int?,
      writtenOffStatus: freezed == writtenOffStatus
          ? _value.writtenOffStatus
          : writtenOffStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      writtenOffDate: freezed == writtenOffDate
          ? _value.writtenOffDate
          : writtenOffDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      writtenOffAmount: freezed == writtenOffAmount
          ? _value.writtenOffAmount
          : writtenOffAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      writtenOffRemarks: freezed == writtenOffRemarks
          ? _value.writtenOffRemarks
          : writtenOffRemarks // ignore: cast_nullable_to_non_nullable
              as String?,
      writeOffByType: freezed == writeOffByType
          ? _value.writeOffByType
          : writeOffByType // ignore: cast_nullable_to_non_nullable
              as String?,
      writeOffById: freezed == writeOffById
          ? _value.writeOffById
          : writeOffById // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentStatus: freezed == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      feeType: freezed == feeType
          ? _value.feeType
          : feeType // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      currencyCode: freezed == currencyCode
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String?,
      currencySymbol: freezed == currencySymbol
          ? _value.currencySymbol
          : currencySymbol // ignore: cast_nullable_to_non_nullable
              as String?,
      writeOffBy: freezed == writeOffBy
          ? _value.writeOffBy
          : writeOffBy // ignore: cast_nullable_to_non_nullable
              as By?,
      studentDetail: freezed == studentDetail
          ? _value.studentDetail
          : studentDetail // ignore: cast_nullable_to_non_nullable
              as StudentDetail?,
      payments: freezed == payments
          ? _value._payments
          : payments // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      paymentsTotal: freezed == paymentsTotal
          ? _value._paymentsTotal
          : paymentsTotal // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      batch: freezed == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as Batch?,
      paymentDueDate: freezed == paymentDueDate
          ? _value.paymentDueDate
          : paymentDueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      writtenOffByType: freezed == writtenOffByType
          ? _value.writtenOffByType
          : writtenOffByType // ignore: cast_nullable_to_non_nullable
              as String?,
      writtenOffById: freezed == writtenOffById
          ? _value.writtenOffById
          : writtenOffById // ignore: cast_nullable_to_non_nullable
              as int?,
      month: freezed == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int?,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      cycle: freezed == cycle
          ? _value.cycle
          : cycle // ignore: cast_nullable_to_non_nullable
              as int?,
      writtenOffBy: freezed == writtenOffBy
          ? _value.writtenOffBy
          : writtenOffBy // ignore: cast_nullable_to_non_nullable
              as By?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_FeeInvoice implements _FeeInvoice {
  const _$_FeeInvoice(
      {this.id,
      this.studentDetailId,
      this.academyId,
      this.branchId,
      this.branchName,
      this.batchId,
      this.batchName,
      this.courseName,
      this.subjectName,
      this.payableAmount,
      this.reminderCount,
      this.writtenOffStatus,
      this.writtenOffDate,
      this.writtenOffAmount,
      this.writtenOffRemarks,
      this.writeOffByType,
      this.writeOffById,
      this.paymentStatus,
      this.feeType,
      this.currency,
      this.currencyCode,
      this.currencySymbol,
      this.writeOffBy,
      this.studentDetail,
      final List<dynamic>? payments,
      final List<dynamic>? paymentsTotal,
      this.batch,
      this.paymentDueDate,
      this.writtenOffByType,
      this.writtenOffById,
      this.month,
      this.year,
      this.cycle,
      this.writtenOffBy})
      : _payments = payments,
        _paymentsTotal = paymentsTotal;

  factory _$_FeeInvoice.fromJson(Map<String, dynamic> json) =>
      _$$_FeeInvoiceFromJson(json);

  @override
  final int? id;
  @override
  final int? studentDetailId;
  @override
  final int? academyId;
  @override
  final int? branchId;
  @override
  final String? branchName;
  @override
  final int? batchId;
  @override
  final String? batchName;
  @override
  final String? courseName;
  @override
  final String? subjectName;
  @override
  final String? payableAmount;
  @override
  final int? reminderCount;
  @override
  final int? writtenOffStatus;
  @override
  final DateTime? writtenOffDate;
  @override
  final String? writtenOffAmount;
  @override
  final String? writtenOffRemarks;
  @override
  final String? writeOffByType;
  @override
  final String? writeOffById;
  @override
  final String? paymentStatus;
  @override
  final String? feeType;
  @override
  final String? currency;
  @override
  final String? currencyCode;
  @override
  final String? currencySymbol;
  @override
  final By? writeOffBy;
  @override
  final StudentDetail? studentDetail;
  final List<dynamic>? _payments;
  @override
  List<dynamic>? get payments {
    final value = _payments;
    if (value == null) return null;
    if (_payments is EqualUnmodifiableListView) return _payments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _paymentsTotal;
  @override
  List<dynamic>? get paymentsTotal {
    final value = _paymentsTotal;
    if (value == null) return null;
    if (_paymentsTotal is EqualUnmodifiableListView) return _paymentsTotal;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Batch? batch;
  @override
  final DateTime? paymentDueDate;
  @override
  final String? writtenOffByType;
  @override
  final int? writtenOffById;
  @override
  final int? month;
  @override
  final int? year;
  @override
  final int? cycle;
  @override
  final By? writtenOffBy;

  @override
  String toString() {
    return 'FeeInvoice(id: $id, studentDetailId: $studentDetailId, academyId: $academyId, branchId: $branchId, branchName: $branchName, batchId: $batchId, batchName: $batchName, courseName: $courseName, subjectName: $subjectName, payableAmount: $payableAmount, reminderCount: $reminderCount, writtenOffStatus: $writtenOffStatus, writtenOffDate: $writtenOffDate, writtenOffAmount: $writtenOffAmount, writtenOffRemarks: $writtenOffRemarks, writeOffByType: $writeOffByType, writeOffById: $writeOffById, paymentStatus: $paymentStatus, feeType: $feeType, currency: $currency, currencyCode: $currencyCode, currencySymbol: $currencySymbol, writeOffBy: $writeOffBy, studentDetail: $studentDetail, payments: $payments, paymentsTotal: $paymentsTotal, batch: $batch, paymentDueDate: $paymentDueDate, writtenOffByType: $writtenOffByType, writtenOffById: $writtenOffById, month: $month, year: $year, cycle: $cycle, writtenOffBy: $writtenOffBy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FeeInvoice &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.studentDetailId, studentDetailId) ||
                other.studentDetailId == studentDetailId) &&
            (identical(other.academyId, academyId) ||
                other.academyId == academyId) &&
            (identical(other.branchId, branchId) ||
                other.branchId == branchId) &&
            (identical(other.branchName, branchName) ||
                other.branchName == branchName) &&
            (identical(other.batchId, batchId) || other.batchId == batchId) &&
            (identical(other.batchName, batchName) ||
                other.batchName == batchName) &&
            (identical(other.courseName, courseName) ||
                other.courseName == courseName) &&
            (identical(other.subjectName, subjectName) ||
                other.subjectName == subjectName) &&
            (identical(other.payableAmount, payableAmount) ||
                other.payableAmount == payableAmount) &&
            (identical(other.reminderCount, reminderCount) ||
                other.reminderCount == reminderCount) &&
            (identical(other.writtenOffStatus, writtenOffStatus) ||
                other.writtenOffStatus == writtenOffStatus) &&
            (identical(other.writtenOffDate, writtenOffDate) ||
                other.writtenOffDate == writtenOffDate) &&
            (identical(other.writtenOffAmount, writtenOffAmount) ||
                other.writtenOffAmount == writtenOffAmount) &&
            (identical(other.writtenOffRemarks, writtenOffRemarks) ||
                other.writtenOffRemarks == writtenOffRemarks) &&
            (identical(other.writeOffByType, writeOffByType) ||
                other.writeOffByType == writeOffByType) &&
            (identical(other.writeOffById, writeOffById) ||
                other.writeOffById == writeOffById) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.feeType, feeType) || other.feeType == feeType) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.currencyCode, currencyCode) ||
                other.currencyCode == currencyCode) &&
            (identical(other.currencySymbol, currencySymbol) ||
                other.currencySymbol == currencySymbol) &&
            (identical(other.writeOffBy, writeOffBy) ||
                other.writeOffBy == writeOffBy) &&
            (identical(other.studentDetail, studentDetail) ||
                other.studentDetail == studentDetail) &&
            const DeepCollectionEquality().equals(other._payments, _payments) &&
            const DeepCollectionEquality()
                .equals(other._paymentsTotal, _paymentsTotal) &&
            (identical(other.batch, batch) || other.batch == batch) &&
            (identical(other.paymentDueDate, paymentDueDate) ||
                other.paymentDueDate == paymentDueDate) &&
            (identical(other.writtenOffByType, writtenOffByType) ||
                other.writtenOffByType == writtenOffByType) &&
            (identical(other.writtenOffById, writtenOffById) ||
                other.writtenOffById == writtenOffById) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.cycle, cycle) || other.cycle == cycle) &&
            (identical(other.writtenOffBy, writtenOffBy) ||
                other.writtenOffBy == writtenOffBy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        studentDetailId,
        academyId,
        branchId,
        branchName,
        batchId,
        batchName,
        courseName,
        subjectName,
        payableAmount,
        reminderCount,
        writtenOffStatus,
        writtenOffDate,
        writtenOffAmount,
        writtenOffRemarks,
        writeOffByType,
        writeOffById,
        paymentStatus,
        feeType,
        currency,
        currencyCode,
        currencySymbol,
        writeOffBy,
        studentDetail,
        const DeepCollectionEquality().hash(_payments),
        const DeepCollectionEquality().hash(_paymentsTotal),
        batch,
        paymentDueDate,
        writtenOffByType,
        writtenOffById,
        month,
        year,
        cycle,
        writtenOffBy
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FeeInvoiceCopyWith<_$_FeeInvoice> get copyWith =>
      __$$_FeeInvoiceCopyWithImpl<_$_FeeInvoice>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FeeInvoiceToJson(
      this,
    );
  }
}

abstract class _FeeInvoice implements FeeInvoice {
  const factory _FeeInvoice(
      {final int? id,
      final int? studentDetailId,
      final int? academyId,
      final int? branchId,
      final String? branchName,
      final int? batchId,
      final String? batchName,
      final String? courseName,
      final String? subjectName,
      final String? payableAmount,
      final int? reminderCount,
      final int? writtenOffStatus,
      final DateTime? writtenOffDate,
      final String? writtenOffAmount,
      final String? writtenOffRemarks,
      final String? writeOffByType,
      final String? writeOffById,
      final String? paymentStatus,
      final String? feeType,
      final String? currency,
      final String? currencyCode,
      final String? currencySymbol,
      final By? writeOffBy,
      final StudentDetail? studentDetail,
      final List<dynamic>? payments,
      final List<dynamic>? paymentsTotal,
      final Batch? batch,
      final DateTime? paymentDueDate,
      final String? writtenOffByType,
      final int? writtenOffById,
      final int? month,
      final int? year,
      final int? cycle,
      final By? writtenOffBy}) = _$_FeeInvoice;

  factory _FeeInvoice.fromJson(Map<String, dynamic> json) =
      _$_FeeInvoice.fromJson;

  @override
  int? get id;
  @override
  int? get studentDetailId;
  @override
  int? get academyId;
  @override
  int? get branchId;
  @override
  String? get branchName;
  @override
  int? get batchId;
  @override
  String? get batchName;
  @override
  String? get courseName;
  @override
  String? get subjectName;
  @override
  String? get payableAmount;
  @override
  int? get reminderCount;
  @override
  int? get writtenOffStatus;
  @override
  DateTime? get writtenOffDate;
  @override
  String? get writtenOffAmount;
  @override
  String? get writtenOffRemarks;
  @override
  String? get writeOffByType;
  @override
  String? get writeOffById;
  @override
  String? get paymentStatus;
  @override
  String? get feeType;
  @override
  String? get currency;
  @override
  String? get currencyCode;
  @override
  String? get currencySymbol;
  @override
  By? get writeOffBy;
  @override
  StudentDetail? get studentDetail;
  @override
  List<dynamic>? get payments;
  @override
  List<dynamic>? get paymentsTotal;
  @override
  Batch? get batch;
  @override
  DateTime? get paymentDueDate;
  @override
  String? get writtenOffByType;
  @override
  int? get writtenOffById;
  @override
  int? get month;
  @override
  int? get year;
  @override
  int? get cycle;
  @override
  By? get writtenOffBy;
  @override
  @JsonKey(ignore: true)
  _$$_FeeInvoiceCopyWith<_$_FeeInvoice> get copyWith =>
      throw _privateConstructorUsedError;
}

Batch _$BatchFromJson(Map<String, dynamic> json) {
  return _Batch.fromJson(json);
}

/// @nodoc
mixin _$Batch {
  int? get id => throw _privateConstructorUsedError;
  String? get batchName => throw _privateConstructorUsedError;
  int? get academyId => throw _privateConstructorUsedError;
  int? get branchId => throw _privateConstructorUsedError;
  int? get courseId => throw _privateConstructorUsedError;
  int? get subjectId => throw _privateConstructorUsedError;
  String? get batchStatus => throw _privateConstructorUsedError;
  int? get feeAmount => throw _privateConstructorUsedError;
  int? get admissionFees => throw _privateConstructorUsedError;
  int? get isActive => throw _privateConstructorUsedError;
  List<BatchDetail>? get batchDetail => throw _privateConstructorUsedError;
  List<Trainer>? get trainers => throw _privateConstructorUsedError;
  Course? get course => throw _privateConstructorUsedError;
  Subject? get subject => throw _privateConstructorUsedError;
  Branch? get branch => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BatchCopyWith<Batch> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BatchCopyWith<$Res> {
  factory $BatchCopyWith(Batch value, $Res Function(Batch) then) =
      _$BatchCopyWithImpl<$Res, Batch>;
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
      int? isActive,
      List<BatchDetail>? batchDetail,
      List<Trainer>? trainers,
      Course? course,
      Subject? subject,
      Branch? branch});

  $CourseCopyWith<$Res>? get course;
  $SubjectCopyWith<$Res>? get subject;
  $BranchCopyWith<$Res>? get branch;
}

/// @nodoc
class _$BatchCopyWithImpl<$Res, $Val extends Batch>
    implements $BatchCopyWith<$Res> {
  _$BatchCopyWithImpl(this._value, this._then);

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
    Object? isActive = freezed,
    Object? batchDetail = freezed,
    Object? trainers = freezed,
    Object? course = freezed,
    Object? subject = freezed,
    Object? branch = freezed,
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
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int?,
      batchDetail: freezed == batchDetail
          ? _value.batchDetail
          : batchDetail // ignore: cast_nullable_to_non_nullable
              as List<BatchDetail>?,
      trainers: freezed == trainers
          ? _value.trainers
          : trainers // ignore: cast_nullable_to_non_nullable
              as List<Trainer>?,
      course: freezed == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as Course?,
      subject: freezed == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as Subject?,
      branch: freezed == branch
          ? _value.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as Branch?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CourseCopyWith<$Res>? get course {
    if (_value.course == null) {
      return null;
    }

    return $CourseCopyWith<$Res>(_value.course!, (value) {
      return _then(_value.copyWith(course: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SubjectCopyWith<$Res>? get subject {
    if (_value.subject == null) {
      return null;
    }

    return $SubjectCopyWith<$Res>(_value.subject!, (value) {
      return _then(_value.copyWith(subject: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BranchCopyWith<$Res>? get branch {
    if (_value.branch == null) {
      return null;
    }

    return $BranchCopyWith<$Res>(_value.branch!, (value) {
      return _then(_value.copyWith(branch: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_BatchCopyWith<$Res> implements $BatchCopyWith<$Res> {
  factory _$$_BatchCopyWith(_$_Batch value, $Res Function(_$_Batch) then) =
      __$$_BatchCopyWithImpl<$Res>;
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
      int? isActive,
      List<BatchDetail>? batchDetail,
      List<Trainer>? trainers,
      Course? course,
      Subject? subject,
      Branch? branch});

  @override
  $CourseCopyWith<$Res>? get course;
  @override
  $SubjectCopyWith<$Res>? get subject;
  @override
  $BranchCopyWith<$Res>? get branch;
}

/// @nodoc
class __$$_BatchCopyWithImpl<$Res> extends _$BatchCopyWithImpl<$Res, _$_Batch>
    implements _$$_BatchCopyWith<$Res> {
  __$$_BatchCopyWithImpl(_$_Batch _value, $Res Function(_$_Batch) _then)
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
    Object? isActive = freezed,
    Object? batchDetail = freezed,
    Object? trainers = freezed,
    Object? course = freezed,
    Object? subject = freezed,
    Object? branch = freezed,
  }) {
    return _then(_$_Batch(
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
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int?,
      batchDetail: freezed == batchDetail
          ? _value._batchDetail
          : batchDetail // ignore: cast_nullable_to_non_nullable
              as List<BatchDetail>?,
      trainers: freezed == trainers
          ? _value._trainers
          : trainers // ignore: cast_nullable_to_non_nullable
              as List<Trainer>?,
      course: freezed == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as Course?,
      subject: freezed == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as Subject?,
      branch: freezed == branch
          ? _value.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as Branch?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Batch implements _Batch {
  const _$_Batch(
      {this.id,
      this.batchName,
      this.academyId,
      this.branchId,
      this.courseId,
      this.subjectId,
      this.batchStatus,
      this.feeAmount,
      this.admissionFees,
      this.isActive,
      final List<BatchDetail>? batchDetail,
      final List<Trainer>? trainers,
      this.course,
      this.subject,
      this.branch})
      : _batchDetail = batchDetail,
        _trainers = trainers;

  factory _$_Batch.fromJson(Map<String, dynamic> json) =>
      _$$_BatchFromJson(json);

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
  final int? isActive;
  final List<BatchDetail>? _batchDetail;
  @override
  List<BatchDetail>? get batchDetail {
    final value = _batchDetail;
    if (value == null) return null;
    if (_batchDetail is EqualUnmodifiableListView) return _batchDetail;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Trainer>? _trainers;
  @override
  List<Trainer>? get trainers {
    final value = _trainers;
    if (value == null) return null;
    if (_trainers is EqualUnmodifiableListView) return _trainers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Course? course;
  @override
  final Subject? subject;
  @override
  final Branch? branch;

  @override
  String toString() {
    return 'Batch(id: $id, batchName: $batchName, academyId: $academyId, branchId: $branchId, courseId: $courseId, subjectId: $subjectId, batchStatus: $batchStatus, feeAmount: $feeAmount, admissionFees: $admissionFees, isActive: $isActive, batchDetail: $batchDetail, trainers: $trainers, course: $course, subject: $subject, branch: $branch)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Batch &&
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
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            const DeepCollectionEquality()
                .equals(other._batchDetail, _batchDetail) &&
            const DeepCollectionEquality().equals(other._trainers, _trainers) &&
            (identical(other.course, course) || other.course == course) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.branch, branch) || other.branch == branch));
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
      isActive,
      const DeepCollectionEquality().hash(_batchDetail),
      const DeepCollectionEquality().hash(_trainers),
      course,
      subject,
      branch);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BatchCopyWith<_$_Batch> get copyWith =>
      __$$_BatchCopyWithImpl<_$_Batch>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BatchToJson(
      this,
    );
  }
}

abstract class _Batch implements Batch {
  const factory _Batch(
      {final int? id,
      final String? batchName,
      final int? academyId,
      final int? branchId,
      final int? courseId,
      final int? subjectId,
      final String? batchStatus,
      final int? feeAmount,
      final int? admissionFees,
      final int? isActive,
      final List<BatchDetail>? batchDetail,
      final List<Trainer>? trainers,
      final Course? course,
      final Subject? subject,
      final Branch? branch}) = _$_Batch;

  factory _Batch.fromJson(Map<String, dynamic> json) = _$_Batch.fromJson;

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
  int? get isActive;
  @override
  List<BatchDetail>? get batchDetail;
  @override
  List<Trainer>? get trainers;
  @override
  Course? get course;
  @override
  Subject? get subject;
  @override
  Branch? get branch;
  @override
  @JsonKey(ignore: true)
  _$$_BatchCopyWith<_$_Batch> get copyWith =>
      throw _privateConstructorUsedError;
}

BatchDetail _$BatchDetailFromJson(Map<String, dynamic> json) {
  return _BatchDetail.fromJson(json);
}

/// @nodoc
mixin _$BatchDetail {
  int? get id => throw _privateConstructorUsedError;
  int? get batchId => throw _privateConstructorUsedError;
  int? get day => throw _privateConstructorUsedError;
  String? get startTime => throw _privateConstructorUsedError;
  String? get endTime => throw _privateConstructorUsedError;
  int? get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BatchDetailCopyWith<BatchDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BatchDetailCopyWith<$Res> {
  factory $BatchDetailCopyWith(
          BatchDetail value, $Res Function(BatchDetail) then) =
      _$BatchDetailCopyWithImpl<$Res, BatchDetail>;
  @useResult
  $Res call(
      {int? id,
      int? batchId,
      int? day,
      String? startTime,
      String? endTime,
      int? isActive});
}

/// @nodoc
class _$BatchDetailCopyWithImpl<$Res, $Val extends BatchDetail>
    implements $BatchDetailCopyWith<$Res> {
  _$BatchDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? batchId = freezed,
    Object? day = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? isActive = freezed,
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
      day: freezed == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BatchDetailCopyWith<$Res>
    implements $BatchDetailCopyWith<$Res> {
  factory _$$_BatchDetailCopyWith(
          _$_BatchDetail value, $Res Function(_$_BatchDetail) then) =
      __$$_BatchDetailCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? batchId,
      int? day,
      String? startTime,
      String? endTime,
      int? isActive});
}

/// @nodoc
class __$$_BatchDetailCopyWithImpl<$Res>
    extends _$BatchDetailCopyWithImpl<$Res, _$_BatchDetail>
    implements _$$_BatchDetailCopyWith<$Res> {
  __$$_BatchDetailCopyWithImpl(
      _$_BatchDetail _value, $Res Function(_$_BatchDetail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? batchId = freezed,
    Object? day = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_$_BatchDetail(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      batchId: freezed == batchId
          ? _value.batchId
          : batchId // ignore: cast_nullable_to_non_nullable
              as int?,
      day: freezed == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_BatchDetail implements _BatchDetail {
  const _$_BatchDetail(
      {this.id,
      this.batchId,
      this.day,
      this.startTime,
      this.endTime,
      this.isActive});

  factory _$_BatchDetail.fromJson(Map<String, dynamic> json) =>
      _$$_BatchDetailFromJson(json);

  @override
  final int? id;
  @override
  final int? batchId;
  @override
  final int? day;
  @override
  final String? startTime;
  @override
  final String? endTime;
  @override
  final int? isActive;

  @override
  String toString() {
    return 'BatchDetail(id: $id, batchId: $batchId, day: $day, startTime: $startTime, endTime: $endTime, isActive: $isActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BatchDetail &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.batchId, batchId) || other.batchId == batchId) &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, batchId, day, startTime, endTime, isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BatchDetailCopyWith<_$_BatchDetail> get copyWith =>
      __$$_BatchDetailCopyWithImpl<_$_BatchDetail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BatchDetailToJson(
      this,
    );
  }
}

abstract class _BatchDetail implements BatchDetail {
  const factory _BatchDetail(
      {final int? id,
      final int? batchId,
      final int? day,
      final String? startTime,
      final String? endTime,
      final int? isActive}) = _$_BatchDetail;

  factory _BatchDetail.fromJson(Map<String, dynamic> json) =
      _$_BatchDetail.fromJson;

  @override
  int? get id;
  @override
  int? get batchId;
  @override
  int? get day;
  @override
  String? get startTime;
  @override
  String? get endTime;
  @override
  int? get isActive;
  @override
  @JsonKey(ignore: true)
  _$$_BatchDetailCopyWith<_$_BatchDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

Branch _$BranchFromJson(Map<String, dynamic> json) {
  return _Branch.fromJson(json);
}

/// @nodoc
mixin _$Branch {
  int? get id => throw _privateConstructorUsedError;
  String? get branchName => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  int? get pincode => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  int? get stateId => throw _privateConstructorUsedError;
  int? get districtId => throw _privateConstructorUsedError;
  int? get countryId => throw _privateConstructorUsedError;
  Country? get country => throw _privateConstructorUsedError;
  StateDetails? get state => throw _privateConstructorUsedError;
  District? get district => throw _privateConstructorUsedError;
  Timezone? get timezone => throw _privateConstructorUsedError;
  int? get academyId => throw _privateConstructorUsedError;
  int? get managerDetailId => throw _privateConstructorUsedError;
  int? get isActive => throw _privateConstructorUsedError;
  Pivot? get pivot => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BranchCopyWith<Branch> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BranchCopyWith<$Res> {
  factory $BranchCopyWith(Branch value, $Res Function(Branch) then) =
      _$BranchCopyWithImpl<$Res, Branch>;
  @useResult
  $Res call(
      {int? id,
      String? branchName,
      String? address,
      int? pincode,
      String? currency,
      int? stateId,
      int? districtId,
      int? countryId,
      Country? country,
      StateDetails? state,
      District? district,
      Timezone? timezone,
      int? academyId,
      int? managerDetailId,
      int? isActive,
      Pivot? pivot});

  $CountryCopyWith<$Res>? get country;
  $StateDetailsCopyWith<$Res>? get state;
  $DistrictCopyWith<$Res>? get district;
  $TimezoneCopyWith<$Res>? get timezone;
  $PivotCopyWith<$Res>? get pivot;
}

/// @nodoc
class _$BranchCopyWithImpl<$Res, $Val extends Branch>
    implements $BranchCopyWith<$Res> {
  _$BranchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? branchName = freezed,
    Object? address = freezed,
    Object? pincode = freezed,
    Object? currency = freezed,
    Object? stateId = freezed,
    Object? districtId = freezed,
    Object? countryId = freezed,
    Object? country = freezed,
    Object? state = freezed,
    Object? district = freezed,
    Object? timezone = freezed,
    Object? academyId = freezed,
    Object? managerDetailId = freezed,
    Object? isActive = freezed,
    Object? pivot = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      branchName: freezed == branchName
          ? _value.branchName
          : branchName // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      pincode: freezed == pincode
          ? _value.pincode
          : pincode // ignore: cast_nullable_to_non_nullable
              as int?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      stateId: freezed == stateId
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as int?,
      districtId: freezed == districtId
          ? _value.districtId
          : districtId // ignore: cast_nullable_to_non_nullable
              as int?,
      countryId: freezed == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as int?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as Country?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as StateDetails?,
      district: freezed == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as District?,
      timezone: freezed == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as Timezone?,
      academyId: freezed == academyId
          ? _value.academyId
          : academyId // ignore: cast_nullable_to_non_nullable
              as int?,
      managerDetailId: freezed == managerDetailId
          ? _value.managerDetailId
          : managerDetailId // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int?,
      pivot: freezed == pivot
          ? _value.pivot
          : pivot // ignore: cast_nullable_to_non_nullable
              as Pivot?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CountryCopyWith<$Res>? get country {
    if (_value.country == null) {
      return null;
    }

    return $CountryCopyWith<$Res>(_value.country!, (value) {
      return _then(_value.copyWith(country: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $StateDetailsCopyWith<$Res>? get state {
    if (_value.state == null) {
      return null;
    }

    return $StateDetailsCopyWith<$Res>(_value.state!, (value) {
      return _then(_value.copyWith(state: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DistrictCopyWith<$Res>? get district {
    if (_value.district == null) {
      return null;
    }

    return $DistrictCopyWith<$Res>(_value.district!, (value) {
      return _then(_value.copyWith(district: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TimezoneCopyWith<$Res>? get timezone {
    if (_value.timezone == null) {
      return null;
    }

    return $TimezoneCopyWith<$Res>(_value.timezone!, (value) {
      return _then(_value.copyWith(timezone: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PivotCopyWith<$Res>? get pivot {
    if (_value.pivot == null) {
      return null;
    }

    return $PivotCopyWith<$Res>(_value.pivot!, (value) {
      return _then(_value.copyWith(pivot: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_BranchCopyWith<$Res> implements $BranchCopyWith<$Res> {
  factory _$$_BranchCopyWith(_$_Branch value, $Res Function(_$_Branch) then) =
      __$$_BranchCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? branchName,
      String? address,
      int? pincode,
      String? currency,
      int? stateId,
      int? districtId,
      int? countryId,
      Country? country,
      StateDetails? state,
      District? district,
      Timezone? timezone,
      int? academyId,
      int? managerDetailId,
      int? isActive,
      Pivot? pivot});

  @override
  $CountryCopyWith<$Res>? get country;
  @override
  $StateDetailsCopyWith<$Res>? get state;
  @override
  $DistrictCopyWith<$Res>? get district;
  @override
  $TimezoneCopyWith<$Res>? get timezone;
  @override
  $PivotCopyWith<$Res>? get pivot;
}

/// @nodoc
class __$$_BranchCopyWithImpl<$Res>
    extends _$BranchCopyWithImpl<$Res, _$_Branch>
    implements _$$_BranchCopyWith<$Res> {
  __$$_BranchCopyWithImpl(_$_Branch _value, $Res Function(_$_Branch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? branchName = freezed,
    Object? address = freezed,
    Object? pincode = freezed,
    Object? currency = freezed,
    Object? stateId = freezed,
    Object? districtId = freezed,
    Object? countryId = freezed,
    Object? country = freezed,
    Object? state = freezed,
    Object? district = freezed,
    Object? timezone = freezed,
    Object? academyId = freezed,
    Object? managerDetailId = freezed,
    Object? isActive = freezed,
    Object? pivot = freezed,
  }) {
    return _then(_$_Branch(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      branchName: freezed == branchName
          ? _value.branchName
          : branchName // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      pincode: freezed == pincode
          ? _value.pincode
          : pincode // ignore: cast_nullable_to_non_nullable
              as int?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      stateId: freezed == stateId
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as int?,
      districtId: freezed == districtId
          ? _value.districtId
          : districtId // ignore: cast_nullable_to_non_nullable
              as int?,
      countryId: freezed == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as int?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as Country?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as StateDetails?,
      district: freezed == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as District?,
      timezone: freezed == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as Timezone?,
      academyId: freezed == academyId
          ? _value.academyId
          : academyId // ignore: cast_nullable_to_non_nullable
              as int?,
      managerDetailId: freezed == managerDetailId
          ? _value.managerDetailId
          : managerDetailId // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int?,
      pivot: freezed == pivot
          ? _value.pivot
          : pivot // ignore: cast_nullable_to_non_nullable
              as Pivot?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Branch implements _Branch {
  const _$_Branch(
      {this.id,
      this.branchName,
      this.address,
      this.pincode,
      this.currency,
      this.stateId,
      this.districtId,
      this.countryId,
      this.country,
      this.state,
      this.district,
      this.timezone,
      this.academyId,
      this.managerDetailId,
      this.isActive,
      this.pivot});

  factory _$_Branch.fromJson(Map<String, dynamic> json) =>
      _$$_BranchFromJson(json);

  @override
  final int? id;
  @override
  final String? branchName;
  @override
  final String? address;
  @override
  final int? pincode;
  @override
  final String? currency;
  @override
  final int? stateId;
  @override
  final int? districtId;
  @override
  final int? countryId;
  @override
  final Country? country;
  @override
  final StateDetails? state;
  @override
  final District? district;
  @override
  final Timezone? timezone;
  @override
  final int? academyId;
  @override
  final int? managerDetailId;
  @override
  final int? isActive;
  @override
  final Pivot? pivot;

  @override
  String toString() {
    return 'Branch(id: $id, branchName: $branchName, address: $address, pincode: $pincode, currency: $currency, stateId: $stateId, districtId: $districtId, countryId: $countryId, country: $country, state: $state, district: $district, timezone: $timezone, academyId: $academyId, managerDetailId: $managerDetailId, isActive: $isActive, pivot: $pivot)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Branch &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.branchName, branchName) ||
                other.branchName == branchName) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.pincode, pincode) || other.pincode == pincode) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.stateId, stateId) || other.stateId == stateId) &&
            (identical(other.districtId, districtId) ||
                other.districtId == districtId) &&
            (identical(other.countryId, countryId) ||
                other.countryId == countryId) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.district, district) ||
                other.district == district) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            (identical(other.academyId, academyId) ||
                other.academyId == academyId) &&
            (identical(other.managerDetailId, managerDetailId) ||
                other.managerDetailId == managerDetailId) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.pivot, pivot) || other.pivot == pivot));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      branchName,
      address,
      pincode,
      currency,
      stateId,
      districtId,
      countryId,
      country,
      state,
      district,
      timezone,
      academyId,
      managerDetailId,
      isActive,
      pivot);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BranchCopyWith<_$_Branch> get copyWith =>
      __$$_BranchCopyWithImpl<_$_Branch>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BranchToJson(
      this,
    );
  }
}

abstract class _Branch implements Branch {
  const factory _Branch(
      {final int? id,
      final String? branchName,
      final String? address,
      final int? pincode,
      final String? currency,
      final int? stateId,
      final int? districtId,
      final int? countryId,
      final Country? country,
      final StateDetails? state,
      final District? district,
      final Timezone? timezone,
      final int? academyId,
      final int? managerDetailId,
      final int? isActive,
      final Pivot? pivot}) = _$_Branch;

  factory _Branch.fromJson(Map<String, dynamic> json) = _$_Branch.fromJson;

  @override
  int? get id;
  @override
  String? get branchName;
  @override
  String? get address;
  @override
  int? get pincode;
  @override
  String? get currency;
  @override
  int? get stateId;
  @override
  int? get districtId;
  @override
  int? get countryId;
  @override
  Country? get country;
  @override
  StateDetails? get state;
  @override
  District? get district;
  @override
  Timezone? get timezone;
  @override
  int? get academyId;
  @override
  int? get managerDetailId;
  @override
  int? get isActive;
  @override
  Pivot? get pivot;
  @override
  @JsonKey(ignore: true)
  _$$_BranchCopyWith<_$_Branch> get copyWith =>
      throw _privateConstructorUsedError;
}

Country _$CountryFromJson(Map<String, dynamic> json) {
  return _Country.fromJson(json);
}

/// @nodoc
mixin _$Country {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  String? get currencySymbol => throw _privateConstructorUsedError;
  String? get currencyCode => throw _privateConstructorUsedError;
  String? get timezone => throw _privateConstructorUsedError;
  String? get currencySubUnit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CountryCopyWith<Country> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryCopyWith<$Res> {
  factory $CountryCopyWith(Country value, $Res Function(Country) then) =
      _$CountryCopyWithImpl<$Res, Country>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? currency,
      String? currencySymbol,
      String? currencyCode,
      String? timezone,
      String? currencySubUnit});
}

/// @nodoc
class _$CountryCopyWithImpl<$Res, $Val extends Country>
    implements $CountryCopyWith<$Res> {
  _$CountryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? currency = freezed,
    Object? currencySymbol = freezed,
    Object? currencyCode = freezed,
    Object? timezone = freezed,
    Object? currencySubUnit = freezed,
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
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      currencySymbol: freezed == currencySymbol
          ? _value.currencySymbol
          : currencySymbol // ignore: cast_nullable_to_non_nullable
              as String?,
      currencyCode: freezed == currencyCode
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String?,
      timezone: freezed == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
      currencySubUnit: freezed == currencySubUnit
          ? _value.currencySubUnit
          : currencySubUnit // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CountryCopyWith<$Res> implements $CountryCopyWith<$Res> {
  factory _$$_CountryCopyWith(
          _$_Country value, $Res Function(_$_Country) then) =
      __$$_CountryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? currency,
      String? currencySymbol,
      String? currencyCode,
      String? timezone,
      String? currencySubUnit});
}

/// @nodoc
class __$$_CountryCopyWithImpl<$Res>
    extends _$CountryCopyWithImpl<$Res, _$_Country>
    implements _$$_CountryCopyWith<$Res> {
  __$$_CountryCopyWithImpl(_$_Country _value, $Res Function(_$_Country) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? currency = freezed,
    Object? currencySymbol = freezed,
    Object? currencyCode = freezed,
    Object? timezone = freezed,
    Object? currencySubUnit = freezed,
  }) {
    return _then(_$_Country(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      currencySymbol: freezed == currencySymbol
          ? _value.currencySymbol
          : currencySymbol // ignore: cast_nullable_to_non_nullable
              as String?,
      currencyCode: freezed == currencyCode
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String?,
      timezone: freezed == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
      currencySubUnit: freezed == currencySubUnit
          ? _value.currencySubUnit
          : currencySubUnit // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Country implements _Country {
  const _$_Country(
      {this.id,
      this.name,
      this.currency,
      this.currencySymbol,
      this.currencyCode,
      this.timezone,
      this.currencySubUnit});

  factory _$_Country.fromJson(Map<String, dynamic> json) =>
      _$$_CountryFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? currency;
  @override
  final String? currencySymbol;
  @override
  final String? currencyCode;
  @override
  final String? timezone;
  @override
  final String? currencySubUnit;

  @override
  String toString() {
    return 'Country(id: $id, name: $name, currency: $currency, currencySymbol: $currencySymbol, currencyCode: $currencyCode, timezone: $timezone, currencySubUnit: $currencySubUnit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Country &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.currencySymbol, currencySymbol) ||
                other.currencySymbol == currencySymbol) &&
            (identical(other.currencyCode, currencyCode) ||
                other.currencyCode == currencyCode) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            (identical(other.currencySubUnit, currencySubUnit) ||
                other.currencySubUnit == currencySubUnit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, currency,
      currencySymbol, currencyCode, timezone, currencySubUnit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CountryCopyWith<_$_Country> get copyWith =>
      __$$_CountryCopyWithImpl<_$_Country>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CountryToJson(
      this,
    );
  }
}

abstract class _Country implements Country {
  const factory _Country(
      {final int? id,
      final String? name,
      final String? currency,
      final String? currencySymbol,
      final String? currencyCode,
      final String? timezone,
      final String? currencySubUnit}) = _$_Country;

  factory _Country.fromJson(Map<String, dynamic> json) = _$_Country.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get currency;
  @override
  String? get currencySymbol;
  @override
  String? get currencyCode;
  @override
  String? get timezone;
  @override
  String? get currencySubUnit;
  @override
  @JsonKey(ignore: true)
  _$$_CountryCopyWith<_$_Country> get copyWith =>
      throw _privateConstructorUsedError;
}

District _$DistrictFromJson(Map<String, dynamic> json) {
  return _District.fromJson(json);
}

/// @nodoc
mixin _$District {
  int? get id => throw _privateConstructorUsedError;
  String? get districtName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DistrictCopyWith<District> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DistrictCopyWith<$Res> {
  factory $DistrictCopyWith(District value, $Res Function(District) then) =
      _$DistrictCopyWithImpl<$Res, District>;
  @useResult
  $Res call({int? id, String? districtName});
}

/// @nodoc
class _$DistrictCopyWithImpl<$Res, $Val extends District>
    implements $DistrictCopyWith<$Res> {
  _$DistrictCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? districtName = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      districtName: freezed == districtName
          ? _value.districtName
          : districtName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DistrictCopyWith<$Res> implements $DistrictCopyWith<$Res> {
  factory _$$_DistrictCopyWith(
          _$_District value, $Res Function(_$_District) then) =
      __$$_DistrictCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? districtName});
}

/// @nodoc
class __$$_DistrictCopyWithImpl<$Res>
    extends _$DistrictCopyWithImpl<$Res, _$_District>
    implements _$$_DistrictCopyWith<$Res> {
  __$$_DistrictCopyWithImpl(
      _$_District _value, $Res Function(_$_District) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? districtName = freezed,
  }) {
    return _then(_$_District(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      districtName: freezed == districtName
          ? _value.districtName
          : districtName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_District implements _District {
  const _$_District({this.id, this.districtName});

  factory _$_District.fromJson(Map<String, dynamic> json) =>
      _$$_DistrictFromJson(json);

  @override
  final int? id;
  @override
  final String? districtName;

  @override
  String toString() {
    return 'District(id: $id, districtName: $districtName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_District &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.districtName, districtName) ||
                other.districtName == districtName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, districtName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DistrictCopyWith<_$_District> get copyWith =>
      __$$_DistrictCopyWithImpl<_$_District>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DistrictToJson(
      this,
    );
  }
}

abstract class _District implements District {
  const factory _District({final int? id, final String? districtName}) =
      _$_District;

  factory _District.fromJson(Map<String, dynamic> json) = _$_District.fromJson;

  @override
  int? get id;
  @override
  String? get districtName;
  @override
  @JsonKey(ignore: true)
  _$$_DistrictCopyWith<_$_District> get copyWith =>
      throw _privateConstructorUsedError;
}

Pivot _$PivotFromJson(Map<String, dynamic> json) {
  return _Pivot.fromJson(json);
}

/// @nodoc
mixin _$Pivot {
  int? get trainerDetailId => throw _privateConstructorUsedError;
  int? get branchId => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  int? get batchId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PivotCopyWith<Pivot> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PivotCopyWith<$Res> {
  factory $PivotCopyWith(Pivot value, $Res Function(Pivot) then) =
      _$PivotCopyWithImpl<$Res, Pivot>;
  @useResult
  $Res call(
      {int? trainerDetailId,
      int? branchId,
      DateTime? createdAt,
      DateTime? updatedAt,
      int? batchId});
}

/// @nodoc
class _$PivotCopyWithImpl<$Res, $Val extends Pivot>
    implements $PivotCopyWith<$Res> {
  _$PivotCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trainerDetailId = freezed,
    Object? branchId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? batchId = freezed,
  }) {
    return _then(_value.copyWith(
      trainerDetailId: freezed == trainerDetailId
          ? _value.trainerDetailId
          : trainerDetailId // ignore: cast_nullable_to_non_nullable
              as int?,
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      batchId: freezed == batchId
          ? _value.batchId
          : batchId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PivotCopyWith<$Res> implements $PivotCopyWith<$Res> {
  factory _$$_PivotCopyWith(_$_Pivot value, $Res Function(_$_Pivot) then) =
      __$$_PivotCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? trainerDetailId,
      int? branchId,
      DateTime? createdAt,
      DateTime? updatedAt,
      int? batchId});
}

/// @nodoc
class __$$_PivotCopyWithImpl<$Res> extends _$PivotCopyWithImpl<$Res, _$_Pivot>
    implements _$$_PivotCopyWith<$Res> {
  __$$_PivotCopyWithImpl(_$_Pivot _value, $Res Function(_$_Pivot) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trainerDetailId = freezed,
    Object? branchId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? batchId = freezed,
  }) {
    return _then(_$_Pivot(
      trainerDetailId: freezed == trainerDetailId
          ? _value.trainerDetailId
          : trainerDetailId // ignore: cast_nullable_to_non_nullable
              as int?,
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      batchId: freezed == batchId
          ? _value.batchId
          : batchId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Pivot implements _Pivot {
  const _$_Pivot(
      {this.trainerDetailId,
      this.branchId,
      this.createdAt,
      this.updatedAt,
      this.batchId});

  factory _$_Pivot.fromJson(Map<String, dynamic> json) =>
      _$$_PivotFromJson(json);

  @override
  final int? trainerDetailId;
  @override
  final int? branchId;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final int? batchId;

  @override
  String toString() {
    return 'Pivot(trainerDetailId: $trainerDetailId, branchId: $branchId, createdAt: $createdAt, updatedAt: $updatedAt, batchId: $batchId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Pivot &&
            (identical(other.trainerDetailId, trainerDetailId) ||
                other.trainerDetailId == trainerDetailId) &&
            (identical(other.branchId, branchId) ||
                other.branchId == branchId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.batchId, batchId) || other.batchId == batchId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, trainerDetailId, branchId, createdAt, updatedAt, batchId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PivotCopyWith<_$_Pivot> get copyWith =>
      __$$_PivotCopyWithImpl<_$_Pivot>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PivotToJson(
      this,
    );
  }
}

abstract class _Pivot implements Pivot {
  const factory _Pivot(
      {final int? trainerDetailId,
      final int? branchId,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      final int? batchId}) = _$_Pivot;

  factory _Pivot.fromJson(Map<String, dynamic> json) = _$_Pivot.fromJson;

  @override
  int? get trainerDetailId;
  @override
  int? get branchId;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  int? get batchId;
  @override
  @JsonKey(ignore: true)
  _$$_PivotCopyWith<_$_Pivot> get copyWith =>
      throw _privateConstructorUsedError;
}

StateDetails _$StateDetailsFromJson(Map<String, dynamic> json) {
  return _StateDetails.fromJson(json);
}

/// @nodoc
mixin _$StateDetails {
  int? get id => throw _privateConstructorUsedError;
  String? get stateName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StateDetailsCopyWith<StateDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StateDetailsCopyWith<$Res> {
  factory $StateDetailsCopyWith(
          StateDetails value, $Res Function(StateDetails) then) =
      _$StateDetailsCopyWithImpl<$Res, StateDetails>;
  @useResult
  $Res call({int? id, String? stateName});
}

/// @nodoc
class _$StateDetailsCopyWithImpl<$Res, $Val extends StateDetails>
    implements $StateDetailsCopyWith<$Res> {
  _$StateDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? stateName = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      stateName: freezed == stateName
          ? _value.stateName
          : stateName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StateDetailsCopyWith<$Res>
    implements $StateDetailsCopyWith<$Res> {
  factory _$$_StateDetailsCopyWith(
          _$_StateDetails value, $Res Function(_$_StateDetails) then) =
      __$$_StateDetailsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? stateName});
}

/// @nodoc
class __$$_StateDetailsCopyWithImpl<$Res>
    extends _$StateDetailsCopyWithImpl<$Res, _$_StateDetails>
    implements _$$_StateDetailsCopyWith<$Res> {
  __$$_StateDetailsCopyWithImpl(
      _$_StateDetails _value, $Res Function(_$_StateDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? stateName = freezed,
  }) {
    return _then(_$_StateDetails(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      stateName: freezed == stateName
          ? _value.stateName
          : stateName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_StateDetails implements _StateDetails {
  const _$_StateDetails({this.id, this.stateName});

  factory _$_StateDetails.fromJson(Map<String, dynamic> json) =>
      _$$_StateDetailsFromJson(json);

  @override
  final int? id;
  @override
  final String? stateName;

  @override
  String toString() {
    return 'StateDetails(id: $id, stateName: $stateName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StateDetails &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.stateName, stateName) ||
                other.stateName == stateName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, stateName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StateDetailsCopyWith<_$_StateDetails> get copyWith =>
      __$$_StateDetailsCopyWithImpl<_$_StateDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StateDetailsToJson(
      this,
    );
  }
}

abstract class _StateDetails implements StateDetails {
  const factory _StateDetails({final int? id, final String? stateName}) =
      _$_StateDetails;

  factory _StateDetails.fromJson(Map<String, dynamic> json) =
      _$_StateDetails.fromJson;

  @override
  int? get id;
  @override
  String? get stateName;
  @override
  @JsonKey(ignore: true)
  _$$_StateDetailsCopyWith<_$_StateDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

Timezone _$TimezoneFromJson(Map<String, dynamic> json) {
  return _Timezone.fromJson(json);
}

/// @nodoc
mixin _$Timezone {
  int? get id => throw _privateConstructorUsedError;
  String? get timezone => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimezoneCopyWith<Timezone> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimezoneCopyWith<$Res> {
  factory $TimezoneCopyWith(Timezone value, $Res Function(Timezone) then) =
      _$TimezoneCopyWithImpl<$Res, Timezone>;
  @useResult
  $Res call({int? id, String? timezone});
}

/// @nodoc
class _$TimezoneCopyWithImpl<$Res, $Val extends Timezone>
    implements $TimezoneCopyWith<$Res> {
  _$TimezoneCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? timezone = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      timezone: freezed == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TimezoneCopyWith<$Res> implements $TimezoneCopyWith<$Res> {
  factory _$$_TimezoneCopyWith(
          _$_Timezone value, $Res Function(_$_Timezone) then) =
      __$$_TimezoneCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? timezone});
}

/// @nodoc
class __$$_TimezoneCopyWithImpl<$Res>
    extends _$TimezoneCopyWithImpl<$Res, _$_Timezone>
    implements _$$_TimezoneCopyWith<$Res> {
  __$$_TimezoneCopyWithImpl(
      _$_Timezone _value, $Res Function(_$_Timezone) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? timezone = freezed,
  }) {
    return _then(_$_Timezone(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      timezone: freezed == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Timezone implements _Timezone {
  const _$_Timezone({this.id, this.timezone});

  factory _$_Timezone.fromJson(Map<String, dynamic> json) =>
      _$$_TimezoneFromJson(json);

  @override
  final int? id;
  @override
  final String? timezone;

  @override
  String toString() {
    return 'Timezone(id: $id, timezone: $timezone)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Timezone &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, timezone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TimezoneCopyWith<_$_Timezone> get copyWith =>
      __$$_TimezoneCopyWithImpl<_$_Timezone>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TimezoneToJson(
      this,
    );
  }
}

abstract class _Timezone implements Timezone {
  const factory _Timezone({final int? id, final String? timezone}) =
      _$_Timezone;

  factory _Timezone.fromJson(Map<String, dynamic> json) = _$_Timezone.fromJson;

  @override
  int? get id;
  @override
  String? get timezone;
  @override
  @JsonKey(ignore: true)
  _$$_TimezoneCopyWith<_$_Timezone> get copyWith =>
      throw _privateConstructorUsedError;
}

Course _$CourseFromJson(Map<String, dynamic> json) {
  return _Course.fromJson(json);
}

/// @nodoc
mixin _$Course {
  int? get id => throw _privateConstructorUsedError;
  int? get academyTypeId => throw _privateConstructorUsedError;
  String? get courseName => throw _privateConstructorUsedError;
  int? get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CourseCopyWith<Course> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseCopyWith<$Res> {
  factory $CourseCopyWith(Course value, $Res Function(Course) then) =
      _$CourseCopyWithImpl<$Res, Course>;
  @useResult
  $Res call({int? id, int? academyTypeId, String? courseName, int? isActive});
}

/// @nodoc
class _$CourseCopyWithImpl<$Res, $Val extends Course>
    implements $CourseCopyWith<$Res> {
  _$CourseCopyWithImpl(this._value, this._then);

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
abstract class _$$_CourseCopyWith<$Res> implements $CourseCopyWith<$Res> {
  factory _$$_CourseCopyWith(_$_Course value, $Res Function(_$_Course) then) =
      __$$_CourseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, int? academyTypeId, String? courseName, int? isActive});
}

/// @nodoc
class __$$_CourseCopyWithImpl<$Res>
    extends _$CourseCopyWithImpl<$Res, _$_Course>
    implements _$$_CourseCopyWith<$Res> {
  __$$_CourseCopyWithImpl(_$_Course _value, $Res Function(_$_Course) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? academyTypeId = freezed,
    Object? courseName = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_$_Course(
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

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Course implements _Course {
  const _$_Course(
      {this.id, this.academyTypeId, this.courseName, this.isActive});

  factory _$_Course.fromJson(Map<String, dynamic> json) =>
      _$$_CourseFromJson(json);

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
    return 'Course(id: $id, academyTypeId: $academyTypeId, courseName: $courseName, isActive: $isActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Course &&
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
  _$$_CourseCopyWith<_$_Course> get copyWith =>
      __$$_CourseCopyWithImpl<_$_Course>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CourseToJson(
      this,
    );
  }
}

abstract class _Course implements Course {
  const factory _Course(
      {final int? id,
      final int? academyTypeId,
      final String? courseName,
      final int? isActive}) = _$_Course;

  factory _Course.fromJson(Map<String, dynamic> json) = _$_Course.fromJson;

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
  _$$_CourseCopyWith<_$_Course> get copyWith =>
      throw _privateConstructorUsedError;
}

Subject _$SubjectFromJson(Map<String, dynamic> json) {
  return _Subject.fromJson(json);
}

/// @nodoc
mixin _$Subject {
  int? get id => throw _privateConstructorUsedError;
  int? get courseId => throw _privateConstructorUsedError;
  String? get subjectName => throw _privateConstructorUsedError;
  int? get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubjectCopyWith<Subject> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubjectCopyWith<$Res> {
  factory $SubjectCopyWith(Subject value, $Res Function(Subject) then) =
      _$SubjectCopyWithImpl<$Res, Subject>;
  @useResult
  $Res call({int? id, int? courseId, String? subjectName, int? isActive});
}

/// @nodoc
class _$SubjectCopyWithImpl<$Res, $Val extends Subject>
    implements $SubjectCopyWith<$Res> {
  _$SubjectCopyWithImpl(this._value, this._then);

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
abstract class _$$_SubjectCopyWith<$Res> implements $SubjectCopyWith<$Res> {
  factory _$$_SubjectCopyWith(
          _$_Subject value, $Res Function(_$_Subject) then) =
      __$$_SubjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, int? courseId, String? subjectName, int? isActive});
}

/// @nodoc
class __$$_SubjectCopyWithImpl<$Res>
    extends _$SubjectCopyWithImpl<$Res, _$_Subject>
    implements _$$_SubjectCopyWith<$Res> {
  __$$_SubjectCopyWithImpl(_$_Subject _value, $Res Function(_$_Subject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? courseId = freezed,
    Object? subjectName = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_$_Subject(
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

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Subject implements _Subject {
  const _$_Subject({this.id, this.courseId, this.subjectName, this.isActive});

  factory _$_Subject.fromJson(Map<String, dynamic> json) =>
      _$$_SubjectFromJson(json);

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
    return 'Subject(id: $id, courseId: $courseId, subjectName: $subjectName, isActive: $isActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Subject &&
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
  _$$_SubjectCopyWith<_$_Subject> get copyWith =>
      __$$_SubjectCopyWithImpl<_$_Subject>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SubjectToJson(
      this,
    );
  }
}

abstract class _Subject implements Subject {
  const factory _Subject(
      {final int? id,
      final int? courseId,
      final String? subjectName,
      final int? isActive}) = _$_Subject;

  factory _Subject.fromJson(Map<String, dynamic> json) = _$_Subject.fromJson;

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
  _$$_SubjectCopyWith<_$_Subject> get copyWith =>
      throw _privateConstructorUsedError;
}

Trainer _$TrainerFromJson(Map<String, dynamic> json) {
  return _Trainer.fromJson(json);
}

/// @nodoc
mixin _$Trainer {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  int? get userId => throw _privateConstructorUsedError;
  int? get academyId => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  DateTime? get dob => throw _privateConstructorUsedError;
  DateTime? get doj => throw _privateConstructorUsedError;
  String? get whatsappNo => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get upiId => throw _privateConstructorUsedError;
  String? get salaryType => throw _privateConstructorUsedError;
  int? get salaryDate => throw _privateConstructorUsedError;
  int? get salaryAmount => throw _privateConstructorUsedError;
  String? get expertise => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get profilePic => throw _privateConstructorUsedError;
  String? get document1 => throw _privateConstructorUsedError;
  String? get document2 => throw _privateConstructorUsedError;
  int? get isActive => throw _privateConstructorUsedError;
  Pivot? get pivot => throw _privateConstructorUsedError;
  List<Branch>? get branches => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TrainerCopyWith<Trainer> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrainerCopyWith<$Res> {
  factory $TrainerCopyWith(Trainer value, $Res Function(Trainer) then) =
      _$TrainerCopyWithImpl<$Res, Trainer>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      int? userId,
      int? academyId,
      String? gender,
      DateTime? dob,
      DateTime? doj,
      String? whatsappNo,
      String? email,
      String? upiId,
      String? salaryType,
      int? salaryDate,
      int? salaryAmount,
      String? expertise,
      String? address,
      String? profilePic,
      String? document1,
      String? document2,
      int? isActive,
      Pivot? pivot,
      List<Branch>? branches});

  $PivotCopyWith<$Res>? get pivot;
}

/// @nodoc
class _$TrainerCopyWithImpl<$Res, $Val extends Trainer>
    implements $TrainerCopyWith<$Res> {
  _$TrainerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? userId = freezed,
    Object? academyId = freezed,
    Object? gender = freezed,
    Object? dob = freezed,
    Object? doj = freezed,
    Object? whatsappNo = freezed,
    Object? email = freezed,
    Object? upiId = freezed,
    Object? salaryType = freezed,
    Object? salaryDate = freezed,
    Object? salaryAmount = freezed,
    Object? expertise = freezed,
    Object? address = freezed,
    Object? profilePic = freezed,
    Object? document1 = freezed,
    Object? document2 = freezed,
    Object? isActive = freezed,
    Object? pivot = freezed,
    Object? branches = freezed,
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
      salaryDate: freezed == salaryDate
          ? _value.salaryDate
          : salaryDate // ignore: cast_nullable_to_non_nullable
              as int?,
      salaryAmount: freezed == salaryAmount
          ? _value.salaryAmount
          : salaryAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      expertise: freezed == expertise
          ? _value.expertise
          : expertise // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePic: freezed == profilePic
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as String?,
      document1: freezed == document1
          ? _value.document1
          : document1 // ignore: cast_nullable_to_non_nullable
              as String?,
      document2: freezed == document2
          ? _value.document2
          : document2 // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int?,
      pivot: freezed == pivot
          ? _value.pivot
          : pivot // ignore: cast_nullable_to_non_nullable
              as Pivot?,
      branches: freezed == branches
          ? _value.branches
          : branches // ignore: cast_nullable_to_non_nullable
              as List<Branch>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PivotCopyWith<$Res>? get pivot {
    if (_value.pivot == null) {
      return null;
    }

    return $PivotCopyWith<$Res>(_value.pivot!, (value) {
      return _then(_value.copyWith(pivot: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TrainerCopyWith<$Res> implements $TrainerCopyWith<$Res> {
  factory _$$_TrainerCopyWith(
          _$_Trainer value, $Res Function(_$_Trainer) then) =
      __$$_TrainerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      int? userId,
      int? academyId,
      String? gender,
      DateTime? dob,
      DateTime? doj,
      String? whatsappNo,
      String? email,
      String? upiId,
      String? salaryType,
      int? salaryDate,
      int? salaryAmount,
      String? expertise,
      String? address,
      String? profilePic,
      String? document1,
      String? document2,
      int? isActive,
      Pivot? pivot,
      List<Branch>? branches});

  @override
  $PivotCopyWith<$Res>? get pivot;
}

/// @nodoc
class __$$_TrainerCopyWithImpl<$Res>
    extends _$TrainerCopyWithImpl<$Res, _$_Trainer>
    implements _$$_TrainerCopyWith<$Res> {
  __$$_TrainerCopyWithImpl(_$_Trainer _value, $Res Function(_$_Trainer) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? userId = freezed,
    Object? academyId = freezed,
    Object? gender = freezed,
    Object? dob = freezed,
    Object? doj = freezed,
    Object? whatsappNo = freezed,
    Object? email = freezed,
    Object? upiId = freezed,
    Object? salaryType = freezed,
    Object? salaryDate = freezed,
    Object? salaryAmount = freezed,
    Object? expertise = freezed,
    Object? address = freezed,
    Object? profilePic = freezed,
    Object? document1 = freezed,
    Object? document2 = freezed,
    Object? isActive = freezed,
    Object? pivot = freezed,
    Object? branches = freezed,
  }) {
    return _then(_$_Trainer(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
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
      whatsappNo: freezed == whatsappNo
          ? _value.whatsappNo
          : whatsappNo // ignore: cast_nullable_to_non_nullable
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
      salaryDate: freezed == salaryDate
          ? _value.salaryDate
          : salaryDate // ignore: cast_nullable_to_non_nullable
              as int?,
      salaryAmount: freezed == salaryAmount
          ? _value.salaryAmount
          : salaryAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      expertise: freezed == expertise
          ? _value.expertise
          : expertise // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePic: freezed == profilePic
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as String?,
      document1: freezed == document1
          ? _value.document1
          : document1 // ignore: cast_nullable_to_non_nullable
              as String?,
      document2: freezed == document2
          ? _value.document2
          : document2 // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int?,
      pivot: freezed == pivot
          ? _value.pivot
          : pivot // ignore: cast_nullable_to_non_nullable
              as Pivot?,
      branches: freezed == branches
          ? _value._branches
          : branches // ignore: cast_nullable_to_non_nullable
              as List<Branch>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Trainer implements _Trainer {
  const _$_Trainer(
      {this.id,
      this.name,
      this.userId,
      this.academyId,
      this.gender,
      this.dob,
      this.doj,
      this.whatsappNo,
      this.email,
      this.upiId,
      this.salaryType,
      this.salaryDate,
      this.salaryAmount,
      this.expertise,
      this.address,
      this.profilePic,
      this.document1,
      this.document2,
      this.isActive,
      this.pivot,
      final List<Branch>? branches})
      : _branches = branches;

  factory _$_Trainer.fromJson(Map<String, dynamic> json) =>
      _$$_TrainerFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
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
  final String? email;
  @override
  final String? upiId;
  @override
  final String? salaryType;
  @override
  final int? salaryDate;
  @override
  final int? salaryAmount;
  @override
  final String? expertise;
  @override
  final String? address;
  @override
  final String? profilePic;
  @override
  final String? document1;
  @override
  final String? document2;
  @override
  final int? isActive;
  @override
  final Pivot? pivot;
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
  String toString() {
    return 'Trainer(id: $id, name: $name, userId: $userId, academyId: $academyId, gender: $gender, dob: $dob, doj: $doj, whatsappNo: $whatsappNo, email: $email, upiId: $upiId, salaryType: $salaryType, salaryDate: $salaryDate, salaryAmount: $salaryAmount, expertise: $expertise, address: $address, profilePic: $profilePic, document1: $document1, document2: $document2, isActive: $isActive, pivot: $pivot, branches: $branches)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Trainer &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.academyId, academyId) ||
                other.academyId == academyId) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            (identical(other.doj, doj) || other.doj == doj) &&
            (identical(other.whatsappNo, whatsappNo) ||
                other.whatsappNo == whatsappNo) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.upiId, upiId) || other.upiId == upiId) &&
            (identical(other.salaryType, salaryType) ||
                other.salaryType == salaryType) &&
            (identical(other.salaryDate, salaryDate) ||
                other.salaryDate == salaryDate) &&
            (identical(other.salaryAmount, salaryAmount) ||
                other.salaryAmount == salaryAmount) &&
            (identical(other.expertise, expertise) ||
                other.expertise == expertise) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.profilePic, profilePic) ||
                other.profilePic == profilePic) &&
            (identical(other.document1, document1) ||
                other.document1 == document1) &&
            (identical(other.document2, document2) ||
                other.document2 == document2) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.pivot, pivot) || other.pivot == pivot) &&
            const DeepCollectionEquality().equals(other._branches, _branches));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        userId,
        academyId,
        gender,
        dob,
        doj,
        whatsappNo,
        email,
        upiId,
        salaryType,
        salaryDate,
        salaryAmount,
        expertise,
        address,
        profilePic,
        document1,
        document2,
        isActive,
        pivot,
        const DeepCollectionEquality().hash(_branches)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TrainerCopyWith<_$_Trainer> get copyWith =>
      __$$_TrainerCopyWithImpl<_$_Trainer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TrainerToJson(
      this,
    );
  }
}

abstract class _Trainer implements Trainer {
  const factory _Trainer(
      {final int? id,
      final String? name,
      final int? userId,
      final int? academyId,
      final String? gender,
      final DateTime? dob,
      final DateTime? doj,
      final String? whatsappNo,
      final String? email,
      final String? upiId,
      final String? salaryType,
      final int? salaryDate,
      final int? salaryAmount,
      final String? expertise,
      final String? address,
      final String? profilePic,
      final String? document1,
      final String? document2,
      final int? isActive,
      final Pivot? pivot,
      final List<Branch>? branches}) = _$_Trainer;

  factory _Trainer.fromJson(Map<String, dynamic> json) = _$_Trainer.fromJson;

  @override
  int? get id;
  @override
  String? get name;
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
  String? get email;
  @override
  String? get upiId;
  @override
  String? get salaryType;
  @override
  int? get salaryDate;
  @override
  int? get salaryAmount;
  @override
  String? get expertise;
  @override
  String? get address;
  @override
  String? get profilePic;
  @override
  String? get document1;
  @override
  String? get document2;
  @override
  int? get isActive;
  @override
  Pivot? get pivot;
  @override
  List<Branch>? get branches;
  @override
  @JsonKey(ignore: true)
  _$$_TrainerCopyWith<_$_Trainer> get copyWith =>
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
      int? isActive});
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StudentDetailCopyWith<$Res>
    implements $StudentDetailCopyWith<$Res> {
  factory _$$_StudentDetailCopyWith(
          _$_StudentDetail value, $Res Function(_$_StudentDetail) then) =
      __$$_StudentDetailCopyWithImpl<$Res>;
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
      int? isActive});
}

/// @nodoc
class __$$_StudentDetailCopyWithImpl<$Res>
    extends _$StudentDetailCopyWithImpl<$Res, _$_StudentDetail>
    implements _$$_StudentDetailCopyWith<$Res> {
  __$$_StudentDetailCopyWithImpl(
      _$_StudentDetail _value, $Res Function(_$_StudentDetail) _then)
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
  }) {
    return _then(_$_StudentDetail(
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
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_StudentDetail implements _StudentDetail {
  const _$_StudentDetail(
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
      this.isActive});

  factory _$_StudentDetail.fromJson(Map<String, dynamic> json) =>
      _$$_StudentDetailFromJson(json);

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

  @override
  String toString() {
    return 'StudentDetail(id: $id, name: $name, parentName: $parentName, userId: $userId, academyId: $academyId, gender: $gender, dob: $dob, doj: $doj, email: $email, whatsappNo: $whatsappNo, address: $address, profilePic: $profilePic, isActive: $isActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StudentDetail &&
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
                other.isActive == isActive));
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
      isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StudentDetailCopyWith<_$_StudentDetail> get copyWith =>
      __$$_StudentDetailCopyWithImpl<_$_StudentDetail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StudentDetailToJson(
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
      final int? isActive}) = _$_StudentDetail;

  factory _StudentDetail.fromJson(Map<String, dynamic> json) =
      _$_StudentDetail.fromJson;

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
  @JsonKey(ignore: true)
  _$$_StudentDetailCopyWith<_$_StudentDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

ClassDetails _$ClassDetailsFromJson(Map<String, dynamic> json) {
  return _ClassDetails.fromJson(json);
}

/// @nodoc
mixin _$ClassDetails {
  String? get status => throw _privateConstructorUsedError;
  int? get batchId => throw _privateConstructorUsedError;
  String? get batchName => throw _privateConstructorUsedError;
  String? get branchName => throw _privateConstructorUsedError;
  String? get startTime => throw _privateConstructorUsedError;
  String? get endTime => throw _privateConstructorUsedError;
  String? get timezone => throw _privateConstructorUsedError;
  List<String>? get trainers => throw _privateConstructorUsedError;
  bool? get rescheduled => throw _privateConstructorUsedError;
  String? get classLink => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClassDetailsCopyWith<ClassDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClassDetailsCopyWith<$Res> {
  factory $ClassDetailsCopyWith(
          ClassDetails value, $Res Function(ClassDetails) then) =
      _$ClassDetailsCopyWithImpl<$Res, ClassDetails>;
  @useResult
  $Res call(
      {String? status,
      int? batchId,
      String? batchName,
      String? branchName,
      String? startTime,
      String? endTime,
      String? timezone,
      List<String>? trainers,
      bool? rescheduled,
      String? classLink});
}

/// @nodoc
class _$ClassDetailsCopyWithImpl<$Res, $Val extends ClassDetails>
    implements $ClassDetailsCopyWith<$Res> {
  _$ClassDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? batchId = freezed,
    Object? batchName = freezed,
    Object? branchName = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? timezone = freezed,
    Object? trainers = freezed,
    Object? rescheduled = freezed,
    Object? classLink = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      batchId: freezed == batchId
          ? _value.batchId
          : batchId // ignore: cast_nullable_to_non_nullable
              as int?,
      batchName: freezed == batchName
          ? _value.batchName
          : batchName // ignore: cast_nullable_to_non_nullable
              as String?,
      branchName: freezed == branchName
          ? _value.branchName
          : branchName // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      timezone: freezed == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
      trainers: freezed == trainers
          ? _value.trainers
          : trainers // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      rescheduled: freezed == rescheduled
          ? _value.rescheduled
          : rescheduled // ignore: cast_nullable_to_non_nullable
              as bool?,
      classLink: freezed == classLink
          ? _value.classLink
          : classLink // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ClassDetailsCopyWith<$Res>
    implements $ClassDetailsCopyWith<$Res> {
  factory _$$_ClassDetailsCopyWith(
          _$_ClassDetails value, $Res Function(_$_ClassDetails) then) =
      __$$_ClassDetailsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? status,
      int? batchId,
      String? batchName,
      String? branchName,
      String? startTime,
      String? endTime,
      String? timezone,
      List<String>? trainers,
      bool? rescheduled,
      String? classLink});
}

/// @nodoc
class __$$_ClassDetailsCopyWithImpl<$Res>
    extends _$ClassDetailsCopyWithImpl<$Res, _$_ClassDetails>
    implements _$$_ClassDetailsCopyWith<$Res> {
  __$$_ClassDetailsCopyWithImpl(
      _$_ClassDetails _value, $Res Function(_$_ClassDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? batchId = freezed,
    Object? batchName = freezed,
    Object? branchName = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? timezone = freezed,
    Object? trainers = freezed,
    Object? rescheduled = freezed,
    Object? classLink = freezed,
  }) {
    return _then(_$_ClassDetails(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      batchId: freezed == batchId
          ? _value.batchId
          : batchId // ignore: cast_nullable_to_non_nullable
              as int?,
      batchName: freezed == batchName
          ? _value.batchName
          : batchName // ignore: cast_nullable_to_non_nullable
              as String?,
      branchName: freezed == branchName
          ? _value.branchName
          : branchName // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      timezone: freezed == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
      trainers: freezed == trainers
          ? _value._trainers
          : trainers // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      rescheduled: freezed == rescheduled
          ? _value.rescheduled
          : rescheduled // ignore: cast_nullable_to_non_nullable
              as bool?,
      classLink: freezed == classLink
          ? _value.classLink
          : classLink // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_ClassDetails implements _ClassDetails {
  const _$_ClassDetails(
      {this.status,
      this.batchId,
      this.batchName,
      this.branchName,
      this.startTime,
      this.endTime,
      this.timezone,
      final List<String>? trainers,
      this.rescheduled,
      this.classLink})
      : _trainers = trainers;

  factory _$_ClassDetails.fromJson(Map<String, dynamic> json) =>
      _$$_ClassDetailsFromJson(json);

  @override
  final String? status;
  @override
  final int? batchId;
  @override
  final String? batchName;
  @override
  final String? branchName;
  @override
  final String? startTime;
  @override
  final String? endTime;
  @override
  final String? timezone;
  final List<String>? _trainers;
  @override
  List<String>? get trainers {
    final value = _trainers;
    if (value == null) return null;
    if (_trainers is EqualUnmodifiableListView) return _trainers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? rescheduled;
  @override
  final String? classLink;

  @override
  String toString() {
    return 'ClassDetails(status: $status, batchId: $batchId, batchName: $batchName, branchName: $branchName, startTime: $startTime, endTime: $endTime, timezone: $timezone, trainers: $trainers, rescheduled: $rescheduled, classLink: $classLink)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ClassDetails &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.batchId, batchId) || other.batchId == batchId) &&
            (identical(other.batchName, batchName) ||
                other.batchName == batchName) &&
            (identical(other.branchName, branchName) ||
                other.branchName == branchName) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            const DeepCollectionEquality().equals(other._trainers, _trainers) &&
            (identical(other.rescheduled, rescheduled) ||
                other.rescheduled == rescheduled) &&
            (identical(other.classLink, classLink) ||
                other.classLink == classLink));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      batchId,
      batchName,
      branchName,
      startTime,
      endTime,
      timezone,
      const DeepCollectionEquality().hash(_trainers),
      rescheduled,
      classLink);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ClassDetailsCopyWith<_$_ClassDetails> get copyWith =>
      __$$_ClassDetailsCopyWithImpl<_$_ClassDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ClassDetailsToJson(
      this,
    );
  }
}

abstract class _ClassDetails implements ClassDetails {
  const factory _ClassDetails(
      {final String? status,
      final int? batchId,
      final String? batchName,
      final String? branchName,
      final String? startTime,
      final String? endTime,
      final String? timezone,
      final List<String>? trainers,
      final bool? rescheduled,
      final String? classLink}) = _$_ClassDetails;

  factory _ClassDetails.fromJson(Map<String, dynamic> json) =
      _$_ClassDetails.fromJson;

  @override
  String? get status;
  @override
  int? get batchId;
  @override
  String? get batchName;
  @override
  String? get branchName;
  @override
  String? get startTime;
  @override
  String? get endTime;
  @override
  String? get timezone;
  @override
  List<String>? get trainers;
  @override
  bool? get rescheduled;
  @override
  String? get classLink;
  @override
  @JsonKey(ignore: true)
  _$$_ClassDetailsCopyWith<_$_ClassDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
