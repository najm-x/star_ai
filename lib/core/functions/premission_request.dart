import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> requsetPremission() async {
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  AndroidDeviceInfo androidDeviceInfo = await deviceInfoPlugin.androidInfo;
  if (Platform.isAndroid && androidDeviceInfo.version.sdkInt > 29) {
    await Permission.manageExternalStorage.request();
  } else {
    await Permission.storage.request();
  }
}
