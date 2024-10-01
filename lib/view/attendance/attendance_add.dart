import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/flavors.dart';
import 'package:part_app/model/data_model/attendence_add_request.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/model/data_model/drop_down_item.dart';
import 'package:part_app/model/data_model/student_model.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view_model/attendance/attendance_cubit.dart';
import 'package:part_app/view_model/cubits.dart';

class AttendanceAdd extends StatefulWidget {
  static const route = '/add-attendance';

  const AttendanceAdd({super.key});

  @override
  State<AttendanceAdd> createState() => _AttendanceAddState();
}

class _AttendanceAddState extends State<AttendanceAdd> {
  int? branchId;
  String? query;
  String? temp;
  DropDownItem? selectedItem;
  ScrollController scrollController = ScrollController();
  BatchModel? batch;
  String? startTime, endTime;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      doSearch(true);
    });

    // scrollController.position.isScrollingNotifier.addListener(() async {
    //   if (!scrollController.position.isScrollingNotifier.value) {
    //     doSearch(false);
    //     setState(() {});
    //   }
    // });

    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        await doSearch(false);
      }
    });
  }

  Future<void> doSearch(bool clean) async {
    await context.read<StudentCubit>().getStudents(
          batchId: context.read<AttendanceCubit>().id,
          clean: clean,
        );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AttendanceCubit>();
    var studentCubit = context.read<StudentCubit>();
    return WillPopScope(
      onWillPop: () async {
        studentCubit.students?.clear();
        cubit.selectedStudents = {};
        cubit.attendance.clear();
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        appBar: CommonBar(
          title: 'Class Attendance',
          onPressed: () {
            studentCubit.students?.clear();
            cubit.selectedStudents = {};
            cubit.attendance.clear();
            Navigator.pop(context);
          },
        ),
        body: Column(
          children: [
            Expanded(
              child: BlocConsumer<AttendanceCubit, AttendanceState>(
                listener: (context, state) async {
                  if (state is CreateAttendanceFailed) {
                    Alert(context).show(message: state.message);
                  }
                  if (state is CreatedAttendance) {
                    Alert(context).show(message: 'Attendance Saved');
                    cubit.selectedStudents.clear();
                    cubit.attendance.clear();
                    Navigator.pop(context);
                  }
                },
                builder: (context, state) {
                  batch = context.read<BatchCubit>().batchModel;
                  if (!cubit.isFromRescheduledClass) {
                    batch?.batchDetail?.forEach((element) {
                      if (element.day == cubit.conductedDate!.weekday) {
                        startTime = element.startTime;
                        endTime = element.endTime;
                      } else {
                        startTime = cubit.selectedClass?.startTime;
                        endTime = cubit.selectedClass?.endTime;
                      }
                    });
                  } else {
                    startTime = cubit.selectedClass?.startTime;
                    endTime = cubit.selectedClass?.endTime;
                  }

                  if (state is CreatingAttendance) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return Padding(
                    padding: EdgeInsets.all(20.h),
                    child: ListView(
                      controller: scrollController,
                      physics: const ClampingScrollPhysics(),
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
                        Row(
                          children: [
                            Text(
                              "Time: ",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Text(
                              "${startTime?.toAmPM()} - ${endTime?.toAmPM()}",
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
                          ],
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
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${batch?.courseName}, ${batch?.subjectName}",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                              fontSize: 12.sp,
                                            ),
                                      ),
                                      SizedBox(height: 10.h),
                                      SizedBox(
                                        width: 180.w,
                                        child: Text(
                                          "Trainer - ${batch?.trainersString}",
                                          maxLines: 5,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(
                                                  fontSize: 12.sp,
                                                  color:
                                                      AppColors.primaryColor),
                                        ),
                                      ),
                                    ]),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '${cubit.conductedDate?.toDay()}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                              color: AppColors.textColor,
                                              fontSize: 16,
                                            ),
                                      ),
                                      Text(
                                        '${cubit.conductedDate?.toDDMMMYYY()}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                              color: AppColors.textColor,
                                              fontSize: 16,
                                            ),
                                      ),
                                    ]),
                              )
                            ]),
                        SizedBox(height: 25.h),
                        BlocBuilder<AttendanceCubit, AttendanceState>(
                            builder: (context, state) {
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: studentCubit.students?.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              StudentModel student =
                                  studentCubit.students![index];
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(vertical: 8.w),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16.w,
                                  vertical: 16.h,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: AppColors.grey800,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Row(
                                        children: [
                                          UserImage(
                                            profilePic: student.profilePic != ""
                                                ? '${F.baseUrl}'
                                                    '/admin/images/trainer/'
                                                    '${student.id}/${student.profilePic}'
                                                : '',
                                          ),
                                          SizedBox(width: 16.w),
                                          Expanded(
                                            child: Text(
                                              '${student.name}',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 25.0.h,
                                            alignment: Alignment.center,
                                            child: FittedBox(
                                              fit: BoxFit.contain,
                                              child: CupertinoSwitch(
                                                trackColor: AppColors.grey500,
                                                value: cubit.selectedStudents
                                                    .contains(student.detailId),
                                                onChanged: (value) {
                                                  cubit.addOrRemoveStudent(
                                                      student.detailId ?? 0);
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        }),
                        BlocBuilder<StudentCubit, StudentState>(
                          builder: (context, state) {
                            if (state is FetchingStudents && state.pagination) {
                              return AnimatedContainer(
                                height: state.pagination ? 30 : 0,
                                color: Colors.black,
                                duration: const Duration(
                                  milliseconds: 250,
                                ),
                                child: const Center(
                                    child: Text('Fetching more items ..')),
                              );
                            } else {
                              return Column(
                                children: [
                                  SizedBox(height: 20.h),
                                  Center(
                                    child: SafeArea(
                                      child: Button(
                                        onTap: () {
                                          for (int i
                                              in cubit.selectedStudents) {
                                            Attendance studentAttendence =
                                                Attendance(
                                              studentDetailId: i,
                                              isPresent: 1,
                                            );
                                            cubit.addAttendenceofStudent(
                                                studentAttendence);
                                          }
                                          if (studentCubit.students?.length !=
                                              cubit.selectedStudents.length) {
                                            for (StudentModel student
                                                in studentCubit.students ??
                                                    []) {
                                              if (!cubit.selectedStudents
                                                  .contains(student.detailId)) {
                                                Attendance studentAttendance =
                                                    Attendance(
                                                  studentDetailId:
                                                      student.detailId,
                                                  isPresent: 0,
                                                );
                                                cubit.addAttendenceofStudent(
                                                    studentAttendance);
                                              }
                                            }
                                          }
                                          AttendenceAddRequest request =
                                              AttendenceAddRequest(
                                            conductedOn: (cubit.conductedDate ??
                                                    DateTime.now())
                                                .toServerYMD(),
                                            startTime: startTime ?? "",
                                            endTime: endTime ?? "",
                                            attendance:
                                                cubit.buildAttendanceList(),
                                          );
                                          cubit.addAttendence(request,
                                              batchId: batch?.id);
                                        },
                                        height: UIConstants.buttonHeight,
                                        title: 'Save Attendance',
                                      ),
                                    ),
                                  )
                                ],
                              );
                            }
                          },
                        ),
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
