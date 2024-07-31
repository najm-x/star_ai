import 'dart:io';
import 'dart:math' show Random;

import 'package:business_tools/core/errors/exceptions.dart';
import 'package:business_tools/features/video_translator/data/datasources/vd_db_fun.dart';
import 'package:business_tools/features/video_translator/data/models/data_vd_model.dart';
import 'package:business_tools/features/video_translator/data/models/vd_translate_model.dart';
import 'package:business_tools/features/video_translator/domain/entities/vd_translate_entities.dart';
import 'package:dartz/dartz.dart' show Unit, unit;
import 'package:file_picker/file_picker.dart';

abstract class VdRemoteDaraSource {
  Future<List<VdTranslateModel>> vdTranslate(
    String videoId,
    String translateFrom,
    String translateTo,
    String translateFromCode,
  );
  Future<Unit> downloadTranslation(List<VdTranslateEntities> translation, String videoUrl);
  Future<DataVdModel> getTransCript(String videoId, String translateFrom, String translateTo, String translateFromCode);
  Future<List<VdTranslateEntities>> vdTransRealTime(
      String translateFrom, String translateTo, String videoInfo, List<VdTranslateModel> subTitles);
  Future<List<VdTranslateEntities>> getTransFromFile(String filePath);
}

class VdRemoteDaraSourceImp implements VdRemoteDaraSource {
  final VdDbFunHelping vdDbFunHelping;

  VdRemoteDaraSourceImp({required this.vdDbFunHelping});
  @override
  Future<List<VdTranslateModel>> vdTranslate(
      String videoId, String translateFrom, String translateTo, String translateFromCode) async {
    //
    String videoInfo = await vdDbFunHelping.videoInfo(videoId);
    List<VdTranslateModel> transScript = await vdDbFunHelping.transCriptVd(videoId, translateFromCode);
    if (transScript.isEmpty) {
      throw TransScriptVdException();
    }
    //
    List translate = await vdDbFunHelping.handelingTranslate(translateFrom, translateTo, videoInfo, transScript);
    return vdDbFunHelping.theTranslate(translate, transScript);
  }
//

  @override
  Future<Unit> downloadTranslation(List<VdTranslateEntities> translation, String videoUrl) async {
    String? path = await FilePicker.platform.getDirectoryPath();
    int random = Random().nextInt(10000);
    String folderName = '${random}_${DateTime.now().year}_${DateTime.now().month}_${DateTime.now().day}';
    if (path == null) {
      throw EmptyPathException();
    }
    Directory directory = Directory("$path/$folderName");
    await directory.create();
    File translationFile = File("${directory.path}/translation.srt");
    File vdUrl = File("${directory.path}/videoUrl.txt");
    try {
      await vdUrl.writeAsString(videoUrl);
      await translationFile.writeAsString(vdDbFunHelping.convertListToSubFormat(translation));
      return unit;
    } catch (e) {
      throw CreateFileException();
    }
  }

  @override
  Future<DataVdModel> getTransCript(
      String videoId, String translateFrom, String translateTo, String translateFromCode) async {
    List<VdTranslateModel> transScript = await vdDbFunHelping.transCriptVd(videoId, translateFromCode);
    String videoInfo = await vdDbFunHelping.videoInfo(videoId);

    if (transScript.isEmpty || videoInfo.isEmpty) {
      throw TransScriptVdException();
    }
    return DataVdModel(
        idVideo: videoId,
        data: transScript,
        translateFrom: translateFrom,
        translateTo: translateTo,
        videoInfo: videoInfo);
  }

  //
  @override
  Future<List<VdTranslateEntities>> vdTransRealTime(
      String translateFrom, String translateTo, String videoInfo, List<VdTranslateModel> subTitles) async {
    try {
      List translate =
          await vdDbFunHelping.handelingTranslate(translateFrom, translateTo, "part of $videoInfo", subTitles);
      return vdDbFunHelping.theTranslate(translate, subTitles);
    } catch (e) {
      throw TranslateVdException();
    }
  }

  @override
  Future<List<VdTranslateEntities>> getTransFromFile(String filePath) async {
    try {
      File file = File(filePath);
      String srtContent = await file.readAsString();
      return vdDbFunHelping.parseSrt(srtContent);
    } catch (e) {
      throw GetTransFroFileException();
    }
  }
}
/*
1
00:05:00,400 --> 00:05:15,300
This is an example of a subtitle.
*/