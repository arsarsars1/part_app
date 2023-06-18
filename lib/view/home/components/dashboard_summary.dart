import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/view/constants/app_colors.dart';

class SummaryDashboard extends StatelessWidget {
  const SummaryDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Overall Summary'),
          SizedBox(
            height: 8.h,
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Text('123'),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      'Total\nStudents',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 12.sp,
                          ),
                    ),
                  ],
                ),
                Container(
                  height: 60.h,
                  width: 1,
                  color: Colors.white.withOpacity(0.5),
                ),
                Column(
                  children: [
                    const Text('₹ 15,000'),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      'Daily\nCollection',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 12.sp,
                          ),
                    ),
                  ],
                ),
                Container(
                  height: 60.h,
                  width: 1,
                  color: Colors.white.withOpacity(0.5),
                ),
                Column(
                  children: [
                    const Text('₹ 1,25,000'),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      'Monthly\nCollection',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 12.sp,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
