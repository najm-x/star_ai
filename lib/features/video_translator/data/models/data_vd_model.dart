import 'package:business_tools/features/video_translator/domain/entities/vd_translate_entities.dart';

class DataVdModel {
  final String idVideo;
  final List<VdTranslateEntities> data;
  DataVdModel({required this.idVideo, required this.data});
}
