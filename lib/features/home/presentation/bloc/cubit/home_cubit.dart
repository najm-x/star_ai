import 'package:bloc/bloc.dart';
import 'package:business_tools/features/home/presentation/pages/setting_page.dart';
import 'package:business_tools/features/home/presentation/pages/welcome_page.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GlobalKey one = GlobalKey();
  final scaffols = GlobalKey<ScaffoldState>();
  final List<Widget> pages = [WelcomePage(), SettingsPage()];
  final PageController pageController = PageController();
  int slectedPage = 0;
  HomeCubit() : super(HomeState());

  void changePage(int page) {
    print(page) ;
    emit(state.copyWith(status: HomeStatus.init));
    slectedPage = page;
    pageController.animateToPage(page, duration: Durations.medium1, curve: Curves.bounceIn);
    emit(state.copyWith(status: HomeStatus.init));
  }
}
