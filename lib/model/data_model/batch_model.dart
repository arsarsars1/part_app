import 'package:part_app/model/data_model/batch_response.dart';
import 'package:part_app/model/data_model/trainer_response.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/constants/default_values.dart';

class BatchModel {
  final String name;
  final String trainersString;
  final String branchName;
  final int id;
  final int? branchId;
  final List<String> days;
  final String courseName;
  final String subjectName;
  final int? admissionFee;
  final int? fee;
  final int? studentCount;
  final List<Trainer>? trainers;
  final bool active;

  BatchModel({
    required this.name,
    required this.trainersString,
    required this.branchName,
    required this.id,
    required this.days,
    required this.courseName,
    required this.subjectName,
    this.branchId,
    this.admissionFee,
    this.fee,
    this.studentCount,
    this.trainers,
    required this.active,
  });

  factory BatchModel.fromEntity(Batch batch) {
    String trainer = '';
    List<String>? days = [];
    if (batch.trainers != null && batch.trainers!.isNotEmpty) {
      batch.trainers?.forEach((element) {
        trainer += '${element.name}, ';
      });
      trainer = trainer.trimRight().removeLast();
    } else {
      trainer = 'No Trainer Allocated';
    }

    days = batch.batchDetail?.map((e) {
      String day = DefaultValues.defaultTrainingDays[e.day];
      return '${day.substring(0, 3)} ${e.startTime?.toAmPM()} - ${e.endTime?.toAmPM()}';
    }).toList();

    return BatchModel(
      branchId: batch.branch?.id,
      name: batch.batchName ?? '',
      trainersString: trainer,
      branchName: batch.branch?.branchName ?? 'Branch Not Allocated',
      id: batch.id ?? 0,
      days: days ?? [],
      courseName: batch.course?.courseName ?? 'NA',
      subjectName: batch.subject?.subjectName ?? 'NA',
      admissionFee: batch.admissionFees,
      fee: batch.feeAmount,
      studentCount: batch.activeStudentsCount,
      trainers: batch.trainers,
      active: batch.isActive == 1,
    );
  }
}
