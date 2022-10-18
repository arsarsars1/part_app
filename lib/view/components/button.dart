import 'package:flutter/material.dart';
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
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
