import 'package:bloc/bloc.dart';
import 'package:business_tools/core/errors/failure.dart';
import 'package:business_tools/features/video_translator/data/models/data_vd_model.dart';
import 'package:business_tools/features/video_translator/domain/entities/vd_translate_entities.dart';
import 'package:business_tools/features/video_translator/domain/usecases/vd_trans_real_time.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

part 'vd_view_state.dart';

class VdViewCubit extends Cubit<VdViewState> {
  final VdTransRealTimeUc vdTransRealTimeUc;
  VdViewCubit({required this.vdTransRealTimeUc}) : super(VdViewInitial());
  int stratSendToAI = 0;
  int itemsBySend = 20;
  List<VdTranslateEntities> translateToShow = [];
  List<VdTranslateEntities> nextTranslateToShow = [];
  List<VdTranslateEntities> itemsToSend = [];
  DataVdModel dataVdModel = DataVdModel(idVideo: "", data: []); // init
  String currentSubTitle = "";
  double currentFontSize = 14;
  double currentBgOpacity = 0.2;
  double currentTextColor = 1;
  double currentBottomSpace = 50;
  int currentSubtitleDelay = 0;
  bool currentisLtoR = false;
  Duration currentPosition = const Duration(seconds: 0);
  bool currentShow = false;

  //
  String currentVdSubtitleValue = "";
  bool isnextTranslateToShow = true;
  late YoutubePlayerController controller;

  //
  void changSubTitle(List<VdTranslateEntities> subTitles) {
    String newSubTitle = "";
    Duration subtitleDelay = Duration(seconds: currentSubtitleDelay);
    for (var subTitle in subTitles) {
      if (subTitle.start <= currentPosition + subtitleDelay && subTitle.end >= currentPosition + subtitleDelay) {
        newSubTitle = subTitle.subTitle;
        break;
      }
    }
    if (newSubTitle != currentSubTitle) {
      currentSubTitle = newSubTitle;
      emit(ChangeSubTitle(subTitle: currentSubTitle));
    }
  }

  changeWidgetView() {
    currentShow = !currentShow;
    emit(ChangeWidgetView(show: currentShow));
  }

  void changeTextStyle(
      double? fontSize, double? bgOpacity, double? textColor, double? bottomSpace, bool? isLtoR, int? subtitleDelay) {
    double newFontSize = fontSize ?? currentFontSize;
    double newBgOpacity = bgOpacity ?? currentBgOpacity;
    double newTextColor = textColor ?? currentTextColor;
    double newBottomSpace = bottomSpace ?? currentBottomSpace;
    bool newIsLToR = isLtoR ?? currentisLtoR;
    int newSubtitleDelay = subtitleDelay ?? currentSubtitleDelay;
    currentFontSize = newFontSize;
    currentBgOpacity = newBgOpacity;
    currentTextColor = newTextColor;
    currentBottomSpace = newBottomSpace;
    currentisLtoR = newIsLToR;
    currentSubtitleDelay = newSubtitleDelay;

    emit(ChangeTextStyle(
        isLtoR: currentisLtoR,
        fontSize: currentFontSize,
        bgOpacity: currentBgOpacity,
        textColor: currentTextColor,
        bottomSpace: currentBottomSpace,
        currentSubtitleDelay: currentSubtitleDelay));
  }

  //# 1- get the start item to start : For Example the items 150 the start item start is the number item in the list when [allsubtitle[i].start >= currentTime] fitst item >= currentTime from the video
  //# 2- add items from start item to startitem + itemsBySend
  Future<void> translateWithLoading(Duration currentTime) async {
    getStartedFromItem(currentTime);
    addTheItemsToTranslate();
    emit(LoadingVdTranslate());
    var failureOrDone = await vdTransRealTimeUc.call(
        dataVdModel.translateFrom!, dataVdModel.translateTo!, dataVdModel.videoInfo!, itemsToSend);
    emit(handelSendToAiWithLoading(failureOrDone));
  }

