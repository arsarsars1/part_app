import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/model/data_model/student_dashboard.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/constants/app_colors.dart';
import 'package:part_app/view_model/cubits.dart';

class WhatsHappeningToday extends StatelessWidget {
  const WhatsHappeningToday({super.key});

  @override
  Widget build(BuildContext context) {
    var homeCubit = context.read<HomeCubit>();
    var authCubit = context.read<AuthCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            'What\'s Happening Today',
            style: TextStyle(fontSize: 16.sp),
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            DateTime.now().toDateString(),
            style: TextStyle(fontSize: 10.sp),
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        FutureBuilder(
          future: homeCubit.getTempStudentAppDashboard(
              studentId: authCubit.user?.studentDetail?[0].id),
          builder: (BuildContext context,
              AsyncSnapshot<StudentDashboard?> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: homeCubit.studentDashboardItems?.classes?.length,
                itemBuilder: (context, index) {
                  ClassDetails? classDetails =
                      homeCubit.studentDashboardItems?.classes?[index];
                  return Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: AppColors.liteDark,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${classDetails?.batchName}',
                          style: TextStyle(fontSize: 14.sp),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          '${classDetails?.branchName}',
                          style: TextStyle(fontSize: 11.sp),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          homeCubit.createTrainerString(classDetails?.trainers),
                          style: TextStyle(
                              fontSize: 11.sp, color: AppColors.primaryColor),
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${classDetails?.startTime?.toAmPM()} - ${classDetails?.endTime?.toAmPM()}',
                              style: TextStyle(fontSize: 12.sp),
                            ),
                            Text(
                              classDetails?.status == 'upcoming'
                                  ? 'Upnext'
                                  : 'Completed',
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: classDetails?.status == 'upcoming'
                                    ? AppColors.disabledColor
                                    : AppColors.green,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        )
      ],
    );
  }
}
