import 'dart:io';
import 'dart:math';
import 'package:business_tools/core/errors/exceptions.dart';
import 'package:business_tools/features/text_translate/data/datasources/static_data_text_trans.dart';
import 'package:business_tools/features/text_translate/data/models/text_trans_model.dart';
import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

abstract class TextTransRemoteDataSource {
  Future<TextTransModel> translateText(String text, String translateFrom, String translateTo ,  String info);
  Future<Unit> saveText(String text);
}

class TextTransRemoteDataSourceImp extends TextTransRemoteDataSource {
  @override
  Future<Unit> saveText(String text) async {
    String? path = await FilePicker.platform.getDirectoryPath();
    int random = Random().nextInt(10000);
    String fileName = '${random}_trasnlate';
    if (path == null) {
      throw EmptyPathException();
    }
    File file = File("$path/$fileName.txt");
    try {
      await file.writeAsString(text);
      return unit;
    } catch (e) {
      throw CreateFileException();
    }
  }

  @override
  Future<TextTransModel> translateText(String text, String translateFrom, String translateTo ,  String info) async {
    final model = GenerativeModel(
        model: "gemini-1.5-flash-latest",
        apiKey: "AIzaSyA_4XW31z90lGuOtueo3919IFdEpHMxQWI",
        systemInstruction: Content.system(StaticDataTextTrans.prompt));
    final response = await model.generateContent([Content.text("""
Translate this text from $translateFrom to $translateTo, $info following all the mentioned rules:
 "${text.replaceAll('"', ' ')..replaceAll('*', " ")..replaceAll('#', " ")}"
""")]);
  
      
    return TextTransModel(text:  response.text!);
  }
}
