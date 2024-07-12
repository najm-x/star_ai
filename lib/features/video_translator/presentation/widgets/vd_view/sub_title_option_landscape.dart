import 'package:business_tools/features/video_translator/domain/entities/vd_translate_entities.dart';
import 'package:business_tools/features/video_translator/presentation/bloc/vd_view_cubit/vd_view_cubit.dart';
import 'package:business_tools/features/video_translator/presentation/widgets/vd_view/sub_title_options_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubTitleOptionLandscape extends StatelessWidget {
  const SubTitleOptionLandscape({super.key, required this.subTitles});
 final List<VdTranslateEntities> subTitles ;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VdViewCubit, VdViewState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 30),
          alignment: AlignmentDirectional.centerEnd,
          height: double.maxFinite,
          width: double.maxFinite,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () => context.read<VdViewCubit>().changeWidgetView(),
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.white70,
                    size: 40,
                  )),
              AnimatedCrossFade(
                  firstChild: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white38,
                    ),
                    width: 300,
                    child: SubTitleOptionsWidget(subTitles: subTitles),
                  ),
                  secondChild: const SizedBox(
                    height: double.maxFinite,
                  ),
                  crossFadeState:
                      context.read<VdViewCubit>().currentShow ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                  duration: Durations.medium2)
            ],
          ),
        );
      },
    );
  }
}
