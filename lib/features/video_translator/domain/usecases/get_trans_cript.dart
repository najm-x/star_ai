import 'package:business_tools/core/errors/failure.dart';
import 'package:business_tools/features/video_translator/data/models/data_vd_model.dart';
import 'package:business_tools/features/video_translator/domain/repositories/vd_translate_repo.dart';
import 'package:dartz/dartz.dart';

class GetTransCriptUc {
  final VdTranslateRepo vdTranslateRepo;

  GetTransCriptUc({required this.vdTranslateRepo});
  Future<Either<Failure, DataVdModel>> call(
      String videoId, String translateFrom, String translateTo, String translateFromCode) async {
    return vdTranslateRepo.getTransCript(videoId, translateFrom, translateTo, translateFromCode);
  }
}
