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
          )
        ]);
    // Drawer(
    //   child: Padding(
    //     padding: const EdgeInsets.all(18.0),
    //     child: Column(children: [
    //       _title(),
    //       ...List.generate(StaticData.drawerData.length, (index) {
    //         DrawerModel drawerModel = StaticData.drawerData[index];
    //         return _itemDesing(
    //             drawerModel: drawerModel,
    //             onTap: () {
    //               drawerModel.route != null ? Navigator.of(context).pushNamed(drawerModel.route!) : {};
    //             });
    //       })
    //     ]),
    //   ),
    // );
  }

  Widget _title(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.only(top: 20, left: 10, right: 20, bottom: 20),
      child: Text(AppLocalizations.of(context)!.tools),
    );
  }
}
