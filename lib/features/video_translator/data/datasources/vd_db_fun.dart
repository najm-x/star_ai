import 'dart:async';
import 'dart:convert';
import 'package:business_tools/core/functions/handel_api_key.dart';
import 'package:business_tools/features/video_translator/data/datasources/static_data_vd_trans.dart';
import 'package:business_tools/features/video_translator/data/models/vd_translate_model.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

abstract class VdDbFunHelpings {
  Future<List<VdTranslateModel>> transCriptVd(
      String videoId, String translateFromCode); // [transCriptVd] for get the subTitles From Video By id
  tarnslateSmallCaption(String translateFrom, String translateTo, String videoInfo,
      List<VdTranslateModel> caption); //for translate Small Caption
  tarnslateLargCapthion(String translateFrom, String translateTo, String videoInfo,
      List<VdTranslateModel> caption); //for translate larg Caption
  //?👇 the[getTheListLengths] used in tarnslateLargCapthion
  List<int> getTheListLengths(
      List<VdTranslateModel>
          caption); // for convert the lengths list caption to small length by [itemsSelectedBySend] Example caption.length == 105 and [itemsSelectedBySend == 50] the list length is [50 , 100 , 5]
  Future<String> sendCaptionByLength(
      List<int> lingths,
      String translateFrom,
      String translateTo,
      String videoInfo,
      List<VdTranslateModel>
          caption); // for send the cpation to ai by length  [50 , 100 , 5] ==> [0-50 , 50-100 ,100-105] and add all it in one list
  List? decodeTheTranslate(String translate); // for decode the translate after translate smoll OR larg Caption
  List<VdTranslateModel> theTranslate(List listSubTilte,
      List<VdTranslateModel> transScript); // conevrt the list translation to list<VdTranslateModel> for use it
}

class VdDbFunHelping {
  VdDbFunHelping() {
    initModel();
  }
  static var translationProgressCo = StreamController<double>();
  static const int itemsSelectedBySend = 50;
  late GenerativeModel model;
  void initModel() async {
    model = GenerativeModel(
        systemInstruction: Content.text(StaticDataVdTrans.fghfgh),
        model: 'gemini-1.5-flash',
        apiKey: await handelApiKey(),
        generationConfig: GenerationConfig());
  }

  // [transCriptVd] for get the subTitles From Video By id
  Future<List<VdTranslateModel>> transCriptVd(String videoId, String translateFromCode) async {
    List<VdTranslateModel> listcaptions = [];
    try {
      var yt = YoutubeExplode();
      var ma = await yt.videos.closedCaptions.getManifest(videoId);
      var trackInfo = ma.getByLanguage(translateFromCode); // Get [translateFrom] caption.
      // Get the actual closed caption track.
      var track = await yt.videos.closedCaptions.get(trackInfo[0]);
      var caption = track.captions;

      for (var data in caption) {
        listcaptions.add(VdTranslateModel(subTitle: data.text.replaceAll('"', ' '), start: data.offset, end: data.end));
      }
    } catch (e) {
      listcaptions = [];
    }
    print(listcaptions.length);
    return listcaptions;
  }

  tarnslateSmallCaption(
      String translateFrom, String translateTo, String videoInfo, List<VdTranslateModel> caption) async {
    var response = await model.generateContent([
      Content.text(prompt(caption.length, translateFrom, translateTo, videoInfo, convertListToString(caption), ""))
    ]);
    debugPrint(response.text);
    List responeToList = [];
    List responseFixed = [];

    try {
      responeToList = [];
      responeToList = json.decode(response.text!);
      responseFixed = fixResponse(responeToList, caption.length);
    } catch (e) {
      responeToList = [];
      responseFixed = [];
    }

    while (responeToList.isEmpty) {
      response = await model.generateContent([
        Content.text(prompt(caption.length, translateFrom, translateTo, videoInfo, convertListToString(caption),
            "Return the translation response as a list consisting of only ${caption.length} elements"))
      ]);

      try {
        responeToList = [];
        responeToList = json.decode(response.text!);
      } catch (e) {
        responseFixed = [];
        responeToList = [];
      }
    }

    return responseFixed.isEmpty ? responeToList : responseFixed;
  }

