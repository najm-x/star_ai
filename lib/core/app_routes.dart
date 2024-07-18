import 'package:business_tools/core/constant/app_routes_name.dart';
import 'package:business_tools/core/constant/shared_key.dart';
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
import 'package:business_tools/features/text_extract/presentation/bloc/bloc/text_extract_bloc.dart';
import 'package:business_tools/features/text_extract/presentation/pages/text_extract_page.dart';
import 'package:business_tools/features/text_translate/presentation/bloc/cubit/text_trans_cubit.dart';
import 'package:business_tools/features/text_translate/presentation/pages/text_translate_page.dart';
import 'package:business_tools/features/video_translator/presentation/bloc/vd_download_bloc/vd_download_bloc.dart';
import 'package:business_tools/features/video_translator/presentation/bloc/vd_translate_bloc/vd_translate_bloc.dart';
import 'package:business_tools/features/video_translator/presentation/bloc/vd_view_cubit/vd_view_cubit.dart';
import 'package:business_tools/features/video_translator/presentation/pages/vd_view.dart';
import 'package:business_tools/features/video_translator/presentation/pages/video_translator_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:business_tools/core/services/app_services.dart' as id;

final goRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => BlocProvider(
      create: (context) => id.sl<CheckCubit>()..check(),
      child: const CheckPage(),
    ),
  ),
  GoRoute(
      path: AppRouteName.home,
      builder: (context, state) => BlocProvider(
            create: (context) => id.sl<HomeCubit>(),
            child: const HomePage(),
          )),
  GoRoute(
    path: AppRouteName.videoTranslatorPage,
    builder: (context, state) => BlocProvider(
      create: (context) => id.sl<VdTranslateBloc>(),
      child: const VideoTranslatorPage(),
    ),
  ),
  GoRoute(
    path: AppRouteName.extract,
    builder: (context, state) => MultiBlocProvider(providers: [
      BlocProvider(create: (context) => id.sl<ExtractBloc>()),
      BlocProvider(create: (context) => id.sl<SaveDataBloc>()),
    ], child: const ExtractPage()),
  ),
  GoRoute(
    path: AppRouteName.vdView,
    builder: (context, state) => MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => id.sl<VdViewCubit>(),
        ),
        BlocProvider(
          create: (context) => id.sl<VdDownloadBloc>(),
        ),
      ],
      child: VdView(
        data: state.extra as Map,
      ),
    ),
  ),
  GoRoute(
    path: AppRouteName.textTranslatorPage,
    builder: (context, state) => BlocProvider(
      create: (context) => id.sl<TextTransCubit>(),
      child: const TextTranslatePage(),
    ),
  ),
  GoRoute(
    path: AppRouteName.spellCheckerPage,
    builder: (context, state) => BlocProvider(
      create: (context) => id.sl<SpellCheckerCubit>(),
      child: const SpellCheckerPage(),
    ),
  ),
  GoRoute(
    path: AppRouteName.textExtractPage,
    builder: (context, state) => BlocProvider(
      create: (context) => id.sl<TextExtractBloc>(),
      child: const TextExtractPage(),
    ),
  ),
  GoRoute(
    path: AppRouteName.noInternetPageg,
    builder: (context, state) => const NoInternetPage(),
  ),
  GoRoute(
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
  ),
  GoRoute(
    path: AppRouteName.addApiKeyPage,
    builder: (context, state) => BlocProvider(
      create: (context) => AddApiKeyCubit(),
      child: const AddApiKeyPage(),
    ),
  ),
  GoRoute(
    path: AppRouteName.languagePage,
    builder: (context, state) => const LanguagePage(),
  ),
]);
