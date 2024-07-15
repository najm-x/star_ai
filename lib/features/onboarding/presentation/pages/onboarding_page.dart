import 'package:business_tools/core/constant/app_routes_name.dart';
import 'package:business_tools/features/onboarding/data/datasources/satatic_data_onboarding.dart';
import 'package:business_tools/features/onboarding/data/models/on_boarding_model.dart';
import 'package:business_tools/features/onboarding/presentation/bloc/cubit/onboarding_cubit.dart';
import 'package:business_tools/features/onboarding/presentation/widgets/on_boarding_widget.dart';
import 'package:business_tools/features/onboarding/presentation/widgets/page_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    return BlocListener<OnboardingCubit, OnboardingState>(
      listener: (context, state) {
        if (state.status == OnboardingStatus.finsh) {
          context.pushReplacement(AppRouteName.home);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [_buildPageView(context), const PageIndicatorWidget()],
        ),
      ),
    );
  }

  Widget _buildPageView(BuildContext context) {
    return Expanded(
        child: PageView.builder(
      controller: BlocProvider.of<OnboardingCubit>(context).pageController,
      itemCount: SataticDataOnboarding.onBoardingData.length,
      itemBuilder: (context, index) {
        OnBoardingModel onBoardingModel = SataticDataOnboarding.onBoardingData[index];
        return OnBoardingWidget(onBoardingModel: onBoardingModel);
      },
    ));
  }
}
