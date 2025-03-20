import 'package:business_tools/features/summary/presentation/bloc/cubit/summary_setup_cubit.dart';
import 'package:business_tools/features/summary/presentation/bloc/summary_view_bloc/summary_view_bloc.dart';
import 'package:business_tools/features/summary/presentation/view/widgets/summary_view_widgets/app_bar_summary_view.dart';
import 'package:business_tools/features/summary/presentation/view/widgets/summary_view_widgets/change_text_lt_r_widget.dart';
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
          context.read<SummaryViewBloc>().add(
              GetSummaryEvent(data: data, textOfVd: state.vdInfoMod!.vdText, titleVd: state.vdInfoMod?.vdTitle ?? ""));
        }
        if (state.state == ViewSummaryStates.errorGetVdInfo) {
          ScaffoldMessenger.maybeOf(context)?.showSnackBar(SnackBar(
            content: Text("ERROR: WE CAN'T CREATE SUNNARY FOR THIS VIDEO"),
            backgroundColor: Theme.of(context).colorScheme.error,
            duration: Duration(seconds: 5),
          ));
        }
      },
      child: Scaffold(
        appBar: _appBar(),
        body: _body(context),
      ),
    );
  }

  AppBar _appBar() {
    return appBarSummaryView();
  }

  Widget _body(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BlocBuilder<SummaryViewBloc, SummaryViewState>(
            builder: (context, state) {
              return state.state == ViewSummaryStates.successGetSummary ? SizedBox() : LinearProgressIndicator();
            },
          ),
          VideoViewWidget(),
          VdTitleWidget(),
          ChangeTextLtRWidget(),
          SummaryBody()
        ],
      ),
    );
  }
}
