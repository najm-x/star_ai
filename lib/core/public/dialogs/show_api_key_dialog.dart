import 'package:business_tools/core/constant/app_routes_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

void showApiKeyDialog(BuildContext context) {
  showCupertinoDialog(
    context: context,
    builder: (BuildContext context) {
      final textStyle = Theme.of(context).textTheme.bodyMedium;

      return CupertinoAlertDialog(
        title: DefaultTextStyle(
          style: textStyle ?? const TextStyle(),
          child: Text(AppLocalizations.of(context)!.note),
        ),
        content: DefaultTextStyle(
          style: textStyle ?? const TextStyle(),
          child: Text(AppLocalizations.of(context)!.appCrach),
        ),
        actions: [
          CupertinoDialogAction(
            child: DefaultTextStyle(
              style: textStyle ?? const TextStyle(),
              child: Text(AppLocalizations.of(context)!.cancel),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          CupertinoDialogAction(
            child: DefaultTextStyle(
              style: textStyle ?? const TextStyle(),
              child: Text(AppLocalizations.of(context)!.setting),
            ),
            onPressed: () {
              context.go(AppRouteName.addApiKeyPage);
            },
          ),
        ],
      );
    },
  );
}
