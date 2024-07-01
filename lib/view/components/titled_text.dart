import 'package:flutter/material.dart';
import 'package:part_app/constants/constant.dart';

class TitledText extends StatelessWidget {
  final String title;
  final String subText;
  final Color? titleColor;

  const TitledText(
      {super.key, required this.title, required this.subText, this.titleColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: titleColor ?? AppColors.primaryColor,
                  fontSize: 12,
                ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(subText),
        ],
      ),
    );
  }
}
