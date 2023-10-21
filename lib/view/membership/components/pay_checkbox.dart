import 'package:flutter/material.dart';
import 'package:part_app/view/components/checkbox_text.dart';

class PayCheckBox extends StatefulWidget {
  final ValueChanged<bool> onChange;
  const PayCheckBox({Key? key, required this.onChange}) : super(key: key);

  @override
  State<PayCheckBox> createState() => _PayCheckBoxState();
}

class _PayCheckBoxState extends State<PayCheckBox> {
  bool online = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CheckBoxText(
          checked: online,
          title: 'Pay Online',
          onTap: () {
            setState(() {
              online = true;
            });
            widget.onChange(online);
          },
        ),
        CheckBoxText(
          checked: !online,
          title: 'Pay Offline',
          onTap: () {
            setState(() {
              online = false;
            });
            widget.onChange(online);
          },
        ),
      ],
    );
  }
}
