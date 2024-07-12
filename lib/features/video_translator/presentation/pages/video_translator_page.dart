import 'package:business_tools/core/constant/app_strings.dart';
import 'package:business_tools/core/constant/types_validate.dart';
import 'package:business_tools/core/functions/validat_input.dart';
import 'package:business_tools/core/public/widgets/text_form_filed_cu.dart';
import 'package:business_tools/features/video_translator/presentation/bloc/vd_translate_bloc/vd_translate_bloc.dart';
import 'package:business_tools/features/video_translator/presentation/widgets/translate_option_widget.dart';
import 'package:business_tools/features/video_translator/presentation/widgets/video_translate/transelate_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideoTranslatorPage extends StatelessWidget {
  const VideoTranslatorPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: BlocProvider.of<VdTranslateBloc>(context).formState,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: double.maxFinite,
                    child: TextFormFieldCu(
                        hint: AppStrings.pasteUrlHere,
                        labelText: AppStrings.vdurl,
                        textEditingController: BlocProvider.of<VdTranslateBloc>(context).videoUrlCo,
                        validator: (p0) => validateInput(p0!, TypesValidate.videoId, 300, 5)),
                  ),
                  _space(),
                  const TranslateOptionWidget(),
                  _space(),
                  const TranselateButton()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _space() {
    return const SizedBox(
      height: 15,
    );
  }
}
