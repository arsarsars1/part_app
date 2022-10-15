import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:part_app/view/constants/app_colors.dart';

class AlertBar {
  AlertBar._();

  static void showToast(BuildContext context, String? message, Color bgColor,
      {IconData? icon,
      double? radius,
      Color? itemsColor,
      VoidCallback? onTap}) {
    FToast fToast = FToast();
    fToast.init(context);
    Widget toast = InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 25.0),
          color: bgColor,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon ?? Icons.check,
              color: itemsColor ?? Colors.white,
            ),
            const SizedBox(
              width: 12.0,
            ),
            Text(message!,
                style: Theme.of(context).textTheme.headline4?.copyWith(
                      color: itemsColor ?? Colors.white,
                      fontSize: 20,
                    )),
          ],
        ),
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );
  }

  static void showFailureToast(
    BuildContext context,
    String? message,
  ) {
    FToast fToast = FToast();
    fToast.init(context);
    Widget toast = Container(
      margin: const EdgeInsets.only(top: kToolbarHeight + kToolbarHeight),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              message!,
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    color: Colors.white,
                    fontSize: 16,
                  ),
            ),
          ),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.TOP,
      toastDuration: const Duration(seconds: 4),
    );
  }
}
