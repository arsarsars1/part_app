// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/model/data_base/data_base.dart';
import 'package:part_app/model/data_model/dashboard_item.dart';
import 'package:part_app/view/components/dialog.dart';
import 'package:part_app/view_model/cubits.dart';
import 'package:showcaseview/showcaseview.dart';

class StudentAppDashboardIcons extends StatefulWidget {
  const StudentAppDashboardIcons({Key? key}) : super(key: key);

  @override
  State<StudentAppDashboardIcons> createState() =>
      _StudentAppDashboardIconsState();
}

class _StudentAppDashboardIconsState extends State<StudentAppDashboardIcons> {
  List<String> titles = ['Attendance', 'Fees', 'Batches'];
  List<String> descriptions = [
    'Check Attendance of each Batch here',
    'View Fees related details here',
    'See Batch details here',
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      List<GlobalKey> tempkey = [];
      for (int i = 0; i < 3; i++) {
        tempkey.add(context.read<HomeCubit>().studentkKeyCap[i]);
      }
      bool temp =
          Hive.box(Database.userBox).get("Student App Showcase") ?? false;
      if (temp == false) {
        CommonDialog(
          context: context,
          message: 'Do you want to see the features available in the app ?',
          buttonText: 'Proceed',
          subColor: AppColors.primaryColor,
          onTap: () {
            Navigator.pop(context);
            ShowCaseWidget.of(context).startShowCase(tempkey);
          },
          onCancelTap: () {
            Hive.box(Database.userBox).put("Student App Showcase", true);
            Navigator.pop(context);
          },
        ).show();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: DefaultValues.studentDashboardItems.length,
        itemBuilder: (context, index) {
          DashboardItem item = DefaultValues.studentDashboardItems[index];
          return Showcase(
            key: context.read<HomeCubit>().studentkKeyCap[index],
            title: titles[index],
            description: descriptions[index],
            child: InkWell(
              onTap: () async {
                await Navigator.pushNamed(context, item.route);
                context.read<HomeCubit>().getStudentAppDashboard(
                    studentId: context
                        .read<AuthCubit>()
                        .user
                        ?.studentDetail?[context.read<AuthCubit>().studentIndex]
                        .id);
              },
              child: Container(
                margin: EdgeInsets.all(8.h),
                decoration: BoxDecoration(
                  color: AppColors.liteDark,
                  borderRadius: BorderRadius.circular(5),
                ),
                height: 98.h,
                width: 98.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: item.color,
                        shape: BoxShape.circle,
                      ),
                      width: 32.w,
                      height: 32.h,
                      child: Center(
                        child: SvgPicture.asset(
                          item.asset,
                          width: 16.h,
                          height: 16.h,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      item.title,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 12.sp,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