  void translateWithOutLoading(Duration currentTime) async {
    getStartedFromItem(currentTime);
    addTheItemsToTranslateWithOutLoading();
    print("object its STarttttttttttttttttt getting of translte");
    print("object items sended by -- ${itemsToSend.length}");
    print("object nextTranslateToShow -- ${nextTranslateToShow.length}");
    print("object translateToShow -- ${translateToShow.length}");
    nextTranslateToShow = [];
    print("object items sended by -- ${itemsToSend.length}");
    print("object nextTranslateToShow -- ${nextTranslateToShow.length}");
    print("object translateToShow -- ${translateToShow.length}");
    var failureOrDone = await vdTransRealTimeUc.call(
        dataVdModel.translateFrom!, dataVdModel.translateTo!, dataVdModel.videoInfo!, itemsToSend);
    handelSendToAiWithOutLoading(failureOrDone);
  }

  void getStartedFromItem(Duration currentTime) {
    for (var i = 0; i < dataVdModel.data.length; i++) {
      if (dataVdModel.data[i].start >= currentTime) {
        stratSendToAI = i;
        break;
      }
    }
  }

  void addTheItemsToTranslate() {
    itemsToSend.clear();
    int numberForLoop = (dataVdModel.data.length > stratSendToAI + itemsBySend
        ? itemsBySend /**/
        : dataVdModel.data.length - stratSendToAI);
    for (var index = 0; index < numberForLoop; index++) {
      itemsToSend.add(dataVdModel.data[stratSendToAI + index]);
    }
  }

  void addTheItemsToTranslateWithOutLoading() {
    int totla = (stratSendToAI + ((translateToShow.length / 4) * 3)).toInt();
    itemsToSend.clear();
    int numberForLoop = (dataVdModel.data.length > totla + itemsBySend
        ? itemsBySend /**/
        : dataVdModel.data.length - totla);
    for (var index = 0; index < numberForLoop; index++) {
      itemsToSend.add(dataVdModel.data[totla + index]);
    }
  }

  VdViewState handelSendToAiWithLoading(Either<Failure, List<VdTranslateEntities>> failureOrDone) {
    return failureOrDone.fold((failur) => ErrorVdTranslate(), (done) {
      print("object its");
      translateToShow = done;
      return SuccessVdTranslate(data: done);
    });
  }

  handelSendToAiWithOutLoading(Either<Failure, List<VdTranslateEntities>> failureOrDone) {
    return failureOrDone.fold((failur) {}, (done) {
      print("object its doooooooooone getting of translte");
      nextTranslateToShow.addAll(done);

      print("object doooooooooone getting of  $nextTranslateToShow");
      print("object doooooooooone getting of  $translateToShow");
    });
  }

  //if video progress == 0
  transalteOnVdStart() {
    translateWithLoading(Duration.zero);
  }

  //if video is running
  vdIsRunnig() {
    int islam = 0;
    String newSubTitle = "";
    for (var i = 0; i < translateToShow.length; i++) {
      if (translateToShow[i].start <= currentPosition + Duration.zero &&
          translateToShow[i].end >= currentPosition + Duration.zero) {
        newSubTitle = translateToShow[i].subTitle;
        islam = i + 1;
        break;
      }
    }
    print("object $islam || ${translateToShow.length}");

    if (newSubTitle != currentVdSubtitleValue) {
      print("object FUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUck");

      currentVdSubtitleValue = newSubTitle;
      if (islam == translateToShow.length) {
        if ([] == nextTranslateToShow) {
          print("object ${nextTranslateToShow == []}");
          isnextTranslateToShow = false;
        } else {
          print("object ${nextTranslateToShow.first}");
          print("object ${nextTranslateToShow.isEmpty}");
          isnextTranslateToShow = true;
          print("object rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrck");
          translateToShow.clear();
          translateToShow = nextTranslateToShow;
          print("object $translateToShow");
          print("object $nextTranslateToShow");
        }
      } else if (islam == translateToShow.length / 4) {
        print("object islam == translateToShow.length / 4 ${translateToShow.length}");
        translateWithOutLoading(currentPosition);
      }
    }
    changSubTitle(translateToShow);
  }
}
//on video runnig
//on choose new value from progress
