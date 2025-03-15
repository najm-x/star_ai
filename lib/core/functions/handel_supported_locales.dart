import 'package:business_tools/core/constant/shared_key.dart';
import 'package:business_tools/core/services/app_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

Locale handelSupportedLocales(BuildContext context) {
  Locale? locale;
  String? localLang = sl<SharedPreferences>().getString(SharedKey.langCode);
  if (localLang == null) {
    for (var locales in AppLocalizations.supportedLocales) {
      if (WidgetsBinding.instance.platformDispatcher.locale.languageCode.contains(locales.languageCode)) {
        locale = Locale(locales.languageCode);
        break;
      }
    }
  } else {
    locale = Locale(localLang);
    
  }
   
  return locale ?? const Locale("en");
}
