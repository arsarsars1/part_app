import 'package:part_app/model/data_model/batch_response.dart';
import 'package:part_app/model/data_model/students_response.dart';

class StudentModel {
  final int? id;
  final String? countryCode;
  final String? mobileNo;
  final int? isActive;
  final String? mobileUnique;
  final int? detailId;
  final PivotClass? pivot;
  final String? name;
  final String? parentName;
  final int? userId;
  final int? academyId;
  final String? gender;
  final DateTime? dob;
  final DateTime? doj;
  final String? email;
  final String? whatsappNo;
  final String? address;
  final String? profilePic;
  final int? studentActive;

  StudentModel({
    this.id,
    this.countryCode,
    this.mobileNo,
    this.isActive,
    this.mobileUnique,
    this.detailId,
    this.pivot,
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
    this.studentActive,
  });

  factory StudentModel.fromEntity(Student student, StudentDetail detail) {
    return StudentModel(
      id: student.id,
      countryCode: student.countryCode,
      mobileNo: student.mobileNo,
      isActive: student.isActive,
      detailId: detail.id,
      name: detail.name,
      parentName: detail.parentName,
      userId: detail.userId,
      academyId: detail.academyId,
      pivot: student.studentDetail?[0].pivot,
      gender: detail.gender,
      dob: detail.dob,
      doj: detail.doj,
      email: detail.email,
      whatsappNo: detail.whatsappNo,
      address: detail.address,
      profilePic: detail.profilePic,
      studentActive: detail.isActive,
    );
  }
}
