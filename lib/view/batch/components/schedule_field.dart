import 'package:flutter/material.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/components/common_field.dart';
import 'package:part_app/view/constants/constant.dart';

class ScheduleField extends StatefulWidget {
  final String title;
  final bool time;
  final bool dateMonth;
  final String? hint;
  final ValueChanged<String>? onSelect;
  final ValueChanged<DateTime>? onDateSelect;

  const ScheduleField({
    Key? key,
    required this.title,
    this.onSelect,
    this.hint,
    this.dateMonth = false,
    required this.time,
    this.onDateSelect,
  }) : super(key: key);

  @override
  State<ScheduleField> createState() => _ScheduleFieldState();
}

class _ScheduleFieldState extends State<ScheduleField> {
  TextEditingController controller = TextEditingController();
  String? hint = '';

  @override
  void initState() {
    super.initState();
    hint = widget.time ? 'hh:mm' : 'dd/mm/yyyy';
  }

  @override
  Widget build(BuildContext context) {
    return CommonField(
      disabled: true,
      onTap: () {
        if (widget.time) {
          timePicker().then((value) {
            controller.text = value ?? '';
          });
        } else {
          datePicker().then((value) {
            controller.text = value ?? '';
          });
        }
      },
      controller: controller,
      padding: const EdgeInsets.only(left: 10),
      title: widget.title,
      hint: widget.hint ?? hint,
      validator: (value) {
        if (value.toString().isEmpty) {
          return 'Please enter ${widget.title}';
        } else {
          return null;
        }
      },
      suffixIcon: widget.time
          ? Icon(
              Icons.access_time,
              color: AppColors.hintColor,
              size: 22,
            )
          : Icon(
              Icons.calendar_month_rounded,
              color: AppColors.hintColor,
              size: 22,
            ),
      onChange: (value) {},
    );
  }

  Future<String?> timePicker() async {
    TimeOfDay? time = await showTimePicker(
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              onPrimary: Colors.white,
              onSurface: Colors.white, // default text color
              primary: AppColors.primaryColor, // circle color
            ),
            dialogBackgroundColor: AppColors.liteDark,
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                textStyle: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          child: child!,
        );
      },
      context: context,
      initialTime: const TimeOfDay(hour: 09, minute: 00),
    );

    if (time != null) {
      final localizations = MaterialLocalizations.of(context);
      final formattedTimeOfDay = localizations.formatTimeOfDay(
        time,
        alwaysUse24HourFormat: true,
      );
      if (widget.onSelect != null) {
        widget.onSelect!('$formattedTimeOfDay:00');
      }
      return '$formattedTimeOfDay:00';
    }
    return null;
  }

  // method to get the date for [ dob ]
  Future<String?> datePicker() async {
    DateTime? dateTime = await showDatePicker(
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              onPrimary: Colors.white,
              onSurface: Colors.white, // default text color
              primary: AppColors.primaryColor, // circle color
            ),
            dialogBackgroundColor: AppColors.liteDark,
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                textStyle: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          child: child!,
        );
      },
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(
        DateTime.now().year - 2,
      ),
      lastDate: DateTime(
        DateTime.now().year + 100,
      ),
    );

    if (widget.onSelect != null && dateTime != null) {
      widget.onSelect!(dateTime.toServerYMD());
    }
    return widget.dateMonth ? dateTime?.toMMMMYYYY() : dateTime?.toDateString();
  }
}
