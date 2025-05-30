import 'package:flutter/material.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/attendance/trainer_app_attendance_add.dart';
import 'package:part_app/view/attendance/trainer_app_attendance_update.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view_model/cubits.dart';

import '../../../model/data_model/event_model.dart';
import '../../../view_model/attendance/attendance_cubit.dart';

class ManagerAppAttendanceClassPicker extends StatefulWidget {
  final DateTime date;
  final List<EventModel>? eventList;

  const ManagerAppAttendanceClassPicker({
    super.key,
    required this.date,
    this.eventList,
  });

  @override
  State<ManagerAppAttendanceClassPicker> createState() =>
      _ManagerAppAttendanceClassPickerState();
}

class _ManagerAppAttendanceClassPickerState
    extends State<ManagerAppAttendanceClassPicker> {
  @override
  Widget build(BuildContext context) {
    AttendanceCubit cubit = context.read<AttendanceCubit>();
    final classList = cubit.attendenceClasses
        ?.where(
          (element) =>
              DateTime(
                  element.date!.year, element.date!.month, element.date!.day) ==
              DateTime(widget.date.year, widget.date.month, widget.date.day),
        )
        .toList();

    return Column(
      children: [
        Expanded(
          child: Container(
            color: Colors.black54,
          ),
        ),
        Container(
          height: 500.h,
          decoration: BoxDecoration(
            color: AppColors.liteDark,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(16),
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.65,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Select A Class',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 20.w,
                      height: 20.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black54,
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                      child: const Icon(
                        Icons.close,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade800,
                              borderRadius: BorderRadius.circular(10)),
                          child: RadioListTile<int>(
                              value: index,
                              subtitle: Text(
                                "${classList?[index].startTime?.toAmPM()} - ${classList?[index].endTime?.toAmPM()}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      fontSize: 12.sp,
                                      color: AppColors.grey100,
                                    ),
                              ),
                              title: Text(
                                "${context.read<BatchCubit>().batchModel?.courseName}, ${context.read<BatchCubit>().batchModel?.subjectName}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      fontSize: 12.sp,
                                      color: AppColors.primaryColor,
                                    ),
                              ),
                              groupValue: cubit.dropdownSelectedIndex,
                              onChanged: (value) {
                                setState(() {
                                  cubit.dropdownSelectedIndex = value!;
                                });
                              }),
                        ),
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                    itemCount: widget.eventList?.length ?? 0),
              ),
              Button(
                  onTap: () {
                    cubit.selectedClass =
                        classList?[cubit.dropdownSelectedIndex];
                    if (widget.eventList == null) {
                      Navigator.pop(context);
                      Navigator.pushNamed(
                          context, TrainerAppAttendanceAdd.route);
                    } else {
                      Navigator.pop(context);
                      Navigator.pushNamed(
                        context,
                        widget.eventList![cubit.dropdownSelectedIndex].flag == 0
                            ? TrainerAppAttendanceAdd.route
                            : TrainerAppAttendanceUpdate.route,
                      );
                    }
                  },
                  height: UIConstants.buttonHeight,
                  title: 'Continue')
            ],
          ),
        ),
      ],
    );
  }
}
