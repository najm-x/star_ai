import 'package:business_tools/features/video_translator/data/datasources/static_data_vd_trans.dart';
import 'package:business_tools/features/video_translator/presentation/bloc/vd_view_cubit/vd_view_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubTitleWidget extends StatelessWidget {
  const SubTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VdViewCubit, VdViewState>(
      builder: (context, state) {
        return Positioned(
          bottom: context.read<VdViewCubit>().currentBottomSpace,
          left: 10,
          right: 10,
          child: IgnorePointer(
            child: Text(
              textDirection: context.read<VdViewCubit>().currentisLtoR ? TextDirection.ltr : TextDirection.rtl,
              context.read<VdViewCubit>().currentSubTitle,
              style: TextStyle(
                color: StaticDataVdTrans.colorList[context.read<VdViewCubit>().currentTextColor.toInt()],
                fontSize: context.read<VdViewCubit>().currentFontSize,
                backgroundColor: Colors.black.withOpacity(context.read<VdViewCubit>().currentBgOpacity),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }
}
