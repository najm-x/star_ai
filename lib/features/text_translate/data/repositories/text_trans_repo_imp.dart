import 'package:business_tools/core/errors/failure.dart';
import 'package:business_tools/core/functions/handel_exceptions.dart';
import 'package:business_tools/features/text_translate/data/datasources/text_trans_remote_data_source.dart';
import 'package:business_tools/features/text_translate/domain/entities/text_trans_entities.dart';
import 'package:business_tools/features/text_translate/domain/repositories/text_trans_repo.dart';
import 'package:dartz/dartz.dart';

class TextTransRepoImp implements TextTransRepo {
  final TextTransRemoteDataSource textTransRemoteDataSource;

  TextTransRepoImp({required this.textTransRemoteDataSource});

  @override
  Future<Either<Failure, Unit>> saveText(String text) async {
    try {
      return right(await textTransRemoteDataSource.saveText(text));
    } catch (e) {
      return left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, TextTransEntities>> translateText(
      String text, String translateFrom, String translateTo, String info) async {
    try {
      return right(await textTransRemoteDataSource.translateText(text, translateFrom, translateTo, info));
    } catch (e) {
      return left(mapExceptionToFailure(e));
    }
  }
}
