import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:business_tools/l10n/app_localizations.dart';

Future<String> messagePremissionHandel(BuildContext context) async {
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  AndroidDeviceInfo androidDeviceInfo = await deviceInfoPlugin.androidInfo;
  if (Platform.isAndroid && androidDeviceInfo.version.sdkInt > 29) {
    // ignore: use_build_context_synchronously
    return AppLocalizations.of(context)!.permissionRequires;
  } else {
    // ignore: use_build_context_synchronously
    return AppLocalizations.of(context)!.permissionRequires;
  }
}
