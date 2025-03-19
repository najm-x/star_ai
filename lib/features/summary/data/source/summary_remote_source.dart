import 'package:business_tools/core/constant/api_keys.dart';
import 'package:business_tools/core/constant/prompts.dart';
import 'package:business_tools/core/errors/exceptions.dart';
import 'package:business_tools/core/functions/handel_api_key.dart';
import 'package:business_tools/features/summary/data/models/summary_mod.dart';
import 'package:business_tools/features/summary/data/models/vd_info_mod.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

abstract class SummaryRemoteSource {
  Future<VdInfoMod> vdInfoEctract(String vdId);
  Future<SummaryMod> summary(String text, String lang, String typeSummary, String lengthSummary , String titleVd);
}

class SummaryRemoteSourceImp implements SummaryRemoteSource {
  @override
  Future<SummaryMod> summary(String text, String lang, String typeSummary, String lengthSummary , String titleVd) async {
    try {
      var model = GenerativeModel(
          apiKey: await handelApiKey(), model: modelType, systemInstruction: Content.system(Prompts.summaryIntro));
      final response = await model.generateContent([
        Content.text(
            Prompts.summaryPromptRole(typeSummary, lengthSummary, lang, titleVd, text))
      ]);
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
      return VdInfoMod(vdUrl: vdId, vdText: text, vdTitle: info.title);
    } catch (e) {
      throw ClosedCaptionException();
    }
  }
}
