import 'package:bloc/bloc.dart';
import 'package:business_tools/core/errors/failure.dart';
import 'package:business_tools/core/functions/message_error_handel.dart';
import 'package:business_tools/features/text_extract/domain/entities/text_extract_entities.dart';
import 'package:business_tools/features/text_extract/domain/usecases/crop_image_uc.dart';
import 'package:business_tools/features/text_extract/domain/usecases/extract_text_uc.dart';
import 'package:business_tools/features/text_extract/domain/usecases/pick_image_uc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'text_extract_event.dart';
part 'text_extract_state.dart';

class TextExtractBloc extends Bloc<TextExtractEvent, TextExtractState> {
  final ExtractTextUc extractTextUc;
  final PickImageUc pickImageUc;
  final CropImageUc cropImageUc;
  String path = '';
  TextExtractBloc({
    required this.extractTextUc,
    required this.pickImageUc,
    required this.cropImageUc,
  }) : super(const TextExtractState()) {
    on<TextExtractEvent>((event, emit) {});
    on<ExtractTextFromImageEvent>(_extractTextFromImageEvent);
    on<PickImagEvent>(_pickImagEvent);
    on<CropImageEvent>(_cropImageEvent);
    on<RestEvent>(_restEvent);
  }
  //Events
  Future<void> _extractTextFromImageEvent(ExtractTextFromImageEvent event, Emitter<TextExtractState> emit) async {
    if (path.isNotEmpty) {
      emit(state.copyWith(status: TextExtractStatus.loading));
      var failurOrDone = await extractTextUc.call(event.path);
      emit(_extractTextFromImagestate(failurOrDone));
    } else {
      emit(state.copyWith(status: TextExtractStatus.init));
      emit(state.copyWith(status: TextExtractStatus.errorPickImage, messageError: "plz chsoe image "));
    }
  }

  Future<void> _pickImagEvent(PickImagEvent event, Emitter<TextExtractState> emit) async {
    print("object");
    var failurOrDone = await pickImageUc.call();
    emit(_pickImageState(failurOrDone));
  }

  Future<void> _cropImageEvent(CropImageEvent event, Emitter<TextExtractState> emit) async {
    emit(state.copyWith(status: TextExtractStatus.loadingCropImage));
    var failurOrDone = await cropImageUc.call(event.path);
    emit(_cropImageEventState(failurOrDone));
  }

  Future<void> _restEvent(RestEvent event, Emitter<TextExtractState> emit) async {
    emit(state.copyWith(status: TextExtractStatus.init));
    path = "";
  }

//status
  TextExtractState _extractTextFromImagestate(Either<Failure, TextExtractEntities> failurOrDone) {
    return failurOrDone.fold(
        (failure) =>
            state.copyWith(status: TextExtractStatus.errorTextExtract, messageError: messageErrorHandel(failure)),
        (done) =>
            state.copyWith(status: TextExtractStatus.successTextExtract, messageSuccess: "done", value: done.text));
  }

  TextExtractState _pickImageState(Either<Failure, String> failurOrDone) {
    return failurOrDone.fold(
        (failure) =>
            state.copyWith(status: TextExtractStatus.errorPickImage, messageError: messageErrorHandel(failure)),
        (done) => state.copyWith(
            status: TextExtractStatus.successPickImage, messageSuccess: "done", value: done /*image Path*/));
  }

  TextExtractState _cropImageEventState(Either<Failure, String> failurOrDone) {
    return failurOrDone.fold(
        (failure) =>
            state.copyWith(status: TextExtractStatus.errorCropImage, messageError: messageErrorHandel(failure)),
        (done) => state.copyWith(
            status: TextExtractStatus.successCropImage, messageSuccess: "done", value: done /*image Path*/));
  }
}
