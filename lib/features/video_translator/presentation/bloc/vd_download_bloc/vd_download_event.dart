part of 'vd_download_bloc.dart';

final class VdDownloadEvent extends Equatable {
  final List<VdTranslateEntities> translation;
  final String videoUrl;
  const VdDownloadEvent({required this.translation, required this.videoUrl});

  @override
  List<Object> get props => [translation, videoUrl];
}
