import 'package:business_tools/core/constant/app_routes_name.dart';
import 'package:business_tools/core/constant/shared_key.dart';
import 'package:business_tools/features/ads/presentation/bloc/bloc/ads_bloc.dart';
import 'package:business_tools/features/check/presentation/bloc/add_api_key/add_api_key_cubit.dart';
import 'package:business_tools/features/check/presentation/bloc/check/check_cubit.dart';
import 'package:business_tools/features/check/presentation/pages/add_api_key_page.dart';
import 'package:business_tools/features/check/presentation/pages/check_page.dart';
import 'package:business_tools/features/check/presentation/pages/no_internet_page.dart';
import 'package:business_tools/features/extract/presentation/bloc/extract_bloc/extract_bloc.dart';
import 'package:business_tools/features/extract/presentation/bloc/save_data_bloc/save_data_bloc.dart';
import 'package:business_tools/features/extract/presentation/pages/extract_page.dart';
import 'package:business_tools/features/home/presentation/bloc/cubit/home_cubit.dart';
import 'package:business_tools/features/home/presentation/pages/home_page.dart';
import 'package:business_tools/features/language/presentation/pages/language_page.dart';
import 'package:business_tools/features/onboarding/presentation/bloc/cubit/onboarding_cubit.dart';
import 'package:business_tools/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:business_tools/features/spell_checker/presentation/bloc/cubit/spell_checker_cubit.dart';
import 'package:business_tools/features/spell_checker/presentation/pages/spell_checker_page.dart';
import 'package:business_tools/features/summary/presentation/bloc/cubit/summary_setup_cubit.dart';
import 'package:business_tools/features/summary/presentation/bloc/summary_home_cubit/summary_home_cubit.dart';
import 'package:business_tools/features/summary/presentation/bloc/summary_view_bloc/summary_view_bloc.dart';
import 'package:business_tools/features/summary/presentation/bloc/summary_view_cubit/cubit/summary_view_cubit.dart';
import 'package:business_tools/features/summary/presentation/view/summary_home.dart';
import 'package:business_tools/features/summary/presentation/view/summary_setup.dart';
import 'package:business_tools/features/summary/presentation/view/summary_view.dart';
import 'package:business_tools/features/text_extract/presentation/bloc/bloc/text_extract_bloc.dart';
import 'package:business_tools/features/text_extract/presentation/pages/text_extract_page.dart';
import 'package:business_tools/features/text_translate/presentation/bloc/cubit/text_trans_cubit.dart';
import 'package:business_tools/features/text_translate/presentation/pages/text_translate_page.dart';
import 'package:business_tools/features/video_translator/data/models/data_vd_model.dart';
import 'package:business_tools/features/video_translator/presentation/bloc/pick_file_cubit/pick_file_cubit.dart';
import 'package:business_tools/features/video_translator/presentation/bloc/vd_download_bloc/vd_download_bloc.dart';
import 'package:business_tools/features/video_translator/presentation/bloc/vd_trans_type_cubit/vd_trans_type_cubit.dart';
import 'package:business_tools/features/video_translator/presentation/bloc/vd_translate_bloc/vd_translate_bloc.dart';
import 'package:business_tools/features/video_translator/presentation/bloc/vd_view_cubit/vd_view_cubit.dart';
import 'package:business_tools/features/video_translator/presentation/pages/choose_type_trans_page.dart';
import 'package:business_tools/features/video_translator/presentation/pages/vd_view.dart';
import 'package:business_tools/features/video_translator/presentation/pages/video_translator_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:business_tools/core/services/app_services.dart' as id;

final goRouter = GoRouter(
  initialLocation: AppRouteName.summaryHome,
  routes: [
    // _mainGoRoute(),
    _chooseTransTypeRoute(),
    _homeRoute(),
    _videoTranslatorRoute(),
    _extractRoute(),
    _vdViewRoute(),
    _textTranslatorRoute(),
    _spellCheckerRoute(),
    _textExtractRoute(),
    _noInternetRoute(),
    _onBoardingRoute(),
    _addApiKeyRoute(),
    _languageRoute(),
    _summryHomeRoute(),
    _summrySetupRoute(),
    _summaryViewRoute()
  ],
);

GoRoute _mainGoRoute() {
  return GoRoute(
    path: '/',
    builder: (context, state) => BlocProvider(
      create: (context) => id.sl<CheckCubit>()..check(),
      child: const CheckPage(),
    ),
  );
}

GoRoute _chooseTransTypeRoute() {
  return GoRoute(
    path: AppRouteName.chooseTransTypePage,
    builder: (context, state) => MultiRepositoryProvider(
      providers: [
        BlocProvider(create: (context) => id.sl<AdsBloc>()..add(RewardedAdEvent())),
        BlocProvider(create: (context) => VdTransTypeCubit()),
      ],
      child: const ChooseTypeTransPage(),
    ),
  );
}

