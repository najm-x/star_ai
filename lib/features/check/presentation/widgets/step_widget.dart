import 'package:business_tools/core/constant/app_images.dart';
import 'package:business_tools/core/constant/app_routes_name.dart';
import 'package:business_tools/core/public/custom_snak_bar.dart';
import 'package:business_tools/core/public/widgets/loading.dart';
import 'package:business_tools/core/public/widgets/text_form_filed_cu.dart';
import 'package:business_tools/core/services/app_services.dart' show sl;
import 'package:business_tools/features/check/presentation/bloc/add_api_key/add_api_key_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:business_tools/l10n/app_localizations.dart';
import 'package:business_tools/core/functions/open_url.dart';

class StepWidget extends StatelessWidget {
  const StepWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddApiKeyCubit, AddApiKeyState>(
      listener: (context, state) {
        if (state.status == AddApiKeyStatus.loading) {
          context.read<AddApiKeyCubit>().checkingApiKey();
        }
        if (state.status == AddApiKeyStatus.success) {
          context.pushReplacement(AppRouteName.onBoarding);
        }
        if (state.status == AddApiKeyStatus.error) {
          sl<CustomSnakBar>().snackBarError(context, state.messageError, 2);
        }
      },
      builder: (context, state) {
        return state.status == AddApiKeyStatus.loading
            ? const Center(
                child: Loading(),
              )
            : Stepper(
                currentStep: context.read<AddApiKeyCubit>().currentStep,
                onStepContinue: () {
                  context.read<AddApiKeyCubit>().nextlStep();
                },
                onStepCancel: () {
                  context.read<AddApiKeyCubit>().cancelStep();
                },
                steps: [_stepOne(context), _stepTow(context), _stepThree(context)]);
      },
    );
  }

  Step _stepOne(BuildContext context) {
    return Step(
        title: Text(AppLocalizations.of(context)!.firstStep),
        content: Row(
          children: [
            Text(
              AppLocalizations.of(context)!.visitWebsite,
              textAlign: TextAlign.center,
            ),
            TextButton(
                onPressed: () => openUrl("https://aistudio.google.com/app/apikey"),
                child: Text(AppLocalizations.of(context)!.fromHere))
          ],
        ));
  }

  Step _stepTow(BuildContext context) {
    return Step(
        title: Text(AppLocalizations.of(context)!.secondStep),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [Text(AppLocalizations.of(context)!.obtainApiKey), Image.asset(AppImages.gif)],
        ));
  }

  Step _stepThree(BuildContext context) {
    return Step(
        title: Text(AppLocalizations.of(context)!.thirdStep),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(AppLocalizations.of(context)!.pasteApiKey),
            const SizedBox(
              height: 10,
            ),
            TextFormFieldCu(
              hint: AppLocalizations.of(context)!.pasteApiKeyHere,
              labelText: AppLocalizations.of(context)!.apiKey,
              textEditingController: BlocProvider.of<AddApiKeyCubit>(context).textEditingCO,
            )
          ],
        ));
  }
}
