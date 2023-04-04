import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:part_app/model/data_model/dashboard_item.dart';
import 'package:part_app/view/constants/constant.dart';

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
          crossAxisCount: 3,
        ),
        itemCount: DefaultValues.dashboardItems.length,
        itemBuilder: (context, index) {
          DashboardItem item = DefaultValues.dashboardItems[index];
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, item.route);
            },
            child: Container(
              margin: EdgeInsets.all(8.h),
              padding: EdgeInsets.all(16.h),
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
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontSize: 12.sm,
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
