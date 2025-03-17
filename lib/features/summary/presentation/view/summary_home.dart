import 'package:business_tools/core/constant/app_routes_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uicons/uicons.dart';

class SummaryHome extends StatelessWidget {
  const SummaryHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _floatActionButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      appBar: _appBar(),
      body: _body(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text('تلخيص اليوتيوب'),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(UIcons.regularStraight.info),
        )
      ],
    );
  }

  Widget _body() {
    return Center(
      child: Text("لا يوجد هنا شيء لعرض بعد "),
    );
  }

  Widget _floatActionButton(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: FloatingActionButton(
        onPressed: () => context.push(AppRouteName.summarySetup),
        child: Icon(UIcons.regularStraight.plus_small),
      ),
    );
  }
}
