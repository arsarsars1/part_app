import 'package:flutter/material.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/view/branch/branch_list.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/manager/manager_page.dart';

class BranchOrManager extends StatelessWidget {
  static const route = '/branches_or_manager';

  const BranchOrManager({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonBar(title: 'Choose from below'),
      body: Padding(
        padding: EdgeInsets.all(15.w),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, BranchList.route),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.liteDark,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  height: 200.w,
                  width: 250.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.local_post_office,
                        size: 50.h,
                        color: Colors.white,
                      ),
                      SizedBox(height: 25.w),
                      Text(
                        'Branches',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50.w),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, ManagerPage.route),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.liteDark,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  height: 200.w,
                  width: 250.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.supervised_user_circle,
                        size: 50.h,
                        color: Colors.white,
                      ),
                      SizedBox(height: 25.w),
                      Text(
                        'Managers',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
