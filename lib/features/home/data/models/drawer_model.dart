import 'package:flutter/material.dart';

class DrawerModel {
  final String title;
  final String? route;
  final IconData iconData;
  final String description ;

  DrawerModel( {required this.title, this.route, required this.iconData , required this.description});
}