GoRoute _homeRoute() {
  return GoRoute(
    path: AppRouteName.home,
    builder: (context, state) => BlocProvider(
      create: (context) => id.sl<HomeCubit>(),
      child: const HomePage(),
    ),
  );
}

GoRoute _videoTranslatorRoute() {
  return GoRoute(
    path: AppRouteName.videoTranslatorPage,
    builder: (context, state) => MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => id.sl<VdTranslateBloc>()),
        BlocProvider(create: (context) => id.sl<PickFileCubit>()),
        BlocProvider(create: (context) => id.sl<AdsBloc>()..add(const BannerAdEvent(size: AdSize.largeBanner))),
      ],
      child: VideoTranslatorPage(typeTrans: state.extra as String),
    ),
  );
}

GoRoute _extractRoute() {
  return GoRoute(
    path: AppRouteName.extract,
    builder: (context, state) => MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => id.sl<ExtractBloc>()),
        BlocProvider(create: (context) => id.sl<SaveDataBloc>()),
      ],
      child: const ExtractPage(),
    ),
  );
}

GoRoute _vdViewRoute() {
  return GoRoute(
    path: AppRouteName.vdView,
    builder: (context, state) => MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => id.sl<AdsBloc>()),
        BlocProvider(create: (context) => id.sl<VdViewCubit>()),
        BlocProvider(create: (context) => id.sl<VdDownloadBloc>()),
      ],
      child: VdView(data: state.extra as DataVdModel),
    ),
  );
}

GoRoute _textTranslatorRoute() {
  return GoRoute(
    path: AppRouteName.textTranslatorPage,
    builder: (context, state) => MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => id.sl<TextTransCubit>()),
        BlocProvider(create: (context) => id.sl<AdsBloc>()..add(const BannerAdEvent())),
      ],
      child: const TextTranslatePage(),
    ),
  );
}

GoRoute _spellCheckerRoute() {
  return GoRoute(
    path: AppRouteName.spellCheckerPage,
    builder: (context, state) => MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => id.sl<SpellCheckerCubit>()),
        BlocProvider(create: (context) => id.sl<AdsBloc>()..add(const BannerAdEvent())),
      ],
      child: const SpellCheckerPage(),
    ),
  );
}

GoRoute _textExtractRoute() {
  return GoRoute(
    path: AppRouteName.textExtractPage,
    builder: (context, state) => MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => id.sl<TextExtractBloc>()),
        BlocProvider(create: (context) => id.sl<AdsBloc>()..add(const BannerAdEvent(size: AdSize.largeBanner))),
      ],
      child: const TextExtractPage(),
    ),
  );
}

GoRoute _noInternetRoute() {
  return GoRoute(
    path: AppRouteName.noInternetPageg,
    builder: (context, state) => const NoInternetPage(),
  );
}

GoRoute _onBoardingRoute() {
  return GoRoute(
    path: AppRouteName.onBoarding,
    builder: (context, state) => BlocProvider(
      create: (context) => id.sl<OnboardingCubit>(),
      child: const OnboardingPage(),
    ),
    redirect: (context, state) async {
      if (id.sl<SharedPreferences>().getBool(SharedKey.onBoardingStatus) != null) {
        return AppRouteName.home;
      }
      return null;
    },
  );
}

GoRoute _addApiKeyRoute() {
  return GoRoute(
    path: AppRouteName.addApiKeyPage,
    builder: (context, state) => BlocProvider(
      create: (context) => AddApiKeyCubit(),
      child: const AddApiKeyPage(),
    ),
  );
}

GoRoute _languageRoute() {
  return GoRoute(
    path: AppRouteName.languagePage,
    builder: (context, state) => const LanguagePage(),
  );
}

GoRoute _summryHomeRoute() {
  return GoRoute(
    path: AppRouteName.summaryHome,
    builder: (context, state) => BlocProvider(
      create: (context) => id.sl<SummaryHomeCubit>()..fetch(),
      child: const SummaryHome(),
    ),
  );
}

GoRoute _summrySetupRoute() {
  return GoRoute(
      path: AppRouteName.summarySetup,
      builder: (context, state) => BlocProvider(
            create: (context) => id.sl<SummarySetupCubit>(),
            child: const SummarySetup(),
          ));
}

GoRoute _summaryViewRoute() {
  return GoRoute(
      path: AppRouteName.summaryView,
      builder: (context, state) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    id.sl<SummaryViewBloc>()..add(GetVdInfoEvent(vdUrl: (state.extra as SummarySetupState).vdUrl)),
              ),
              BlocProvider(
                create: (context) => id.sl<SummaryViewCubit>(),
              ),
            ],
            child: const SummaryView(),
          ));
}
