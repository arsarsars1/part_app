import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
// import 'package:month_year_picker/month_year_picker.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/components/common_field.dart';
import 'package:part_app/view/constants/constant.dart';

class ScheduleField extends StatefulWidget {
  final String title;
  final bool time;
  final bool dateMonth;
  final String? hint;
  final String? initialValue;
  final ValueChanged<String>? onSelect;
  final ValueChanged<DateTime>? onDateSelect;
  final bool onlyMonth;
  final double padding;
  final double margin;

  const ScheduleField({
    Key? key,
    required this.title,
    this.onSelect,
    this.hint,
    this.initialValue,
    this.dateMonth = false,
    required this.time,
    this.onDateSelect,
    this.onlyMonth = false,
    this.padding = 0.0,
    this.margin = 0.0,
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
    if (widget.initialValue != null) {
      controller.text = widget.initialValue!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CommonField(
      contentPadding: EdgeInsets.symmetric(horizontal: widget.padding),
      disabled: true,
      onTap: () async {
        if (widget.time) {
          timePicker().then((value) {
            controller.text = value ?? '';
          });
        } else {
          if (widget.onlyMonth) {
            await DatePicker.showSimpleDatePicker(
              context,
              initialDate: DateTime(DateTime.now().year),
              firstDate: DateTime(DateTime.now().year - 25),
              lastDate: DateTime(DateTime.now().year + 25),
              dateFormat: "MMMM-yyyy",
              locale: DateTimePickerLocale.en_us,
              backgroundColor: AppColors.grey800,
              textColor: AppColors.textColor,
              looping: false,
            ).then((value) {
              if (value == null) {
                return;
              }
              if (widget.onSelect != null) {
                widget.onSelect!(value.toServerYMD());
              }

              if (widget.onDateSelect != null) {
                widget.onDateSelect!(value);
              }
              controller.text =
                  widget.dateMonth ? value.toMMMMYYYY() : value.toDateString();
            });

            // monthYearPicker().then((value) {
            //
            // });
          } else {
            datePicker().then((value) {
              controller.text = value ?? '';
            });
          }
        }
      },
      controller: controller,
      padding: EdgeInsets.symmetric(horizontal: widget.margin),
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
        widget.onSelect!(formattedTimeOfDay);
      }
      return formattedTimeOfDay;
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
      firstDate: DateTime.now(),
      lastDate: DateTime(
        DateTime.now().year + 100,
      ),
    );

    if (widget.onSelect != null && dateTime != null) {
      widget.onSelect!(dateTime.toServerYMD());
    }
    return widget.dateMonth ? dateTime?.toMMMMYYYY() : dateTime?.toDateString();
  }

  // Future<String?> monthYearPicker() async {
  //   DateTime? dateTime = await showMonthYearPicker(
  //     builder: (context, child) {
  //       return Theme(
  //         data: ThemeData.dark().copyWith(
  //           colorScheme: ColorScheme.dark(
  //             onPrimary: Colors.white,
  //             onSurface: Colors.white, // default text color
  //             primary: AppColors.primaryColor, // circle color
  //           ),
  //           dialogBackgroundColor: AppColors.liteDark,
  //           textButtonTheme: TextButtonThemeData(
  //             style: TextButton.styleFrom(
  //               textStyle: TextStyle(
  //                 color: AppColors.primaryColor,
  //                 fontWeight: FontWeight.normal,
  //                 fontSize: 12,
  //               ),
  //               shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(5),
  //               ),
  //             ),
  //           ),
  //         ),
  //         child: child!,
  //       );
  //     },
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(
  //       DateTime.now().year - 1,
  //     ),
  //     lastDate: DateTime(
  //       DateTime.now().year + 2,
  //     ),
  //   );

  //   if (widget.onSelect != null && dateTime != null) {
  //     widget.onSelect!(dateTime.toServerYMD());
  //   }

  //   if (widget.onDateSelect != null && dateTime != null) {
  //     widget.onDateSelect!(dateTime);
  //   }
  //   return widget.dateMonth ? dateTime?.toMMMMYYYY() : dateTime?.toDateString();
  // }
}
