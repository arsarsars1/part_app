import 'package:flutter/material.dart';

class PayCheckBox extends StatefulWidget {
  const PayCheckBox({Key? key}) : super(key: key);

  @override
  State<PayCheckBox> createState() => _PayCheckBoxState();
}

class _PayCheckBoxState extends State<PayCheckBox> {
  bool online = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: online,
          onChanged: (value) {},
        )
      ],
    );
  }
}
