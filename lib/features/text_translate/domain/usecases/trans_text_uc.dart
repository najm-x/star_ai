
import 'package:business_tools/core/errors/failure.dart';
import 'package:business_tools/features/text_translate/domain/entities/text_trans_entities.dart';
import 'package:business_tools/features/text_translate/domain/repositories/text_trans_repo.dart';
import 'package:dartz/dartz.dart';

class TransTextUc {
  final TextTransRepo textTransRepo;

  TransTextUc({required this.textTransRepo});
  Future<Either<Failure, TextTransEntities>> call(String text, String translateFrom, String translateTo ,  String info) async {
    return textTransRepo.translateText(text, translateFrom, translateTo , info );
  }
}
