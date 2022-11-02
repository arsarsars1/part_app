import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:part_app/app.dart';
import 'package:part_app/model/data_base/data_base.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await initialize();

  runApp(const App());
}

Future initialize() async {
  await Hive.initFlutter();
  await Database().init();
}
