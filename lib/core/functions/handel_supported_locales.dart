import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

Locale handelSupportedLocales() {
  Locale? locale;
   print(AppLocalizations.supportedLocales) ;
       print(Intl.systemLocale) ;
  for (var locales in AppLocalizations.supportedLocales) {
    if ( Intl.systemLocale.contains(locales.languageCode)) {
      
      locale = Locale(Intl.systemLocale);
      break;
    }
  }
  return locale ?? Locale("en");
}
