import 'package:business_tools/core/errors/exceptions.dart';
import 'package:business_tools/core/errors/failure.dart';
import 'package:business_tools/core/functions/handel_exceptions.dart';
import 'package:business_tools/features/video_translator/data/datasources/vd_remote_dara_source.dart';
import 'package:business_tools/features/video_translator/data/models/data_vd_model.dart';
import 'package:business_tools/features/video_translator/data/models/vd_translate_model.dart';
import 'package:business_tools/features/video_translator/domain/entities/vd_translate_entities.dart';
import 'package:business_tools/features/video_translator/domain/repositories/vd_translate_repo.dart';
import 'package:dartz/dartz.dart';

class VdTranslateRepoImp extends VdTranslateRepo {
  final VdRemoteDaraSource vdRemoteDataSource;

  VdTranslateRepoImp({required this.vdRemoteDataSource});
  @override
  Future<Either<Failure, List<VdTranslateEntities>>> vdTranslate(
      String videoId, String translateFrom, String translateTo, String translateFromCode) async {
    try {
      return right(await vdRemoteDataSource.vdTranslate(videoId, translateFrom, translateTo, translateFromCode));
    } catch (e) {
      if (e is TransScriptVdException) {
        return left(TransScriptVdFailure());
      }
      if (e is TranslateVdException) {
        return left(TranslateVdFailure());
      }
      return left(EmptyFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> downloadTranslation(List<VdTranslateEntities> translation, String videoUrl) async {
    try {
      return right(await vdRemoteDataSource.downloadTranslation(translation, videoUrl));
    } catch (e) {
      print(e);
      if (e is CreateFileException) {
        return left(CreateFileFailure());
      }
      if (e is EmptyPathException) {
        return left(EmptyPathFailure());
      }
      if (e is PermissionException) {
        return left(PermissionFailure());
      }
      return left(EmptyFailure());
    }
  }

  @override
  Future<Either<Failure, DataVdModel>> getTransCript(
      String videoId, String translateFrom, String translateTo, String translateFromCode) async {
    try {
      return right(await vdRemoteDataSource.getTransCript(videoId, translateFrom, translateTo, translateFromCode));
    } catch (e) {
      return left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, List<VdTranslateEntities>>> vdTransRealTime(
      String translateFrom, String translateTo, String videoInfo, List<VdTranslateEntities> subTitles) async {
    try {
      return right(await vdRemoteDataSource.vdTransRealTime(
          translateFrom,
          translateTo,
          videoInfo,
          subTitles
              .map((data) => VdTranslateModel(subTitle: data.subTitle, start: data.start, end: data.end))
              .toList()));
    } catch (e) {
      return left(mapExceptionToFailure(e));
    }
  }
}
