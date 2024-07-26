import 'package:bloc/bloc.dart';
import 'package:business_tools/features/video_translator/domain/entities/vd_translate_entities.dart';
import 'package:equatable/equatable.dart';

part 'vd_view_state.dart';

class VdViewCubit extends Cubit<VdViewState> {
  int stratSendToAI = 0;
  int itemsBySend = 20;
  List<VdTranslateEntities> translateToShow = [];
  List<VdTranslateEntities> allsubtitle = [];
  String currentSubTitle = "";
  double currentFontSize = 14;
  double currentBgOpacity = 0.2;
  double currentTextColor = 1;
  double currentBottomSpace = 50;
  int currentSubtitleDelay = 0;
  bool currentisLtoR = false;
  Duration currentPosition = const Duration(seconds: 0);
  bool currentShow = false;

  VdViewCubit() : super(VdViewInitial());
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

  //
  void sendToTranslte(Duration currentTime) {
    for (var i = 0; i < allsubtitle.length; i++) {
      if (allsubtitle[i].start >= currentTime) {
        stratSendToAI = i;
        break;
      }
    }
    
  }
}
