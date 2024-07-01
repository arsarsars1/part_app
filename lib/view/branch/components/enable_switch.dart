import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:part_app/constants/constant.dart';

class EnableSwitch extends StatefulWidget {
  final bool enable;
  final ValueChanged<bool> onChange;

  const EnableSwitch({super.key, required this.enable, required this.onChange});

  @override
  State<EnableSwitch> createState() => _EnableSwitchState();
}

class _EnableSwitchState extends State<EnableSwitch> {
  bool selected = false;

  @override
  void initState() {
    super.initState();
    selected = widget.enable;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Disable/Enable Branch',
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
    );
  }
}
