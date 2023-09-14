import 'package:flutter/material.dart';
import 'package:part_app/view/constants/constant.dart';

class LargeButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color? color;
  final double? margin;

  const LargeButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.color,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color ?? AppColors.primaryColor,
          borderRadius: BorderRadius.circular(45),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        margin: EdgeInsets.symmetric(
          horizontal: margin ?? 16.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 12,
                    ),
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.keyboard_arrow_right,
              size: 24,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
