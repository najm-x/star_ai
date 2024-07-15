import 'package:business_tools/core/errors/failure.dart';
import 'package:business_tools/features/text_extract/domain/repositories/text_extract_repo.dart';
import 'package:dartz/dartz.dart';

class CropImageUc {
  final TextExtractRepo textExtractRepo ;

  CropImageUc({required this.textExtractRepo});
  Future<Either< Failure , String >> call (String path) async{
  return await textExtractRepo.cropImage(path) ;
  }
}