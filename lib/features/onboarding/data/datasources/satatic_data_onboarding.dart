import 'package:business_tools/core/app_routes.dart';
import 'package:business_tools/core/constant/app_images.dart';
import 'package:business_tools/features/onboarding/data/models/on_boarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SataticDataOnboarding {
  static   BuildContext context = goRouter.routerDelegate.navigatorKey.currentContext! ;

  static List<OnBoardingModel> onBoardingData = [
    OnBoardingModel(
        image: AppImages.logo,
        title: AppLocalizations.of(context)!.titleWelcomOnBoarding,
        decoration: AppLocalizations.of(context)!.desWelcomOnBoarding),
    OnBoardingModel(
        image: AppImages.translateVideo,
        title: AppLocalizations.of(context)!.titleYtTrans,
        decoration: AppLocalizations.of(context)!.desYtTrans),
    OnBoardingModel(
        image: AppImages.translateText,
        title: AppLocalizations.of(context)!.titletextTrans,
        decoration: AppLocalizations.of(context)!.destextTrans),
    OnBoardingModel(
        image: AppImages.spellchecker,
        title: AppLocalizations.of(context)!.titleSpellChecking,
        decoration: AppLocalizations.of(context)!.desSpellChecking),
    OnBoardingModel(
        image: AppImages.textExtract,
        title: AppLocalizations.of(context)!.titleTextExtract,
        decoration: AppLocalizations.of(context)!.desTextExtract),
  ];
}
