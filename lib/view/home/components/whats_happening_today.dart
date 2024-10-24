import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/model/data_model/student_dashboard.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/home/components/student_app_home_fee_list_item.dart';
import 'package:part_app/view_model/cubits.dart';
import 'package:url_launcher/url_launcher.dart';

class WhatsHappeningToday extends StatelessWidget {
  const WhatsHappeningToday({super.key});

  @override
  Widget build(BuildContext context) {
    List<ClassDetails?> classes;
    List<BatchFeeInvoice?> batchInvoice;

    var homeCubit = context.read<HomeCubit>();
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        classes = homeCubit.studentClasses ?? [];
        batchInvoice = homeCubit.studentBatches ?? [];
        if (state is DashboardLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
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
                classes.isNotEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: classes.length,
                        itemBuilder: (context, index) {
                          ClassDetails? classDetails = classes[index];
                          return Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 14.h),
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
                                  style: TextStyle(fontSize: 16.sp),
                                ),
                                SizedBox(height: 10.h),
                                Text(
                                  '${classDetails?.branchName}',
                                  style: TextStyle(fontSize: 10.sp),
                                ),
                                SizedBox(height: 10.h),
                                Text(
                                  homeCubit.createTrainerString(
                                      classDetails?.trainers),
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      color: AppColors.primaryColor),
                                ),
                                SizedBox(height: 10.h),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${classDetails?.startTime} - ${classDetails?.endTime}',
                                      style: TextStyle(fontSize: 12.sp),
                                    ),
                                    Text(
                                      classDetails?.status == 'upcoming'
                                          ? 'Upnext'
                                          : 'Completed',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            classDetails?.status == 'upcoming'
                                                ? AppColors.violet
                                                : AppColors.green,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    SizedBox(height: 10.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Click to join  :  ',
                                          style: TextStyle(fontSize: 11.sp),
                                        ),
                                        classDetails?.classLink != null
                                            ? Expanded(
                                                child: InkWell(
                                                  child: Text(
                                                    '${classDetails?.classLink}',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyLarge
                                                        ?.copyWith(
                                                          color: AppColors
                                                              .defaultBlue,
                                                        ),
                                                  ),
                                                  onTap: () => launchUrl(
                                                    Uri.parse(
                                                        '${classDetails?.classLink}'),
                                                  ),
                                                ),
                                              )
                                            : const Text('No Class link added'),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      )
                    : const Center(child: Text('No Data Available')),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 25.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(
                    'Pending Fees',
                    style: TextStyle(fontSize: 16.sp),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                batchInvoice.isNotEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: batchInvoice.length,
                        itemBuilder: (context, index) {
                          BatchFeeInvoice? feeDetails = batchInvoice[index];
                          return StudentAppHomeFeeListItem(
                            fee: feeDetails,
                            onTap: () {},
                          );
                        },
                      )
                    : const Center(child: Text('No Fees Pending')),
              ],
            ),
          ],
        );
      },
    );
  }
}
