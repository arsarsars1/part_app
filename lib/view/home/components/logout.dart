import 'package:flutter/material.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view_model/cubits.dart';

import '../../../view_model/profile_pic/cubit/profile_cubit.dart';

class _Logout extends StatelessWidget {
  const _Logout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.liteDark,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Are you sure you want to logout?',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(
              height: 32.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Button(
                  width: 95.w,
                  height: 36.h,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  title: 'Cancel',
                  border: true,
                ),
                SizedBox(
                  width: 32.w,
                ),
                Button(
                  width: 95.w,
                  height: 36.h,
                  onTap: () {
                    Navigator.pop(context);
                    context.read<AuthCubit>().logout();
                    context.read<ProfileCubit>().emitProfileInitial();
                  },
                  title: 'Yes',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Logout {
  final BuildContext context;

  Logout(this.context);

  void show() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.liteDark,
          contentPadding: EdgeInsets.zero,
          content: const _Logout(),
        );
      },
    );
  }
}
