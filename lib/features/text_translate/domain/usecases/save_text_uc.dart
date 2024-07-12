


import 'package:business_tools/core/errors/failure.dart';
import 'package:business_tools/features/text_translate/domain/repositories/text_trans_repo.dart';
import 'package:dartz/dartz.dart';

class SaveTextUc {
  final TextTransRepo textTransRepo;

  SaveTextUc({required this.textTransRepo});
    Future<Either<Failure, Unit>>  call(String text)
 async {
    return textTransRepo.saveText(text);
  }
}

