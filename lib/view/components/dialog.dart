import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/app_colors.dart';

class CommonDialog {
  final BuildContext context;
  final String message;
  final String? subMessage;
  final VoidCallback onTap;
  final Color? subColor;
  final String? buttonText;
  final Widget? subContent;

  CommonDialog(
      {required this.context,
      required this.message,
      this.subMessage,
      this.subColor,
      this.buttonText,
      this.subContent,
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
            subColor: subColor,
            message: message,
            subMessage: subMessage,
            onTap: onTap,
            buttonText: buttonText,
            subContent: subContent,
          ),
        );
      },
    );
  }
}

class _Logout extends StatelessWidget {
  final String message;
  final String? subMessage;
  final VoidCallback onTap;
  final Color? subColor;
  final String? buttonText;
  final Widget? subContent;

  const _Logout({
    Key? key,
    required this.message,
    this.subMessage,
    required this.onTap,
    this.subColor,
    this.buttonText,
    this.subContent,
  }) : super(key: key);

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
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.h,
            ),
            if (subMessage != null)
              Text(
                subMessage!,
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: subColor ?? Colors.white,
                    ),
              ),
            if (subMessage != null)
              SizedBox(
                height: 20.h,
              ),
            if (subContent != null) subContent!,
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
                  title: buttonText ?? 'Ok',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
