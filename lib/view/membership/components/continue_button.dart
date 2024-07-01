import 'dart:async';

import 'package:flutter/material.dart';
import 'package:part_app/view/components/components.dart';

class ContinueButton extends StatefulWidget {
  final VoidCallback onTap;
  const ContinueButton({super.key, required this.onTap});

  @override
  State<ContinueButton> createState() => _ContinueButtonState();
}

class _ContinueButtonState extends State<ContinueButton> {
  int current = 5;
  Timer? timer;

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        current--;
      });
      if (current == 0) {
        timer?.cancel();
        widget.onTap();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Button(
      onTap: () {
        timer?.cancel();
        widget.onTap();
      },
      title: 'Continue (${current}s)',
    );
  }
}
