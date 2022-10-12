import 'package:flutter/material.dart';
import 'package:part_app/view/components/alert_bar.dart';

class Alert {
  final BuildContext context;

  Alert(this.context);

  void show({required String message}) {
    AlertBar.showFailureToast(
      context,
      message,
    );
  }
}

class _Snack extends StatelessWidget {
  final String message;

  const _Snack({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Text(message));
  }
}
