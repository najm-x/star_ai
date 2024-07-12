import 'package:bloc/bloc.dart';
import 'package:business_tools/features/extract/domain/entities/emails_numbera_entite.dart';
import 'package:business_tools/features/extract/domain/usecases/save_data_uc.dart';
import 'package:equatable/equatable.dart';
part 'save_data_event.dart';
part 'save_data_state.dart';

class SaveDataBloc extends Bloc<SaveDataEvent, SaveDataState> {
  String type ="" ;
  final SaveDatasUc saveDatasUc;
  SaveDataBloc({required this.saveDatasUc}) : super(const SaveDataState()) {
    on<SaveDataEvent>(_saveDataEvent);
  }
  Future<void> _saveDataEvent(SaveDataEvent event, Emitter<SaveDataState> emit) async {
    emit(state.copyWith(status: SaveDataStatus.loading));
    var failureOrDone = await saveDatasUc.call(type, event.data);
    emit(failureOrDone.fold(
        (l) => state.copyWith(messageError: "error"), (r) => state.copyWith(messageSuccess: "Done")));
  }
}
