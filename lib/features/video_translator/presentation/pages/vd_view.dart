// ignore_for_file: use_build_context_synchronously

import 'package:business_tools/core/functions/date_format.dart';
import 'package:business_tools/features/ads/presentation/bloc/bloc/ads_bloc.dart';
import 'package:business_tools/features/video_translator/data/models/data_vd_model.dart';
import 'package:business_tools/features/video_translator/domain/entities/vd_translate_entities.dart';
import 'package:business_tools/features/video_translator/presentation/bloc/vd_view_cubit/vd_view_cubit.dart';
import 'package:business_tools/features/video_translator/presentation/widgets/vd_view/download_widget.dart';
import 'package:business_tools/features/video_translator/presentation/widgets/vd_view/sub_title_option_landscape.dart';
import 'package:business_tools/features/video_translator/presentation/widgets/vd_view/sub_title_options_widget.dart';
import 'package:business_tools/features/video_translator/presentation/widgets/vd_view/sub_title_widget.dart';
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
  late YoutubePlayerController controller;
  late List<VdTranslateEntities> subTitles;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AdsBloc>(context).add(InterstitialAdEvent());
    BlocProvider.of<VdViewCubit>(context).dataVdModel = widget.data;
    subTitles = widget.data.data;
    controller = YoutubePlayerController(
      initialVideoId: widget.data.idVideo,
      flags: const YoutubePlayerFlags(
        hideThumbnail: true,
        forceHD: false,
        autoPlay: true,
        enableCaption: false,
      ),
    )..addListener(() {
        BlocProvider.of<VdViewCubit>(context).currentPosition = controller.value.position;

        if (widget.data.translateFrom != null) {
          if (controller.value.position.inMicroseconds == 0) {
            controller.seekTo(Durations.short1);
            controller.pause();
            BlocProvider.of<VdViewCubit>(context).transalteOnVdStart();
          } else if (BlocProvider.of<VdViewCubit>(context).translateToShow.isNotEmpty) {
            BlocProvider.of<VdViewCubit>(context).vdIsRunnig();
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
        },
        child: Scaffold(
          body: BlocListener<VdViewCubit, VdViewState>(
            listener: (context, state) {
              if (state is LoadingVdTranslate) {
                controller.pause();
              }
              if (state is SuccessVdTranslate) {
                controller.play();
              }
            },
            child: OrientationBuilder(
              builder: (context, orientation) {
                if (orientation == Orientation.portrait) {
                  return Column(
                    children: [
                      Stack(
                        children: [
                          _player(),
                          const SubTitleWidget(),
                        ],
                      ),
                      Expanded(
                        child: SubTitleOptionsWidget(
                          subTitles: subTitles,
                        ),
                      ),
                      DownloadWidget(translation: widget.data.data, videoUrl: widget.data.idVideo)
                    ],
                  );
                } else {
                  return Stack(
                    children: [_player(), const SubTitleWidget(), SubTitleOptionLandscape(subTitles: subTitles)],
                  );
                }
              },
            ),
          ),
        ));
  }

  Widget _player() {
    return YoutubePlayer(
      controller: controller,
      showVideoProgressIndicator: true,
      bottomActions: [
        BlocBuilder<VdViewCubit, VdViewState>(
          builder: (context, state) {
            return Expanded(
              child: Row(
                children: [
                  Text(
                    dateFormat(controller.metadata.duration.toString()),
                    style: TextStyle(color: Theme.of(context).colorScheme.surface),
                  ),
                  Expanded(
                    child: Slider(
                      min: 0,
                      max: controller.metadata.duration.inSeconds.toDouble(),
                      value: context.read<VdViewCubit>().currentPosition.inSeconds.toDouble(),
                      onChanged: (value) async {},
                      onChangeEnd: (value) async {
                        controller.pause();
                        await Future.delayed(Durations.short4);
                        context.read<VdViewCubit>().translateToShow.clear();
                        context.read<VdViewCubit>().nextTranslateToShow.clear();
                        controller.seekTo(Duration(seconds: value.toInt()));
                        context.read<VdViewCubit>().translateWithLoading(context.read<VdViewCubit>().currentPosition);
                      },
                    ),
                  ),
                  Text(
                    dateFormat(context.read<VdViewCubit>().currentPosition.toString()),
                    style: TextStyle(color: Theme.of(context).colorScheme.surface),
                  ),
                  IconButton(
                      onPressed: () async {
                        controller.pause();
                        await Future.delayed(Durations.short4);
                        context.read<VdViewCubit>().translateToShow.clear();
                        context.read<VdViewCubit>().nextTranslateToShow.clear();
                        controller.seekTo(const Duration(seconds: 0));
                        context.read<VdViewCubit>().translateWithLoading(context.read<VdViewCubit>().currentPosition);
                        if (MediaQuery.of(context).orientation == Orientation.landscape) {
                          SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
                        } else {
                          SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
                        }
                      },
                      icon: Icon(Icons.screen_rotation))
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
