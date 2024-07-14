import 'package:business_tools/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class AdsRepo {
  Future<Either<Failure , Unit>> bannerAd () ;
}