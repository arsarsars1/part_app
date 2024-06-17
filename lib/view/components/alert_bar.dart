import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:part_app/view/constants/app_colors.dart';

class AlertBar {
  AlertBar._();

  static void showFailureToast(BuildContext context, String? message) {
    FToast fToast = FToast();
    fToast.init(context);
    fToast.removeQueuedCustomToasts();
    Widget toast = Container(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              message!,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.white,
                    fontSize: 14,
                  ),
            ),
          ),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.TOP,
      toastDuration: const Duration(seconds: 2),
    );
  }
}
