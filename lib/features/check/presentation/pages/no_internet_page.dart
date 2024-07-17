import 'package:business_tools/core/constant/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
            AppStrings.noInternet,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 20,
          ),
          OutlinedButton(onPressed: () => context.pushReplacement('/'), child: const Text(AppStrings.tryAgain))
        ],
      ),
    );
  }
}
