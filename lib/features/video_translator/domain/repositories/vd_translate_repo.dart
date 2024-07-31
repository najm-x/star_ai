import 'package:business_tools/core/errors/failure.dart';
import 'package:business_tools/features/video_translator/data/models/data_vd_model.dart';
import 'package:business_tools/features/video_translator/domain/entities/vd_translate_entities.dart';
import 'package:dartz/dartz.dart';

abstract class VdTranslateRepo {
  Future<Either<Failure, List<VdTranslateEntities>>> vdTranslate(
      String videoId, String translateFrom, String translateTo, String translateFromCode);
  Future<Either<Failure, Unit>> downloadTranslation(List<VdTranslateEntities> translation, String videoUrl);
  Future<Either<Failure, DataVdModel>> getTransCript(
      String videoId, String translateFrom, String translateTo, String translateFromCode);
  Future<Either<Failure, List<VdTranslateEntities>>> vdTransRealTime(
      String translateFrom, String translateTo, String videoInfo, List<VdTranslateEntities> subTitles);
  Future<Either<Failure, List<VdTranslateEntities>>> getTransFromFile(String filePath);
}
