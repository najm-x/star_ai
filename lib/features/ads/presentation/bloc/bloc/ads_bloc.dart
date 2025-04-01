import 'package:bloc/bloc.dart';
import 'package:business_tools/core/errors/failure.dart';
import 'package:business_tools/features/ads/domain/usecases/ads_uc.dart';
import 'package:business_tools/features/ads/domain/usecases/lnterstitial_ad_uc.dart';
import 'package:business_tools/features/ads/domain/usecases/rewarded_ad_uc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
part 'ads_event.dart';
part 'ads_state.dart';

class AdsBloc extends Bloc<AdsEvent, AdsState> {
  final AdsUc adsUc;
  final InterstitialAdUc interstitialAdUc;
  final RewardedAdUc rewardedAdUc;
  BannerAd? bannerAd;
  InterstitialAd? interstitialAd;
  RewardedAd? rewardedAd;
  AdsBloc({required this.adsUc, required this.interstitialAdUc, required this.rewardedAdUc}) : super(AdsInitial()) {
    on<AdsEvent>((event, emit) {});
    on<BannerAdEvent>(_bannerAdEvent);
    on<InterstitialAdEvent>(_interstitialAdEvent);
    on<RewardedAdEvent>(_rewardedAdEvent);
  }
  //Event
  Future<void> _bannerAdEvent(BannerAdEvent event, Emitter<AdsState> emit) async {
    emit(AdsLoading());
    var failureOrDone = await adsUc.call(event.size ?? AdSize.banner);
    emit(_bannerAdEventHandel(failureOrDone));
  }

  Future<void> _interstitialAdEvent(InterstitialAdEvent event, Emitter<AdsState> emit) async {
    emit(InterstitialAdoading());
    var failureOrDone = await interstitialAdUc();
    emit(_interstitialAdEventHandel(failureOrDone));
  }

  Future<void> _rewardedAdEvent(RewardedAdEvent event, Emitter<AdsState> emit) async {
    emit(RewardedAdLoading());
    var failureOrDone = await rewardedAdUc();
    emit(_rewardedAdEventHandel(failureOrDone));
  }

//State
  AdsState _bannerAdEventHandel(Either<Failure, BannerAd> failureOrDone) {
    return failureOrDone.fold((failure) => AdsError(), (done) {
      bannerAd = done;
      return AdBannerSuccess();
    });
  }

  AdsState _interstitialAdEventHandel(Either<Failure, InterstitialAd> failureOrDone) {
    return failureOrDone.fold((failure) => InterstitialAdError(), (done) {
      interstitialAd = done;
      return InterstitialAdSuccess();
    });
  }

  AdsState _rewardedAdEventHandel(Either<Failure, RewardedAd> failureOrDone) {
    return failureOrDone.fold((failure) => RewardedAdError(), (done) {
      rewardedAd = done;
      return RewardedAdSuccess();
    });
  }

  @override
  Future<void> close() {
    bannerAd?.dispose();
    interstitialAd?.dispose();
    rewardedAd?.dispose();
    return super.close();
  }
}
