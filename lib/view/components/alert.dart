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
