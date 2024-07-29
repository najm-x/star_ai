import 'package:business_tools/features/video_translator/data/models/vd_type_model.dart';
import 'package:business_tools/features/video_translator/presentation/bloc/vd_trans_type_cubit/vd_trans_type_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RadioChooseWidget extends StatelessWidget {
  const RadioChooseWidget({super.key, required this.index, required this.currentVdType, required this.vdTypeModel});
  final int index;
  final int currentVdType;
  final VdTypeModel vdTypeModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
              color: index == currentVdType
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.secondary)),
      margin: const EdgeInsets.only(top: 10),
      child: SizedBox(
        child: RadioListTile(
          value: index,
          groupValue: currentVdType,
          onChanged: (newValue) => BlocProvider.of<VdTransTypeCubit>(context).change(newValue!),
          dense: true,
          title: Text(
            vdTypeModel.title,
          ),
          subtitle: Text(
            vdTypeModel.body,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
