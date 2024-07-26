import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:business_tools/core/app_routes.dart';
import 'package:business_tools/core/constant/shared_key.dart';
import 'package:business_tools/core/constant/types_validate.dart';
import 'package:business_tools/core/errors/failure.dart';
import 'package:business_tools/core/functions/message_error_handel.dart';
import 'package:business_tools/core/functions/show_case_init.dart';
import 'package:business_tools/core/public/data/language_data.dart';
import 'package:business_tools/features/video_translator/data/datasources/vd_db_fun.dart';
import 'package:business_tools/features/video_translator/data/models/data_vd_model.dart';
import 'package:business_tools/features/video_translator/domain/entities/vd_translate_entities.dart';
import 'package:business_tools/features/video_translator/domain/usecases/get_trans_cript.dart';
import 'package:business_tools/features/video_translator/domain/usecases/vd_translate_uc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'vd_translate_event.dart';
part 'vd_translate_state.dart';

class VdTranslateBloc extends Bloc<VdTranslateEvent, VdTranslateState> {
  final VdTranslateUc vdTranslateUc;
  final GetTransCriptUc getTransCriptUc;
  //
  BuildContext context = goRouter.routerDelegate.navigatorKey.currentContext!;

  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  final TextEditingController videoUrlCo = TextEditingController();
  String translateFrom = "";
  String translateTo = "";
  String translateFromCode = "";
  String typeTrans = ""; //
  final one = GlobalKey();
  final tow = GlobalKey();
  final three = GlobalKey();

  //
  VdTranslateBloc({
    required this.vdTranslateUc,
    required this.getTransCriptUc,
  }) : super(const VdTranslateState()) {
    on<VdTranslateEvent>((event, emit) {});
    on<VdTranslate>(_vdTranslate);
    on<GetTransCriptEvent>(_getTransCriptEvent);
  }

  Future<void> _vdTranslate(VdTranslate event, Emitter<VdTranslateState> emit) async {
    VdDbFunHelping.translationProgressCo = StreamController<double>();
    final translationProgress = VdDbFunHelping.translationProgressCo.stream;
    emit(state.copyWith(status: VdTranslateStatus.loading, translationProgress: 0));
    final sub = translationProgress.listen((onData) {
      emit(state.copyWith(status: VdTranslateStatus.loading, translationProgress: 0));
    });
    await Future.delayed(Durations.extralong4);

    var failureOrDone =
        await vdTranslateUc.call(event.videoId, event.translateFrom, event.translateTo, event.translateFromCode);
    await VdDbFunHelping.translationProgressCo.close();
    sub.cancel();
    emit(_vdTranslateState(failureOrDone));
  }

  Future<void> _getTransCriptEvent(GetTransCriptEvent event, Emitter<VdTranslateState> emit) async {
    emit(state.copyWith(
        status: VdTranslateStatus.loading, translationProgress: 0, infoLoading: "لن يستغرق ذلك أكثر من دقيقة"));
    await Future.delayed(Durations.extralong4);
    var failureOrDone =
        await getTransCriptUc.call(event.videoId, event.translateFrom, event.translateTo, event.translateFromCode);
    await VdDbFunHelping.translationProgressCo.close();

    emit(_getTransCriptEventState(failureOrDone));
  }

  VdTranslateState _vdTranslateState(Either<Failure, List<VdTranslateEntities>> failureOrDone) {
    return failureOrDone.fold((failure) {
      return state.copyWith(status: VdTranslateStatus.error, messageError: messageErrorHandel(failure, context));
    }, (done) {
      return state.copyWith(status: VdTranslateStatus.successVdTranslate, onSuccessVdTranslate: done);
    });
  }

  VdTranslateState _getTransCriptEventState(Either<Failure, DataVdModel> failureOrDone) {
    return failureOrDone.fold((failure) {
      return state.copyWith(status: VdTranslateStatus.error, messageError: messageErrorHandel(failure, context));
    }, (done) {
      return state.copyWith(status: VdTranslateStatus.successTransCript, onSuccessTransCript: done);
    });
  }

  //Other
  onTapTranslate() {
    if (formState.currentState!.validate() &&
        translateFrom.isNotEmpty &&
        translateTo.isNotEmpty &&
        translateFromCode.isNotEmpty) {
      add(VdTranslate(
          videoId: extractYouTubeId(videoUrlCo.text.trim()),
          translateFrom: translateFrom,
          translateTo: translateTo,
          translateFromCode: translateFromCode));
    }
  }

  onSelectOption(String type, String langName) {
    if (type == TypesValidate.from) {
      for (var i in languages) {
        if (i["lang"].toString() == langName) {
          translateFromCode = i["code"];
          break;
        }
      }
      translateFrom = langName;
      return;
    }
    translateTo = langName;
  }

  String extractYouTubeId(String url) {
    RegExp regExp = RegExp(
      r"^(?:https?:\/\/)?(?:www\.)?(?:youtube\.com\/(?:[^\/\n\s]+\/\S+\/|(?:v|e(?:mbed)?)\/|\S*?[?&]v=)|youtu\.be\/)([a-zA-Z0-9_-]{11})",
      caseSensitive: false,
      multiLine: false,
    );
    final match = regExp.firstMatch(url);
    return match?.group(1) ?? '';
  }

  showcase(BuildContext? myContext) {
    showCaseInit(myContext!, SharedKey.isVdTransShowed, [one, tow, three]);
  }

  @override
  Future<void> close() {
    videoUrlCo.dispose();
    return super.close();
  }
}
