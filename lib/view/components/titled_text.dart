import 'package:flutter/material.dart';
import 'package:part_app/view/constants/constant.dart';

class TitledText extends StatelessWidget {
  final String title;
  final String subText;
  final Color? titleColor;

  const TitledText(
      {Key? key, required this.title, required this.subText, this.titleColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
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
