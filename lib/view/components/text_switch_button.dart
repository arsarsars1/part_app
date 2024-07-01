import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:part_app/constants/constant.dart';

class TextSwitchButton extends StatefulWidget {
  final ValueChanged<bool> onChange;
  final String title;
  final String? subTitle;
  final bool selected;
  final double horizontalPadding;

  const TextSwitchButton(
      {super.key,
      required this.onChange,
      required this.title,
      this.subTitle,
      required this.selected,
      this.horizontalPadding = 16});

  @override
  State<TextSwitchButton> createState() => _TextSwitchButtonState();
}

class _TextSwitchButtonState extends State<TextSwitchButton> {
  bool selected = false;

  @override
  void initState() {
    super.initState();

    selected = widget.selected;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 8,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: widget.horizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  maxLines: 2,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                ),
                if (widget.subTitle != null)
                  const SizedBox(
                    height: 8,
                  ),
                if (widget.subTitle != null)
                  Text(
                    widget.subTitle ?? '',
                    maxLines: 2,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.primaryColor,
                          fontSize: 12,
                        ),
                    overflow: TextOverflow.ellipsis,
                  ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            // height: 35.0,
            padding: const EdgeInsets.only(right: 16),
            child: FittedBox(
              fit: BoxFit.contain,
              child: CupertinoSwitch(
                thumbColor: AppColors.grey100,
                // widget.selected ? AppColors.grey900 : AppColors.grey100,
                trackColor: AppColors.grey500,
                activeColor: AppColors.green,
                value: widget.selected,
                onChanged: (value) {
                  widget.onChange(value);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
