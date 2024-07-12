import 'package:business_tools/core/errors/failure.dart';
import 'package:business_tools/features/video_translator/domain/entities/vd_translate_entities.dart';
import 'package:business_tools/features/video_translator/domain/repositories/vd_translate_repo.dart';
import 'package:dartz/dartz.dart';

class VdTranslateUc {
  final VdTranslateRepo vdTranslateRepo;

  VdTranslateUc({required this.vdTranslateRepo});
  Future<Either<Failure, List<VdTranslateEntities>>> call(
      String videoId, String translateFrom, String translateTo, String translateFromCode, ) async {
    return vdTranslateRepo.vdTranslate(videoId, translateFrom, translateTo, translateFromCode);
  }
}
