import 'package:flutter/material.dart';
import 'package:part_app/view/constants/constant.dart';

class FeeReminderButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color? color;
  final double? margin;
  final int? count;
  final bool? disabled;
  const FeeReminderButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.disabled = false,
    this.color,
    this.margin,
    this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (disabled ?? false) ? null : onTap,
      child: Container(
        decoration: BoxDecoration(
          color: (disabled ?? false)
              ? AppColors.primaryColor.withOpacity(.35)
              : AppColors.primaryColor,
          borderRadius: BorderRadius.circular(45),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        margin: EdgeInsets.symmetric(
          horizontal: margin ?? 16.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 12,
                  color: (disabled ?? false) ? Colors.white30 : Colors.white),
            ),
            const SizedBox(
              width: 10,
            ),
            Row(
              children: [
                Icon(
                  Icons.check,
                  size: 24,
                  color: (count ?? 0) >= 1
                      ? Colors.white.withOpacity((disabled ?? false) ? 0.35 : 1)
                      : Colors.black
                          .withOpacity((disabled ?? false) ? 0.35 : 1),
                ),
                Icon(
                  Icons.check,
                  size: 24,
                  color: (count ?? 0) >= 2
                      ? Colors.white.withOpacity((disabled ?? false) ? 0.35 : 1)
                      : Colors.black
                          .withOpacity((disabled ?? false) ? 0.35 : 1),
                ),
                Icon(
                  Icons.check,
                  size: 24,
                  color: (count ?? 0) >= 3
                      ? Colors.white.withOpacity((disabled ?? false) ? 0.35 : 1)
                      : Colors.black
                          .withOpacity((disabled ?? false) ? 0.35 : 1),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
