import 'package:bloc/bloc.dart';
import 'package:business_tools/core/errors/failure.dart';
import 'package:business_tools/features/extract/domain/entities/emails_numbera_entite.dart';
import 'package:business_tools/features/extract/domain/usecases/ex_emails_uc.dart';
import 'package:business_tools/features/extract/domain/usecases/ex_numbers_uc.dart';
import 'package:business_tools/features/extract/domain/usecases/save_data_uc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'extract_event.dart';
part 'extract_state.dart';

class ExtractBloc extends Bloc<ExtractEvent, ExtractState> {
  final TextEditingController textEditingController = TextEditingController();
  final ExNumbersUc exNumbersUc;
  final ExEmailsUc exEmailsUc;
  final SaveDatasUc saveDatasUc;
  String typeExtractName = 'number';
  String typeFileSelexted = "";
  ExtractBloc({required this.exNumbersUc, required this.exEmailsUc, required this.saveDatasUc})
      : super(ExtractInitial()) {
    on<ExtractEvent>((event, emit) {});
    on<PhoneEmailExtractEvent>(_phoneEmailExtractEvent);
    on<ChangeTypeExtract>(_changeTypeExtract);
    on<ChangeTypeFile>(_changeTypeFile);
    on<SaveFile> (_onSaveFile) ;
  }

  Future<void> _phoneEmailExtractEvent(PhoneEmailExtractEvent event, Emitter<ExtractState> emit) async {
    emit(LoadingExtract());
    late TypeName failureOrData;
    if (event.type == "email") {
      failureOrData = await exEmailsUc.call(event.text);
      emit(_handeling(failureOrData));
    } else {
      failureOrData = await exNumbersUc.call(event.text);
      emit(_handeling(failureOrData));
    }
  }
  Future<void> _onSaveFile(SaveFile event, Emitter<ExtractState> emit) async {
    
    var failureOrDone = await saveDatasUc.call(event.type, event.data);
    emit(failureOrDone.fold(
        (l) => const ErrorSave(messageError: "messageError"), (r) => const SuccessSave(messageSuccess: "messageSuccess")));
  }

  Future<void> _changeTypeExtract(ChangeTypeExtract event, Emitter<ExtractState> emit) async {
    typeExtractName = typeExtractName == "number" ? "email" : "number";
    emit(DoneChanged(value: typeExtractName));
  }

  Future<void> _changeTypeFile(ChangeTypeFile event, Emitter<ExtractState> emit) async {
    typeFileSelexted = event.value;
    emit(DoneChanged(value: event.value));
  }

  ExtractState _handeling(TypeName failureOrData) {
    return failureOrData.fold(
        (failure) => const ErrorExtract(messageError: "Empty"), (data) => SuccessExtract(data: data));
  }

  @override
  Future<void> close() {
    textEditingController.dispose();
    return super.close();
  }
}

typedef TypeName = Either<Failure, List<EmailsNumberaEntite>>;
