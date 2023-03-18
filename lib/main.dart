import 'package:flutter/material.dart';
import 'package:tut_project/app/app.dart';
import 'package:tut_project/app/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //init dependency injection
  await initAppModule();
  runApp(MyApp());
}
