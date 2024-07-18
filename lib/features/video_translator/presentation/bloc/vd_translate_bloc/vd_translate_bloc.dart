import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:business_tools/core/app_routes.dart';
import 'package:business_tools/core/constant/types_validate.dart';
import 'package:business_tools/core/errors/failure.dart';
import 'package:business_tools/core/functions/message_error_handel.dart';
import 'package:business_tools/core/public/data/language_data.dart';
import 'package:business_tools/features/video_translator/data/datasources/vd_db_fun.dart';
import 'package:business_tools/features/video_translator/domain/entities/vd_translate_entities.dart';
import 'package:business_tools/features/video_translator/domain/usecases/vd_translate_uc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'vd_translate_event.dart';
part 'vd_translate_state.dart';

class VdTranslateBloc extends Bloc<VdTranslateEvent, VdTranslateState> {
  final VdTranslateUc vdTranslateUc;
  //
    BuildContext context = goRouter.routerDelegate.navigatorKey.currentContext! ;

  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  final TextEditingController videoUrlCo = TextEditingController();
  String translateFrom = "";
  String translateTo = "";
  String translateFromCode = "";

  //
  VdTranslateBloc({required this.vdTranslateUc}) : super(VdTranslateInitial()) {
    on<VdTranslateEvent>((event, emit) {});
    on<VdTranslate>(_vdTranslate);
  }
  
  Future<void> _vdTranslate(VdTranslate event, Emitter<VdTranslateState> emit) async {
    VdDbFunHelping.translationProgressCo = StreamController<double>() ;
    final translationProgress = VdDbFunHelping.translationProgressCo.stream;
    emit(const LoadingVdTranslate(translationProgress: 0));
    final sub = translationProgress.listen((onData) {
      emit(LoadingVdTranslate(translationProgress: onData)) ;
    });
    await Future.delayed(Durations.extralong4);
    
    var failureOrDone =
        await vdTranslateUc.call(event.videoId, event.translateFrom, event.translateTo, event.translateFromCode);
    await VdDbFunHelping.translationProgressCo.close();
    sub.cancel();
    emit(_vdTranslateState(failureOrDone));
  }

  VdTranslateState _vdTranslateState(Either<Failure, List<VdTranslateEntities>> failureOrDone) {
    return failureOrDone.fold((failure) {
      return ErrorVdTranslate(messageError: messageErrorHandel(failure , context));
    }, (done) {
      return SuccessVdTranslate(data: done);
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

  @override
  Future<void> close() {
    videoUrlCo.dispose();
    return super.close();
  }
}
