import 'package:business_tools/core/errors/failure.dart';
import 'package:business_tools/features/ads/domain/repositories/ads_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class InterstitialAdUc {
  final AdsRepo adsRepo ;

  InterstitialAdUc({required this.adsRepo});
  Future<Either<Failure,InterstitialAd>> call ()async{
    return await adsRepo.interstitialAd();
  }
}