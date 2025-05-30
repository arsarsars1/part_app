// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/model/data_model/batch_request.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view_model/batch/batch_cubit.dart';

import '../../../model/data_base/data_base.dart';

class TrainingDays extends StatelessWidget {
  final bool edit;

  const TrainingDays({super.key, this.edit = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Select Training Days *'),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 48,
            child: BlocBuilder<BatchCubit, BatchState>(
              builder: (context, state) {
                var cubit = context.read<BatchCubit>();
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: DefaultValues.defaultTrainingDays.length,
                  itemBuilder: (context, index) {
                    MapEntry<int, dynamic> data =
                        DefaultValues.defaultTrainingDays.entries.elementAt(
                      index,
                    );

                    bool selected = cubit.days
                        .where((element) => element.day == data.key)
                        .isNotEmpty;

                    return GestureDetector(
                      onTap: () async {
                        FocusManager.instance.primaryFocus?.unfocus();
                        Days? days;
                        var items = cubit.days
                            .where((element) => element.day == data.key)
                            .toList();
                        if (items.isNotEmpty) {
                          days = items[0];
                        }

                        if (edit && days != null) {
                          String day =
                              DefaultValues.defaultTrainingDays[days.day];

                          CommonDialog(
                            subColor: AppColors.primaryColor,
                            context: context,
                            message:
                                'Do you want to continue with deactivation of class on',
                            subMessage:
                                '$day ${days.startTime?.toAmPM()}-${days.endTime?.toAmPM()}?',
                            buttonText: 'Yes',
                            onTap: () {
                              if (days != null) {
                                Navigator.pop(context);
                                context.read<BatchCubit>().removeDay(days);
                              }
                            },
                          ).show();
                          return;
                        }

                        // Database database = Database();
                        // String? startTime =
                        //     await database.getPreviousClassStartTime();
                        // String? endTime =
                        //     await database.getPreviousClassEndTime();

                        showDialog(
                          context: context,
                          builder: (context) {
                            return ClassTime(
                              // start: startTime ?? days?.startTime,
                              // end: endTime ?? days?.endTime,
                              start: days?.startTime,
                              end: days?.endTime,
                              day: data.key,
                              startTime: (TimeOfDay value) {},
                              endTime: (TimeOfDay value) {},
                            );
                          },
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: !selected
                              ? AppColors.liteDark
                              : AppColors.primaryColor,
                        ),
                        height: 36,
                        width: 36,
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        alignment: Alignment.center,
                        child: Text(
                          data.value.substring(0, 1),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ClassTime extends StatefulWidget {
  final int day;
  final String? start;
  final String? end;
  final ValueChanged<TimeOfDay> startTime;
  final ValueChanged<TimeOfDay> endTime;

  const ClassTime(
      {super.key,
      required this.startTime,
      required this.endTime,
      required this.day,
      this.start,
      this.end});

  @override
  State<ClassTime> createState() => _ClassTimeState();
}

class _ClassTimeState extends State<ClassTime> {
  String? startTime;
  String? endTime;

  TimeOfDay? startTimeOfDay;
  TimeOfDay? endTimeOfDay;

  @override
  void initState() {
    startTime = widget.start;
    endTime = widget.end;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.liteDark,
      contentPadding: EdgeInsets.zero,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              top: 16,
              right: 16,
              bottom: 8,
            ),
            child: Text(
              'Add Class Time',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.white54,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Enter your start time and end time for the class',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.white54,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      timePicker(true).then((value) {
                        setState(() {
                          startTime = value;
                          Database().setPreviousClassStartTime(value!);
                        });
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          width: 0.5,
                          color: Colors.white54,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            startTime == null ? 'Start Time' : '$startTime',
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: Colors.white54,
                                    ),
                          ),
                          const Icon(
                            Icons.access_time,
                            color: Colors.white54,
                            size: 18,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if (startTime == null) {
                        Alert(context).show(
                          message: 'Please select start time.',
                        );
                        return;
                      }
                      timePicker(false).then((value) {
                        if (value != null) {
                          setState(() {
                            endTime = value;
                            Database().setPreviousClassEndTime(value);
                          });
                        }
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          width: 0.5,
                          color: Colors.white54,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            endTime == null ? 'End Time' : '$endTime',
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: Colors.white54,
                                    ),
                          ),
                          const Icon(
                            Icons.access_time,
                            color: Colors.white54,
                            size: 18,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.white54,
            height: 0.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: SizedBox(
                    height: 45,
                    child: Center(
                      child: Text(
                        'Cancel',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Colors.white54,
                            ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: 0.5,
                color: Colors.white54,
                height: 45,
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    if (startTime != null && endTime != null) {
                      Navigator.pop(context);
                      Days day = Days(
                        day: widget.day,
                        startTime: startTime,
                        endTime: endTime,
                      );
                      context.read<BatchCubit>().addDay(day);
                    }
                  },
                  child: SizedBox(
                    height: 45,
                    child: Center(
                      child: Text(
                        'Add',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Colors.white54,
                            ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<String?> timePicker(bool start) async {
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
      if (start) {
        startTimeOfDay = time;
      } else {
        endTimeOfDay = time;
      }
      final localizations = MaterialLocalizations.of(context);
      final formattedTimeOfDay = localizations.formatTimeOfDay(
        time,
        alwaysUse24HourFormat: true,
      );
      if (startTime != null && !start) {
        final tempFormat = localizations.formatTimeOfDay(
          time,
          alwaysUse24HourFormat: false,
        );
        final tempFormatStart = localizations.formatTimeOfDay(
          startTimeOfDay ??
              TimeOfDay(
                hour: int.parse(startTime!.substring(0, 2)),
                minute: int.parse(startTime!.substring(3, 5)),
              ),
          alwaysUse24HourFormat: false,
        );

        if (tempFormat.toDateTime().isBefore(tempFormatStart.toDateTime())) {
          Alert(context).show(
            message: 'Selected end time is before start time.',
          );
          return null;
        }
      }
      return formattedTimeOfDay;
    }
    return null;
  }
}
