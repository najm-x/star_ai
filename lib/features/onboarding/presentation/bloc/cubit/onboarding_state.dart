part of 'onboarding_cubit.dart';

enum OnboardingStatus { init, finsh }

final class OnboardingState extends Equatable {
  final OnboardingStatus status;
  const OnboardingState({this.status = OnboardingStatus.init});
  OnboardingState copyWith({
    OnboardingStatus? status,
  }) {
    return OnboardingState(status: status ?? this.status);
  }

  @override
  List<Object> get props => [status];
}
