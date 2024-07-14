import 'package:bloc/bloc.dart';
import 'package:business_tools/core/errors/failure.dart';
import 'package:business_tools/core/functions/message_error_handel.dart';
import 'package:business_tools/features/spell_checker/domain/entities/spell_checker_entities.dart';
import 'package:business_tools/features/spell_checker/domain/usecases/save_text_spelled.dart';
import 'package:business_tools/features/spell_checker/domain/usecases/spell_text_checker_uc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'spell_checker_state.dart';

class SpellCheckerCubit extends Cubit<SpellCheckerState> {
  final SpellTextCheckerUc spellTextCheckerUc;
  final SaveTextSpelled saveTextSpelled;
  final TextEditingController textCo = TextEditingController();
  bool isLtR = false;
  // List moreInfo = [] ;
  SpellCheckerCubit({required this.spellTextCheckerUc, required this.saveTextSpelled})
      : super(const SpellCheckerState());

  void spellTextChecker() async {
    if (textCo.text.isNotEmpty) {
      emit(state.copyWith(status: SpellCheckerStatus.loading));
      var failureOrDone = await spellTextCheckerUc.call(textCo.text, ""); //In new Update I well add more Info
      emit(_spellTextCheckerStatus(failureOrDone));
    } else {
      emit(state.copyWith(status: SpellCheckerStatus.init));
      emit(state.copyWith(status: SpellCheckerStatus.emptyOption, messageError: "add text"));
    }
  }

  void saveText(String value) async {
    emit(state.copyWith(status: SpellCheckerStatus.loading));
    var failureOrDone = await saveTextSpelled.call(textCo.text); //In new Update I well add more Info
    emit(_saveTextStatus(failureOrDone));
  }

  SpellCheckerState _spellTextCheckerStatus(Either<Failure, SpellCheckerEntities> failureOrDone) {
    return failureOrDone.fold(
        (failure) =>
            state.copyWith(status: SpellCheckerStatus.errorSpellChecker, messageError: messageErrorHandel(failure)),
        (done) => state.copyWith(status: SpellCheckerStatus.successSpellChecker, value: done.text));
  }

  SpellCheckerState _saveTextStatus(Either<Failure, Unit> failureOrDone) {
    return failureOrDone.fold(
        (failure) => state.copyWith(status: SpellCheckerStatus.errorOther, messageError: messageErrorHandel(failure)),
        (done) => state.copyWith(status: SpellCheckerStatus.successSave, messageSuccess: "done Save It"));
  }

  void changeLtR(bool value) {
    isLtR = value;
    emit(state.copyWith(status: SpellCheckerStatus.init));
    emit(state.copyWith(status: SpellCheckerStatus.changeLtR));
  }

  @override
  Future<void> close() {
    textCo.dispose();
    return super.close();
  }
}
