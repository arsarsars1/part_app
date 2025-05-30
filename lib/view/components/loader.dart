import 'package:flutter/material.dart';
import 'package:part_app/constants/app_colors.dart';

class LoadingView extends StatelessWidget {
  final String? message;
  final bool hideColor;
  final Color? color;

  const LoadingView(
      {super.key, this.message, this.hideColor = false, this.color});

  @override
  Widget build(BuildContext context) {
    return Material(
      color:
          color ?? (hideColor ? Colors.black : Colors.white.withOpacity(0.1)),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
                strokeWidth: 3,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              message ?? 'Loading...',
              style:
                  Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}

class Loader {
  final String? message;
  final BuildContext context;

  Loader(this.context, {this.message});

  void show() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return LoadingView(
          message: message,
        );
      },
    );
  }
}
