import 'package:bank_test/app/app.dart';
import 'package:bank_test/data/get_it_locator.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Locator.setUpLocator();
  await locator.allReady();

  runApp(MyApp());
}
