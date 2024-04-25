// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'student_request_for_student.freezed.dart';
part 'student_request_for_student.g.dart';

@freezed
abstract class StudentRequestForStudent with _$StudentRequestForStudent {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory StudentRequestForStudent({
    String? name,
    String? mobileNo,
    int? countryCode,
    String? gender,
    String? dob,
    String? whatsappNo,
    String? email,
    String? address,
    int? isParent,
    String? parentName,
  }) = _StudentRequestForStudent;

  factory StudentRequestForStudent.fromJson(Map<String, dynamic> json) =>
      _$StudentRequestForStudentFromJson(json);
}
