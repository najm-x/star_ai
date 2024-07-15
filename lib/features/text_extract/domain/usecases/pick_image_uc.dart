import 'package:business_tools/core/errors/failure.dart';
import 'package:business_tools/features/text_extract/domain/repositories/text_extract_repo.dart';
import 'package:dartz/dartz.dart';

class PickImageUc {
  final TextExtractRepo textExtractRepo;

  PickImageUc({required this.textExtractRepo});
  Future<Either<Failure, String>> call() async {
    return await textExtractRepo.pickImage();
  }
}
