part of 'ads_bloc.dart';

sealed class AdsEvent extends Equatable {
  const AdsEvent();

  @override
  List<Object> get props => [];
}

final class BannerAdEvent extends AdsEvent {
  final AdSize? size;
  const BannerAdEvent({this.size});

  @override
  List<Object> get props => [];
}

final class InterstitialAdEvent extends AdsEvent {
  }
