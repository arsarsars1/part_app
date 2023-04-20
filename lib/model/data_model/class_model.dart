import 'package:part_app/model/data_model/class_response.dart';

class ClassModel {
  final String startTime;
  final String endTime;
  final bool rescheduled;
  final DateTime oldDate;

  ClassModel({
    required this.startTime,
    required this.endTime,
    required this.rescheduled,
    required this.oldDate,
  });

  factory ClassModel.fromEntity(Class classes) {
    return ClassModel(
      startTime: classes.startTime ?? '',
      endTime: classes.endTime ?? '',
      rescheduled: classes.rescheduled ?? false,
      oldDate: classes.oldDate ?? DateTime.now(),
    );
  }
}
