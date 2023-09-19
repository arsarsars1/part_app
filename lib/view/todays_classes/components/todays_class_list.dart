import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:part_app/view/constants/constant.dart';
import 'package:part_app/view_model/trainer/trainer_cubit.dart';
import '../../../model/data_model/classes_today.dart';

class TodaysClassList extends StatefulWidget {
  final List<Class> classesList;

  const TodaysClassList({Key? key, required this.classesList})
      : super(key: key);

  @override
  State<TodaysClassList> createState() => _TodaysClassListState();
}

class _TodaysClassListState extends State<TodaysClassList> {
  late ScrollController scrollController = ScrollController();

  @override
  void initState() {
    // Pagination listener
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        context.read<TrainerCubit>().getRestOfTheTrainers(nextPage: true);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String classStatus = "";
    Color color;

    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.classesList.length,
      controller: scrollController,
      itemBuilder: (context, index) {
        Class classItem = widget.classesList[index];
        String? startTime = classItem.startTime;
        String? endTime = classItem.endTime;
        String endTime12Hour = convertTo12HourFormat(endTime!);
        String startTime12Hour = convertTo12HourFormat(startTime!);
        if (classItem.conducted == true) {
          classStatus = "Completed";
          color = AppColors.green;
        } else {
          bool isAfterNow = isTimeAfterNow(endTime12Hour);
          if (isAfterNow) {
            classStatus = "Upnext";
            color = AppColors.defaultBlue;
          } else {
            classStatus = "Attendance Pending";
            color = AppColors.primaryColor;
          }
        }

        return InkWell(
          onTap: () {
            // call back to parent widget
            // widget.onSelect();
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(vertical: 8.w, horizontal: 16.h),
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 16.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColors.liteDark,
            ),
            child: Column(
              children: [
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    '${classItem.batchName}',
                    maxLines: 1,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 16,
                        ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    '${classItem.branchName}',
                    maxLines: 1,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontSize: 12),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        '${classItem.trainers}',
                        maxLines: 1,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontSize: 14,
                              color: AppColors.primaryColor,
                            ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      classItem.classLink == "" ? '' : 'Online Class',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.yellow,
                            fontSize: 14,
                          ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        '$startTime12Hour - $endTime12Hour',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      classStatus,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: color,
                            fontSize: 16,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  bool isTimeAfterNow(String timeStr) {
    final timeFormat = DateFormat('hh:mm a');
    final currentTime = DateTime.now();
    final timeObj = timeFormat.parse(timeStr);
    final updatedCurrentTime = DateTime(
      currentTime.year,
      currentTime.month,
      currentTime.day,
      timeObj.hour,
      timeObj.minute,
    );
    return updatedCurrentTime.isAfter(currentTime);
  }

  String convertTo12HourFormat(String timeStr) {
    final timeObj = DateFormat('HH:mm').parse(timeStr);
    final time12Hour = DateFormat('hh:mm a').format(timeObj);
    return time12Hour;
  }
}
