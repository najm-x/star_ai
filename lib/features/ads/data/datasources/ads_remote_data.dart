import 'package:business_tools/core/constant/ad_unit_ids.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

abstract class AdsRemoteData {
  Future<BannerAd> bannerAd(AdSize size);
  Future<InterstitialAd> interstitialAd();
}

class AdsRemoteDataImp implements AdsRemoteData {
  @override
  Future<BannerAd> bannerAd(AdSize size) async {
    BannerAd? bannerAd ;
    await BannerAd(
      adUnitId: AdUnitIds.bannerAdId,
      request: const AdRequest(),
      size: size,
      listener: BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) async {
         bannerAd = ad as BannerAd ;
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (ad, err) {
          print("object");
          ad.dispose();
        },
      ),
    ).load() ;
    while (bannerAd == null) {
      await Future.delayed(Durations.extralong1) ;
    }
    return bannerAd!;
  }

  @override
  Future<InterstitialAd> interstitialAd() async {
    InterstitialAd? interstitialAd;
     InterstitialAd.load(
        adUnitId: AdUnitIds.interstitialAdId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          // Called when an ad is successfully received.
          onAdLoaded: (ad) {
            // Keep a reference to the ad so you can show it later.
            interstitialAd = ad;
          },
          // Called when an ad request failed.
          onAdFailedToLoad: (LoadAdError error) {},
        ));

    while (interstitialAd == null) {
      await Future.delayed(Durations.extralong4);
    }
    return interstitialAd!;
  }
}
