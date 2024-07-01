import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'part',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 42.sp,
                ),
          ),
          TextSpan(
            text: 'app.in',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 20.sp,
                ),
          ),
        ],
      ),
    );
  }
}
