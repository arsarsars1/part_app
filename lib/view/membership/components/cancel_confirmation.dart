import 'package:flutter/material.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/view/components/components.dart';

class _Cancel extends StatelessWidget {
  final VoidCallback onFree;

  const _Cancel({required this.onFree});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(20),
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
              'Are you sure you want to exit the application?',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(
              height: 32.h,
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
                  onTap: onFree,
                  title: 'Try For Free',
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}

class Cancel {
  final BuildContext context;
  final VoidCallback onFree;

  Cancel(this.context, {required this.onFree});

  void show() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.liteDark,
          contentPadding: EdgeInsets.zero,
          content: _Cancel(
            onFree: onFree,
          ),
        );
      },
    );
  }
}
