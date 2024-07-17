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
          context.pushReplacement(AppRouteName.home);
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
                steps: [_stepOne(), _stepTow(), _stepThree(context)]);
      },
    );
  }

  Step _stepOne() {
    return Step(
        title: const Text("أولا "),
        content: Row(
          children: [
            const Text(
              'قم بالدخول على الموقع  ',
              textAlign: TextAlign.center,
            ),
            TextButton(onPressed: () {}, child: const Text("من هنا  "))
          ],
        ));
  }

  Step _stepTow() {
    return Step(
        title: const Text("ثانيا"),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [const Text("اتبع الخطوات للحصول على ال api key"), Image.asset(AppImages.gif)],
        ));
  }

  Step _stepThree(BuildContext context) {
    return Step(
        title: Text("ثالثا"),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("قم بلصق ال api key الذي حصلت عليه"),
            SizedBox(
              height: 10,
            ),
            TextFormFieldCu(
              hint: "paste the api key here ",
              labelText: "api key",
              textEditingController: BlocProvider.of<AddApiKeyCubit>(context).textEditingCO,
            )
          ],
        ));
  }
}
