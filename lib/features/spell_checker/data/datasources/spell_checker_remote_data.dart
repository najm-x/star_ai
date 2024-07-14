import 'dart:io';
import 'dart:math';

import 'package:business_tools/core/errors/exceptions.dart';
import 'package:business_tools/features/spell_checker/data/datasources/static_data_spell_checker.dart';
import 'package:business_tools/features/spell_checker/data/models/spell_checker_model.dart';
import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

abstract class SpellCheckerRemoteData {
  Future<SpellCheckerModel> spellTextChecker(String text, String moreInfo);
  Future<Unit> saveText(String text);
}

class SpellCheckerRemoteDataImp extends SpellCheckerRemoteData {
  @override
  Future<Unit> saveText(String text) async {
    String? path = await FilePicker.platform.getDirectoryPath();
    int random = Random().nextInt(10000);
    String fileName = '${random}_spellChecker';
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
  Future<SpellCheckerModel> spellTextChecker(String text, String moreInfo) async {
    try {
      final model = GenerativeModel(
          model: "gemini-1.5-flash-latest",
          apiKey: "AIzaSyA_4XW31z90lGuOtueo3919IFdEpHMxQWI",
          systemInstruction: Content.system(StaticDataSpellChecker.prompt));
      final response = await model.generateContent([
        Content.text("""
proofread and correct grammatical errors in this text:
 "$text"
""")
      ]);

      return SpellCheckerModel.toModel(response.text!);
    } catch (e) {
      throw AIException();
    }
  }
}
