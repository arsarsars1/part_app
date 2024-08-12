import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:part_app/model/data_model/attendence_classes_of_month.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/model/data_model/student_attendence_of_month.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/students/widgets/trainer_admin_student_batch_picker.dart';
import 'package:part_app/view_model/attendance/attendance_cubit.dart';
import 'package:part_app/view_model/cubits.dart';

class StudentAttendanceCalenderView extends StatefulWidget {
  static const route = '/student-calender-view';

  const StudentAttendanceCalenderView({super.key});

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
  DateTime? date;
  TextEditingController batchController = TextEditingController();
  int noOfWeeks = 0, present = 0, absent = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      AttendanceCubit cubit = context.read<AttendanceCubit>();
      var studentCubic = context.read<StudentCubit>();
      await studentCubic.getStudentAdminBatches(
        clean: true,
        status: 'ongoing',
      );
      // batchCubit?.batches.forEach((batch) {
      //   context
      //       .read<StudentCubit>()
      //       .getStudents(
      //         batchId: batch.id,
      //         searchQuery: null,
      //         activeStatus: null,
      //         clean: true,
      //       )
      //       .then(
      //         (value) => context.read<StudentCubit>().students?.forEach(
      //           (student) {
      //             if (student.id !=
      //                 studentCubit?.student?.studentDetail?[0].id) {
      //               batchCubit?.batches.remove(batch);
      //             }
      //           },
      //         ),
      //       );
      // });
      batch = studentCubic.batches.first;
      batchController.text = studentCubic.batches.first.name;
      cubit.id = batch?.id ?? 0;
      await cubit.getAttendenceOfStudentOfMonth(
          studentDetailId: studentCubit?.student?.studentDetail?[0].id,
          batchId: cubit.id,
          date: DateTime(currentYear, currentMonth));
      await cubit.getClassesOfMonth(
          batchId: cubit.id, date: DateTime(currentYear, currentMonth));
      _markedDateMap.clear();
      setState(() {
        noOfWeeks = getWeeksInMonth(DateTime(currentYear, currentMonth));
        for (ClassDetails element1 in cubit.attendenceClasses ?? []) {
          int flag = 0;
          int conductedClassId = 0;
          for (StudentAttendances element in cubit.studentClasses ?? []) {
            if (element1.date == element.conductedClass?.conductedOn &&
                element.isPresent == 1) {
              flag = 1;
              conductedClassId = element.id ?? 0;
              break;
            }
          }
          if ((element1.date ?? DateTime.now()).isBefore(DateTime.now())) {
            if (flag == 1) {
              present++;
            } else {
              absent++;
            }
            if (element1.conducted == true) {
              _markedDateMap.add(
                element1.date ?? DateTime.now(),
                Event(
                  date: element1.date ?? DateTime.now(),
                  title:
                      conductedClassId == 0 ? 'Event 1' : '$conductedClassId',
                  dot: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 1.0),
                    color: flag == 1 ? Colors.green : Colors.red,
                    height: 5.0,
                    width: 5.0,
                  ),
                ),
              );
            }
          }
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    studentCubit = context.read<StudentCubit>();
    var attendanceCubit = context.read<AttendanceCubit>();
    return WillPopScope(
      onWillPop: () async {
        attendanceCubit.pre = 0;
        attendanceCubit.abs = 0;
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        key: scaffoldKey,
        appBar: CommonBar(
          title: 'Attendance',
          onPressed: () {
            attendanceCubit.pre = 0;
            attendanceCubit.abs = 0;
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
                  CommonField(
                    controller: batchController,
                    onTap: () {
                      scaffoldKey.currentState?.showBottomSheet(
                        backgroundColor: Colors.transparent,
                        (context) => TrainerStudentBatchPicker(
                          status: 'ongoing',
                          onSelect: (value) async {
                            present = 0;
                            absent = 0;
                            batch = value;
                            batchController.text = value.name;
                            AttendanceCubit cubit =
                                context.read<AttendanceCubit>();
                            cubit.id = value.id;
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
                                  DateTime(currentYear, currentMonth));
                              for (ClassDetails element1
                                  in attendanceCubit.attendenceClasses ?? []) {
                                int flag = 0;
                                int conductedClassId = 0;
                                for (StudentAttendances element
                                    in cubit.studentClasses ?? []) {
                                  if (element1.date ==
                                          element.conductedClass?.conductedOn &&
                                      element.isPresent == 1) {
                                    flag = 1;
                                    conductedClassId = element.id ?? 0;
                                    break;
                                  }
                                }
                                if ((element1.date ?? DateTime.now())
                                    .isBefore(DateTime.now())) {
                                  if (flag == 1) {
                                    present++;
                                  } else {
                                    absent++;
                                  }
                                  if (element1.conducted == true) {
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
                              }
                            });
                          },
                        ),
                      );
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
                    padding: EdgeInsets.fromLTRB(15.h, 0.h, 15.h, 15.h),
                    child: CalendarCarousel<Event>(
                      childAspectRatio: 1.1,
                      iconColor: Colors.white,
                      todayBorderColor: Colors.transparent,
                      daysHaveCircularBorder: true,
                      showOnlyCurrentMonthDate: true,
                      headerMargin: const EdgeInsets.all(0),
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
                              DateTime(currentYear, currentMonth));
                          for (ClassDetails element1
                              in attendanceCubit.attendenceClasses ?? []) {
                            int flag = 0;
                            int conductedClassId = 0;
                            for (StudentAttendances element
                                in cubit.studentClasses ?? []) {
                              if (element.conductedClass?.conductedOn ==
                                  element1.date) {
                                flag = 1;
                                conductedClassId = element.id ?? 0;
                                break;
                              }
                            }
                            if ((element1.date ?? DateTime.now())
                                .isBefore(DateTime.now())) {
                              if (flag == 1) {
                                present++;
                              } else {
                                absent++;
                              }
                              if (element1.conducted == true) {
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
                              DateTime(currentYear, currentMonth));
                          for (ClassDetails element1
                              in attendanceCubit.attendenceClasses ?? []) {
                            int flag = 0;
                            int conductedClassId = 0;
                            for (StudentAttendances element
                                in cubit.studentClasses ?? []) {
                              if (element.conductedClass?.conductedOn ==
                                  element1.date) {
                                flag = 1;
                                conductedClassId = element.id ?? 0;
                                break;
                              }
                            }
                            if ((element1.date ?? DateTime.now())
                                .isBefore(DateTime.now())) {
                              if (flag == 1) {
                                present++;
                              } else {
                                absent++;
                              }
                              if (element1.conducted == true) {
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
                          }
                        });
                      },
                    ),
                  ),
                  Text(
                    'Attendance Summary',
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
                    mainAxisAlignment: MainAxisAlignment.center,
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
                              '${attendanceCubit.pre}',
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
                      SizedBox(width: 10.w),
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
                              '${attendanceCubit.abs}',
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
