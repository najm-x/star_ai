import 'package:business_tools/core/constant/app_colors.dart';
import 'package:business_tools/core/functions/check_permission.dart';
import 'package:business_tools/features/extract/domain/entities/emails_numbera_entite.dart';
import 'package:business_tools/features/extract/presentation/bloc/save_data_bloc/save_data_bloc.dart';
import 'package:business_tools/features/extract/presentation/widgets/dialog_widget/file_types.dart';
import 'package:business_tools/features/extract/presentation/widgets/dialog_widget/view_data_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DialogWidget extends StatelessWidget {
  final List<EmailsNumberaEntite> data;
  final String type;
  const DialogWidget({super.key, required this.data, required this.type});
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(color: AppColors.primaryContainer, borderRadius: BorderRadius.circular(16)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ViewDataDialog(data: data),
            _total(data: data, context: context),
            const SizedBox(
              height: 20,
            ),
            const FileTypes(),
            BlocListener<SaveDataBloc, SaveDataState>(
              listener: (context, state) {
              },
              child: InkWell(
                  onTap: () async{
                      if (await checkPermission(context)) {
                        // ignore: use_build_context_synchronously
                        BlocProvider.of<SaveDataBloc>(context).add(SaveDataEvent(data: data, type: type));
                      }
                  } ,
                  child: _export()),
            )
          ],
        ));
  }

  Widget _total({required List<EmailsNumberaEntite> data, required BuildContext context}) {
    return ListTile(
      title: const Text("Total"),
      trailing: Text(
        data.length.toString(),
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  Widget _export() {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      height: 40,
      width: double.maxFinite,
      decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(12)),
      child: const Center(
        child: Text("Export"),
      ),
    );
  }
}
