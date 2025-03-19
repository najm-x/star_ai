import 'package:business_tools/features/summary/presentation/bloc/cubit/summary_setup_cubit.dart';
import 'package:business_tools/features/summary/presentation/bloc/summary_view_bloc/summary_view_bloc.dart';
import 'package:business_tools/features/summary/presentation/view/widgets/summary_view_widgets/summary_body.dart';
import 'package:business_tools/features/summary/presentation/view/widgets/summary_view_widgets/vd_title_widget.dart';
import 'package:business_tools/features/summary/presentation/view/widgets/summary_view_widgets/video_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SummaryView extends StatelessWidget {
  const SummaryView({super.key});

  @override
  Widget build(BuildContext context) {
    final SummarySetupState data = GoRouterState.of(context).extra as SummarySetupState;
    return BlocListener<SummaryViewBloc, SummaryViewState>(
      listener: (context, state) {
        if (state.state == ViewSummaryStates.successGetVdInfo) {
          context.read<SummaryViewBloc>().add(GetSummaryEvent(data: data, textOfVd: state.vdInfoMod!.vdText , titleVd: state.vdInfoMod?.vdTitle??""));
        }
      },
      child: Scaffold(
        appBar: _appBar(),
        body: _body(context),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.upload_rounded),
          iconSize: 30,
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.star_outline_rounded), iconSize: 30),
        IconButton(onPressed: () {}, icon: Icon(Icons.refresh_rounded), iconSize: 30),
        IconButton(onPressed: () {}, icon: Icon(Icons.copy_rounded), iconSize: 30),
      ],
    );
  }

  Widget _body(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LinearProgressIndicator(),
          VideoViewWidget(),
          VdTitleWidget(),
          ListTile(
            title: Text("Text Direction"),
            trailing: Switch(
              value: true,
              onChanged: (value) {},
            ),
          ),
          SummaryBody()
        ],
      ),
    );
  }
}
