import 'package:business_tools/features/summary/data/models/export_type_mod.dart';
import 'package:business_tools/features/summary/data/source/static/summary_static_data.dart';
import 'package:business_tools/features/summary/presentation/bloc/summary_view_bloc/summary_view_bloc.dart';
import 'package:business_tools/features/summary/presentation/bloc/summary_view_cubit/cubit/summary_view_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

AppBar appBarSummaryView(BuildContext context) {
  return AppBar(
    actions: [
      _popButton(context),
      _iconWidget(
        onPressed: () {},
        iconData: Icons.star_outline_rounded,
      ),
      _iconWidget(
        onPressed: () => context.read<SummaryViewCubit>().copyText(context.read<SummaryViewBloc>().summary),
        iconData: Icons.copy_rounded,
      )
    ],
  );
}

Widget _iconWidget({required void Function()? onPressed, required IconData? iconData}) {
  return BlocBuilder<SummaryViewBloc, SummaryViewState>(
    buildWhen: (previous, current) => current.state == ViewSummaryStates.successGetSummary,
    builder: (context, state) {
      bool isReady = state.state == ViewSummaryStates.successGetSummary;
      return IgnorePointer(
        ignoring: !isReady,
        child: IconButton(
          color: !isReady ? Colors.black26 : null,
          onPressed: onPressed,
          icon: Icon(iconData),
          iconSize: 30,
        ),
      );
    },
  );
}

Widget _popButton(BuildContext context) {
  return BlocBuilder<SummaryViewBloc, SummaryViewState>(
    buildWhen: (previous, current) => current.state == ViewSummaryStates.successGetSummary,
    builder: (context, state) {
      bool isReady = state.state == ViewSummaryStates.successGetSummary;
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
            context.read<SummaryViewCubit>().export(
                context.read<SummaryViewBloc>().summary, SummaryStaticData.exportType[int.parse(value)]);
          },
          child: Icon(
            Icons.upload_rounded,
            color: !isReady ? Colors.black26 : null,
          ),
        ),
      );
    },
  );
}
