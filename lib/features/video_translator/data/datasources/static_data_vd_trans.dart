import 'package:business_tools/core/app_routes.dart';
import 'package:business_tools/core/constant/app_routes_name.dart';
import 'package:business_tools/core/constant/types_validate.dart';
import 'package:business_tools/features/video_translator/data/models/vd_type_model.dart';
import 'package:flutter/material.dart';
import 'package:business_tools/l10n/app_localizations.dart';

class StaticDataVdTrans {
  static String fghfgh = '''
Hello,

My task is to translate YouTube video titles into the requested language based on the content of the video. I will follow these guidelines during the translation:

List format: I will present the titles in a list format.

Matching the number of elements: When translating, I will return the titles in a list format while maintaining the same number of elements as in the original list.

Technical terms: I will translate the titles into the requested language while retaining the technical terms without translation if they are related to technical subjects like programming, and provide clarification if needed.

Accuracy and context of translation: The translation will be accurate and contextually appropriate, especially if the video is educational.

List structure: I will maintain the structure of the list by separating each element with a comma as in the original list. This ensures that no issues arise when converting it to JSON using Dart.

List integrity: I will ensure the integrity of the list by avoiding any errors, such as not writing commas (,) between each element.

Last comma: I will not add a comma (,) to the last element in the list as shown in the examples.

Quotation marks: I will not repeat quotation marks within a single element to avoid issues when converting to JSON.

Incorrect way that causes issues:

[
"Hello click on the "button""
]

Correct way that does not cause issues:

[
"Hello click on the (button)"
]

If the video discusses a programming language or any technical lesson where English terms are important for the listener, I will retain them and provide clarification if needed.

The original list has (6 elements):

[
"In Kotlin:",
"fun is used to declare",
"a function",
"the main() function",
"is where your program starts from",
"the body of a function is written within curly braces {}"
]

The translated list has (6 elements):

[
"In Kotlin:",
"The word fun is used to declare",
"a function",
"the main() function",
"is the starting point of your program",
"the body of the function is written within curly braces {}"
]

Important note: I will provide the translation in a list format with the same number of elements as in the original list to ensure no issues arise when converting it to JSON using Dart.

Very important note: I will not add a comma (,) to the last part of the list as shown in the example.

Very important note in all the following examples: I will translate each element in this list separately to ensure the number of elements in the original list matches the number of elements in the translated list.

The translated text must contain the same number of sentences as the original text.
I will translate each sentence from the original text independently.
I will not merge or split any sentences during the translation.
I will ensure that each element in the original list corresponds to exactly one element in the translated list.
''';

  static List<Color> colorList = [
    Colors.white,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.pink,
    Colors.red,
    Colors.black,
  ];
  static BuildContext context = goRouter.routerDelegate.navigatorKey.currentContext!;
  List<VdTypeModel> vdTypeData = [
    VdTypeModel(
        title: AppLocalizations.of(context)!.vdTransTypeOneTitle,
        body: AppLocalizations.of(context)!.vdTransTypeOneDes,
        pageRoute: AppRouteName.videoTranslatorPage,
        type: TypesValidate.tarnsWithDownload),
    VdTypeModel(
        title: AppLocalizations.of(context)!.vdTransTypeTowTitle,
        body: AppLocalizations.of(context)!.vdTransTypeTowDes,
        pageRoute: AppRouteName.videoTranslatorPage,
        type: TypesValidate.transDirect),
    VdTypeModel(
        title: AppLocalizations.of(context)!.vdTransTypeThreeTitle,
        body: AppLocalizations.of(context)!.vdTransTypeThreeDes,
        pageRoute: AppRouteName.videoTranslatorPage,
        type: TypesValidate.transFromFile),
  ];
}
