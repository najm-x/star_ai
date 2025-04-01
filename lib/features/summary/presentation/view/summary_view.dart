import 'package:business_tools/core/constant/app_routes_name.dart';
import 'package:business_tools/core/functions/copy_text.dart';
import 'package:business_tools/features/ads/presentation/bloc/bloc/ads_bloc.dart';
import 'package:business_tools/features/ads/presentation/widgets/ads_banner_widget.dart';
import 'package:business_tools/features/summary/presentation/bloc/cubit/summary_setup_cubit.dart';
import 'package:business_tools/features/summary/presentation/bloc/summary_view_bloc/summary_view_bloc.dart';
import 'package:business_tools/features/summary/presentation/bloc/summary_view_cubit/cubit/summary_view_cubit.dart';
import 'package:business_tools/features/summary/presentation/view/widgets/summary_view_widgets/app_bar_summary_view.dart';
import 'package:business_tools/features/summary/presentation/view/widgets/summary_view_widgets/change_text_lt_r_widget.dart';
import 'package:business_tools/features/summary/presentation/view/widgets/summary_view_widgets/summary_body.dart';
import 'package:business_tools/features/summary/presentation/view/widgets/summary_view_widgets/vd_title_widget.dart';
import 'package:business_tools/features/summary/presentation/view/widgets/summary_view_widgets/video_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class SummaryView extends StatefulWidget {
  const SummaryView({super.key});

  @override
  State<SummaryView> createState() => _SummaryViewState();
}

class _SummaryViewState extends State<SummaryView> {
  int itemBuild = 0;

  @override
  Widget build(BuildContext context) {
    SummarySetupState? data;
    if (itemBuild == 0) {
      if (GoRouterState.of(context).extra is! SummarySetupState) {
        context.read<SummaryViewBloc>().add(GetSummaryStoredEvent(id: GoRouterState.of(context).extra as int));
      } else {
        data = GoRouterState.of(context).extra as SummarySetupState;
        context.read<SummaryViewBloc>().add(GetVdInfoEvent(vdUrl: (data).vdUrl, vdLang: data.lang));
      }
      itemBuild++;
    }

    return MultiBlocListener(
      listeners: [
        BlocListener<SummaryViewBloc, SummaryViewState>(
          listener: (context, state) {
            context.read<SummaryViewCubit>().data = state;
            if (state.state == ViewSummaryStates.successGetVdInfo) {
              context.read<SummaryViewBloc>().add(GetSummaryEvent(
                  data: data!, textOfVd: state.vdInfoMod!.vdText, titleVd: state.vdInfoMod?.vdTitle ?? ""));
            }
            if (state.state == ViewSummaryStates.errorGetVdInfo || state.state == ViewSummaryStates.erroretSummary) {
              ScaffoldMessenger.maybeOf(context)?.showSnackBar(SnackBar(
                content: Text("ERROR: WE CAN'T CREATE SUNNARY FOR THIS VIDEO"),
                backgroundColor: Theme.of(context).colorScheme.error,
                duration: Duration(seconds: 5),
              ));
            }
          },
        ),
        BlocListener<SummaryViewCubit, SummaryViewCubitState>(
          listener: (context, state) async {
            if (state.state == StateSummaryViewCubit.copy) {
              copyText(state.summary);
              ScaffoldMessenger.maybeOf(context)?.showSnackBar(SnackBar(
                content: Text("Done Copy"),
                backgroundColor: Theme.of(context).colorScheme.primary,
                duration: Duration(seconds: 2),
              ));
            }
            if (state.state == StateSummaryViewCubit.reSummary) {
              context.pop();
            }
            if (state.state == StateSummaryViewCubit.save || state.state == StateSummaryViewCubit.saveError) {
              context.go(AppRouteName.summaryHome);
              await context.read<AdsBloc>().interstitialAd?.show();
            }
          },
        ),
      ],
      child: BlocBuilder<SummaryViewBloc, SummaryViewState>(
        buildWhen: (previous, current) => 2 == 3,
        builder: (context, state) {
          return PopScope(
              canPop: false,
              onPopInvokedWithResult: (didPop, result) {
                !didPop ? context.read<SummaryViewCubit>().save() : {};
              },
              child: Scaffold(
                bottomSheet: Container(
                  width: double.maxFinite,
                  color: Colors.white,
                  child: AdsBannerWidget(
                    adSize: AdSize.largeBanner,
                  ),
                ),
                appBar: PreferredSize(preferredSize: Size(double.maxFinite, 50), child: _appBar()), // _appBar(context),
                body: _body(context),
              ));
        },
      ),
    );
  }

  Widget _appBar() {
    return AppBarSummaryView();
  }

  Widget _body(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BlocBuilder<SummaryViewBloc, SummaryViewState>(
            builder: (context, state) {
              return state.state == ViewSummaryStates.successGetSummary ||
                      state.state == ViewSummaryStates.successGetSummaryStored
                  ? SizedBox()
                  : LinearProgressIndicator();
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
