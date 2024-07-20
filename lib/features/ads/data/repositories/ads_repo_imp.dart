import 'package:business_tools/core/errors/failure.dart';
import 'package:business_tools/core/functions/handel_exceptions.dart';
import 'package:business_tools/features/ads/data/datasources/ads_remote_data.dart';
import 'package:business_tools/features/ads/domain/repositories/ads_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdsRepoImp extends AdsRepo {
  final AdsRemoteData adsRemoteData;

  AdsRepoImp({required this.adsRemoteData});
  @override
  Future<Either<Failure, BannerAd>> bannerAd(AdSize size) async {
    try {
      return right(await adsRemoteData.bannerAd(size));
    } catch (e) {
      return left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, InterstitialAd>> interstitialAd() async {
    try {
      return right(await adsRemoteData.interstitialAd());
    } catch (e) {
      return left(mapExceptionToFailure(e));
    }
  }
}
