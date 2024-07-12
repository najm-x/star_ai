import 'dart:io';

import 'package:business_tools/core/constant/app_strings.dart';
import 'package:device_info_plus/device_info_plus.dart';

Future<String> messagePremissionHandel() async {
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  AndroidDeviceInfo androidDeviceInfo = await deviceInfoPlugin.androidInfo;
  if (Platform.isAndroid && androidDeviceInfo.version.sdkInt > 29) {
    return AppStrings.permissionRequiresA11;
  } else {
    return AppStrings.permissionRequires;
  }
}
