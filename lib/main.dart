import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:part_app/firebase_options.dart';
import 'package:part_app/model/data_base/data_base.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import 'app.dart';
import 'flavors.dart';

final _configuration =
    PurchasesConfiguration("appl_dHvEeSdOEnQSzijfNnuQkGAUOhv");

void main() async {
  debugPrint('main called');
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Purchases.configure(_configuration);
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
