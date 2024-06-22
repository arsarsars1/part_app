import 'package:flutter/material.dart';
import 'package:part_app/constants/constant.dart';

class LargeButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color? color;
  final double? margin;
  final double? height;
  final EdgeInsets? marginPadding;

  const LargeButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.color,
    this.height,
    this.margin,
    this.marginPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? UIConstants.buttonHeight,
        decoration: BoxDecoration(
          color: color ?? AppColors.primaryColor,
          borderRadius: BorderRadius.circular(45),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        margin: marginPadding ??
            EdgeInsets.symmetric(
              horizontal: margin ?? 16.0,
            ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 12,
                      ),
                ),
              ),
            ),
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
