import 'package:business_tools/core/constant/shared_key.dart';
import 'package:business_tools/core/services/app_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

Locale handelSupportedLocales() {
  Locale? locale;
  String? localLang = sl<SharedPreferences>().getString(SharedKey.langCode);
  if (localLang == null) {
    for (var locales in AppLocalizations.supportedLocales) {
      if (Intl.systemLocale.contains(locales.languageCode)) {
        locale = Locale(Intl.systemLocale);
        break;
      }
    }
  } else {
    locale = Locale(localLang);
  }
  return locale ?? Locale("en");
}
