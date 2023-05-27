import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/constant.dart';
import 'package:part_app/view_model/attendance/attendance_cubit.dart';
import 'package:part_app/view_model/cubits.dart';

class AttendanceCalenderView extends StatefulWidget {
  static const route = '/batch-calender-view';

  const AttendanceCalenderView({Key? key}) : super(key: key);

  @override
  State<AttendanceCalenderView> createState() => _AttendanceCalenderViewState();
}

class _AttendanceCalenderViewState extends State<AttendanceCalenderView> {
  bool isActive = true;
  ScrollController scrollController = ScrollController();
  BatchModel? batch;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final EventList<Event> _markedDateMap = EventList<Event>(events: {});

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      AttendanceCubit cubit = context.read<AttendanceCubit>();
      await cubit.getClassesOfMonth(batchId: cubit.id, date: DateTime.now());
      _markedDateMap.clear();
      log("The lenght is ${cubit.attendenceClasses?.length}");
      for (var element in cubit.attendenceClasses ?? []) {
        _markedDateMap.add(
          element.date ?? DateTime.now(),
          Event(
            date: element.date ?? DateTime.now(),
            title: 'Event 1',
            dot: Container(
              margin: const EdgeInsets.symmetric(horizontal: 1.0),
              color: Colors.white,
              height: 5.0,
              width: 5.0,
            ),
          ),
        );
        setState(() {});
      }
      // context.read<AttendanceCubit>().attendenceClasses?.forEach((element) {
      //   _markedDateMap.add(
      //     element.date ?? DateTime.now(),
      //     Event(
      //       date: element.date ?? DateTime.now(),
      //       title: 'Event 1',
      //       dot: Container(
      //         margin: const EdgeInsets.symmetric(horizontal: 1.0),
      //         color: Colors.white,
      //         height: 5.0,
      //         width: 5.0,
      //       ),
      //     ),
      //   );
      // });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<BatchCubit>().getBatchesByStatus(
              branchId: context.read<BatchCubit>().batchModel?.branchId,
              status: context.read<BatchCubit>().tempStatus,
              clean: true,
            );
        Navigator.pop(context);
        return true;
      },
      child: Scaffold(
        key: scaffoldKey,
        appBar: const CommonBar(
          title: 'Class Attendence',
        ),
        body: Column(
          children: [
            Expanded(
              child: BlocConsumer<BatchCubit, BatchState>(
                listener: (context, state) {},
                builder: (context, state) {
                  batch = context.read<BatchCubit>().batchModel;
                  if (state is FetchingBatch || state is UpdatingBatch) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (state is FetchBatchFailed) {
                    return Center(
                      child: Text(state.message),
                    );
                  }
                  return Padding(
                    padding: EdgeInsets.all(20.h),
                    child: ListView(
                      controller: scrollController,
                      children: [
                        Text(
                          "${batch?.name}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryColor),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          "${batch?.branchName}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.bodyText1?.copyWith(
                                    fontSize: 12.sp,
                                  ),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          "${batch?.courseName}, ${batch?.subjectName}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.bodyText1?.copyWith(
                                    fontSize: 12.sp,
                                  ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          "Trainer - ${batch?.trainersString}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  fontSize: 12.sp,
                                  color: AppColors.primaryColor),
                        ),
                        SizedBox(height: 25.h),
                        ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Text(
                              '${batch?.days[index]}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            );
                          },
                          itemCount: batch?.days.length ?? 0,
                        ),
                        SizedBox(height: 25.h),
                        Text(
                          "Current Date - ${DateTime.now().toDateString()}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.bodyText1?.copyWith(
                                    fontSize: 12.sp,
                                  ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          "Note : Select current date to take today's attendance of ${batch?.name}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.bodyText1?.copyWith(
                                    fontSize: 12.sp,
                                  ),
                        ),
                        CalendarCarousel<Event>(
                          iconColor: Colors.white,
                          todayBorderColor: Colors.transparent,
                          onDayPressed: (date, events) {},
                          daysHaveCircularBorder: true,
                          showOnlyCurrentMonthDate: true,
                          weekendTextStyle: const TextStyle(
                            color: Colors.white,
                          ),
                          markedDatesMap: _markedDateMap,
                          daysTextStyle: const TextStyle(
                            color: Colors.white,
                          ),
                          thisMonthDayBorderColor: Colors.transparent,
                          weekFormat: false, //firstDayOfWeek: 4,
                          height: 420.0,
                          weekdayTextStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          shouldShowTransform: false,
                          weekDayFormat: WeekdayFormat.narrow,
                          headerTextStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          customGridViewPhysics:
                              const NeverScrollableScrollPhysics(),
                          markedDateCustomTextStyle: const TextStyle(
                            fontSize: 18,
                            color: Colors.blue,
                          ),
                          showHeader: true,
                          todayTextStyle: const TextStyle(
                            color: Colors.white,
                          ),
                          todayButtonColor: Colors.blue,
                          selectedDayTextStyle: const TextStyle(
                            color: Colors.white,
                          ),
                          prevDaysTextStyle: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                          inactiveDaysTextStyle: const TextStyle(
                            color: Colors.tealAccent,
                            fontSize: 16,
                          ),
                          onCalendarChanged: (DateTime date) {},
                          onDayLongPressed: (DateTime date) {},
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
