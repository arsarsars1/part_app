import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/model/data_model/enums.dart';
import 'package:part_app/view/constants/app_colors.dart';
import 'package:part_app/view/home/home.dart';
import 'package:part_app/view_model/authentication/auth_cubit.dart';

class SwitchAccount extends StatelessWidget {
  static const route = '/switch-account';

  const SwitchAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Your Academy'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (cubit.user?.adminDetail?.academy != null)
              InkWell(
                onTap: () {
                  cubit.accountType = AccountType.admin;
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Home.route,
                    (route) => false,
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.all(16),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.liteDark,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cubit.user?.adminDetail?.academy?.academyName ?? '',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontSize: 16.sm,
                            ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Administrator',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontSize: 12.sm,
                              color: AppColors.primaryColor,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            if (cubit.user?.trainerDetail != null)
              InkWell(
                onTap: () {
                  cubit.accountType = AccountType.trainer;
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Home.route,
                    (route) => false,
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.all(16),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.liteDark,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'WIP',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontSize: 16.sm,
                            ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Trainer',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontSize: 12.sm,
                              color: AppColors.primaryColor,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
