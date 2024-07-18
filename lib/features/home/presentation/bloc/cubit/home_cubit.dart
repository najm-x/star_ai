import 'package:bloc/bloc.dart';
import 'package:business_tools/core/constant/shared_key.dart';
import 'package:business_tools/core/services/app_services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showcaseview/showcaseview.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GlobalKey one = GlobalKey();
  final scaffols = GlobalKey<ScaffoldState>();
  HomeCubit() : super(HomeInitial());

  showCaseInit(BuildContext context) {
    if (sl<SharedPreferences>().getBool(SharedKey.isShowed) == null) {
      // sl<SharedPreferences>().setBool(SharedKey.isShowed, true);
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => Future.delayed(const Duration(milliseconds: 200), () {
          ShowCaseWidget.of(context).startShowCase([one]);
        }),
      );
    }
  }
}
