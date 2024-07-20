part of 'ads_bloc.dart';

final class AdsState extends Equatable {
  const AdsState();

  @override
  List<Object> get props => [];
}

final class AdsInitial extends AdsState {}

final class AdsLoading extends AdsState {}

final class AdsError extends AdsState {}

final class AdBannerSuccess extends AdsState {}

final class InterstitialAdoading extends AdsState {}

final class InterstitialAdError extends AdsState {}

final class InterstitialAdSuccess extends AdsState {}
