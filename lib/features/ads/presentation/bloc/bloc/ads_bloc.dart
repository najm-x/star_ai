import 'package:bloc/bloc.dart';
import 'package:business_tools/core/constant/shared_key.dart';
import 'package:business_tools/core/errors/failure.dart';
import 'package:business_tools/features/ads/domain/usecases/ads_uc.dart';
import 'package:business_tools/features/ads/domain/usecases/lnterstitial_ad_uc.dart';
import 'package:business_tools/features/ads/domain/usecases/rewarded_ad_uc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:business_tools/core/services/app_services.dart' show sl;
import 'package:shared_preferences/shared_preferences.dart';

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
    int? numbersShowOfAds = sl<SharedPreferences>().getInt(SharedKey.adsShow);

    numbersShowOfAds = numbersShowOfAds ?? 0;
    if (numbersShowOfAds < 2) {
      await sl<SharedPreferences>().setInt(SharedKey.adsShow, ++numbersShowOfAds);
      return;
    } else {
      emit(InterstitialAdoading());
      var failureOrDone = await interstitialAdUc();
      emit(_interstitialAdEventHandel(failureOrDone));
    }
  }

  Future<void> _rewardedAdEvent(RewardedAdEvent event, Emitter<AdsState> emit) async {
    emit(RewardedAdLoading());

    int? numbersShowOfAds = sl<SharedPreferences>().getInt(SharedKey.adsShow);
    numbersShowOfAds = numbersShowOfAds ?? 0;

    if (numbersShowOfAds < 3) {
      sl<SharedPreferences>().setInt(SharedKey.adsShow, ++numbersShowOfAds);
      return;
    } else {
      var failureOrDone = await rewardedAdUc();
      emit(await _rewardedAdEventHandel(failureOrDone));
      sl<SharedPreferences>().setInt(SharedKey.adsShow, 0);
    }
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
      sl<SharedPreferences>().setInt(SharedKey.adsShow, 0);
      return InterstitialAdSuccess();
    });
  }

  Future<AdsState> _rewardedAdEventHandel(Either<Failure, RewardedAd> failureOrDone) async {
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
