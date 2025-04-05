import 'dart:io';

import 'package:business_tools/core/app_routes.dart' show goRouter;
import 'package:business_tools/core/errors/exceptions.dart';
import 'package:business_tools/core/functions/handel_api_key.dart';
import 'package:business_tools/features/text_extract/data/datasources/static_data_text_extract.dart';
import 'package:business_tools/features/text_extract/data/models/text_extract_model.dart';
import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:image_cropper/image_cropper.dart';

abstract class TextExtractRemoteData {
  Future<String> pickImage();
  Future<TextExtractModel> extractTextFromImage(String path);
  Future<Unit> saveExtractedText(String path);
  Future<String> cropImage(String path);
}

class TextExtractRemoteDataImp extends TextExtractRemoteData {
  @override
  Future<TextExtractModel> extractTextFromImage(String path) async {
    try {
      final model = GenerativeModel(
          model: 'gemini-1.5-flash',
          apiKey: await handelApiKey(),
          generationConfig: GenerationConfig(),
          systemInstruction: Content.system(StaticDataTextExtract.prompt));
      final image = await File(path).readAsBytes();
      final prompt = TextPart("Extract text from this image");
      final imageParts = [
        DataPart('image/jpeg', image),
      ];
      final response = await model.generateContent([
        Content.multi([prompt, ...imageParts])
      ]);
      return TextExtractModel.toModel(response.text!);
    } catch (e) {
      throw AIException();
    }
  }

  @override
  Future<String> pickImage() async {
    FilePickerResult? filePicker = await FilePicker.platform.pickFiles(type: FileType.image, allowCompression: false);
    if (filePicker == null) throw EmptyPathException();
    return filePicker.files.first.path!;
  }

  @override
  Future<Unit> saveExtractedText(String path) {
    throw UnimplementedError();
  }

  @override
  Future<String> cropImage(String path) async {
    try {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: path,
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Cropper',
            // toolbarColor: Colors.deepOrange,
            activeControlsWidgetColor:
                Theme.of(goRouter.routerDelegate.navigatorKey.currentContext!).colorScheme.primary,
            initAspectRatio: CropAspectRatioPreset.square,
            lockAspectRatio: false,
            aspectRatioPresets: [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio4x3,
            ],
          ),
        ],
      );
      if (croppedFile == null) {
        throw EmptyCropImageException();
      }
      return croppedFile.path;
    } catch (e) {
      throw CropImageException();
    }
  }
}
