import 'package:flutter/services.dart';

Future copyText(String text) async {
     await Clipboard.setData(ClipboardData(text: text));
   
  }