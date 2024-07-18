import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class CustomSnakBar {
  void snackBarError(BuildContext context, String messageError, int seconds) {
    showTopSnackBar(context, messageError, Theme.of(context).colorScheme.onErrorContainer, seconds);
  }

  void snackBarSuccess(BuildContext context, String messageSuccess, int seconds) {
    showTopSnackBar(context, messageSuccess, Theme.of(context).colorScheme.onPrimaryContainer, seconds);
  }

  void showTopSnackBar(BuildContext context, String message, Color color, int seconds) {
    final overlay = Overlay.of(context);

    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).viewInsets.top + 50,
        left: 10.0,
        right: 10.0,
        child: Material(
          color: Colors.transparent,
          child: FadeIn(
        
              child: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    message,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
          )),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    Future.delayed(Duration(seconds: seconds), () {
      overlayEntry.remove();
    });
   
  }
}
