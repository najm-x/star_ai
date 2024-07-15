import 'package:business_tools/core/errors/failure.dart';
import 'package:business_tools/core/functions/handel_exceptions.dart';
import 'package:business_tools/features/text_extract/data/datasources/text_extract_remote_data.dart';
import 'package:business_tools/features/text_extract/domain/entities/text_extract_entities.dart';
import 'package:business_tools/features/text_extract/domain/repositories/text_extract_repo.dart';
import 'package:dartz/dartz.dart';

class TextExtractRepoImp implements TextExtractRepo {
  final TextExtractRemoteData textExtractRemoteData;

  TextExtractRepoImp({required this.textExtractRemoteData});
  @override
  Future<Either<Failure, TextExtractEntities>> extractTextFromImage(String path) async {
    try {
      return right(await textExtractRemoteData.extractTextFromImage(path));
    } catch (e) {
      return left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, String>> pickImage() async {
    try {
      return right(await textExtractRemoteData.pickImage());
    } catch (e) {
      return left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> saveExtractedText(String text) {
    // TODO: implement saveExtractedText
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> cropImage(String path) async {
    try {
      return right(await textExtractRemoteData.cropImage(path));
    } catch (e) {
      return left(mapExceptionToFailure(e));
    }
  }
}
