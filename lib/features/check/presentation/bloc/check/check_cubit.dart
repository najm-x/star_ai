import 'package:bloc/bloc.dart';
import 'package:business_tools/core/functions/check_api_key.dart';
import 'package:business_tools/core/functions/check_internet.dart';
import 'package:business_tools/core/functions/handel_api_key.dart';
import 'package:equatable/equatable.dart';

part 'check_state.dart';

class CheckCubit extends Cubit<CheckState> {
  CheckCubit() : super(const CheckState());

  void check() async {
    emit(state.copyWith(status: CheckStatus.loading));
    if ((await checkInternet())) {
      if (await checkApiKey(await handelApiKey())) {
        emit(state.copyWith(status: CheckStatus.apiKeyWorking));
      } else {
        emit(state.copyWith(status: CheckStatus.apiKeyDontWorking));
      }
    } else {
      emit(state.copyWith(status: CheckStatus.internetError));
    }
  }
}
