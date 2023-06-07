import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:part_app/flavors.dart';
import 'package:part_app/model/data_model/attendence_add_request.dart';
import 'package:part_app/model/data_model/attendence_taken.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/model/data_model/drop_down_item.dart';
import 'package:part_app/model/data_model/student_model.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/attendance/attendance_add.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/app_colors.dart';
import 'package:part_app/view_model/attendance/attendance_cubit.dart';
import 'package:part_app/view_model/cubits.dart';

class AttendanceUpdate extends StatefulWidget {
  static const route = '/update_attendance';

  const AttendanceUpdate({Key? key}) : super(key: key);

  @override
  State<AttendanceUpdate> createState() => _AttendanceUpdateState();
}

class _AttendanceUpdateState extends State<AttendanceUpdate> {
  ScrollController scrollController = ScrollController();
  BatchModel? batch;
  AttendanceDetails? selectedStudent;

  @override
  void initState() {
    super.initState();

    // get the trainers list
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      AttendanceCubit cubit = context.read<AttendanceCubit>();
      await cubit.getAttendenceTaken(
          batchId: cubit.id, conductedClassId: cubit.conductedClassId);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AttendanceCubit>();
    var studentCubit = context.read<StudentCubit>();
    return Scaffold(
      appBar: const CommonBar(
        title: 'Class Attendance',
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocConsumer<AttendanceCubit, AttendanceState>(
              listener: (context, state) {
                if (state is UpdateAttendenceFailed) {
                  Alert(context).show(message: state.message);
                }
                if (state is UpdatedAttendence) {
                  Alert(context).show(message: 'Attendence Updated');
                }
                if (state is AddedForUpdateAttendance) {}
              },
              builder: (context, state) {
                batch = context.read<BatchCubit>().batchModel;
                if (state is UpdatingAttendence) {
                  return const Center(
                    child: CircularProgressIndicator(),
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
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
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
                            style:
                                Theme.of(context).textTheme.bodyText1?.copyWith(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          Text(
                            "${batch?.batchDetail?[0].startTime?.toAmPM()} - ${batch?.batchDetail?[0].endTime?.toAmPM()}",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style:
                                Theme.of(context).textTheme.bodyText1?.copyWith(
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
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontSize: 12.sp,
                            ),
                      ),
                      SizedBox(height: 5.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${batch?.courseName}, ${batch?.subjectName}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
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
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${cubit.conductedDate?.toDay()}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                      color: AppColors.textColor,
                                      fontSize: 16,
                                    ),
                              ),
                              Text(
                                '${cubit.conductedDate?.toDDMMMYYY()}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                      color: AppColors.textColor,
                                      fontSize: 16,
                                    ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        "Attendence: ${cubit.updatedStudents.length ?? 0} / ${studentCubit.students?.length ?? 0}",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontSize: 12.sp,
                            ),
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        "Note: You can update each student's attendence from this page for the following batch on the selected date.",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontSize: 12.sp,
                            ),
                      ),
                      SizedBox(height: 25.h),
                      BlocBuilder<AttendanceCubit, AttendanceState>(
                        builder: (context, state) {
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: studentCubit.students?.length,
                            controller: scrollController,
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
                                                value: cubit.updatedStudents
                                                    .contains(student.detailId),
                                                onChanged: (value) {
                                                  cubit.updateStudent(
                                                      student.detailId ?? 0);
                                                  for (AttendanceDetails i
                                                      in cubit
                                                          .attendenceTaken) {
                                                    if (i.studentDetail?.id ==
                                                        student.detailId) {
                                                      selectedStudent = i;
                                                      break;
                                                    }
                                                  }
                                                  CommonDialog(
                                                    context: context,
                                                    message:
                                                        'Are you sure you want to update\nattendence for ${selectedStudent?.studentDetail?.name}',
                                                    buttonText: 'Ok',
                                                    subColor:
                                                        AppColors.primaryColor,
                                                    subContent: Text(
                                                      'Date : ${cubit.conductedDate?.formattedString()} '
                                                      '\n\nTime : ${batch?.batchDetail?[0].startTime?.toAmPM()} - '
                                                      '${batch?.batchDetail?[0].endTime?.toAmPM()}'
                                                      '\n\n${batch?.branchName}'
                                                      '\n\n${batch?.name}'
                                                      '\n\n${batch?.courseName}, ${batch?.subjectName}\n\n\n',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1
                                                          ?.copyWith(
                                                            color: AppColors
                                                                .primaryColor,
                                                          ),
                                                    ),
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                      cubit.updateAttendence(
                                                          request: {
                                                            "is_present": cubit
                                                                    .updatedStudents
                                                                    .contains(
                                                                        student
                                                                            .detailId)
                                                                ? "1"
                                                                : "0"
                                                          },
                                                          batchId: cubit.id,
                                                          conductedClassId: cubit
                                                              .conductedClassId,
                                                          conductedClassStudentId:
                                                              selectedStudent
                                                                  ?.id);
                                                    },
                                                  ).show();
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
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          // AttendanceUpdateListItem(
          //   students: studentCubit.students ?? [],
          //   onSelect: (StudentModel student) async {},
          // )
          // BlocBuilder<StudentCubit, StudentState>(
          //   builder: (context, state) {
          //     if (state is FetchingTrainers) {
          //       return const Padding(
          //         padding: EdgeInsets.all(64.0),
          //         child: Center(
          //           child: CircularProgressIndicator(),
          //         ),
          //       );
          //     }

          //     // ignore: prefer_is_empty
          //     if (studentCubit.students?.length == 0) {
          //       return Padding(
          //         padding: const EdgeInsets.all(64.0),
          //         child: Center(
          //           child: Text(
          //             query == null
          //                 ? selectedItem == null
          //                     ? 'Add a trainer to get started'
          //                     : 'No active trainers'
          //                 : 'Sorry, No Matching Results Found.',
          //           ),
          //         ),
          //       );
          //     }
          //     return AttendanceUpdateListItem(
          //       students: studentCubit.students ?? [],
          //       onSelect: (StudentModel student) async {},
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
