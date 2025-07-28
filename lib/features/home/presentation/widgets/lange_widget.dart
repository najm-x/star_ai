import 'package:business_tools/core/constant/app_routes_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uicons/uicons.dart';
import 'package:business_tools/l10n/app_localizations.dart';

class LangeWidget extends StatelessWidget {
  const LangeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        onPressed: () => context.push(AppRouteName.languagePage),
        icon: Icon(
          UIcons.regularRounded.angle_down,
          size: 13,
        ),
        label: Text(AppLocalizations.of(context)!.localeName));
  }
}
