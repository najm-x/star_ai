import 'dart:io';

import 'package:business_tools/core/functions/check_permission.dart';
import 'package:business_tools/core/public/custom_snak_bar.dart';
import 'package:business_tools/core/services/app_services.dart';
import 'package:business_tools/features/ads/presentation/bloc/bloc/ads_bloc.dart';
import 'package:business_tools/features/text_extract/presentation/bloc/bloc/text_extract_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:showcaseview/showcaseview.dart';

class AddImageWidget extends StatelessWidget {
  const AddImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Durations.medium1,
      padding: const EdgeInsets.all(8),
      height: 180,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), border: Border.all()),
      child: BlocConsumer<TextExtractBloc, TextExtractState>(
        listener: (context, state) {
          if (state.status == TextExtractStatus.successPickImage) {
            context.read<TextExtractBloc>().add(CropImageEvent(path: state.value));
          }
          if (state.status == TextExtractStatus.successCropImage) {
            context.read<AdsBloc>().add(InterstitialAdEvent());
            context.read<TextExtractBloc>().path = state.value;
          }
          if (state.status == TextExtractStatus.successTextExtract) {
            context.read<AdsBloc>().interstitialAd?.show();
          }
          if (state.status == TextExtractStatus.errorPickImage || state.status == TextExtractStatus.errorCropImage) {
            sl<CustomSnakBar>().snackBarError(context, state.messageError, 2);
          }
        },
        builder: (context, state) {
          return state.status == TextExtractStatus.successCropImage ||
                  state.status == TextExtractStatus.successTextExtract ||
                  state.status == TextExtractStatus.loading
              ? SingleChildScrollView(child: Image.file(File(context.read<TextExtractBloc>().path)))
              : Center(
                  child: Showcase(
                    key: BlocProvider.of<TextExtractBloc>(context).one,
                    description: AppLocalizations.of(context)!.chooseImage,
                    child: TextButton.icon(
                    onPressed: () async {
                      if (await checkPermission(context)) {
                        // ignore: use_build_context_synchronously
                        context.read<TextExtractBloc>().add(const PickImagEvent());
                      }
                    },
                    label: Text("\n${AppLocalizations.of(context)!.uploadImage}\n"),
                    icon: const Icon(Icons.upload),
                                    ),
                  ));
        },
      ),
    );
  }
}
