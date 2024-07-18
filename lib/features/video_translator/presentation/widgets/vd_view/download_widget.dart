import 'package:business_tools/core/functions/message_permission_handel.dart';
import 'package:business_tools/core/functions/premission_request.dart';
import 'package:business_tools/core/public/custom_snak_bar.dart';
import 'package:business_tools/core/public/widgets/dialog_permission.dart';
import 'package:business_tools/features/video_translator/domain/entities/vd_translate_entities.dart';
import 'package:business_tools/features/video_translator/presentation/bloc/vd_download_bloc/vd_download_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DownloadWidget extends StatelessWidget {
  const DownloadWidget({super.key, required this.translation, required this.videoUrl});
  final List<VdTranslateEntities> translation;
  final String videoUrl;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VdDownloadBloc, VdDownloadState>(
      listener: (context, state) async {
        if (state.status == VdDownloadStatus.error) {
          CustomSnakBar().snackBarError(context, state.messageError, 5);
        }

        if (state.status == VdDownloadStatus.success) {
          CustomSnakBar().snackBarSuccess(context, state.messageSuccess, 5);
        }
        if (state.status == VdDownloadStatus.errorPermission) {
          String permissionMessage = await messagePremissionHandel(context);
          showDialog(
            // ignore: use_build_context_synchronously
            context: context,
            builder: (context) {
              return DialogPermission(
                title: AppLocalizations.of(context)!.accessRequired,
                permissionMessage: permissionMessage,
                iconData: Icons.folder_rounded,
                onPressed: () => requsetPremission(),
              );
            },
          );
        }
      },
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: AnimatedCrossFade(
              firstChild: ElevatedButton(
                onPressed: () =>
                    context.read<VdDownloadBloc>().add(VdDownloadEvent(translation: translation, videoUrl: videoUrl)),
                child: Text(AppLocalizations.of(context)!.saveTranslation),
              ),
              secondChild: const Padding(
                padding: EdgeInsets.all(2.0),
                child: CircularProgressIndicator(),
              ),
              crossFadeState:
                  state.status == VdDownloadStatus.loading ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              duration: Durations.medium1),
        );
      },
    );
  }
}
