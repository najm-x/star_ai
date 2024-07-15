import 'package:business_tools/features/onboarding/data/datasources/satatic_data_onboarding.dart';
import 'package:business_tools/features/onboarding/presentation/bloc/cubit/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:uicons/uicons.dart';

class PageIndicatorWidget extends StatelessWidget {
  const PageIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            width: 50,
          ),
          const Spacer(),
          _smoothPageIndicator(context),
          const Spacer(),
          _nextIcon(context),
        ],
      ),
    );
  }

  Widget _nextIcon(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: CircleAvatar(
        child: IconButton(
            onPressed: ()=>BlocProvider.of<OnboardingCubit>(context).nextPage(),
            icon: Icon(
              UIcons.regularRounded.angle_right,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            )),
      ),
    );
  }

  Widget _smoothPageIndicator(BuildContext context) {
    return SmoothPageIndicator(
      controller: BlocProvider.of<OnboardingCubit>(context).pageController,
      count: SataticDataOnboarding.onBoardingData.length,
      effect: ExpandingDotsEffect(
          dotColor: Theme.of(context).colorScheme.secondaryContainer,
          activeDotColor: Theme.of(context).colorScheme.primary,
          dotHeight: 12,
          dotWidth: 12),
    );
  }
}
