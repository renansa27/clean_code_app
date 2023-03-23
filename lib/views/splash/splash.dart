import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tut_project/views/resources/assets_manager.dart';
import 'package:tut_project/views/resources/color_manager.dart';
import 'package:tut_project/views/resources/routes_manager.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer? _time;

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _time?.cancel();
    super.dispose();
  }

  _startDelay() {
    _time = Timer(const Duration(seconds: 2), _goNext);
  }

  void _goNext() {
    Navigator.pushReplacementNamed(context, Routes.loginRoute);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(
        child: Image(
          image: AssetImage(ImageAssets.splashImage),
        ),
      ),
    );
  }
}
