import 'dart:io';

import 'package:flutter/material.dart';
import 'package:part_app/view/components/dialog.dart';
import 'package:part_app/view/constants/app_colors.dart';

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
