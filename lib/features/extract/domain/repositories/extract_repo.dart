import 'package:business_tools/core/errors/failure.dart';
import 'package:business_tools/features/extract/domain/entities/emails_numbera_entite.dart';
import 'package:dartz/dartz.dart';

abstract class ExtractRepo {
  Future<Either<Failure, List<EmailsNumberaEntite>>> extractNumbers(String text);
  Future<Either<Failure, List<EmailsNumberaEntite>>> extractEmails(String text);
  Future<Either<Failure, Unit>> saveData (String type, List<EmailsNumberaEntite> data);
}