  List<VdTranslateModel> theTranslate(List listSubTilte, List<VdTranslateModel> transScript) {
    List<VdTranslateModel> toModel = [];
    print(" object ${listSubTilte.length} ---------- ${transScript.length}");
    for (var i = 0; i < transScript.length; i++) {
      toModel.add(VdTranslateModel(subTitle: listSubTilte[i], start: transScript[i].start, end: transScript[i].end));
    }
    return toModel;
  }

  tarnslateLargCapthion(
      String translateFrom, String translateTo, String videoInfo, List<VdTranslateModel> caption) async {
    List<int> lengths = getTheListLengths(caption);
    return await sendCaptionByLength(lengths, translateFrom, translateTo, videoInfo, caption);
  }

  List<int> getTheListLengths(List<VdTranslateModel> caption) {
    //list lengths 479 //
    // [itemsSelectedBySend , 200 , itemsSelectedBySend0 , 400 , 79]
    //
    List<int> lengths = [];

    for (var index = 0; index < (caption.length ~/ itemsSelectedBySend) + 1; index++) {
      if (index == (caption.length ~/ itemsSelectedBySend) /*on the last for*/) {
        int total = 0;
        // ignore: unused_local_variable
        for (var none in lengths) {
          total += itemsSelectedBySend;
        }

        caption.length - total != 0
            ? lengths.add(caption.length - total)
            : [""]; // for get the last of number like 479 => 79;
      } else {
        lengths.add(itemsSelectedBySend * (index + 1));
      }
    }
    return lengths;
  }

  Future<List> sendCaptionByLength(List<int> lingths, String translateFrom, String translateTo, String videoInfo,
      List<VdTranslateModel> caption) async {
    // [itemsSelectedBySend , 200 , itemsSelectedBySend0 , 400 , 79]
    // first add to text list items from  0 --itemsSelectedBySend  and send this to ai and add to totala response
    // second add to text list items from itemsSelectedBySend --200 and send this to ai and add to totala response
    // second add to text list items from 200 --itemsSelectedBySend0 and send this to ai and add to totala response
    // second add to text list items from itemsSelectedBySend0 --400 and send this to ai and add to totala response
    // second add to text list items from 400 --479 and send this to ai and add to totala response
    // return the total respnse ;
    List totalRespnse = []; //? fot create list Start by <[> and end by <]>
    for (var index = 0; index < lingths.length; index++) {
      translationProgress(index, lingths.length);
      // ? if the totlal length is 479 the start is 0 -- itemsSelectedBySend -- 200 -- itemsSelectedBySend0 -- 400
      int startFrom = (index == 0 ? 0 : lingths[index - 1]);
      int endto = (lingths.length - 1 == index /*on last value*/
          ? (lingths[index] % itemsSelectedBySend != 0
              ? lingths[index] + lingths[index - 1] /*get totlal like 400 + 79 = 497 the */
              : lingths[index])
          : lingths[
              index]); // ? if the totlal length is 479 the end is itemsSelectedBySend -- 200 -- itemsSelectedBySend0 -- 400 -- 497
      print("$startFrom -- $endto");
      List respnse = await sendToAi(translateFrom, translateTo, videoInfo, caption, startFrom, endto);
      // translate by start and end like From 0 --itemsSelectedBySend then itemsSelectedBySend --  200 ... to 400 - 497 ;
      totalRespnse.addAll(respnse);
    }
    debugPrint(totalRespnse.toString());
    return totalRespnse;
  }

