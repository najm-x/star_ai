import 'package:business_tools/core/constant/app_routes_name.dart';
import 'package:business_tools/features/summary/data/models/export_type_mod.dart';
import 'package:business_tools/features/summary/data/source/static/summary_static_data.dart';
import 'package:business_tools/features/summary/presentation/bloc/summary_view_bloc/summary_view_bloc.dart';
import 'package:business_tools/features/summary/presentation/bloc/summary_view_cubit/cubit/summary_view_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppBarSummaryView extends StatelessWidget {
  const AppBarSummaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SummaryViewBloc, SummaryViewState>(
      buildWhen: (previous, current) => current.state == ViewSummaryStates.successGetSummary,
      builder: (context, state) {
        bool isReady = state.state == ViewSummaryStates.successGetSummary;
        return AppBar(
          leading: BackButton(
            onPressed: () => context.pushReplacement(AppRouteName.summaryHome),
          ),
          actions: [
            _popButton(context, isReady, state),
            _iconWidget(
                onPressed: () => context.read<SummaryViewCubit>().reSummary(),
                iconData: Icons.refresh_rounded,
                isReady: isReady),
            _iconWidget(
                onPressed: () => context.read<SummaryViewCubit>().copyText(context.read<SummaryViewBloc>().summary),
                iconData: Icons.copy_rounded,
                isReady: isReady),
          ],
        );
      },
    );
  }
}

Widget _iconWidget({required void Function()? onPressed, required IconData? iconData, required bool isReady}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5),
    child: IgnorePointer(
      ignoring: !isReady,
      child: IconButton(
        color: !isReady ? Colors.black26 : null,
        onPressed: onPressed,
        icon: Icon(iconData),
        iconSize: 30,
      ),
    ),
  );
}

Widget _popButton(BuildContext context, bool isReady, SummaryViewState state) {
  return IgnorePointer(
    ignoring: !isReady,
    child: PopupMenuButton(
      itemBuilder: (context) => List.generate(SummaryStaticData.exportType.length, (index) {
        ExportTypeMod val = SummaryStaticData.exportType[index];
        return PopupMenuItem(
          value: "$index",
          child: Text(val.type),
        );
      }),
      onSelected: (value) {
        context.read<SummaryViewCubit>().export(state.summaryMod?.summary ?? "",
            SummaryStaticData.exportType[int.parse(value)], state.vdInfoMod?.vdTitle ?? "", state.lang);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Icon(
          size: 30,
          Icons.upload_rounded,
          color: !isReady ? Colors.black26 : null,
        ),
      ),
    ),
  );
}
