import 'package:business_tools/core/functions/check_permission.dart';
import 'package:business_tools/core/public/custom_snak_bar.dart';
import 'package:business_tools/core/public/widgets/loading.dart';
import 'package:business_tools/core/services/app_services.dart';
import 'package:business_tools/features/video_translator/presentation/bloc/pick_file_cubit/pick_file_cubit.dart';
import 'package:business_tools/features/video_translator/presentation/bloc/vd_translate_bloc/vd_translate_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:business_tools/l10n/app_localizations.dart';

class PickFileWidget extends StatelessWidget {
  const PickFileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PickFileCubit, PickFileState>(
      listener: (context, state) {
        if (state.status == PickFileStatus.success) {
          context.read<VdTranslateBloc>().filePath = state.filePath;
        }
        if (state.status == PickFileStatus.error) {
          sl<CustomSnakBar>().snackBarError(context, state.messageError, 2);
        }
      },
      builder: (context, state) {
        return state.status == PickFileStatus.loading
            ? const Loading()
            : Container(
                width: double.maxFinite,
                height: 70,
                decoration:
                    BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all()),
                child: Center(
                    child: state.status == PickFileStatus.success
                        ? Text(state.filePath.split('/').last)
                        : state.status == PickFileStatus.loading
                            ? const Loading()
                            : TextButton(
                                onPressed: () async {
                                  if (await checkPermission(context)) {
                                    // ignore: use_build_context_synchronously
                                    await BlocProvider.of<PickFileCubit>(context).pickFile();
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(AppLocalizations.of(context)!.uploadImage),
                                ))),
              );
      },
    );
  }
}
