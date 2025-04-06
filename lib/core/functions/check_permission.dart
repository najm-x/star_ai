
import 'package:flutter/material.dart';

Future<bool> checkPermission(BuildContext context) async {
  // bool isGranted;
  // final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  // AndroidDeviceInfo androidDeviceInfo = await deviceInfoPlugin.androidInfo;
  // if (Platform.isAndroid && androidDeviceInfo.version.sdkInt > 29) {
  //   isGranted = await Permission.manageExternalStorage.isGranted;
  // } else {
  //   isGranted = await Permission.storage.isGranted;
  // }

  // if (isGranted) {
  //   return isGranted;
  // }
  // // ignore: use_build_context_synchronously
  // String permissionMessage = await messagePremissionHandel(context);
  // showDialog(
  //   // ignore: use_build_context_synchronously
  //   context: context,
  //   builder: (context) {
  //     return DialogPermission(
  //       title: AppLocalizations.of(context)!.accessRequired,
  //       permissionMessage: permissionMessage,
  //       iconData: Icons.folder_rounded,
  //       onPressed: () async {
  //         context.pop();
  //         await requsetPremission();
  //       },
  //     );
  //   },
  // );
  return true;
}
