import 'package:business_tools/core/errors/failure.dart';
import 'package:business_tools/features/text_extract/domain/entities/text_extract_entities.dart';
import 'package:dartz/dartz.dart';

abstract class TextExtractRepo {
  Future<Either<Failure, String>> pickImage();
  Future<Either<Failure, TextExtractEntities>> extractTextFromImage(String path);
  Future<Either<Failure, Unit>> saveExtractedText(String text);
  Future<Either<Failure, String>> cropImage(String path);
}
