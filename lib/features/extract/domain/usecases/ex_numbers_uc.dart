import 'package:business_tools/core/errors/failure.dart';
import 'package:business_tools/features/extract/domain/entities/emails_numbera_entite.dart';
import 'package:business_tools/features/extract/domain/repositories/extract_repo.dart';
import 'package:dartz/dartz.dart';

class ExNumbersUc {
 final ExtractRepo extractRepo ;

  ExNumbersUc({required this.extractRepo}); 
  Future<Either<Failure , List<EmailsNumberaEntite>>> call (String text) async {
    return await extractRepo.extractNumbers(text);
  }
}