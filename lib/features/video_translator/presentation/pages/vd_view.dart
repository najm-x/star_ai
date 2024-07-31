// ignore_for_file: use_build_context_synchronously

import 'package:business_tools/features/ads/presentation/bloc/bloc/ads_bloc.dart';
import 'package:business_tools/features/video_translator/data/models/data_vd_model.dart';
import 'package:business_tools/features/video_translator/domain/entities/vd_translate_entities.dart';
import 'package:business_tools/features/video_translator/presentation/bloc/vd_view_cubit/vd_view_cubit.dart';
import 'package:business_tools/features/video_translator/presentation/widgets/vd_view/download_widget.dart';
import 'package:business_tools/features/video_translator/presentation/widgets/vd_view/sub_title_option_landscape.dart';
import 'package:business_tools/features/video_translator/presentation/widgets/vd_view/sub_title_options_widget.dart';
import 'package:business_tools/features/video_translator/presentation/widgets/vd_view/sub_title_widget.dart';
import 'package:business_tools/features/video_translator/presentation/widgets/vd_view/vd_player_bottom_widget.dart';
import 'package:business_tools/features/video_translator/presentation/widgets/view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VdView extends StatefulWidget {
  final DataVdModel data;
  const VdView({super.key, required this.data});

  @override
  State<VdView> createState() => _VdViewState();
}

class _VdViewState extends State<VdView> {
  late List<VdTranslateEntities> subTitles;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AdsBloc>(context).add(InterstitialAdEvent());
    BlocProvider.of<VdViewCubit>(context).dataVdModel = widget.data;
    subTitles = widget.data.data;
    BlocProvider.of<VdViewCubit>(context).controller = YoutubePlayerController(
      initialVideoId: widget.data.idVideo,
      flags: const YoutubePlayerFlags(
        hideThumbnail: true,
        forceHD: false,
        autoPlay: true,
        enableCaption: false,
      ),
    )..addListener(() {
        if (widget.data.translateFrom != null) {
          if (BlocProvider.of<VdViewCubit>(context).controller.value.position.inMicroseconds == 0) {
            BlocProvider.of<VdViewCubit>(context).transalteOnVdStart();
            return;
          }
          if (BlocProvider.of<VdViewCubit>(context).translateToShow.isNotEmpty) {
            BlocProvider.of<VdViewCubit>(context).vdIsRunnig();
            return;
          }
        } else {
          BlocProvider.of<VdViewCubit>(context).changSubTitle(subTitles);
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: MediaQuery.of(context).orientation == Orientation.portrait,
        onPopInvoked: (didPop) async {
          if (MediaQuery.of(context).orientation == Orientation.landscape) {
            await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
          }
          if (MediaQuery.of(context).orientation == Orientation.portrait) {
            await BlocProvider.of<AdsBloc>(context).interstitialAd?.show();
          }
        },
        child: Scaffold(
          body: BlocListener<VdViewCubit, VdViewState>(
            listener: (context, state) {
              if (state is LoadingVdTranslate) {
                BlocProvider.of<VdViewCubit>(context).controller.pause();
              }
              if (state is SuccessVdTranslate) {
                BlocProvider.of<VdViewCubit>(context).controller.play();
              }
            },
            child: OrientationBuilder(
              builder: (context, orientation) {
                if (orientation == Orientation.portrait) {
                  return Column(
                    children: [
                      Stack(
                        children: [
                          ViewWidget(defaultWidegt: _defaultPlayer(), directTransWidegt: _directTransPlayer()),
                          const SubTitleWidget(),
                        ],
                      ),
                      Expanded(
                        child: SubTitleOptionsWidget(
                          subTitles: subTitles,
                        ),
                      ),
                      ViewWidget(
                          defaultWidegt: DownloadWidget(translation: widget.data.data, videoUrl: widget.data.idVideo),
                          directTransWidegt: const SizedBox()),
                    ],
                  );
                } else {
                  return Stack(
                    children: [
                      ViewWidget(defaultWidegt: _defaultPlayer(), directTransWidegt: _directTransPlayer()),
                      const SubTitleWidget(),
                      SubTitleOptionLandscape(subTitles: subTitles)
                    ],
                  );
                }
              },
            ),
          ),
        ));
  }

  Widget _directTransPlayer() {
    return YoutubePlayer(
      controller: BlocProvider.of<VdViewCubit>(context).controller,
      showVideoProgressIndicator: true,
      bottomActions: const [
        VdPlayerBottomWidget(),
      ],
    );
  }

  Widget _defaultPlayer() {
    return YoutubePlayer(
      controller: BlocProvider.of<VdViewCubit>(context).controller,
      showVideoProgressIndicator: true,
    );
  }
}
