import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/app_colors.dart';
import 'package:part_app/view_model/cubits.dart';

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
            const Text('Are you sure you want to logout?'),
            const SizedBox(
              height: 32,
            ),
            Row(
              children: [
                Button(
                  height: 36,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  title: 'Cancel',
                  border: true,
                ),
                const SizedBox(
                  width: 32,
                ),
                Button(
                  height: 36,
                  onTap: () {
                    Navigator.pop(context);
                    context.read<AuthCubit>().logout();
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
