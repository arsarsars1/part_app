import 'package:part_app/model/data_model/class_response.dart';

class ClassModel {
  final String startTime;
  final String endTime;
  final bool rescheduled;
  final DateTime oldDate;
  final int batchId;
  final String batchName;
  final int activeStudentCount;
  final int inactiveStudentCount;
  final String courseName;
  final String subjectName;
  final String branchName;
  final String trainers;

  ClassModel({
    required this.startTime,
    required this.endTime,
    required this.rescheduled,
    required this.oldDate,
    required this.batchId,
    required this.batchName,
    required this.activeStudentCount,
    required this.inactiveStudentCount,
    required this.courseName,
    required this.subjectName,
    required this.branchName,
    required this.trainers,
  });

  factory ClassModel.fromEntity(Class classes) {
    return ClassModel(
      startTime: classes.startTime ?? '',
      endTime: classes.endTime ?? '',
      rescheduled: classes.rescheduled ?? false,
      oldDate: classes.oldDate ?? DateTime.now(),
      batchId: classes.batchId ?? 0,
      batchName: classes.batchName ?? 'No batch name',
      activeStudentCount: classes.activeStudentsCount ?? 0,
      inactiveStudentCount: classes.inactiveStudentsCount ?? 0,
      courseName: classes.courseName ?? 'No course name',
      subjectName: classes.subjectName ?? 'No subject name',
      branchName: classes.branchName ?? 'No branch name',
      trainers: classes.trainers == ""
          ? 'No trainer alocated'
          : classes.trainers ?? "",
    );
  }
}
