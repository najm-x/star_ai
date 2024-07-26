import 'package:business_tools/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

abstract class AdsRepo {
  Future<Either<Failure , BannerAd>> bannerAd (AdSize size) ;
  Future<Either<Failure , InterstitialAd>> interstitialAd () ;
  Future<Either<Failure , RewardedAd>> rewardedAd () ;
}