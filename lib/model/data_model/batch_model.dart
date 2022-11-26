import 'package:part_app/model/data_model/batch_response.dart';
import 'package:part_app/model/data_model/branch_response.dart';
import 'package:part_app/model/data_model/trainer_response.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/constants/default_values.dart';

class BatchModel {
  final String name;
  final String trainersString;
  final String branchName;
  final int id;
  final List<String> days;
  final String courseName;
  final String subjectName;
  final int? admissionFee;
  final int? fee;
  final List<Trainer>? trainers;

  BatchModel({
    required this.name,
    required this.trainersString,
    required this.branchName,
    required this.id,
    required this.days,
    required this.courseName,
    required this.subjectName,
    this.admissionFee,
    this.fee,
    this.trainers,
  });

  factory BatchModel.fromEntity(Batch batch) {
    String trainer = '';
    List<String>? days = [];
    batch.trainers?.forEach((element) {
      trainer += '${element.name}, ';
    });
    days = batch.batchDetail?.map((e) {
      String day = DefaultValues.defaultTrainingDays[e.day];
      return '${day.substring(0, 3)} ${e.startTime} - ${e.endTime}';
    }).toList();
    return BatchModel(
      name: batch.batchName ?? '',
      trainersString: trainer.trimRight().removeLast(),
      branchName: batch.branch?.branchName ?? 'NA',
      id: batch.id ?? 0,
      days: days ?? [],
      courseName: batch.course?.courseName ?? 'NA',
      subjectName: batch.subject?.subjectName ?? 'NA',
      admissionFee: batch.admissionFees,
      fee: batch.feeAmount,
      trainers: batch.trainers,
    );
  }
}
