import 'package:business_tools/core/constant/app_routes_name.dart';
import 'package:business_tools/features/summary/presentation/bloc/cubit/summary_setup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:uicons/uicons.dart';

class VlidateButtonSetup extends StatelessWidget {
const VlidateButtonSetup({ super.key });

  @override
  Widget build(BuildContext context){
    return BlocListener<SummarySetupCubit, SummarySetupState>(
                    listener: (context, state) {
                      if (state.state == StateSetUp.error) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("data")));
                      }
                      if (state.state == StateSetUp.done) {
                        context.push(AppRouteName.summaryView, extra: state);
                      }
                    },
                    child: Center(
                      child: FilledButton.icon(
                        onPressed: () => context.read<SummarySetupCubit>().validateButton(),
                        label: Text("Summary"),
                        icon: Icon(UIcons.regularStraight.magic_wand),
                      ),
                    ),
                  );
  }
}