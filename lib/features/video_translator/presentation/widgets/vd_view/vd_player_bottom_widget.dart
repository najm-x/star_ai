import 'package:business_tools/core/functions/date_format.dart';
import 'package:business_tools/features/video_translator/presentation/bloc/vd_view_cubit/vd_view_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VdPlayerBottomWidget extends StatelessWidget {
const VdPlayerBottomWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return BlocBuilder<VdViewCubit, VdViewState>(
          builder: (context, state) {
            return Expanded(
              child: Row(
                children: [
                  Text(
                    dateFormat(context.read<VdViewCubit>().controller.metadata.duration.toString()),
                    style: TextStyle(color: Theme.of(context).colorScheme.surface),
                  ),
                  Expanded(
                    child: Slider(
                      min: 0,
                      max: context.read<VdViewCubit>().controller.metadata.duration.inSeconds.toDouble(),
                      value: context.read<VdViewCubit>().controller.value.position.inSeconds.toDouble(),
                      onChanged: (value) {},
                      onChangeEnd: (value) {
                        context.read<VdViewCubit>().onChangeVdProggress(value.toInt());
                      },
                    ),
                  ),
                  Text(
                    dateFormat(context.read<VdViewCubit>().controller.value.position.toString()),
                    style: TextStyle(color: Theme.of(context).colorScheme.surface),
                  ),
                  IconButton(
                      onPressed: () {
                        context.read<VdViewCubit>().onScreenRotation(context);
                      },
                      icon: const Icon(Icons.screen_rotation))
                ],
              ),
            );
          },
        );
  }
}