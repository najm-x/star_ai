import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:business_tools/l10n/app_localizations.dart';

class DialogPermission extends StatelessWidget {
  const DialogPermission(
      {super.key, required this.title, required this.permissionMessage, required this.iconData, this.onPressed});
  final String title;
  final String permissionMessage;
  final IconData iconData;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: Icon(
        iconData,
        size: 50,
      ),
      title: Text(title),
      content: Text(permissionMessage),
      actions: [
        TextButton(onPressed: onPressed, child: Text(AppLocalizations.of(context)!.ok)),
        TextButton(onPressed: () => context.pop(), child: Text(AppLocalizations.of(context)!.cancel)),
      ],
    );
  }
}
