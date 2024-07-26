import 'package:business_tools/core/constant/app_routes_name.dart';
import 'package:business_tools/core/public/custom_snak_bar.dart';
import 'package:business_tools/core/public/widgets/info_widget.dart';
import 'package:business_tools/features/video_translator/data/models/data_vd_model.dart';
import 'package:business_tools/features/video_translator/presentation/bloc/vd_translate_bloc/vd_translate_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class TranselateButton extends StatelessWidget {
  const TranselateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VdTranslateBloc, VdTranslateState>(
      listener: (context, state) async {
        if (state.status == VdTranslateStatus.successVdTranslate) {
          // debugPrint(state.data.toString());
          await Future.delayed(Durations.medium1);
          // ignore: use_build_context_synchronously
          context.replace(AppRouteName.vdView,
              extra: DataVdModel(
                  idVideo:
                      // ignore: use_build_context_synchronously
                      context.read<VdTranslateBloc>().extractYouTubeId(context.read<VdTranslateBloc>().videoUrlCo.text),
                  data: state.onSuccessVdTranslate!));
        }
        if (state.status == VdTranslateStatus.error) {
          // ignore: use_build_context_synchronously
          CustomSnakBar().snackBarError(context, state.messageError, 5);
          debugPrint(state.messageError.toString());
        }
      },
      builder: (context, state) {
        return AnimatedCrossFade(
            firstChild: ElevatedButton(
              onPressed: () => context.read<VdTranslateBloc>().onTapTranslate(),
              child: const Text("Translate"),
            ),
            secondChild: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const InfoWidget(
                    text: "The translation time ranges from 0.1 to 7 minutes, depending on the length of the video."),
                const SizedBox(
                  height: 10,
                ),
                _progressWidget(state.status == VdTranslateStatus.loading ? state.translationProgress : 0),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.all(2.0),
                  child: CircularProgressIndicator(),
                )
              ],
            ),
            crossFadeState: state.status == VdTranslateStatus.loading ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            duration: Durations.medium1);
      },
    );
  }

  Widget _progressWidget(double translationProgress) {
    return SizedBox(
      child: Row(
        children: [
          Expanded(
            child: LinearProgressIndicator(
              minHeight: 10,
              borderRadius: BorderRadius.circular(20),
              value: translationProgress / 100,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text("$translationProgress%")
        ],
      ),
    );
  }
}
