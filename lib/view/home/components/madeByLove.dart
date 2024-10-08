import 'package:flutter/material.dart';
import 'package:part_app/constants/app_colors.dart';
import 'package:part_app/view/components/components.dart';

class MadeByLove extends StatelessWidget {
  const MadeByLove({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 14.h),
      child: Text(
        "Made with ❤ By PartApp",
        textAlign: TextAlign.center,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: 12.sp,
              color: AppColors.textColor,
            ),
      ),
    );
  }
}
