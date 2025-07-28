import 'package:business_tools/features/home/presentation/bloc/cubit/home_cubit.dart';
import 'package:business_tools/features/home/presentation/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:business_tools/l10n/app_localizations.dart';
import 'package:uicons/uicons.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<HomeCubit>().scaffols,
      bottomNavigationBar: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return BottomNavigationBar(
              onTap: (value) {
                context.read<HomeCubit>().changePage(value);
              },
              currentIndex: state.selectedPage,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                      UIcons.regularRounded.home,
                    ),
                    label: AppLocalizations.of(context)!.home),
                BottomNavigationBarItem(
                    icon: Icon(UIcons.regularRounded.settings), label: AppLocalizations.of(context)!.setting),
              ]);
        },
      ),
      appBar: _appBar(context),
      drawer: _drawer(),
      body: _buildWidget(context),
    );
  }

  Widget _buildWidget(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return PageView.builder(
          physics: NeverScrollableScrollPhysics(),
          allowImplicitScrolling: true,
          controller: context.read<HomeCubit>().pageController,
          itemCount: context.read<HomeCubit>().pages.length,
          itemBuilder: (context, index) {
            return context.read<HomeCubit>().pages[index];
          },
        );
      },
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(AppLocalizations.of(context)!.appName),
      leading: IconButton(
          onPressed: () {
            BlocProvider.of<HomeCubit>(context).scaffols.currentState!.openDrawer();
          },
          icon: const Icon(Icons.menu)),
    );
  }

  Widget _drawer() {
    return const DrawerWidget();
  }
}
