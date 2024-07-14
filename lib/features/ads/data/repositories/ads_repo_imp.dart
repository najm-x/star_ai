import 'package:business_tools/core/errors/failure.dart';
import 'package:business_tools/features/ads/data/datasources/ads_remote_data.dart';
import 'package:business_tools/features/ads/domain/repositories/ads_repo.dart';
import 'package:dartz/dartz.dart';

class AdsRepoImp extends AdsRepo {
  final AdsRemoteData adsRemoteData ;

  AdsRepoImp({required this.adsRemoteData}); 
  @override
  Future<Either<Failure, Unit>> bannerAd() {
    // TODO: implement bannerAd
    throw UnimplementedError();
  }
  
}