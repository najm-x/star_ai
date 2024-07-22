import 'package:business_tools/core/services/app_services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showcaseview/showcaseview.dart';

showCaseInit(BuildContext context, String sharedKey, List<GlobalKey> globalKeys) {
  if (sl<SharedPreferences>().getBool(sharedKey) == null) {
    sl<SharedPreferences>().setBool(sharedKey, true);
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => Future.delayed(const Duration(milliseconds: 200), () {
        ShowCaseWidget.of(context).startShowCase(globalKeys);
      }),
    );
  }
}
