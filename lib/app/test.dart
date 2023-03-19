import 'package:flutter/material.dart';
import 'package:tut_project/app/app.dart';
import 'package:tut_project/views/common/log.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  void updateAppState() {
    MyApp.instance;
  }

  void getAppState() {
    log.d(MyApp.instance.appState); // 10
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
