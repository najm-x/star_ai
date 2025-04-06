import 'package:business_tools/core/constant/app_routes_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void showApiKeyDialog(BuildContext context) {
  showCupertinoDialog(
    context: context,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: Text(AppLocalizations.of(context)!.note),
        content: Text(AppLocalizations.of(context)!.appCrach),
        actions: [
          CupertinoDialogAction(
            child: Text(AppLocalizations.of(context)!.cancel),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          CupertinoDialogAction(
            child: Text(AppLocalizations.of(context)!.setting),
            onPressed: () {
              context.go(AppRouteName.addApiKeyPage); // تعديل حسب مسار صفحة الإعدادات لديك
            },
          ),
        ],
      );
    },
  );
}
