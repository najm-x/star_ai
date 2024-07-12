import 'package:business_tools/core/errors/failure.dart';
import 'package:business_tools/features/video_translator/domain/entities/vd_translate_entities.dart';
import 'package:business_tools/features/video_translator/domain/repositories/vd_translate_repo.dart';
import 'package:dartz/dartz.dart';

class DownloadTransUc {
  final VdTranslateRepo vdTranslateRepo ;

  DownloadTransUc({required this.vdTranslateRepo});
  Future<Either<Failure , Unit>> call(List<VdTranslateEntities> translation , String videoUrl) async{
    return vdTranslateRepo.downloadTranslation(translation,videoUrl);
  }
}