import 'package:business_tools/core/errors/exceptions.dart';
import 'package:business_tools/core/errors/failure.dart';
import 'package:business_tools/features/extract/data/datasources/loacal_data_source.dart';
import 'package:business_tools/features/extract/domain/entities/emails_numbera_entite.dart';
import 'package:business_tools/features/extract/domain/repositories/extract_repo.dart';
import 'package:dartz/dartz.dart';

class ExtractRepoImp implements ExtractRepo {
  final LocalDataSource localDataSource;

  ExtractRepoImp({required this.localDataSource});
  @override
  Future<Either<Failure, List<EmailsNumberaEntite>>> extractEmails(String text) async {
    try {
      return right(await localDataSource.extractEmails(text));
    } on EmptyException {
      return left(EmptyFailure());
    }
  }

  @override
  Future<Either<Failure, List<EmailsNumberaEntite>>> extractNumbers(String text) async {
    try {
      return right(await localDataSource.extractNumbers(text));
    } on EmptyException {
      return left(EmptyFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> saveData(String type, List<EmailsNumberaEntite> data) async {
    try {
      right(await localDataSource.saveData(type, data));
    } catch (e) {
      if (e is EmptyPathException) {
        return left(EmptyPathFailure());
      }
      return left(SaveFailure());
    }
    return left(SaveFailure());
  }
}
