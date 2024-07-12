// import 'package:business_tools/features/video_translator/data/models/vd_translate_model.dart';
// import 'package:flutter/material.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
// import 'package:flutter/services.dart';

// class Test extends StatefulWidget {
//   const Test({super.key});

//   @override
//   State<Test> createState() => _TestState();
// }

// class _TestState extends State<Test> {
//   lsitjg(List<int> count) async {
//     // [200 , 400 , 600 , 800 , 79]
//     // first add to text list items from 0 --200 and send this to ai and add to totala response
//     // second add to text list items from 200 --400 and send this to ai and add to totala response
//     // second add to text list items from 400 --600 and send this to ai and add to totala response
//     // second add to text list items from 600 --800 and send this to ai and add to totala response
//     // second add to text list items from 800 --879 and send this to ai and add to totala response
//     // return the total respnse ;
//     String totalRespnse = "[";
//     for (var i = 0; i < count.length; i++) {
//       int startFrom = (i == 0 ? 0 : count[i - 1]);
//       int endto = (count.length - 1 == i ? (count[i] % 200 != 0 ? count[i] + count[i - 1] : count[i]) : count[i]);
//       // print("$startFrom -- $endto");
//       // String respnse = await sendToAi();
//       // String secRespnse = respnse.replaceAll('[', '')..replaceAll(']', '');
//       // totalRespnse += count.length - 1 == i ? "$secRespnse\n]" : "$secRespnse,\n" ;
//     }
//   }

//   tarnslateCapthionForLarg(int caption) {
//     //list 879 //
//     // [200 , 400 , 600 , 800 , 79]
//     //
//     List<int> lingths = [];

//     for (var i = 0; i < (caption ~/ 200) + 1; i++) {
//       if (i == (caption ~/ 200)) {
//         int sdvv = 0;
//         // ignore: unused_local_variable
//         for (var isds in lingths) {
//           sdvv += 200;
//         }

//         caption - sdvv != 0 ? lingths.add(caption - sdvv) : [""];
//       } else {
//         lingths.add(200 * (i + 1));
//       }
//     }
//     return lingths;
//   }

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: ElevatedButton(
//             onPressed: () {
//               print(lsitjg(tarnslateCapthionForLarg(600)));
//             },
//             child: Text("data")),
//       ),
//     );
//   }
// }

// //                 final captionScraper = YouTubeCaptionScraper();
// //                 final captionTracks = await captionScraper.getCaptionTracks('https://www.youtube.com/watch?v=izr7uBuiacE');

// // // Fetch the subtitles by providing it with a `CaptionTrack`
// // // from `getCaptionTracks`.
// //                 final subtitles = await captionScraper.getSubtitles(captionTracks[0]);

// // // Use the subtitles however you want.
// //                 for (final subtitle in subtitles) {
// //                   print('${subtitle.start} - ${subtitle.duration} - ${subtitle.text}');
// //                 }
