import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/model/data_model/student_app_calender_events.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/calender/widgets/custom_container.dart';
import 'package:part_app/view/components/alert.dart';
import 'package:part_app/view/components/common_bar.dart';
import 'package:part_app/view/constants/constant.dart';
import 'package:part_app/view_model/cubits.dart';

class StudentAppCalenderEvent extends StatefulWidget {
  static const route = '/student-app-calender-event';
  const StudentAppCalenderEvent({super.key});

  @override
  State<StudentAppCalenderEvent> createState() =>
      _StudentAppCalenderEventState();
}

class _StudentAppCalenderEventState extends State<StudentAppCalenderEvent> {
  @override
  void initState() {
    var cubit = context.read<HomeCubit>();
    var authCubit = context.read<AuthCubit>();
    cubit.getStudentAppCalenderEvents(
      date: cubit.selectedStudentDate.toServerYMD(),
      studentId: authCubit.user?.studentDetail?[authCubit.studentIndex].id ?? 0,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = context.read<HomeCubit>();
    return Scaffold(
      appBar: const CommonBar(
        title: 'Calender Quick View',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state is GetCalenderEventsFailed) {
              Alert(context).show(message: state.message);
            }
          },
          builder: (context, state) {
            if (state is GettingCalenderEvents) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if ((cubit.scheduledStudentClasses ?? []).isEmpty &&
                (cubit.rescheduledStudentClasses ?? []).isEmpty &&
                (cubit.rescheduledToStudentClasses ?? []).isEmpty) {
              return const Center(
                child: Text(
                    'There is no calendar information available for this date'),
              );
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10.w),
                        Padding(
                          padding: EdgeInsets.only(left: 15.w),
                          child: Text(
                            cubit.selectedStudentDate.toEEEEDDMMYYY(),
                            style: TextStyle(
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.w),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: cubit.scheduledStudentClasses?.length,
                          itemBuilder: (context, index) {
                            Class? tempClass =
                                cubit.scheduledStudentClasses?[index];
                            return CustomContainer(
                              widget: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (tempClass?.rescheduled ?? false)
                                    Center(
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(8.h),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: AppColors.primaryColor,
                                              ),
                                            ),
                                            child: Text(
                                              'Rescheduled from ${tempClass?.oldDate?.toDDMMYYY()}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16.sp,
                                                color: AppColors.primaryColor,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10.h),
                                        ],
                                      ),
                                    ),
                                  Text(
                                    '${tempClass?.batchName}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  Text(
                                    '${tempClass?.branchName}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                  Text(
                                    '${tempClass?.courseName}, ${tempClass?.subjectName}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  Row(
                                    children: [
                                      Text(
                                        'Trainers - ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.sp,
                                          color: AppColors.primaryColor,
                                        ),
                                      ),
                                      tempClass?.trainers == ''
                                          ? Text(
                                              'No Trainers allocated',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14.sp,
                                                color: AppColors.primaryColor,
                                              ),
                                            )
                                          : Text(
                                              '${tempClass?.trainers}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14.sp,
                                                color: AppColors.primaryColor,
                                              ),
                                            ),
                                    ],
                                  ),
                                  SizedBox(height: 10.h),
                                  Row(
                                    children: [
                                      Text(
                                        'Start Time - ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.sp,
                                          color: AppColors.green,
                                        ),
                                      ),
                                      Text(
                                        '${tempClass?.startTime?.toAmPM()}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.sp,
                                          color: AppColors.green,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'End Time - ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.sp,
                                          color: AppColors.green,
                                        ),
                                      ),
                                      Text(
                                        '${tempClass?.endTime?.toAmPM()}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.sp,
                                          color: AppColors.green,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 10.w),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: cubit.rescheduledStudentClasses?.length,
                          itemBuilder: (context, index) {
                            Class? tempClass =
                                cubit.rescheduledStudentClasses?[index];
                            return CustomContainer(
                              widget: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (tempClass?.rescheduled ?? false)
                                    Center(
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(8.h),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: AppColors.primaryColor,
                                              ),
                                            ),
                                            child: Text(
                                              'Rescheduled from ${tempClass?.oldDate?.toDDMMYYY()}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16.sp,
                                                color: AppColors.primaryColor,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10.h),
                                        ],
                                      ),
                                    ),
                                  Text(
                                    '${tempClass?.batchName}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  Text(
                                    '${tempClass?.branchName}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                  Text(
                                    '${tempClass?.courseName}, ${tempClass?.subjectName}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  Row(
                                    children: [
                                      Text(
                                        'Trainers - ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.sp,
                                          color: AppColors.primaryColor,
                                        ),
                                      ),
                                      tempClass?.trainers == ''
                                          ? Text(
                                              'No Trainers allocated',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14.sp,
                                                color: AppColors.primaryColor,
                                              ),
                                            )
                                          : Text(
                                              '${tempClass?.trainers}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14.sp,
                                                color: AppColors.primaryColor,
                                              ),
                                            ),
                                    ],
                                  ),
                                  SizedBox(height: 10.h),
                                  Row(
                                    children: [
                                      Text(
                                        'Start Time - ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.sp,
                                          color: AppColors.green,
                                        ),
                                      ),
                                      Text(
                                        '${tempClass?.startTime?.toAmPM()}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.sp,
                                          color: AppColors.green,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'End Time - ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.sp,
                                          color: AppColors.green,
                                        ),
                                      ),
                                      Text(
                                        '${tempClass?.endTime?.toAmPM()}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.sp,
                                          color: AppColors.green,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 10.w),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: cubit.rescheduledToStudentClasses?.length,
                          itemBuilder: (context, index) {
                            Class? tempClass =
                                cubit.rescheduledToStudentClasses?[index];
                            return CustomContainer(
                              widget: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (tempClass?.rescheduled ?? false)
                                    Center(
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(8.h),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: AppColors.primaryColor,
                                              ),
                                            ),
                                            child: Text(
                                              'Rescheduled to ${tempClass?.newDate?.toDDMMYYY()}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16.sp,
                                                color: AppColors.primaryColor,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10.h),
                                        ],
                                      ),
                                    ),
                                  Text(
                                    '${tempClass?.batchName}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  Text(
                                    '${tempClass?.branchName}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                  Text(
                                    '${tempClass?.courseName}, ${tempClass?.subjectName}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  Row(
                                    children: [
                                      Text(
                                        'Trainers - ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.sp,
                                          color: AppColors.primaryColor,
                                        ),
                                      ),
                                      tempClass?.trainers == ''
                                          ? Text(
                                              'No Trainers allocated',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14.sp,
                                                color: AppColors.primaryColor,
                                              ),
                                            )
                                          : Text(
                                              '${tempClass?.trainers}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14.sp,
                                                color: AppColors.primaryColor,
                                              ),
                                            ),
                                    ],
                                  ),
                                  SizedBox(height: 10.h),
                                  Row(
                                    children: [
                                      Text(
                                        'Start Time - ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.sp,
                                          color: AppColors.green,
                                        ),
                                      ),
                                      Text(
                                        '${tempClass?.startTime?.toAmPM()}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.sp,
                                          color: AppColors.green,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'End Time - ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.sp,
                                          color: AppColors.green,
                                        ),
                                      ),
                                      Text(
                                        '${tempClass?.endTime?.toAmPM()}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.sp,
                                          color: AppColors.green,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
