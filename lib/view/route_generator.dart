import 'package:flutter/material.dart';
import 'package:part_app/view/auth/login.dart';
import 'package:part_app/view/home/home.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case Login.route:
        return MaterialPageRoute(
          builder: (_) => const Login(),
          settings: settings,
        );
      case Home.route:
        return MaterialPageRoute(
          // todo change to home
          builder: (_) => const Login(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Login(),
          settings: settings,
        );
    }
  }
}
