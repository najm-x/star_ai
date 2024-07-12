import 'package:business_tools/core/constant/app_colors.dart';
import 'package:business_tools/core/constant/app_routes_name.dart';
import 'package:business_tools/features/extract/presentation/bloc/extract_bloc/extract_bloc.dart';
import 'package:business_tools/features/extract/presentation/bloc/save_data_bloc/save_data_bloc.dart';
import 'package:business_tools/features/extract/presentation/pages/extract_page.dart';
import 'package:business_tools/features/home/presentation/pages/home_page.dart';
import 'package:business_tools/features/text_translate/presentation/bloc/cubit/text_trans_cubit.dart';
import 'package:business_tools/features/text_translate/presentation/pages/text_translate_page.dart';
import 'package:business_tools/features/video_translator/presentation/bloc/vd_download_bloc/vd_download_bloc.dart';
import 'package:business_tools/features/video_translator/presentation/bloc/vd_translate_bloc/vd_translate_bloc.dart';
import 'package:business_tools/features/video_translator/presentation/bloc/vd_view_cubit/vd_view_cubit.dart';
import 'package:business_tools/features/video_translator/presentation/pages/vd_view.dart';
import 'package:business_tools/features/video_translator/presentation/pages/video_translator_page.dart';
import 'package:business_tools/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'core/services/app_services.dart' as id;

void main() async {
  await id.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

final goRouter = GoRouter(initialLocation: "/", routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const HomePage(),
  ),
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
  )
]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: goRouter.routerDelegate,
      routeInformationProvider: goRouter.routeInformationProvider,
      routeInformationParser: goRouter.routeInformationParser,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
        ),
        useMaterial3: true,
      ),
    );
  }
}
