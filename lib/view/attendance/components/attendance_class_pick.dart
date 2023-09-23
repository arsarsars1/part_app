import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/constant.dart';
import 'package:part_app/view_model/cubits.dart';
import 'package:part_app/model/extensions.dart';

import '../../../view_model/attendance/attendance_cubit.dart';
import '../attendance_add.dart';
import '../attendance_update.dart';

class AttendanceClassPicker extends StatefulWidget {
  final DateTime date;
  final List<Event>? eventList;

  const AttendanceClassPicker({
    Key? key,
    required this.date,
    this.eventList,
  }) : super(key: key);

  @override
  State<AttendanceClassPicker> createState() => _AttendanceClassPickerState();
}

class _AttendanceClassPickerState extends State<AttendanceClassPicker> {
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
                    itemCount: 2),
              ),
              Button(
                  onTap: () {
                    
                    cubit.selectedClass =
                        classList?[cubit.dropdownSelectedIndex];
                    if (widget.eventList == null) {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, AttendanceAdd.route);
                    } else {
                      Navigator.pop(context);
                      Navigator.pushNamed(
                        context,
                        widget.eventList![cubit.dropdownSelectedIndex].flag == 0
                            ? AttendanceAdd.route
                            : AttendanceUpdate.route,
                      );
                    }
                  },
                  title: 'Continue')
            ],
          ),
        ),
      ],
    );
  }
}
