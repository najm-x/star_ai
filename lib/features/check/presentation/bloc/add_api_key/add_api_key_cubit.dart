import 'package:bloc/bloc.dart';
import 'package:business_tools/core/app_routes.dart';
import 'package:business_tools/core/constant/shared_key.dart';
import 'package:business_tools/core/functions/check_api_key.dart';
import 'package:business_tools/core/services/app_services.dart' show sl;
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'add_api_key_state.dart';

class AddApiKeyCubit extends Cubit<AddApiKeyState> {
  int currentStep = 0;
    BuildContext context = goRouter.routerDelegate.navigatorKey.currentContext!;

  final TextEditingController textEditingCO = TextEditingController();
  AddApiKeyCubit() : super(const AddApiKeyState());
  void nextlStep() {
    emit(state.copyWith(status: AddApiKeyStatus.init));
    if (currentStep < 2) {
      currentStep++;
      emit(state.copyWith(status: AddApiKeyStatus.stepChange));
    } else {
      if (textEditingCO.text.isNotEmpty) {
        emit(state.copyWith(status: AddApiKeyStatus.loading));
      } else {
        emit(state.copyWith(status: AddApiKeyStatus.error, messageError: AppLocalizations.of(context)!.enterTheApiKey));
      }
    }
  }

  void cancelStep() {
    emit(state.copyWith(status: AddApiKeyStatus.init));
    if (currentStep > 0) {
      currentStep--;
    }
    emit(state.copyWith(status: AddApiKeyStatus.stepChange));
  }

  void checkingApiKey() async {
    if (await checkApiKey(textEditingCO.text.trim())) {
      await sl<SharedPreferences>().setString(SharedKey.addApiKey, textEditingCO.text.trim());
      emit(state.copyWith(status: AddApiKeyStatus.success));
    } else {
      // ignore: use_build_context_synchronously
      emit(state.copyWith(status: AddApiKeyStatus.error, messageError:AppLocalizations.of(context)!.apikeyDontWork));
    }
  }

  @override
  Future<void> close() {
    textEditingCO.dispose();
    return super.close();
  }
}
