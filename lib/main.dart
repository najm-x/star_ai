import 'package:business_tools/core/app_routes.dart';
import 'package:business_tools/core/constant/app_colors.dart';
import 'package:business_tools/core/constant/shared_key.dart';
import 'package:business_tools/core/functions/handel_supported_locales.dart';
import 'package:business_tools/features/language/presentation/bloc/cubit/language_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upgrader/upgrader.dart';
import 'core/services/app_services.dart' as id;
import 'package:business_tools/l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await id.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LanguageCubit(),
      child: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: state.status == LanguageStatus.success ? Locale(state.value) : handelSupportedLocales(context),
            routerDelegate: goRouter.routerDelegate,
            routeInformationProvider: goRouter.routeInformationProvider,
            routeInformationParser: goRouter.routeInformationParser,
            builder: (context, child) {
              return UpgradeAlert(
                navigatorKey: goRouter.routerDelegate.navigatorKey,
                upgrader: Upgrader(
                    durationUntilAlertAgain: Duration(days: 1),
                    storeController: UpgraderStoreController(onAndroid: () => UpgraderPlayStore())),
                child: child,
              );
            },
            theme: ThemeData(
              fontFamily: "Cairo",
              colorScheme: ColorScheme.fromSeed(
                  seedColor: AppColors.primary,
                  primary: AppColors.primary,
                  brightness: id.sl<SharedPreferences>().getString(SharedKey.themeName) == null
                      ? Brightness.dark
                      : id.sl<SharedPreferences>().getString(SharedKey.themeName) == "dark"
                          ? Brightness.dark
                          : Brightness.light),
              useMaterial3: true,
            ),
          );
        },
      ),
    );
  }
}
