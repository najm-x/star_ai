import 'package:business_tools/core/constant/types_validate.dart';
import 'package:business_tools/core/functions/validat_input.dart';
import 'package:business_tools/core/public/widgets/text_form_filed_cu.dart';
import 'package:business_tools/features/ads/presentation/widgets/ads_banner_widget.dart';
import 'package:business_tools/features/video_translator/presentation/bloc/vd_translate_bloc/vd_translate_bloc.dart';
import 'package:business_tools/features/video_translator/presentation/widgets/translate_option_widget.dart';
import 'package:business_tools/features/video_translator/presentation/widgets/video_translate/pick_file_widget.dart';
import 'package:business_tools/features/video_translator/presentation/widgets/video_translate/transelate_button.dart';
import 'package:flutter/material.dart';
import 'package:business_tools/l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:showcaseview/showcaseview.dart';

class VideoTranslatorPage extends StatefulWidget {
  final String typeTrans;
  const VideoTranslatorPage({super.key, required this.typeTrans});

  @override
  State<VideoTranslatorPage> createState() => _VideoTranslatorPageState();
}

class _VideoTranslatorPageState extends State<VideoTranslatorPage> {
  BuildContext? myContext;

  @override
  void initState() {
    print(widget.typeTrans + '=====+++++++++++++++============+++++++++++++===========');
    BlocProvider.of<VdTranslateBloc>(context).typeTrans = widget.typeTrans;
    Future.delayed(Durations.short1, () {
      BlocProvider.of<VdTranslateBloc>(context).showcase(myContext);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(
      builder: (context) {
        myContext = context;
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
                      const AdsBannerWidget(
                        adSize: AdSize.largeBanner,
                      ),
                      _space(),
                      Showcase(
                        key: BlocProvider.of<VdTranslateBloc>(context).one,
                        description: AppLocalizations.of(context)!.addVideoUrl,
                        child: SizedBox(
                          width: double.maxFinite,
                          child: TextFormFieldCu(
                              hint: AppLocalizations.of(context)!.pasteUrlHere,
                              labelText: AppLocalizations.of(context)!.vdurl,
                              textEditingController: BlocProvider.of<VdTranslateBloc>(context).videoUrlCo,
                              validator: (p0) => validateInput(p0!, TypesValidate.videoId, 300, 5)),
                        ),
                      ),
                      _space(),
                      widget.typeTrans == TypesValidate.transFromFile ? _onTransFromFileWidget() : _defultWidget(),
                      _space(),
                      Showcase(
                          key: BlocProvider.of<VdTranslateBloc>(context).three,
                          description: AppLocalizations.of(context)!.clickToStartTransVd,
                          child: const TranselateButton())
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _space() {
    return const SizedBox(
      height: 15,
    );
  }

  Widget _defultWidget() {
    return Showcase(
        key: BlocProvider.of<VdTranslateBloc>(context).tow,
        description: AppLocalizations.of(context)!.chooselangToTransVd,
        child: const TranslateOptionWidget());
  }

  Widget _onTransFromFileWidget() {
    return const PickFileWidget();
  }
}
