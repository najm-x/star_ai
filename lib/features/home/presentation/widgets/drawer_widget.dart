import 'package:business_tools/core/functions/open_url.dart';
import 'package:business_tools/features/home/data/datasource/static/static_data.dart';
import 'package:business_tools/features/home/data/models/drawer_model.dart';
import 'package:business_tools/features/home/presentation/bloc/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
        onDestinationSelected: (value) async {
          BlocProvider.of<HomeCubit>(context).scaffols.currentState!.closeDrawer();
          if (value == 0) return;
          if (value == StaticData().drawerData.length - 1) {
            openUrl("https://star-ai1.blogspot.com/2024/07/privacy-policy.html");
            return;
          }
          value == 0 ? null : context.push(StaticData().drawerData[value].route!);
        },
        children: [
          _title(context),
          ...List.generate(
            StaticData().drawerData.length,
            (index) {
              DrawerModel drawerModel = StaticData().drawerData[index];
              return NavigationDrawerDestination(icon: Icon(drawerModel.iconData), label: Text(drawerModel.title));
            },
          ),
        ]);
  }

  Widget _title(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.only(top: 20, left: 10, right: 20, bottom: 20),
      child: Text(AppLocalizations.of(context)!.tools),
    );
  }
}
