import 'package:business_tools/features/summary/presentation/bloc/summary_view_bloc/summary_view_bloc.dart';
import 'package:business_tools/features/summary/presentation/bloc/summary_view_cubit/cubit/summary_view_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

AppBar appBarSummaryView(BuildContext context) {
  return AppBar(
    actions: [
      _iconWidget(
        onPressed: () {},
        iconData: Icons.upload_rounded,
      ),
      _iconWidget(
        onPressed: () {},
        iconData: Icons.star_outline_rounded,
      ),
      _iconWidget(
        onPressed: () {},
        iconData: Icons.refresh_rounded,
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
