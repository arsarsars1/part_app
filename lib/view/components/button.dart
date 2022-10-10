import 'package:flutter/material.dart';
import 'package:part_app/view/constants/app_colors.dart';

class Button extends StatelessWidget {
  final VoidCallback? onTap;
  final String title;
  final double? width;
  final double? height;
  final double? fontSize;
  final Color? backgroundColor;

  const Button({
    Key? key,
    required this.onTap,
    required this.title,
    this.width,
    this.fontSize,
    this.backgroundColor,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: onTap != null
              ? backgroundColor ?? AppColors.primaryColor
              : AppColors.primaryColor.withOpacity(
                  0.35,
                ),
          borderRadius: BorderRadius.circular(100),
        ),
        height: height ?? 48,
        width: width ?? 142,
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color: Colors.white,
                  fontSize: fontSize,
                ),
          ),
        ),
      ),
    );
  }
}
