import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/model/data_model/branch_manager_response.dart';
import 'package:part_app/model/data_model/enums.dart';
import 'package:part_app/model/data_model/students_response.dart';
import 'package:part_app/model/data_model/trainer_response.dart';
import 'package:part_app/view/account/account_card.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/home/home.dart';
import 'package:part_app/view/home/manager_app_home.dart';
import 'package:part_app/view/home/student_app_home.dart';
import 'package:part_app/view/home/trainer_app_home.dart';
import 'package:part_app/view_model/authentication/auth_cubit.dart';

import '../../model/data_base/data_base.dart';

class SwitchAccount extends StatelessWidget {
  static const route = '/switch-account';

  const SwitchAccount({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthCubit>();
    Database database = Database();
    return Scaffold(
      appBar: const CommonBar(
        title: 'Select Your Academy',
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: kToolbarHeight),
          child: Center(
            child: ListView(
              shrinkWrap: true,
              children: [
                if (cubit.user?.adminDetail?.academy != null)
                  InkWell(
                    onTap: () async {
                      await DefaultCacheManager().emptyCache();
                      cubit.accountType = AccountType.admin;
                      database.setUserType('admin');
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        Home.route,
                        (route) => false,
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.all(16),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.liteDark,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cubit.user?.adminDetail?.academy?.academyName ?? '',
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontSize: 16.sp,
                                    ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            '${cubit.user?.adminDetail?.name}, Administrator',
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontSize: 12.sp,
                                      color: AppColors.primaryColor,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ),
                if (cubit.user?.trainerDetail != null &&
                    cubit.user!.trainerDetail!.isNotEmpty)
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: cubit.user?.trainerDetail?.length,
                    itemBuilder: (context, index) {
                      Trainer trainer = cubit.user!.trainerDetail![index];
                      return AccountCard(
                        onTap: () async {
                          await DefaultCacheManager().emptyCache();
                          cubit.accountType = AccountType.trainer;
                          database.setUserType('trainer');
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            TrainerAppHome.route,
                            (route) => false,
                          );
                        },
                        accountType: '${trainer.name}, Trainer',
                        academyName: trainer.academy?.academyName ?? '',
                      );
                    },
                  ),
                if (cubit.user?.studentDetail != null &&
                    cubit.user!.studentDetail!.isNotEmpty)
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: cubit.user?.studentDetail?.length,
                    itemBuilder: (context, index) {
                      StudentDetail student = cubit.user!.studentDetail![index];
                      return AccountCard(
                        onTap: () async {
                          await DefaultCacheManager().emptyCache();
                          cubit.studentIndex = index;
                          cubit.accountType = AccountType.student;
                          database.setUserType('student');
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            StudentAppHome.route,
                            (route) => false,
                          );
                        },
                        accountType: '${student.name}, Student',
                        academyName: student.academy?.academyName ?? '',
                      );
                    },
                  ),
                if (cubit.user?.managerDetail != null &&
                    cubit.user!.managerDetail!.isNotEmpty)
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: cubit.user?.managerDetail?.length,
                    itemBuilder: (context, index) {
                      BranchManagerResponse manager =
                          cubit.user!.managerDetail![index];
                      return AccountCard(
                        onTap: () async {
                          await DefaultCacheManager().emptyCache();
                          cubit.managerIndex = index;
                          cubit.accountType = AccountType.branchManager;
                          database.setUserType('manager');
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            ManagerAppHome.route,
                            (route) => false,
                          );
                        },
                        accountType: '${manager.name}, Manager',
                        academyName: manager.academy?.academyName ?? '',
                      );
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
