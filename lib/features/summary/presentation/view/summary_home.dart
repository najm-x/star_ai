import 'package:business_tools/core/constant/app_routes_name.dart';
import 'package:business_tools/features/summary/data/models/summary_store_mod.dart';
import 'package:business_tools/features/summary/presentation/bloc/summary_home_cubit/summary_home_cubit.dart';
import 'package:business_tools/features/summary/presentation/view/widgets/summary_home_widgets/vd_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return BlocBuilder<SummaryHomeCubit, SummaryHomeState>(
      builder: (context, state) {
        return state.status == SummaryHomeStatus.fetchDone
            ? _buildItems(state.summaries!)
            : Center(
                child: Text("لايوجد هنا شيء"),
              );
      },
    );
  }

  Widget _buildItems(List<SummaryStoreMod> summary) {
    return ListView.builder(
      itemCount: summary.length,
      itemBuilder: (context, index) {
        SummaryStoreMod value = summary[index];
        print(value.vdImage);
        return VdCardWidget(vdImage: value.vdImage, vdTitle: value.vdTitle);
      },
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
