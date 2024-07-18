import 'package:flutter/material.dart';

IconData handelIconDirection(BuildContext context, IconData leftIcon, IconData rightIcon) {
  return Directionality.maybeOf(context) == TextDirection.ltr ? leftIcon : rightIcon;
}
