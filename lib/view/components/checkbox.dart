import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:part_app/view/constants/constant.dart';

class TextCheckBox extends StatefulWidget {
  final ValueChanged<bool> onChange;
  final String title;
  final String? subTitle;
  final bool selected;

  const TextCheckBox(
      {Key? key,
      required this.onChange,
      required this.title,
      this.subTitle,
      required this.selected})
      : super(key: key);

  @override
  State<TextCheckBox> createState() => _TextCheckBoxState();
}

class _TextCheckBoxState extends State<TextCheckBox> {
  bool selected = false;

  @override
  void initState() {
    super.initState();

    selected = widget.selected;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.bodyText1,
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
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
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
          flex: 1,
          child: Container(
            height: 25.0,
            padding: const EdgeInsets.only(right: 16),
            child: FittedBox(
              fit: BoxFit.contain,
              child: CupertinoSwitch(
                trackColor: AppColors.grey500,
                value: selected,
                onChanged: (value) {
                  setState(() {
                    selected = !selected;
                  });
                  widget.onChange(selected);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
