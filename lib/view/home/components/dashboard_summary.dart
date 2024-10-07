import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/constants/app_colors.dart';
import 'package:part_app/view_model/cubits.dart';

class SummaryDashboard extends StatelessWidget {
  const SummaryDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    int? totalStudents;
    String? dailyCollection;
    String? monthlyCollection;
    var cubit = context.read<HomeCubit>();
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        totalStudents = cubit.totalStudents;
        dailyCollection = cubit.dailyCollection;
        monthlyCollection = cubit.monthlyCollection;
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Overall Summary'),
              SizedBox(
                height: 15.h,
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.summaryBlue,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text('$totalStudents'),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          'Total\nStudents',
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
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
                        Text('₹ $dailyCollection'),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          'Daily\nCollection',
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
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
                        Text('₹ $monthlyCollection'),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          'Monthly\nCollection',
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
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
      },
    );
  }
}
