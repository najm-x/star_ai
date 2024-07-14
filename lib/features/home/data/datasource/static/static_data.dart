import 'package:business_tools/core/constant/app_routes_name.dart';
import 'package:business_tools/core/constant/app_strings.dart';
import 'package:business_tools/features/home/data/models/drawer_model.dart';
import 'package:flutter/material.dart';
import 'package:uicons/uicons.dart';

class StaticData {
  static List<DrawerModel> drawerData = [
    DrawerModel(
      title: AppStrings.home,
      iconData: UIcons.regularRounded.home,
    ),
    DrawerModel(title: AppStrings.extract, iconData: UIcons.regularRounded.document, route: AppRouteName.extract),
    DrawerModel(
        title: AppStrings.videoTranslator,
        iconData: UIcons.regularRounded.magic_wand,
        route: AppRouteName.videoTranslatorPage),
    DrawerModel(
        title: AppStrings.textTranslator,
        iconData: Icons.translate_rounded,
        route: AppRouteName.textTranslatorPage),
    DrawerModel(
        title: AppStrings.spellChecker,
        iconData: Icons.spellcheck_rounded,
        route: AppRouteName.spellCheckerPage),
  ];
}
