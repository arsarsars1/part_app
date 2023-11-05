import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:part_app/firebase_options.dart';
import 'package:part_app/model/data_base/data_base.dart';

import 'app.dart';
import 'flavors.dart';

void main() async {
  debugPrint('main dev called');
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await initialize();
  F.appFlavor = Flavor.dev;
  runApp(const App());
}

Future initialize() async {
  await Hive.initFlutter();
  await Database().init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
}
