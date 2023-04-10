import 'package:flutter/material.dart';
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
          content: Logout(
            isCancel: true,
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

class Logout extends StatelessWidget {
  final String message;
  final String? subMessage;
  final VoidCallback onTap;
  final Color? subColor;
  final String? buttonText;
  final Widget? subContent;
  final bool? isCancel;
  const Logout({
    Key? key,
    required this.message,
    this.subMessage,
    required this.onTap,
    this.subColor,
    this.buttonText,
    this.subContent,
    this.isCancel = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const start = "Deactivate";
    final startIndex = message.indexOf(start);
    const middle = "From";
    final middleIndex = message.indexOf(middle, startIndex + start.length);
    const end = "?";
    final endIndex = message.indexOf(end, middleIndex + middle.length);
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
            message.contains('Do You Want To Deactivate') &&
                    message.contains('From')
                ? RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Do You Want To Deactivate',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        TextSpan(
                          text:
                              "${message.substring(startIndex + start.length, middleIndex)}\n",
                          style:
                              Theme.of(context).textTheme.bodyText2?.copyWith(
                                    fontWeight: FontWeight.w900,
                                  ),
                        ),
                        TextSpan(
                          text: 'From',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        TextSpan(
                          text:
                              "${message.substring(middleIndex + middle.length, endIndex)} ?",
                          style:
                              Theme.of(context).textTheme.bodyText2?.copyWith(
                                    fontWeight: FontWeight.w900,
                                  ),
                        ),
                      ],
                    ),
                  )
                : Text(
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
                if (isCancel!)
                  Row(
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
                    ],
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
