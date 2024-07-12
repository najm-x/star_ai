import 'dart:io';

import 'package:business_tools/core/constant/app_strings.dart';
import 'package:business_tools/core/functions/message_permission_handel.dart';
import 'package:business_tools/core/functions/premission_request.dart';
import 'package:business_tools/core/public/widgets/dialog_permission.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

Future checkPermission(BuildContext context) async {
  bool isGranted;
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  AndroidDeviceInfo androidDeviceInfo = await deviceInfoPlugin.androidInfo;
  if (Platform.isAndroid && androidDeviceInfo.version.sdkInt > 29) {
    isGranted = await Permission.manageExternalStorage.isGranted;
  } else {
    isGranted = await Permission.storage.isGranted;
  }

  if (isGranted) {
    return;
  }
  String permissionMessage = await messagePremissionHandel();
  showDialog(
    // ignore: use_build_context_synchronously
    context: context,
    builder: (context) {
      return DialogPermission(
        title: AppStrings.accessRequired,
        permissionMessage: permissionMessage,
        iconData: Icons.folder_rounded,
        onPressed: () => requsetPremission(),
      );
    },
  );
}
