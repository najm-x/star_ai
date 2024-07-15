import 'package:business_tools/core/errors/failure.dart';
import 'package:business_tools/features/text_extract/domain/repositories/text_extract_repo.dart';
import 'package:dartz/dartz.dart';

class SaveExtractedTextUc {
  final TextExtractRepo textExtractRepo;

  SaveExtractedTextUc({required this.textExtractRepo});
  Future<Either<Failure, Unit>> call(String text) async {
    return await textExtractRepo.saveExtractedText(text);
  }
}
