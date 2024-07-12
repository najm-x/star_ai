import 'package:business_tools/features/home/data/datasource/static/static_data.dart';
import 'package:business_tools/features/home/data/models/drawer_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
        onDestinationSelected: (value) async {
          context.pop();
         await  Future.delayed(Durations.medium1) ;
          // ignore: use_build_context_synchronously
          value == 0 ? null : context.push(StaticData.drawerData[value].route!);
        },
        children: [
          _title(),
          ...List.generate(
            StaticData.drawerData.length,
            (index) {
              DrawerModel drawerModel = StaticData.drawerData[index];
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

  Widget _title() {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.only(top: 20, left: 10, bottom: 20),
      child: const Text("TOOLS"),
    );
  }
}
