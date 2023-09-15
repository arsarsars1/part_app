// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:part_app/model/data_model/dashboard_item.dart';
import 'package:part_app/view/components/alert.dart';
import 'package:part_app/view/constants/constant.dart';
import 'package:part_app/view_model/home/home_cubit.dart';

class DashboardIcons extends StatelessWidget {
  const DashboardIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, childAspectRatio: 0.9),
        itemCount: DefaultValues.dashboardItems.length,
        itemBuilder: (context, index) {
          DashboardItem item = DefaultValues.dashboardItems[index];
          return InkWell(
            onTap: () async {
              if (item.title == 'Branch Manager') {
                Alert(context).show(message: "Coming soon !!");
              } else {
                await Navigator.pushNamed(context, item.route);
                context.read<HomeCubit>().getDashboard();
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
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
                  Expanded(
                    flex: 5,
                    child: Text(
                      item.title,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 12.sp,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
