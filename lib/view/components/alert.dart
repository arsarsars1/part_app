import 'package:flutter/material.dart';

class Alert {
  final BuildContext context;

  Alert(this.context);

  void show({required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: _Snack(
          message: message,
        ),
      ),
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
