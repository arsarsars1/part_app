import 'dart:async';

import 'package:flutter/material.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/home/home.dart';

class ContinueButton extends StatefulWidget {
  const ContinueButton({Key? key}) : super(key: key);

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
    timer = Timer(const Duration(seconds: 1), () {
      if (current == 0) {
        timer?.cancel();
        Navigator.pushNamed(context, Home.route);
      }
      setState(() {
        current--;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Button(
      onTap: () {
        timer?.cancel();
        Navigator.pushNamed(context, Home.route);
      },
      title: 'Continue (${current}s)',
    );
  }
}
