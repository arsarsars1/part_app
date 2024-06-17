import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/constants/app_colors.dart';

class Button extends StatelessWidget {
  final VoidCallback? onTap;
  final String title;
  final double? width;
  final double? height;
  final double? fontSize;
  final Color? backgroundColor;
  final bool border;
  final bool disable;
  final TextStyle? style;
  final bool fullWidget;

  const Button({
    Key? key,
    required this.onTap,
    required this.title,
    this.width,
    this.fontSize,
    this.border = false,
    this.backgroundColor,
    this.disable = false,
    this.height,
    this.style,
    this.fullWidget = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(100),
      child: Container(
        decoration: BoxDecoration(
          color: border
              ? null
              : !disable
                  ? backgroundColor ?? AppColors.primaryColor
                  : AppColors.primaryColor.withOpacity(
                      0.35,
                    ),
          border: border
              ? Border.all(
                  color: AppColors.primaryColor,
                  width: 2,
                )
              : null,
          borderRadius: BorderRadius.circular(100),
        ),
        height: height ?? 48.h,
        width: width ?? 142.w,
        child: Center(
          child: Text(
            title,
            style: style ??
                Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.white,
                      fontSize: fontSize,
                    ),
          ),
        ),
      ),
    ).expandButton(shouldExpand: fullWidget);
  }
}
