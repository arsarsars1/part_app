import 'package:flutter/material.dart';

class CheckBoxText extends StatefulWidget {
  final bool checked;
  final String title;
  final VoidCallback onTap;

  const CheckBoxText(
      {Key? key,
      required this.checked,
      required this.title,
      required this.onTap})
      : super(key: key);

  @override
  State<CheckBoxText> createState() => _CheckBoxTextState();
}

class _CheckBoxTextState extends State<CheckBoxText> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Row(
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: Icon(
              widget.checked
                  ? Icons.radio_button_checked
                  : Icons.radio_button_off_outlined,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(widget.title),
        ],
      ),
    );
  }
}
