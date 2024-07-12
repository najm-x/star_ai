import 'package:business_tools/core/errors/failure.dart';
import 'package:business_tools/features/text_translate/domain/entities/text_trans_entities.dart';
import 'package:dartz/dartz.dart';

abstract class TextTransRepo {
  Future<Either<Failure, TextTransEntities>> translateText(String text, String translateFrom, String translateTo , String info);
  Future<Either<Failure, Unit>> saveText(String text);
}
