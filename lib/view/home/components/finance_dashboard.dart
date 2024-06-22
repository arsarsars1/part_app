import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/view/components/alert.dart';
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
                child: GestureDetector(
                  onTap: () {
                    Alert(context).show(message: "Coming soon !!");
                  },
                  child: Container(
                    height: 100.h,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(5),
                      image: const DecorationImage(
                          image: AssetImage('assets/images/accounts.png'),
                          fit: BoxFit.cover),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Accounts'),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          'View All Financial Affairs',
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
                    height: 100.h,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(5),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/trainer_salary.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
