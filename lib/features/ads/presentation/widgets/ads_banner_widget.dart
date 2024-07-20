import 'package:business_tools/core/public/widgets/add.dart';
import 'package:business_tools/features/ads/presentation/bloc/bloc/ads_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdsBannerWidget extends StatelessWidget {
  const AdsBannerWidget({super.key, this.adSize});

  final AdSize? adSize;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdsBloc, AdsState>(
      listener: (context, state) {
        print(state.runtimeType);
      },
      builder: (context, state) {
        return SafeArea(
          child: SizedBox(
              width: (adSize ?? AdSize.banner).width.toDouble(),
              height: (adSize ?? AdSize.banner).height.toDouble(),
              child: state is AdBannerSuccess || state is InterstitialAdSuccess || state is InterstitialAdoading || state is InterstitialAdError
                  ?  AdWidget(ad: context.read<AdsBloc>().bannerAd!)
                  : Add(height: (adSize ?? AdSize.banner).height.toDouble()) ),
        );
      },
    );
  }
}
