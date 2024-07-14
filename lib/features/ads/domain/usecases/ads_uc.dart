import 'package:business_tools/core/errors/failure.dart';
import 'package:business_tools/features/ads/domain/repositories/ads_repo.dart';
import 'package:dartz/dartz.dart';

class AdsUc {
  final AdsRepo adsRepo ;

  AdsUc({required this.adsRepo});
  Future<Either<Failure,Unit>> call ()async{
    return await adsRepo.bannerAd();
  }
}