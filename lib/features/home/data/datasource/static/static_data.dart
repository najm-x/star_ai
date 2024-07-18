import 'package:business_tools/core/app_routes.dart';
import 'package:business_tools/core/constant/app_routes_name.dart';
import 'package:business_tools/features/home/data/models/drawer_model.dart';
import 'package:flutter/material.dart';
import 'package:uicons/uicons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StaticData {
  static BuildContext context = goRouter.routerDelegate.navigatorKey.currentContext!;

  static List<DrawerModel> drawerData = [
    DrawerModel(
      title: AppLocalizations.of(context)!.home,
      iconData: UIcons.regularRounded.home,
    ),
    DrawerModel(
        title: AppLocalizations.of(context)!.extract,
        iconData: UIcons.regularRounded.document,
        route: AppRouteName.extract),
    DrawerModel(
        title: AppLocalizations.of(context)!.videoTranslator,
        iconData: UIcons.regularRounded.magic_wand,
        route: AppRouteName.videoTranslatorPage),
    DrawerModel(
        title: AppLocalizations.of(context)!.textTranslator,
        iconData: Icons.translate_rounded,
        route: AppRouteName.textTranslatorPage),
    DrawerModel(
        title: AppLocalizations.of(context)!.spellChecker,
        iconData: Icons.spellcheck_rounded,
        route: AppRouteName.spellCheckerPage),
    DrawerModel(
        title: AppLocalizations.of(context)!.textextract,
        iconData: Icons.image_search_rounded,
        route: AppRouteName.textExtractPage),
  ];
}
