import 'package:flutter/material.dart';
import 'package:part_app/constants/constant.dart';

class FeeReminderButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color? color;
  final double? margin;
  final double? height;
  final int? count;
  final bool disabled;
  final EdgeInsets? padding;
  const FeeReminderButton({
    super.key,
    required this.title,
    required this.onTap,
    this.disabled = false,
    this.color,
    this.margin,
    this.height,
    this.count,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (disabled) ? null : onTap,
      child: Container(
        height: height ?? UIConstants.buttonHeight,
        decoration: BoxDecoration(
          color: (disabled)
              ? AppColors.primaryColor.withOpacity(.35)
              : AppColors.primaryColor,
          borderRadius: BorderRadius.circular(45),
        ),
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        margin: EdgeInsets.symmetric(
          horizontal: margin ?? 16.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (title.isNotEmpty)
              Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 12,
                    color: (disabled) ? Colors.white30 : Colors.white),
              ),
            if (title.isNotEmpty)
              const SizedBox(
                width: 10,
              ),
            Row(
              children: [
                Icon(
                  Icons.check,
                  size: 24,
                  color: (count ?? 0) >= 1
                      ? Colors.white.withOpacity((disabled) ? 0.35 : 1)
                      : Colors.black.withOpacity((disabled) ? 0.35 : 1),
                ),
                Icon(
                  Icons.check,
                  size: 24,
                  color: (count ?? 0) >= 2
                      ? Colors.white.withOpacity((disabled) ? 0.35 : 1)
                      : Colors.black.withOpacity((disabled) ? 0.35 : 1),
                ),
                Icon(
                  Icons.check,
                  size: 24,
                  color: (count ?? 0) >= 3
                      ? Colors.white.withOpacity((disabled) ? 0.35 : 1)
                      : Colors.black.withOpacity((disabled) ? 0.35 : 1),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
