import 'package:business_tools/core/functions/open_url.dart';
import 'package:flutter/material.dart';
import 'package:business_tools/l10n/app_localizations.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
        selectedIndex: 1,
        onDestinationSelected: (value) async {
          openUrl("https://star-ai1.blogspot.com/2024/07/privacy-policy.html");
        },
        children: [
          _title(context),
          NavigationDrawerDestination(
              icon: Icon(Icons.privacy_tip_rounded), label: Text(AppLocalizations.of(context)!.privacyPolicy)),
        ]);
  }

  Widget _title(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.only(top: 20, left: 10, right: 20, bottom: 20),
      child: Text("More"),
    );
  }
}
