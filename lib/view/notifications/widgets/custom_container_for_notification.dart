import 'package:flutter/material.dart';

class CustomContainerForNotification extends StatelessWidget {
  const CustomContainerForNotification({this.widget, this.color, super.key});
  final Widget? widget;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
      child: widget,
    );
  }
}
