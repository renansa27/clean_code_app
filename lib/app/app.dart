import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tut_project/app/di.dart';
import 'package:tut_project/views/login/cubit/auth_cubit.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (c) => getItInstance<AuthCubit>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.splashRoute,
        theme: getApplicationTheme(),
      ),
    );
    /* return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: getApplicationTheme(),
    ); */
  }
}
