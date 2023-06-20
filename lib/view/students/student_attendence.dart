import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/students/widgets/batch_picker.dart';
import 'package:part_app/view_model/attendance/attendance_cubit.dart';
import 'package:part_app/view_model/cubits.dart';

class StudentAttendanceCalenderView extends StatefulWidget {
  static const route = '/student-calender-view';

  const StudentAttendanceCalenderView({Key? key}) : super(key: key);

  @override
  State<StudentAttendanceCalenderView> createState() =>
      _StudentAttendanceCalenderViewState();
}

class _StudentAttendanceCalenderViewState
    extends State<StudentAttendanceCalenderView> {
  bool isActive = true;
  ScrollController scrollController = ScrollController();
  BatchModel? batch;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final EventList<Event> _markedDateMap = EventList<Event>(events: {});
  int currentYear = DateTime.now().year;
  int currentMonth = DateTime.now().month;
  StudentCubit? studentCubit;
  int? branchId;
  DateTime? date;
  BatchCubit? batchCubit;
  TextEditingController batchController = TextEditingController();
  int noOfWeeks = 0, present = 0, absent = 0;

  @override
  Widget build(BuildContext context) {
    batchCubit = context.read<BatchCubit>();
    studentCubit = context.read<StudentCubit>();
    var attendenceCubit = context.read<AttendanceCubit>();
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return true;
      },
      child: Scaffold(
        key: scaffoldKey,
        appBar: CommonBar(
          title: 'Attendence',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        body: BlocConsumer<BatchCubit, BatchState>(
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
            return SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    '${studentCubit?.student?.studentDetail?[0].name}',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 12.sp,
                        ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  BranchField(
                    onSelect: (value) {
                      setState(() {
                        branchId = value;
                        batchController.text = "";
                      });
                      batchCubit?.getBatchesByStatus(
                        branchId: branchId,
                        clean: true,
                        branchSearch: false,
                        status: 'ongoing',
                      );
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CommonField(
                    controller: batchController,
                    onTap: () {
                      if (branchId != null) {
                        scaffoldKey.currentState?.showBottomSheet(
                          backgroundColor: Colors.transparent,
                          (context) => BatchPicker(
                            branchId: branchId!,
                            status: '',
                            branchSearch: true,
                            onSelect: (value) async {
                              present = 0;
                              absent = 0;
                              batch = value;
                              batchController.text = value.name;
                              AttendanceCubit cubit =
                                  context.read<AttendanceCubit>();
                              cubit.id = value.id;
                              await cubit.getAttendenceOfStudentOfMonth(
                                  studentDetailId: studentCubit
                                      ?.student?.studentDetail?[0].id,
                                  batchId: cubit.id,
                                  date: DateTime(currentYear, currentMonth));
                              await cubit.getClassesOfMonth(
                                  batchId: cubit.id,
                                  date: DateTime(currentYear, currentMonth));
                              _markedDateMap.clear();
                              setState(() {
                                noOfWeeks = getWeeksInMonth(
                                    DateTime(currentYear, currentMonth).year,
                                    DateTime(currentYear, currentMonth).month);
                                for (var element1
                                    in attendenceCubit.attendenceClasses ??
                                        []) {
                                  int flag = 0;
                                  int conductedClassId = 0;
                                  for (var element
                                      in cubit.studentClasses ?? []) {
                                    if (element1.date ==
                                        element.conductedClass.conductedOn) {
                                      flag = 1;
                                      conductedClassId = element.id;
                                      break;
                                    }
                                  }
                                  if (element1.date.isBefore(DateTime.now())) {
                                    if (flag == 1) {
                                      present++;
                                    } else {
                                      absent++;
                                    }
                                    _markedDateMap.add(
                                      element1.date ?? DateTime.now(),
                                      Event(
                                        date: element1.date ?? DateTime.now(),
                                        title: conductedClassId == 0
                                            ? 'Event 1'
                                            : '$conductedClassId',
                                        dot: Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 1.0),
                                          color: flag == 1
                                              ? Colors.green
                                              : Colors.red,
                                          height: 5.0,
                                          width: 5.0,
                                        ),
                                      ),
                                    );
                                  }
                                }
                              });
                            },
                          ),
                        );
                      } else {
                        Alert(context).show(
                          message: 'Please select the Branch.',
                        );
                      }
                    },
                    disabled: true,
                    title: 'Batch *',
                    hint: 'Select Batch',
                    onChange: (value) {},
                    suffixIcon: const Padding(
                      padding: EdgeInsets.only(right: 32),
                      child: Icon(
                        Icons.arrow_drop_down,
                        size: 24,
                        color: Colors.white24,
                      ),
                    ),
                    validator: (value) {
                      return value.isEmpty ? 'Please select batch.' : null;
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.h),
                    child: CalendarCarousel<Event>(
                      childAspectRatio: 1.1,
                      iconColor: Colors.white,
                      todayBorderColor: Colors.transparent,
                      daysHaveCircularBorder: true,
                      showOnlyCurrentMonthDate: true,
                      onLeftArrowPressed: () async {
                        present = 0;
                        absent = 0;
                        AttendanceCubit cubit = context.read<AttendanceCubit>();
                        setState(() {
                          if (currentMonth == 1) {
                            currentYear--;
                            currentMonth = 12;
                          } else {
                            currentMonth--;
                          }
                        });
                        await cubit.getAttendenceOfStudentOfMonth(
                            studentDetailId:
                                studentCubit?.student?.studentDetail?[0].id,
                            batchId: cubit.id,
                            date: DateTime(currentYear, currentMonth));
                        await cubit.getClassesOfMonth(
                            batchId: cubit.id,
                            date: DateTime(currentYear, currentMonth));
                        _markedDateMap.clear();
                        setState(() {
                          noOfWeeks = getWeeksInMonth(
                              DateTime(currentYear, currentMonth).year,
                              DateTime(currentYear, currentMonth).month);
                          for (var element1
                              in attendenceCubit.attendenceClasses ?? []) {
                            int flag = 0;
                            int conductedClassId = 0;
                            for (var element in cubit.studentClasses ?? []) {
                              if (element.conductedClass.conductedOn ==
                                  element1.date) {
                                flag = 1;
                                conductedClassId = element.id;
                                break;
                              }
                            }
                            if (element1.date.isBefore(DateTime.now())) {
                              if (flag == 1) {
                                present++;
                              } else {
                                absent++;
                              }
                              _markedDateMap.add(
                                element1.date ?? DateTime.now(),
                                Event(
                                  date: element1.date ?? DateTime.now(),
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
                                ),
                              );
                            }
                          }
                        });
                      },
                      onRightArrowPressed: () async {
                        present = 0;
                        absent = 0;
                        AttendanceCubit cubit = context.read<AttendanceCubit>();
                        setState(() {
                          if (currentMonth == 12) {
                            currentYear++;
                            currentMonth = 1;
                          } else {
                            currentMonth++;
                          }
                        });
                        await cubit.getAttendenceOfStudentOfMonth(
                            studentDetailId:
                                studentCubit?.student?.studentDetail?[0].id,
                            batchId: cubit.id,
                            date: DateTime(currentYear, currentMonth));
                        await cubit.getClassesOfMonth(
                            batchId: cubit.id,
                            date: DateTime(currentYear, currentMonth));
                        _markedDateMap.clear();
                        setState(() {
                          noOfWeeks = getWeeksInMonth(
                              DateTime(currentYear, currentMonth).year,
                              DateTime(currentYear, currentMonth).month);
                          for (var element1
                              in attendenceCubit.attendenceClasses ?? []) {
                            int flag = 0;
                            int conductedClassId = 0;
                            for (var element in cubit.studentClasses ?? []) {
                              if (element.conductedClass.conductedOn ==
                                  element1.date) {
                                flag = 1;
                                conductedClassId = element.id;
                                break;
                              }
                            }
                            if (element1.date.isBefore(DateTime.now())) {
                              if (flag == 1) {
                                present++;
                              } else {
                                absent++;
                              }
                              _markedDateMap.add(
                                element1.date ?? DateTime.now(),
                                Event(
                                  date: element1.date ?? DateTime.now(),
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
                                ),
                              );
                            }
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
                      height: noOfWeeks >= 5 ? 440.h : 380.h,
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
                    ),
                  ),
                  Text(
                    'Attendence Summary',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 12.sp,
                        ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 100.w,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Present',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12.sp,
                                  ),
                            ),
                            Text(
                              '$present',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14.sp,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 100.w,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Absent',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12.sp,
                                  ),
                            ),
                            Text(
                              '$absent',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14.sp,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  int getWeeksInMonth(int year, int month) {
    DateTime firstDayOfMonth = DateTime(year, month, 1);
    int numberOfWeeks = 0;

    while (firstDayOfMonth.month == month) {
      if (firstDayOfMonth.weekday == DateTime.sunday) {
        numberOfWeeks++;
      }
      firstDayOfMonth = firstDayOfMonth.add(const Duration(days: 1));
    }

    return numberOfWeeks;
  }
}
