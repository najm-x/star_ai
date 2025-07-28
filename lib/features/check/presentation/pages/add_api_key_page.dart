import 'package:business_tools/core/public/widgets/info_widget.dart';
import 'package:business_tools/features/check/presentation/widgets/step_widget.dart';
import 'package:flutter/material.dart';
import 'package:business_tools/l10n/app_localizations.dart';

class AddApiKeyPage extends StatelessWidget {
  const AddApiKeyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            InfoWidget(text: AppLocalizations.of(context)!.unableToConnect),
            const SizedBox(
              height: 10,
            ),
            Text(
              AppLocalizations.of(context)!.enterApiKey,
              textAlign: TextAlign.center,
            ),
            const Expanded(child: StepWidget())
          ],
        ),
      ),
    );
  }
}
