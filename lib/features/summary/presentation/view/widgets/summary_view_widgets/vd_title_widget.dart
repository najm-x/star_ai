import 'package:business_tools/features/summary/presentation/bloc/summary_view_bloc/summary_view_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VdTitleWidget extends StatelessWidget {
const VdTitleWidget({ super.key });

  @override
  Widget build(BuildContext context){
    return BlocBuilder<SummaryViewBloc, SummaryViewState>(
    
      builder: (context, state) {
        return Center(
              child: Padding(
            padding: EdgeInsets.only(top: 30),
            child: Text(
               state.vdInfoMod?.vdTitle?? "",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ));
      },
    );
  }
}