import 'package:flutter/material.dart';
import 'package:part_app/model/data_model/trainer_response.dart';
import 'package:part_app/view/components/assignable_picker.dart';

class LeadUtils {
  getAssignable(GlobalKey<ScaffoldState> scaffoldKey,
      {ValueChanged<Trainer?>? onSelect, int? trainerId}) async {
    scaffoldKey.currentState?.showBottomSheet(
      elevation: 10,
      backgroundColor: Colors.transparent,
      (context) => AssignablePicker(
        trainerId: trainerId,
        multiPicker: false,
        selectedTrainers: const [],
        onSave: (List<Trainer?> value) {},
        onSelect: onSelect,
      ),
    );
  }
}
