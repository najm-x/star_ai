import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GoWidget extends StatelessWidget {
  const GoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 60,
      child: Center(
        child: Text(AppLocalizations.of(context)!.gO),
      ),
    );
  }
}
