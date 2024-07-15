part of 'text_extract_bloc.dart';

sealed class TextExtractEvent extends Equatable {
  const TextExtractEvent();

  @override
  List<Object> get props => [];
}

final class PickImagEvent extends TextExtractEvent {
  const PickImagEvent();

  @override
  List<Object> get props => [];
}

final class ExtractTextFromImageEvent extends TextExtractEvent {
  final String path;
  const ExtractTextFromImageEvent({required this.path});

  @override
  List<Object> get props => [path];
}

final class CropImageEvent extends TextExtractEvent {
  final String path;
  const CropImageEvent({required this.path});

  @override
  List<Object> get props => [path];
}

final class RestEvent extends TextExtractEvent {
  const RestEvent();

  @override
  List<Object> get props => [];
}
