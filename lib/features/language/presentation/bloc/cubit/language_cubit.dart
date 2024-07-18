import 'package:bloc/bloc.dart';
import 'package:business_tools/core/constant/shared_key.dart';
import 'package:business_tools/core/services/app_services.dart' show sl;
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(const LanguageState());

  changeLange(String langCode) async {
    emit(state.copyWith(status: LanguageStatus.init));
    await sl<SharedPreferences>().setString(SharedKey.langCode, langCode);
    emit(state.copyWith(status: LanguageStatus.success, value: langCode));
  }
}
