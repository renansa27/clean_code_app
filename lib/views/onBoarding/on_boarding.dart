import 'package:flutter/material.dart';
import 'package:tut_project/Views/resources/color_manager.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: const Center(child: Text('Welcome to on boarding Screen')),
    );
  }
}
