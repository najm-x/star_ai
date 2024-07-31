import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';

part 'pick_file_state.dart';

class PickFileCubit extends Cubit<PickFileState> {
  PickFileCubit() : super(const PickFileState());
  Future<void> pickFile() async {
    emit(state.copyWith(status: PickFileStatus.loading));
    FilePickerResult? filePickerResult =
        await FilePicker.platform.pickFiles(allowCompression: false, allowedExtensions: ["srt"], type: FileType.custom);
    String? path = filePickerResult?.files.first.path;
    if (path == null) {
      emit(state.copyWith(status: PickFileStatus.error, messageError: "لم يتم اختيار الملف"));
    } else {
      emit(state.copyWith(status: PickFileStatus.success, filePath: path));
    }
  }
}
