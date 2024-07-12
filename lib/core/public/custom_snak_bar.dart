import 'package:flutter/material.dart';

class CustomSnakBar {
  static void snackBarError(BuildContext context, String messageError, int seconds) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          backgroundColor: Theme.of(context).colorScheme.onErrorContainer,
          showCloseIcon: true,
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: seconds),
          content: Text(messageError)),
    );
  }
  static void snackBarSuccess(BuildContext context, String messageSuccess, int seconds) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          backgroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
          showCloseIcon: true,
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: seconds),
          content: Text(messageSuccess)),
    );
  }
}
