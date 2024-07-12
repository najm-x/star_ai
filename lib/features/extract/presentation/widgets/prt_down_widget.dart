import 'package:business_tools/core/constant/app_colors.dart';
import 'package:business_tools/core/public/widgets/add.dart';
import 'package:business_tools/features/extract/presentation/bloc/extract_bloc/extract_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uicons/uicons.dart';

class PrtDownWidget extends StatelessWidget {
  const PrtDownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 2,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              const Add(
                height: 70,
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _typeExtract("Extract"),
                  IconButton(
                      onPressed: ()=> BlocProvider.of<ExtractBloc>(context).add(const ChangeTypeExtract()),
                      icon: Icon(UIcons.regularRounded.refresh)),
                  BlocBuilder<ExtractBloc, ExtractState>(
                    builder: (context, state) {
                      return _typeExtract(
                          state is DoneChanged ? state.value : context.read<ExtractBloc>().typeExtractName);
                    },
                  )
                ],
              )
            ],
          ),
        ));
  }

  Widget _typeExtract(String text) {
    return Container(
      height: 45,
      width: 100,
      decoration: BoxDecoration(color: AppColors.primaryContainer, borderRadius: BorderRadius.circular(12)),
      child: Center(
        child: Text(text),
      ),
    );
  }
}
