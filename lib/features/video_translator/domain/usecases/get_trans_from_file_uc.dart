import 'package:business_tools/core/errors/failure.dart';
import 'package:business_tools/features/video_translator/domain/entities/vd_translate_entities.dart';
import 'package:business_tools/features/video_translator/domain/repositories/vd_translate_repo.dart';
import 'package:dartz/dartz.dart';

class GetTransFromFileUc {
  final VdTranslateRepo vdTranslateRepo;

  GetTransFromFileUc({required this.vdTranslateRepo});
  Future<Either<Failure, List<VdTranslateEntities>>> call(String filePath) async {
    return vdTranslateRepo.getTransFromFile(filePath);
  }
}
