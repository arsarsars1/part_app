import 'package:flutter/material.dart';
import 'package:part_app/view/constants/app_colors.dart';

class _LoadingView extends StatelessWidget {
  final String? message;

  const _LoadingView({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white.withOpacity(0.1),
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
                  Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 16),
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
        return _LoadingView(
          message: message,
        );
      },
    );
  }
}
