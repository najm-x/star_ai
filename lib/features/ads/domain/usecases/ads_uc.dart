import 'package:business_tools/core/errors/failure.dart';
import 'package:business_tools/features/ads/domain/repositories/ads_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdsUc {
  final AdsRepo adsRepo ;

  AdsUc({required this.adsRepo});
  Future<Either<Failure,BannerAd>> call (AdSize size)async{
    return await adsRepo.bannerAd(size);
  }
}