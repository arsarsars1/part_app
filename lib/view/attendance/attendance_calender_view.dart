import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/attendance/attendance_add.dart';
import 'package:part_app/view/attendance/attendance_update.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/constant.dart';
import 'package:part_app/view_model/attendance/attendance_cubit.dart';
import 'package:part_app/view_model/cubits.dart';

import '../../model/data_model/attendence_classes_conducted.dart';
import '../../model/data_model/attendence_classes_of_month.dart' as attendance;
import '../../model/data_model/event_model.dart';
import 'components/attendance_class_pick.dart';

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
  final EventList<EventModel> _markedDateMap =
      EventList<EventModel>(events: {});
  int currentYear = DateTime.now().year;
  int currentMonth = DateTime.now().month;
  StudentCubit? studentCubit;
  int noOfWeeks = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      AttendanceCubit cubit = context.read<AttendanceCubit>();
      studentCubit = context.read<StudentCubit>();
      await cubit.getClassesOfMonth(
          batchId: cubit.id, date: DateTime(currentYear, currentMonth));
      await cubit.getConductedClassesOfMonth(
          batchId: cubit.id, date: DateTime(currentYear, currentMonth));
      await studentCubit?.getStudents(batchId: cubit.id, clean: true);
      _markedDateMap.clear();
      setState(() {
        noOfWeeks = getWeeksInMonth(DateTime(currentYear, currentMonth));
        for (var element in cubit.attendenceClasses ?? []) {
          int flag = 0;
          int conductedClassId = 0;
          for (var element1 in cubit.conductedClasses ?? []) {
            if (element.date == element1.conductedOn &&
                element.startTime == element1.startTime.substring(0, 5)) {
              flag = 1;
              conductedClassId = element1.id;
              break;
            }
          }
          _markedDateMap.add(
            element.date ?? DateTime.now(),
            EventModel(
              date: element.date ?? DateTime.now(),
              title: conductedClassId == 0 ? 'Event 1' : '$conductedClassId',
              dot: Container(
                margin: const EdgeInsets.symmetric(horizontal: 1.0),
                color: flag == 1 ? Colors.green : Colors.red,
                height: 5.0,
                width: 5.0,
              ),
              flag: flag,
            ),
          );
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<AttendanceCubit>().getBatchesByStatus(
              branchId: context.read<BatchCubit>().batchModel?.branchId,
              status: context.read<BatchCubit>().tempStatus,
              clean: true,
            );
        Navigator.pop(context);
        return true;
      },
      child: Scaffold(
        key: scaffoldKey,
        appBar: CommonBar(
          title: 'Class Attendance',
          onPressed: () {
            context.read<AttendanceCubit>().getBatchesByStatus(
                  branchId: context.read<BatchCubit>().batchModel?.branchId,
                  status: context.read<BatchCubit>().tempStatus,
                  clean: true,
                );
            Navigator.pop(context);
          },
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
                              .bodyLarge
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
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontSize: 12.sp,
                                  ),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          "${batch?.courseName}, ${batch?.subjectName}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
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
                              .bodyLarge
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
                                  .bodyLarge
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
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontSize: 12.sp,
                                  ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          "Note : Select current date to take today's attendance of ${batch?.name}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontSize: 12.sp,
                                  ),
                        ),
                        CalendarCarousel<EventModel>(
                          childAspectRatio: 1.1,
                          iconColor: Colors.white,
                          todayBorderColor: Colors.transparent,
                          onDayPressed: (date, events) async {
                            AttendanceCubit cubit =
                                context.read<AttendanceCubit>();
                            int flag = 0;
                            for (attendance.ClassDetails element
                                in cubit.attendenceClasses ?? []) {
                              cubit.selectedClass = element;
                              if (date == element.date) {
                                flag = 1;
                                break;
                              }
                            }
                            if (flag == 0) {
                              Alert(context).show(
                                  message:
                                      'This batch does not have class on this day.');
                            } else {
                              if ((studentCubit?.students?.length ?? 0) == 0) {
                                Alert(context).show(
                                    message: 'No students Added to Batch');
                              } else {
                                cubit.conductedDate = date;
                                cubit.conductedClassIdList = List.generate(
                                    events.length,
                                    (index) => events[index].title != "Event 1"
                                        ? int.parse(events[index].title ?? "0")
                                        : 0);
                                if (DateTime.now().compareTo(
                                        cubit.conductedDate ?? DateTime.now()) <
                                    0) {
                                  Alert(context).show(
                                      message:
                                          'Cannot add attendence for a future date.');
                                } else {
                                  cubit.dropdownSelectedIndex = 0;
                                  if (events.length > 1) {
                                    cubit.isFromRescheduledClass = true;
                                    scaffoldKey.currentState?.showBottomSheet(
                                        elevation: 10,
                                        backgroundColor: Colors.transparent,
                                        (context) => AttendanceClassPicker(
                                              date: date,
                                              eventList: events,
                                            ));
                                    await cubit.getClassesOfMonth(
                                        batchId: cubit.id,
                                        date: DateTime(
                                            currentYear, currentMonth));
                                    await cubit.getConductedClassesOfMonth(
                                        batchId: cubit.id,
                                        date: DateTime(
                                            currentYear, currentMonth));
                                    _markedDateMap.clear();
                                    setState(() {
                                      noOfWeeks = getWeeksInMonth(
                                          DateTime(currentYear, currentMonth));
                                      for (var element
                                          in cubit.attendenceClasses ?? []) {
                                        int flag = 0;
                                        int conductedClassId = 0;
                                        for (var element1
                                            in cubit.conductedClasses ?? []) {
                                          if (element.date ==
                                                  element1.conductedOn &&
                                              element.startTime ==
                                                  element1.startTime
                                                      .substring(0, 5)) {
                                            flag = 1;
                                            conductedClassId = element1.id;
                                            break;
                                          }
                                        }
                                        _markedDateMap.add(
                                          element.date ?? DateTime.now(),
                                          EventModel(
                                            date:
                                                element.date ?? DateTime.now(),
                                            title: conductedClassId == 0
                                                ? 'Event 1'
                                                : '$conductedClassId',
                                            dot: Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 1.0),
                                              color: flag == 1
                                                  ? Colors.green
                                                  : Colors.red,
                                              height: 5.0,
                                              width: 5.0,
                                            ),
                                            flag: flag,
                                          ),
                                        );
                                      }
                                    });
                                  } else {
                                    cubit.isFromRescheduledClass = false;
                                    if (cubit.conductedClassIdList[0] == 0) {
                                      await Navigator.pushNamed(
                                        context,
                                        AttendanceAdd.route,
                                      );
                                      await cubit.getClassesOfMonth(
                                          batchId: cubit.id,
                                          date: DateTime(
                                              currentYear, currentMonth));
                                      await cubit.getConductedClassesOfMonth(
                                          batchId: cubit.id,
                                          date: DateTime(
                                              currentYear, currentMonth));
                                      _markedDateMap.clear();
                                      setState(() {
                                        noOfWeeks = getWeeksInMonth(DateTime(
                                            currentYear, currentMonth));
                                        for (var element
                                            in cubit.attendenceClasses ?? []) {
                                          int flag = 0;
                                          int conductedClassId = 0;
                                          for (var element1
                                              in cubit.conductedClasses ?? []) {
                                            if (element.date ==
                                                    element1.conductedOn &&
                                                element.startTime ==
                                                    element1.startTime
                                                        .substring(0, 5)) {
                                              flag = 1;
                                              conductedClassId = element1.id;
                                              break;
                                            }
                                          }
                                          _markedDateMap.add(
                                            element.date ?? DateTime.now(),
                                            EventModel(
                                              date: element.date ??
                                                  DateTime.now(),
                                              title: conductedClassId == 0
                                                  ? 'Event 1'
                                                  : '$conductedClassId',
                                              dot: Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 1.0),
                                                color: flag == 1
                                                    ? Colors.green
                                                    : Colors.red,
                                                height: 5.0,
                                                width: 5.0,
                                              ),
                                              flag: flag,
                                            ),
                                          );
                                        }
                                      });
                                    } else {
                                      Navigator.pushNamed(
                                        context,
                                        AttendanceUpdate.route,
                                      );
                                    }
                                  }
                                }
                              }
                            }
                          },
                          daysHaveCircularBorder: true,
                          showOnlyCurrentMonthDate: true,
                          onLeftArrowPressed: () async {
                            AttendanceCubit cubit =
                                context.read<AttendanceCubit>();
                            setState(() {
                              if (currentMonth == 1) {
                                currentYear--;
                                currentMonth = 12;
                              } else {
                                currentMonth--;
                              }
                            });
                            await cubit.getClassesOfMonth(
                                batchId: cubit.id,
                                date: DateTime(currentYear, currentMonth));
                            await cubit.getConductedClassesOfMonth(
                                batchId: cubit.id,
                                date: DateTime(currentYear, currentMonth));
                            _markedDateMap.clear();
                            setState(() {
                              noOfWeeks = getWeeksInMonth(
                                  DateTime(currentYear, currentMonth));
                              for (var element
                                  in cubit.attendenceClasses ?? []) {
                                int flag = 0;
                                int conductedClassId = 0;
                                for (var element1
                                    in cubit.conductedClasses ?? []) {
                                  if (element.date == element1.conductedOn &&
                                      element.startTime ==
                                          element1.startTime.substring(0, 5)) {
                                    flag = 1;
                                    conductedClassId = element1.id;
                                    break;
                                  }
                                }
                                _markedDateMap.add(
                                  element.date ?? DateTime.now(),
                                  EventModel(
                                    date: element.date ?? DateTime.now(),
                                    title: conductedClassId == 0
                                        ? 'Event 1'
                                        : '$conductedClassId',
                                    dot: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 1.0),
                                      color:
                                          flag == 1 ? Colors.green : Colors.red,
                                      height: 5.0,
                                      width: 5.0,
                                    ),
                                    flag: flag,
                                  ),
                                );
                              }
                            });
                          },
                          onRightArrowPressed: () async {
                            AttendanceCubit cubit =
                                context.read<AttendanceCubit>();
                            setState(() {
                              if (currentMonth == 12) {
                                currentYear++;
                                currentMonth = 1;
                              } else {
                                currentMonth++;
                              }
                            });
                            await cubit.getClassesOfMonth(
                                batchId: cubit.id,
                                date: DateTime(currentYear, currentMonth));
                            await cubit.getConductedClassesOfMonth(
                                batchId: cubit.id,
                                date: DateTime(currentYear, currentMonth));
                            _markedDateMap.clear();
                            setState(() {
                              for (attendance.ClassDetails element
                                  in cubit.attendenceClasses ?? []) {
                                int flag = 0;
                                int conductedClassId = 0;
                                for (ConductedClass element1
                                    in cubit.conductedClasses ?? []) {
                                  if (element.date == element1.conductedOn &&
                                      element.startTime ==
                                          element1.startTime.substring(0, 5)) {
                                    flag = 1;
                                    conductedClassId = element1.id;
                                    break;
                                  }
                                }
                                _markedDateMap.add(
                                  element.date ?? DateTime.now(),
                                  EventModel(
                                    date: element.date ?? DateTime.now(),
                                    title: conductedClassId == 0
                                        ? 'Event 1'
                                        : '$conductedClassId',
                                    dot: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 1.0),
                                      color:
                                          flag == 1 ? Colors.green : Colors.red,
                                      height: 5.0,
                                      width: 5.0,
                                    ),
                                    flag: flag,
                                  ),
                                );
                              }
                            });
                          },
                          weekendTextStyle: const TextStyle(
                            color: Colors.white,
                          ),
                          markedDatesMap: _markedDateMap,
                          daysTextStyle: const TextStyle(
                            color: Colors.white,
                          ),
                          thisMonthDayBorderColor: Colors.transparent,
                          weekFormat: false, //firstDayOfWeek: 4,
                          height: noOfWeeks > 4 ? 440.h : 380.h,
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
                          isScrollable: false,
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

  int getWeeksInMonth(DateTime date) {
    DateTime firstDayOfMonth = DateTime(date.year, date.month, 1);
    DateTime lastDayOfMonth = DateTime(date.year, date.month + 1, 0);

    DateTime firstDayOfFirstWeek =
        firstDayOfMonth.subtract(Duration(days: firstDayOfMonth.weekday - 1));
    DateTime lastDayOfLastWeek =
        lastDayOfMonth.add(Duration(days: 7 - lastDayOfMonth.weekday));

    int numberOfWeeks =
        lastDayOfLastWeek.difference(firstDayOfFirstWeek).inDays ~/ 7;

    return numberOfWeeks;
  }
}
