import 'package:business_tools/core/app_routes.dart';
import 'package:business_tools/core/constant/app_routes_name.dart';
import 'package:business_tools/features/home/data/models/drawer_model.dart';
import 'package:flutter/material.dart';
import 'package:uicons/uicons.dart';
import 'package:business_tools/l10n/app_localizations.dart';

class StaticData {
  static BuildContext context = goRouter.routerDelegate.navigatorKey.currentContext!;

  List<DrawerModel> drawerData = [
    DrawerModel(
        title: AppLocalizations.of(context)!.videoTranslator,
        description: AppLocalizations.of(context)!.desYtTrans,
        iconData: UIcons.regularRounded.magic_wand,
        route: AppRouteName.summaryHome),
    DrawerModel(
        title: AppLocalizations.of(context)!.textTranslator,
        description: AppLocalizations.of(context)!.destextTrans,
        iconData: Icons.translate_rounded,
        route: AppRouteName.textTranslatorPage),
    DrawerModel(
        title: AppLocalizations.of(context)!.spellChecker,
        description: AppLocalizations.of(context)!.desSpellChecking,
        iconData: Icons.spellcheck_rounded,
        route: AppRouteName.spellCheckerPage),
    DrawerModel(
        title: AppLocalizations.of(context)!.textextract,
        description: AppLocalizations.of(context)!.desTextExtract,
        iconData: Icons.image_search_rounded,
        route: AppRouteName.textExtractPage),
  ];
}
