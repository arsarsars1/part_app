import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:part_app/view/constants/constant.dart';

class RetainStudentCheckButton extends StatefulWidget {
  final ValueChanged<bool> onChange;
  final ValueChanged<int> onNumberChange;
  final String? initialValue;
  final bool selected;

  const RetainStudentCheckButton(
      {Key? key,
      required this.onChange,
      required this.onNumberChange,
      this.initialValue,
      this.selected = false})
      : super(key: key);

  @override
  State<RetainStudentCheckButton> createState() =>
      RetainStudentCheckButtonState();
}

class RetainStudentCheckButtonState extends State<RetainStudentCheckButton> {
  bool selected = true;

  @override
  void initState() {
    super.initState();
    selected = widget.selected;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Retain students of batch',
                  maxLines: 2,
                  style: Theme.of(context).textTheme.bodyLarge,
                  overflow: TextOverflow.ellipsis,
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
        ),
      ],
    );
  }
}
