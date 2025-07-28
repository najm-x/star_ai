import 'package:bloc/bloc.dart';
import 'package:business_tools/core/app_routes.dart';
import 'package:business_tools/core/constant/shared_key.dart';
import 'package:business_tools/core/errors/failure.dart';
import 'package:business_tools/core/functions/message_error_handel.dart';
import 'package:business_tools/core/functions/show_case_init.dart';
import 'package:business_tools/features/text_translate/domain/entities/text_trans_entities.dart';
import 'package:business_tools/features/text_translate/domain/usecases/save_text_uc.dart';
import 'package:business_tools/features/text_translate/domain/usecases/trans_text_uc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:business_tools/l10n/app_localizations.dart';
part 'text_trans_state.dart';

class TextTransCubit extends Cubit<TextTransState> {
  final one = GlobalKey();
  final tow = GlobalKey();
  final three = GlobalKey();
  final four = GlobalKey();
  final TransTextUc transTextUc;
  final SaveTextUc saveTextUc;
  String translateFrom = '';
  String translateTo = '';
  bool isLtR = false;
  BuildContext context = goRouter.routerDelegate.navigatorKey.currentContext!;

  final TextEditingController textCo = TextEditingController();
  final TextEditingController infoCo = TextEditingController();
  final ScrollController scrollController = ScrollController();
  TextTransCubit({required this.transTextUc, required this.saveTextUc}) : super(const TextTransState());
  Future<void> translateText() async {
    if (translateFrom.isNotEmpty && translateTo.isNotEmpty && textCo.text.isNotEmpty) {
      emit(state.copyWith(status: TextTransStatus.loading));
      var failurOrDone = await transTextUc.call(
          textCo.text, translateFrom, translateTo, infoCo.text.isNotEmpty ? "this text about : ${infoCo.text} ," : "");
      emit(_translateTextstate(failurOrDone));
    } else {
      emit(state.copyWith(status: TextTransStatus.init));
      emit(state.copyWith(status: TextTransStatus.emptyOptins, messageError: AppLocalizations.of(context)!.entertext));
    }
  }

  Future<void> savetranslate(String value) async {
    if (value.isNotEmpty) {
      emit(state.copyWith(status: TextTransStatus.loading));
      var failurOrDone = await saveTextUc.call(value);
      emit(_savetranslatestate(failurOrDone));
    }
  }

  onSelectedLang(String value, String type) {
    if (type == AppLocalizations.of(context)!.translateFrom) {
      translateFrom = value;
      return;
    }
    translateTo = value;
  }

  TextTransState _translateTextstate(Either<Failure, TextTransEntities> failurOrDone) {
    return failurOrDone.fold(
        (failure) => state.copyWith(status: TextTransStatus.error, messageError: messageErrorHandel(failure, context)),
        (done) => state.copyWith(status: TextTransStatus.successTransleate, messageSuccess: "", value: done.text));
  }

  TextTransState _savetranslatestate(Either<Failure, Unit> failurOrDone) {
    return failurOrDone.fold(
        (failure) => state.copyWith(status: TextTransStatus.error, messageError: messageErrorHandel(failure, context)),
        (done) => state.copyWith(
            status: TextTransStatus.successOther, messageSuccess: AppLocalizations.of(context)!.doneSaveTrans));
  }

  void scrollDown() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(
          milliseconds: 750,
        ),
        curve: Curves.easeOutCirc,
      ),
    );
  }

  void scrollUp() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => scrollController.animateTo(
        0,
        duration: const Duration(
          milliseconds: 750,
        ),
        curve: Curves.easeOutCirc,
      ),
    );
  }

  void changeLtR(bool value) {
    isLtR = value;
    emit(state.copyWith(status: TextTransStatus.init));
    emit(state.copyWith(status: TextTransStatus.changeLtR));
  }

  showCase(BuildContext mycontext) {
    showCaseInit(mycontext, SharedKey.isTextTransShowed, [one, tow, three, four]);
  }

  @override
  Future<void> close() {
    textCo.dispose();
    infoCo.dispose();
    scrollController.dispose();
    return super.close();
  }
}
