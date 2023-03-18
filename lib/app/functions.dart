import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:tut_project/domain/model/model.dart';

Future<DeviceInfo> getDeviceDetails() async {
  String name = "unknow";
  String identifier = "unknow";
  String version = "unknow";
  DeviceInfoPlugin deviceIndoPlugin = DeviceInfoPlugin();

  try {
    if (Platform.isAndroid) {
      AndroidDeviceInfo build = await deviceIndoPlugin.androidInfo;
      name = "${build.brand} ${build.model}";
      identifier = build.id ?? identifier;
      version = build.version.toString();
    } else if (Platform.isIOS) {
      IosDeviceInfo build = await deviceIndoPlugin.iosInfo;
      name = "${build.name} ${build.model}";
      identifier = build.identifierForVendor ?? identifier;
      version = build.systemVersion.toString();
    }
  } on PlatformException catch (e) {
    //return default data here
    return DeviceInfo(name, identifier, version);
  }
  return DeviceInfo(name, identifier, version);
}