  Future<List> sendToAi(String translateFrom, String translateTo, String videoInfo, List<VdTranslateModel> caption,
      int start, int end) async {
    String listToString = '';
    int count = (end % itemsSelectedBySend == 0) ? itemsSelectedBySend : end - start;
    for (var index = 0; index < count; index++) {
      //On End the list remove the (,) Like "3"
      //["1" , "2" , "3"]
      listToString += start + index + 1 == end
          // get the subtitles by position [start + index] on the list and add it in [listToString]
          // for translate it by itemsSelectedBySend items
          ? "\"${caption[start + index].subTitle.replaceAll('\n', " ")}\""
          : "\"${caption[start + index].subTitle.replaceAll('\n', " ")}\" , \n";
    }

    debugPrint("""
[
 $listToString
]""");
    print("$count ===========----------------=============");

    //this prompt for translate the list
    var response = await model
        .generateContent([Content.text(prompt(count, translateFrom, translateTo, videoInfo, listToString, ""))]);
    debugPrint(response.text);
    List responeToList = [];
    List responseFixed = [];

    try {
      responeToList = [];
      responeToList = json.decode(response.text!);
      responseFixed = fixResponse(responeToList, count);
    } catch (e) {
      responeToList = [];
      responseFixed = [];
    }

    while (responeToList.isEmpty) {
      response = await model.generateContent([
        Content.text(prompt(count, translateFrom, translateTo, videoInfo, listToString,
            "Return the translation response as a list consisting of only $count elements"))
      ]);

      try {
        responeToList = [];
        responeToList = json.decode(response.text!);
        responseFixed = fixResponse(responeToList, count);
      } catch (e) {
        responseFixed = [];
        responeToList = [];
      }
    }
    return responseFixed.isEmpty ? responeToList : responseFixed;
  }

  String prompt(
      int count, String translateFrom, String translateTo, String videoInfo, String listToString, String more) {
    return """
Translate these captions, which are a list of strings list, containing $count elements, from the language $translateFrom to the language $translateTo. Maintain the technical terms in the $translateFrom language and provide explanatory comments on them in the $translateTo language. These captions are in the context of: $videoInfo , 

containing $count elements:

[
$listToString
]


The translated text must contain the same number of sentences as the original text.
translate each sentence from the original text independently.
 not merge or split any sentences during the translation.
 ensure that each element in the original list corresponds to exactly one element in the translated list.
 do not add (,) to the last element in the list
 the response is only list and elements = only $count 
$more

""";
  }

  fixResponse(List listForFixIt, int count) {
    List listFixed = [];
    if (listForFixIt.length < count) {
      int length = listForFixIt.length;
      for (var i = 0; i < 100; i++) {
        length++;
        if (length == count) break;
      }
      for (var i = 0; i < length; i++) {
        if (listForFixIt.length < i + 1) {
          listFixed.add(listForFixIt[i]);
        } else {
          listFixed.add("----");
        }
      }
      return listFixed;
    } else if (listForFixIt.length > count) {
      for (var i = 0; i < count; i++) {
        listFixed.add(listForFixIt[i]);
      }
      return listFixed;
    } else {
      return listFixed;
    }
  }

  Future<String> videoInfo(String videoId) async {
    // You can provide either a video ID or URL as String or an instance of `VideoId`.
    var yt = YoutubeExplode();
    var video = await yt.videos.get('https://youtube.com/watch?v=$videoId'); // Returns a Video instance.

    return video.title;
  }

  String convertListToString(List<VdTranslateModel> fixedResponse) {
    String listToString = "";
    for (var i = 0; i < fixedResponse.length; i++) {
      listToString += fixedResponse.length - 1 == i
          ? "\"${fixedResponse[i].subTitle.replaceAll('\n', " ")}\"  \n"
          : "\"${fixedResponse[i].subTitle.replaceAll('\n', " ")}\" , \n";
    }
    return """
[
$listToString
]
    """;
  }

  translationProgress(int index, int total) async {
    translationProgressCo.sink.add((100 * index / total).toDouble());
    index == total - 1 ? await translationProgressCo.close() : null;
  }
}
