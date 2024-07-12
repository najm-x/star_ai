import 'package:business_tools/core/errors/failure.dart';
import 'package:business_tools/features/extract/domain/entities/emails_numbera_entite.dart';
import 'package:business_tools/features/extract/domain/repositories/extract_repo.dart';
import 'package:dartz/dartz.dart';

class SaveDatasUc {
 final ExtractRepo extractRepo ;

  SaveDatasUc({required this.extractRepo}); 
  Future<Either<Failure , Unit>> call (String type , List<EmailsNumberaEntite>data) async {
    return await extractRepo.saveData(type , data);
  }
}