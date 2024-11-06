import 'package:part_app/constants/constant.dart';
import 'package:part_app/model/data_model/batch_response.dart';
import 'package:part_app/model/data_model/models.dart';
import 'package:part_app/model/extensions.dart';

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
  final String? shareToken;
  final int? studentCount;
  final PivotClass? pivot;
  final List<Trainer>? trainers;
  final List<TrainerModel>? trainersList;
  final List<BatchDetail>? batchDetail;
  final bool active;
  final String sharedToken;

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
    this.shareToken,
    this.studentCount,
    this.pivot,
    this.trainers,
    this.batchDetail,
    this.trainersList,
    required this.active,
    required this.sharedToken,
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

    Map<String, int> dayOrder = {
      'Mon': 1,
      'Tue': 2,
      'Wed': 3,
      'Thu': 4,
      'Fri': 5,
      'Sat': 6,
      'Sun': 7,
    };

    days = batch.batchDetail?.map((e) {
      String day = DefaultValues.defaultTrainingDays[e.day];
      return '${day.substring(0, 3)} ${e.startTime?.toAmPM()} - ${e.endTime?.toAmPM()}';
    }).toList();

    if ((days ?? []).length >= 2) {
      days?.sort((a, b) {
        // Extract the day part
        String dayA = a.split(' ')[0];
        String dayB = b.split(' ')[0];

        // Get the day order, using a default value if not found
        int orderA = dayOrder[dayA] ?? 0;
        int orderB = dayOrder[dayB] ?? 0;

        return orderA.compareTo(orderB);
      });
    }

    return BatchModel(
      branchId: batch.branchId,
      name: batch.batchName ?? '',
      trainersString: trainer,
      branchName: batch.branch?.branchName ?? 'Branch Not Allocated',
      id: batch.id ?? 0,
      days: days ?? [],
      courseName: batch.course?.courseName ?? 'NA',
      subjectName: batch.subject?.subjectName ?? 'NA',
      admissionFee: batch.admissionFees,
      fee: batch.feeAmount,
      shareToken: batch.shareToken,
      batchDetail: batch.batchDetail,
      studentCount: batch.activeStudentsCount,
      trainers: batch.trainers,
      pivot: batch.pivot,
      trainersList:
          batch.trainers?.map((e) => TrainerModel.fromEntity(e)).toList(),
      active: batch.isActive == 1,
      sharedToken: batch.shareToken ?? '',
    );
  }
}

// class Pivot {
//   Pivot({
//     this.studentDetailId,
//     this.batchId,
//     this.noOfClasses,
//     this.feeType,
//     this.feeAmount,
//     this.admissionFees,
//     this.cycle,
//     this.doj,
//     this.createdAt,
//     this.updatedAt,
//   });

//   int? studentDetailId;
//   int? batchId;
//   dynamic noOfClasses;
//   String? feeType;
//   int? feeAmount;
//   int? admissionFees;
//   int? cycle;
//   DateTime? doj;
//   DateTime? createdAt;
//   DateTime? updatedAt;

//   factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
//         studentDetailId: json["student_detail_id"],
//         batchId: json["batch_id"],
//         noOfClasses: json["no_of_classes"],
//         feeType: json["fee_type"],
//         feeAmount: json["fee_amount"],
//         admissionFees: json["admission_fees"],
//         cycle: json["cycle"],
//         doj: json["doj"] == null ? null : DateTime.parse(json["doj"]),
//         createdAt: json["created_at"] == null
//             ? null
//             : DateTime.parse(json["created_at"]),
//         updatedAt: json["updated_at"] == null
//             ? null
//             : DateTime.parse(json["updated_at"]),
//       );
// }
