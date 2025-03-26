import 'package:bloc/bloc.dart';
import 'package:business_tools/core/constant/shared_key.dart';
import 'package:business_tools/core/public/data/language_data.dart';
import 'package:business_tools/core/services/app_services.dart';
import 'package:business_tools/features/summary/data/source/static/summary_static_data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'summary_setup_state.dart';

class SummarySetupCubit extends Cubit<SummarySetupState> {
  int currentLen = 2;
  SummarySetupCubit()
      : super(SummarySetupState(
          summaryType: SummaryStaticData.summaryTypes[0],
          summarylen: SummaryStaticData.summaryLen[2],
          lang: languages.firstWhere(
                  (test) => test["code"] == (sl<SharedPreferences>().getString(SharedKey.langCode) ?? "ar"))["lang"] ??
              "",
        ));
  TextEditingController textco = TextEditingController();
  void selectType(String type) {
    emit(state.copyWith(summaryType: type, state: StateSetUp.changeType));
  }

  void changeSize(double size) {
    currentLen = size.toInt();
    emit(state.copyWith(summarylen: SummaryStaticData.summaryLen[size.toInt()], state: StateSetUp.changSzie));
  }

  void changeLang(String lang) {
    emit(state.copyWith(lang: lang, state: StateSetUp.changeLang));
  }

  void validateButton() {
    if (textco.text.isEmpty || !textco.text.contains('https')) {
      emit(state.copyWith(state: StateSetUp.error));
      emit(state.copyWith(state: StateSetUp.init));

      return;
    }
    emit(state.copyWith(vdUrl: textco.text, state: StateSetUp.done));
    emit(state.copyWith(vdUrl: textco.text, state: StateSetUp.init));
  }
}
