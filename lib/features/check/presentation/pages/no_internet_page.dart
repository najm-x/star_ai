import 'package:business_tools/core/constant/app_routes_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:business_tools/l10n/app_localizations.dart';

class NoInternetPage extends StatelessWidget {
  const NoInternetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.wifi_off_rounded,
            size: 70,
            color: Theme.of(context).colorScheme.error,
          ),
          const SizedBox(
            width: double.maxFinite,
            height: 20,
          ),
          Text(
            AppLocalizations.of(context)!.noInternet,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 20,
          ),
          OutlinedButton(
              onPressed: () => context.go(AppRouteName.checkPage), child: Text(AppLocalizations.of(context)!.tryAgain))
        ],
      ),
    );
  }
}
