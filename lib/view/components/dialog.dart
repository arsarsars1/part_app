import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/app_colors.dart';

class CommonDialog {
  final BuildContext context;
  final String message;
  final String subMessage;
  final VoidCallback onTap;

  CommonDialog(
      {required this.context,
      required this.message,
      required this.subMessage,
      required this.onTap});

  void show() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.liteDark,
          contentPadding: EdgeInsets.zero,
          content: _Logout(
            message: message,
            subMessage: subMessage,
            onTap: onTap,
          ),
        );
      },
    );
  }
}

class _Logout extends StatelessWidget {
  final String message;
  final String subMessage;
  final VoidCallback onTap;

  const _Logout(
      {Key? key,
      required this.message,
      required this.subMessage,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
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
              message,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              subMessage,
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            SizedBox(
              height: 20.h,
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
                  onTap: onTap,
                  title: 'Ok',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
