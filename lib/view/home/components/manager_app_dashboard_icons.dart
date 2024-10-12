// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/model/data_base/data_base.dart';
import 'package:part_app/model/data_model/dashboard_item.dart';
import 'package:part_app/view/components/alert.dart';
import 'package:part_app/view/components/dialog.dart';
import 'package:part_app/view_model/authentication/auth_cubit.dart';
import 'package:part_app/view_model/home/home_cubit.dart';
import 'package:showcaseview/showcaseview.dart';

class ManagerAppDashboardIcons extends StatefulWidget {
  const ManagerAppDashboardIcons({super.key});

  @override
  State<ManagerAppDashboardIcons> createState() =>
      _ManagerAppDashboardIconsState();
}

class _ManagerAppDashboardIconsState extends State<ManagerAppDashboardIcons> {
  AuthCubit? authCubit;
  List<String> titles = [
    'Students',
    'Attendance',
    'Fees',
    'Trainers',
    'Today\'s Classes',
    'Class Links',
    'Leads',
    'Branches',
    'Batches'
  ];
  List<String> descriptions = [
    'Add, View and Edit Student details here',
    'Check and take attendance of each batch and students here.',
    'Add, Edit, Manage all your Fee related needs here',
    'See all the trainer related details here',
    'A quick view into daily academy schedule',
    'Add Link and notify students about an Online class',
    'Coming Soon',
    'Manage the Branch details here',
    'Add/Remove/Edit batches here',
  ];

  @override
  void initState() {
    authCubit = context.read<AuthCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      List<GlobalKey> tempkey = [];
      for (int i = 0; i < 9; i++) {
        tempkey.add(context.read<HomeCubit>().managerskeyCap[i]);
      }
      bool temp = Hive.box(Database.userBox).get("Showcase") ?? false;
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
            Hive.box(Database.userBox).put("Showcase", true);
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
            crossAxisCount: 3, childAspectRatio: 0.9),
        itemCount: DefaultValues.managerDashboardItems.length,
        itemBuilder: (context, index) {
          DashboardItem item = DefaultValues.managerDashboardItems[index];
          return Showcase(
            key: context.read<HomeCubit>().keyCap[index],
            title: titles[index],
            description: descriptions[index],
            child: InkWell(
              onTap: () async {
                if (item.title == 'Branch Manager') {
                  Alert(context).show(message: "Coming soon !!");
                } else {
                  await Navigator.pushNamed(context, item.route);
                  context.read<HomeCubit>().getDashboardForManagerApp(
                        managerId: authCubit
                                ?.user
                                ?.managerDetail?[authCubit?.managerIndex ?? 0]
                                .id ??
                            0,
                      );
                }
              },
              child: Container(
                margin: EdgeInsets.all(8.h),
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: AppColors.liteDark,
                  borderRadius: BorderRadius.circular(5),
                ),
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
                      "${item.title}\n",
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
