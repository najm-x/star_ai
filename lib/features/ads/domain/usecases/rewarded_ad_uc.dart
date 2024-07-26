import 'package:business_tools/core/errors/failure.dart';
import 'package:business_tools/features/ads/domain/repositories/ads_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class RewardedAdUc {
  final AdsRepo adsRepo;

  RewardedAdUc({required this.adsRepo});
  Future<Either<Failure, RewardedAd>> call() async {
    return await adsRepo.rewardedAd();
  }
}
