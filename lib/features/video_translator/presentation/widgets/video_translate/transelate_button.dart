// ignore_for_file: use_build_context_synchronously

import 'package:business_tools/core/constant/app_routes_name.dart';
import 'package:business_tools/core/public/custom_snak_bar.dart';
import 'package:business_tools/core/public/widgets/info_widget.dart';
import 'package:business_tools/features/video_translator/data/models/data_vd_model.dart';
import 'package:business_tools/features/video_translator/presentation/bloc/vd_translate_bloc/vd_translate_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TranselateButton extends StatelessWidget {
  const TranselateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VdTranslateBloc, VdTranslateState>(
      listener: (context, state) async {
        if (state.status == VdTranslateStatus.successVdTranslate) {
          await Future.delayed(Durations.medium1);
          context.replace(AppRouteName.vdView,
              extra: DataVdModel(
                  idVideo:
                      context.read<VdTranslateBloc>().extractYouTubeId(context.read<VdTranslateBloc>().videoUrlCo.text),
                  data: state.onSuccessVdTranslate!));
        }
        if (state.status == VdTranslateStatus.successTransCript) {
          await Future.delayed(Durations.medium1);
          context.replace(AppRouteName.vdView, extra: state.onSuccessTransCript);
        }
        if (state.status == VdTranslateStatus.successGetTransFromFile) {
          await Future.delayed(Durations.medium1);
          context.replace(AppRouteName.vdView,
              extra: DataVdModel(
                  idVideo:
                      context.read<VdTranslateBloc>().extractYouTubeId(context.read<VdTranslateBloc>().videoUrlCo.text),
                  data: state.onSuccessGetTransFromFile!));
        }
        if (state.status == VdTranslateStatus.error) {
          CustomSnakBar().snackBarError(context, state.messageError, 5);
          debugPrint(state.messageError.toString());
        }
      },
      builder: (context, state) {
        return AnimatedCrossFade(
            firstChild: ElevatedButton(
              onPressed: () => context.read<VdTranslateBloc>().onTapTranslate(),
              child: Text(AppLocalizations.of(context)!.translate),
            ),
            secondChild: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InfoWidget(text: state.infoLoading),
                const SizedBox(
                  height: 10,
                ),
                _progressWidget(state.translationProgress),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.all(2.0),
                  child: CircularProgressIndicator(),
                )
              ],
            ),
            crossFadeState:
                state.status == VdTranslateStatus.loading ? CrossFadeState.showSecond : CrossFadeState.showFirst,
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
