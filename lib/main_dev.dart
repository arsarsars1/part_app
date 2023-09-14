import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:part_app/firebase_options.dart';
import 'package:part_app/model/data_base/data_base.dart';
import 'package:device_preview/device_preview.dart';

import 'app.dart';
import 'flavors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await initialize();
  F.appFlavor = Flavor.dev;
  // runApp(const App());
   runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const App(), // Wrap your app
    ),
  );
}

Future initialize() async {
  await Hive.initFlutter();
  await Database().init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
