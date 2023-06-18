import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/view/constants/constant.dart';

class AccountCard extends StatelessWidget {
  final VoidCallback onTap;
  final String academyName;
  final String accountType;

  const AccountCard(
      {Key? key,
      required this.onTap,
      required this.accountType,
      required this.academyName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.liteDark,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              academyName,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 16.sp,
                  ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              accountType,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 12.sp,
                    color: AppColors.primaryColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
