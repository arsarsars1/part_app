import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/view/constants/app_colors.dart';
import 'package:part_app/view/trainer/trainer_salary_slips_home.dart';

class FinanceDashboard extends StatelessWidget {
  const FinanceDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 12.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: const Text('Finance'),
        ),
        SizedBox(
          height: 15.h,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 95.h,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(5),
                      image: const DecorationImage(
                          image: AssetImage('assets/images/accounts.png'),
                          fit: BoxFit.cover)
                      // gradient: LinearGradient(
                      //   begin: Alignment.topCenter,
                      //   end: Alignment.bottomCenter,
                      //   colors: [
                      //     const Color(0xFFF27121).withOpacity(0.83),
                      //     const Color(0xFFE94057).withOpacity(0.61),
                      //     const Color(0xFF8A2387).withOpacity(0.76),
                      //   ],
                      // ),
                      ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Accounts'),
                      SizedBox(
                        height: 4.h,
                      ),
                      Text(
                        'View All Financial Affairs',
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontSize: 12.sp,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(
                    context,
                    TrainerSalarySlipsHome.route,
                  ),
                  child: Container(
                    height: 95.h,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(5),
                       image: const DecorationImage(
                            image: AssetImage('assets/images/trainer_salary.png'),
                            fit: BoxFit.cover)
                      // gradient: LinearGradient(
                      //   begin: Alignment.topCenter,
                      //   end: Alignment.bottomCenter,
                      //   colors: [
                      //     const Color(0xFF0575E6).withOpacity(0.90),
                      //     const Color(0xFF640078).withOpacity(0.60),
                      //   ],
                      // ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Trainer Salary'),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          'Pay Salary To Trainers',
                          textAlign: TextAlign.start,
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontSize: 12.sp,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
