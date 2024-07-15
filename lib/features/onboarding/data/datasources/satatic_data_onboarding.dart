import 'package:business_tools/core/constant/app_images.dart';
import 'package:business_tools/core/constant/app_strings.dart';
import 'package:business_tools/features/onboarding/data/models/on_boarding_model.dart';

class SataticDataOnboarding {
  static List<OnBoardingModel> onBoardingData = [
    OnBoardingModel(
        image: AppImages.logo, title: AppStrings.titleWelcomOnBoarding, decoration: AppStrings.desWelcomOnBoarding),
    OnBoardingModel(image: AppImages.translateVideo, title: AppStrings.titleYtTrans, decoration: AppStrings.desYtTrans),
    OnBoardingModel(
        image: AppImages.translateText, title: AppStrings.titletextTrans, decoration: AppStrings.destextTrans),
    OnBoardingModel(
        image: AppImages.spellchecker, title: AppStrings.titleSpellChecking, decoration: AppStrings.desSpellChecking),
    OnBoardingModel(
        image: AppImages.textExtract, title: AppStrings.titleTextExtract, decoration: AppStrings.desTextExtract),
  ];
}
