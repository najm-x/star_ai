import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:path/path.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/services.dart' show Uint8List, rootBundle;

import 'package:business_tools/core/constant/api_keys.dart';
import 'package:business_tools/core/constant/prompts.dart';
import 'package:business_tools/core/errors/exceptions.dart';
import 'package:business_tools/core/functions/handel_api_key.dart';
import 'package:business_tools/features/summary/data/models/export_type_mod.dart';
import 'package:business_tools/features/summary/data/models/summary_mod.dart';
import 'package:business_tools/features/summary/data/models/vd_info_mod.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

abstract class SummaryRemoteSource {
  Future<VdInfoMod> vdInfoEctract(String vdId);
  Future<SummaryMod> summary(String text, String lang, String typeSummary, String lengthSummary, String titleVd);
  Future<Unit> export(String summary, ExportTypeMod exportMod, String title, String lang);
}

class SummaryRemoteSourceImp implements SummaryRemoteSource {
  @override
  Future<SummaryMod> summary(String text, String lang, String typeSummary, String lengthSummary, String titleVd) async {
    try {
      var model = GenerativeModel(
          apiKey: await handelApiKey(), model: modelType, systemInstruction: Content.system(Prompts.summaryIntro));
      final response = await model
          .generateContent([Content.text(Prompts.summaryPromptRole(typeSummary, lengthSummary, lang, titleVd, text))]);
      // Use the response variable
      return SummaryMod(summary: response.text ?? "ERROR Try Again");
    } catch (e) {
      throw AIException(messageError: e.toString());
    }
  }

  @override
  Future<VdInfoMod> vdInfoEctract(String vdId) async {
    try {
      var yt = YoutubeExplode();
      var trackManifest = await yt.videos.closedCaptions.getManifest(vdId);
      print(trackManifest.tracks.first);

      // if (trackManifest.tracks.first ) throw ClosedCaptionException();

      var track = await yt.videos.closedCaptions.get(trackManifest.tracks.first);
      var info = await yt.videos.get(vdId);

      String text = " ";
      for (var element in track.captions) {
        text += " ${element.text}";
      }
      yt.close();
      return VdInfoMod(vdUrl: vdId, vdText: text, vdTitle: info.title , vdImage: info.thumbnails.lowResUrl);
    } catch (e) {
      throw ClosedCaptionException();
    }
  }

  @override
  Future<Unit> export(String summary, ExportTypeMod exportMod, String title, String lang) async {
    try {
      if (exportMod.type == "pdf") {
        String path = await _createPdf(summary, title, lang);
        await Share.shareXFiles([XFile(path, mimeType: exportMod.mimeType)]);
        return Future.value(unit);
      }
      await Share.shareXFiles([XFile.fromData(utf8.encode(summary), mimeType: exportMod.mimeType)],
          fileNameOverrides: ['$title.${exportMod.type}']);
      return Future.value(unit);
    } catch (e) {
      throw UnimplementedError();
    }
  }

  Future<String> _createPdf(String summary, String title, String lang) async {
    final Directory tempDir = await getTemporaryDirectory();
    final pdf = pw.Document();
    print("+++++++++++++$lang");
    pdf.addPage(pw.Page(
        textDirection: lang.contains("عرب") ? pw.TextDirection.rtl : null,
        theme: pw.ThemeData.withFont(base: pw.Font.ttf(await rootBundle.load('assets/fonts/Cairo-Medium.ttf'))),
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Text(summary),
          ); // Center
        }));
    // Page
    Uint8List content = await pdf.save();
    File file = File(join(tempDir.path, "$title.pdf"));
    await file.writeAsBytes(content);
    return file.path;
  }
}
