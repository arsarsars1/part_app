import 'dart:io';

import 'package:flutter/material.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/view/components/dialog.dart';

class AlertBox {
  AlertBox._();
  static void showErrorAlert(BuildContext context,
      {String? message = "Oops! No Internet!",
      String? subMessage,
      VoidCallback? onTap,
      Color? subColor,
      String? buttonText,
      Widget? subContent}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.liteDark,
          contentPadding: EdgeInsets.zero,
          content: Logout(
            subColor: subColor,
            message: message ?? "",
            subMessage: subMessage,
            onTap: onTap ??
                () {
                  Navigator.pop(context);
                },
            buttonText: buttonText,
            subContent: subContent,
          ),
        );
      },
    );
  }

  static void showConfirmation(BuildContext context,
      {String? message = "",
      String? subMessage,
      VoidCallback? onTap,
      VoidCallback? onCancelTap,
      Color? subColor,
      String? buttonText,
      bool? hasClose,
      Widget? subContent}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.liteDark,
          contentPadding: EdgeInsets.zero,
          content: Logout(
            subColor: subColor,
            message: message ?? "",
            subMessage: subMessage,
            hasClose: hasClose,
            onCancelTap: onCancelTap ??
                () {
                  Navigator.pop(context);
                },
            onTap: onTap ??
                () {
                  exit(0);
                },
            buttonText: buttonText,
            subContent: subContent,
          ),
        );
      },
    );
  }
}
