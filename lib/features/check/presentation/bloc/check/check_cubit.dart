import 'package:bloc/bloc.dart';
import 'package:business_tools/core/constant/api_key.dart';
import 'package:business_tools/core/constant/shared_key.dart';
import 'package:business_tools/core/functions/check_api_key.dart';
import 'package:business_tools/core/functions/check_internet.dart';
import 'package:business_tools/core/services/app_services.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'check_state.dart';

class CheckCubit extends Cubit<CheckState> {
  CheckCubit() : super(const CheckState());

  void check() async {
    emit(state.copyWith(status: CheckStatus.loading));
    if ((await checkInternet())) {
      if (  sl<SharedPreferences>().getString(SharedKey.addApiKey) == null) {
        if (await checkApiKey(apiKey)) {
          emit(state.copyWith(status: CheckStatus.apiKeyWorking));
        } else {
          emit(state.copyWith(status: CheckStatus.apiKeyDontWorking));
        }
      } else {
        emit(state.copyWith(status: CheckStatus.addedApiKey));
      }
    } else {
      emit(state.copyWith(status: CheckStatus.internetError));
    }
  }
}
