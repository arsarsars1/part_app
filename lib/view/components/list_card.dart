import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/view/constants/constant.dart';

class ListCard extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String subTitle;
  final String? suffixText;
  final Widget? suffix;

  const ListCard({
    Key? key,
    required this.onTap,
    required this.title,
    required this.subTitle,
    this.suffixText,
    this.suffix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(vertical: 8.w, horizontal: 16.h),
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
          vertical: 16.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.liteDark,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.primaryColor,
                        ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    subTitle,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 12.sp,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            if (suffix != null) suffix!
          ],
        ),
      ),
    );
  }
}
