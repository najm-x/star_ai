part of 'vd_view_cubit.dart';

sealed class VdViewState extends Equatable {
  const VdViewState();

  @override
  List<Object> get props => [];
}

final class VdViewInitial extends VdViewState {}

final class ChangeTextStyle extends VdViewState {
  final double bottomSpace;
  final double bgOpacity;
  final double fontSize;
  final double textColor;
  final bool isLtoR;
  final int currentSubtitleDelay;

  const ChangeTextStyle(
      {required this.currentSubtitleDelay,
      required this.bottomSpace,
      required this.bgOpacity,
      required this.fontSize,
      required this.textColor,
      required this.isLtoR});
  @override
  List<Object> get props => [bgOpacity, fontSize, textColor, bottomSpace , currentSubtitleDelay];
}

final class ChangeSubTitle extends VdViewState {
  final String subTitle;

  const ChangeSubTitle({required this.subTitle});
  @override
  List<Object> get props => [subTitle];
}

final class ChangeWidgetView extends VdViewState {
  final bool show;

  const ChangeWidgetView({required this.show});
  @override
  List<Object> get props => [show];
}
