import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DecWidget extends StatelessWidget {
  const DecWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width / 10),
      child: Text(
        AppLocalizations.of(context)!.descreption,
        textAlign: TextAlign.center,
      ),
    );
  }
}
