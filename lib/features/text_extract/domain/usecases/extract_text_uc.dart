import 'package:business_tools/core/errors/failure.dart';
import 'package:business_tools/features/text_extract/domain/entities/text_extract_entities.dart';
import 'package:business_tools/features/text_extract/domain/repositories/text_extract_repo.dart';
import 'package:dartz/dartz.dart';

class ExtractTextUc {
  final TextExtractRepo textExtractRepo;

  ExtractTextUc({required this.textExtractRepo});
  Future<Either<Failure, TextExtractEntities>> call(String path) async {
    return await textExtractRepo.extractTextFromImage(path);
  }
}
