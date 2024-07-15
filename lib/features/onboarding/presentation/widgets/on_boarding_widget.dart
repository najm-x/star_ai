import 'package:business_tools/features/onboarding/data/models/on_boarding_model.dart';
import 'package:flutter/material.dart';

class OnBoardingWidget extends StatelessWidget {
  final OnBoardingModel onBoardingModel;

  const OnBoardingWidget({super.key, required this.onBoardingModel});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        _image(),
        const SizedBox(
          height: 20,
        ),
        _title(context),
        const SizedBox(
          height: 20,
        ),
        _description(context),
        const Spacer(
          flex: 2,
        )
      ],
    );
  }

  Widget _image() {
    return SizedBox(
      height: 180,
      width: double.maxFinite,
      child: Image.asset(onBoardingModel.image),
    );
  }

  Widget _title(BuildContext context) {
    return Text(
      onBoardingModel.title,
      style: Theme.of(context).textTheme.titleLarge!,
    );
  }

  Widget _description(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        onBoardingModel.decoration,
        style: Theme.of(context).textTheme.bodyMedium!,
        textAlign: TextAlign.center,
      ),
    );
  }
}
