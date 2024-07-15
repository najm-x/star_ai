import 'package:bloc/bloc.dart';
import 'package:business_tools/features/onboarding/data/datasources/satatic_data_onboarding.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final PageController pageController = PageController(initialPage: 0);
  OnboardingCubit() : super(const OnboardingState());
  void nextPage() {
    if (pageController.page == SataticDataOnboarding.onBoardingData.length - 1) {
      emit(state.copyWith(status: OnboardingStatus.finsh));
    } else {}
    pageController.animateToPage((pageController.page! + 1).toInt(),
        duration: Durations.medium4, curve: Curves.easeInOut);
  }
}
