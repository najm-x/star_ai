import 'package:business_tools/features/video_translator/domain/entities/vd_translate_entities.dart';

class DataVdModel {
  final String idVideo;
  final List<VdTranslateEntities> data;
  final String? translateFrom;
  final String? translateTo;
  final String? videoInfo ;
  DataVdModel( {
    required this.idVideo,
    required this.data,
    this.translateFrom,
    this.translateTo,
    this.videoInfo,
  });
}
