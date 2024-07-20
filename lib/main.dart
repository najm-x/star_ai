import 'package:business_tools/core/app_routes.dart';
import 'package:business_tools/core/constant/app_colors.dart';
import 'package:business_tools/core/functions/handel_supported_locales.dart';
import 'package:business_tools/features/language/presentation/bloc/cubit/language_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:upgrader/upgrader.dart';
import 'core/services/app_services.dart' as id;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.updateRequestConfiguration(
  RequestConfiguration(testDeviceIds: ['72F4F610FF0BE40189FFBA2889E51B99']));
  await id.init();
  Upgrader.clearSavedSettings();

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
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: state.status == LanguageStatus.success ? Locale(state.value) : handelSupportedLocales(),
            routerDelegate: goRouter.routerDelegate,
            routeInformationProvider: goRouter.routeInformationProvider,
            routeInformationParser: goRouter.routeInformationParser,
            builder: (context, child) {
              return UpgradeAlert(
                navigatorKey: goRouter.routerDelegate.navigatorKey,
                upgrader: Upgrader(
                    minAppVersion: "1.0.0",
                    durationUntilAlertAgain: const Duration(seconds: 3),
                    storeController: UpgraderStoreController(
                        onAndroid: () =>
                            UpgraderAppcastStore(appcastURL: "https://najm-flutter.github.io/Todo-flutter/new.xml"))),
                child: child,
              );
            },
            theme: ThemeData(
              fontFamily: "Cairo",
              colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary, primary: AppColors.primary),
              useMaterial3: true,
            ),
          );
        },
      ),
    );
  }
}
