import 'package:flutter/material.dart';
import 'package:part_app/view/constants/app_colors.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({this.widget, super.key});
  final Widget? widget;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.liteDark,
        borderRadius: BorderRadius.circular(4),
      ),
      child: widget,
    );
  }
}
