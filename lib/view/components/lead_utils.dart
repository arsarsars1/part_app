import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:part_app/model/data_model/assignable_model.dart';
import 'package:part_app/model/data_model/drop_down_item.dart';
import 'package:part_app/model/data_model/lead_statuses.dart';
import 'package:part_app/view/components/assignable_picker.dart';

class LeadUtils {
  getAssignable(GlobalKey<ScaffoldState> scaffoldKey,
      {ValueChanged<AssignableTrainer?>? onSelect, int? trainerId}) async {
    scaffoldKey.currentState?.showBottomSheet(
      elevation: 10,
      backgroundColor: Colors.transparent,
      (context) => AssignablePicker(
        trainerId: trainerId,
        multiPicker: false,
        selectedTrainers: const [],
        onSave: (List<AssignableTrainer?> value) {},
        onSelect: onSelect,
      ),
    );
  }

  String convertTo24HourFormat(String time) {
    if (time.isNotEmpty) {
      try {
        final DateFormat inputFormat12Hour = DateFormat.jm();
        final DateTime dateTime = inputFormat12Hour.parse(time);
        final DateFormat outputFormat = DateFormat('HH:mm');
        return outputFormat.format(dateTime);
      } catch (e) {
        try {
          final DateFormat inputFormat24Hour = DateFormat('HH:mm');
          final DateTime dateTime = inputFormat24Hour.parse(time);
          return inputFormat24Hour.format(dateTime);
        } catch (e) {
          throw FormatException("Invalid time format: $time");
        }
      }
    } else {
      return "";
    }
  }

  String convertDateString(String dateString) {
    if (dateString.isNotEmpty) {
      DateTime dateTime;

      try {
        DateFormat inputFormat1 = DateFormat('d MMMM, yyyy');
        dateTime = inputFormat1.parse(dateString);
      } catch (e) {
        DateFormat inputFormat2 = DateFormat('yyyy-MM-dd');
        dateTime = inputFormat2.parse(dateString);
      }

      // Define the output format
      DateFormat outputFormat = DateFormat('yyyy-MM-dd');

      // Convert the DateTime object to the desired output format
      String formattedDate = outputFormat.format(dateTime);

      return formattedDate;
    } else {
      return "";
    }
  }

  DropDownItem? getSelectedItem(String? leadStatus, List<LeadStatus?>? status) {
    if (leadStatus == null || status == null) {
      return null;
    }
    LeadStatus? leadStats =
        status.where((e) => e?.leadStatus == leadStatus).first;
    return DropDownItem(
        id: leadStats?.slug, title: leadStats?.leadStatus, item: leadStats);
  }
}
