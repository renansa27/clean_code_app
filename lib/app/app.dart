import 'package:flutter/material.dart';
import 'package:tut_project/views/resources/routes_manager.dart';
import 'package:tut_project/views/resources/theme_manager.dart';

class MyApp extends StatefulWidget {
  final int? appState;
  const MyApp._internal({this.appState = 0}); // private named constructor
  static MyApp instance =
      const MyApp._internal(appState: 0); // single instance -- singleton

  factory MyApp() => instance; // factory for the class instance

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: getApplicationTheme(),
    );
  }
}
