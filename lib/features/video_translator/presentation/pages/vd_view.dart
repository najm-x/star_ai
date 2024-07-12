import 'package:business_tools/core/public/widgets/add.dart';
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
  final Map data;
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
    subTitles = widget.data["data"];
    controller = YoutubePlayerController(
      initialVideoId: widget.data["id"],
      flags: const YoutubePlayerFlags(
        hideThumbnail: true,
        forceHD: true,
        autoPlay: true,
        enableCaption: false,
      ),
    )..addListener(() {
        BlocProvider.of<VdViewCubit>(context).currentPosition = controller.value.position;
        BlocProvider.of<VdViewCubit>(context).changSubTitle(subTitles);
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
          body: OrientationBuilder(
            builder: (context, orientation) {
              if (orientation == Orientation.portrait) {
                return Column(
                  children: [
                    Stack(
                      children: [
                        YoutubePlayer(
                          controller: controller,
                          showVideoProgressIndicator: true,
                        ),
                        const SubTitleWidget(),
                      ],
                    ),
                    const Add(height: 70),
                    Expanded(
                      child: SubTitleOptionsWidget(
                        subTitles: subTitles,
                      ),
                    ),
                    DownloadWidget(translation: widget.data["data"], videoUrl: widget.data["id"])
                  ],
                );
              } else {
                return Stack(
                  children: [
                    YoutubePlayer(
                      controller: controller,
                      showVideoProgressIndicator: true,
                    ),
                    const SubTitleWidget(),
                    SubTitleOptionLandscape(subTitles: subTitles)
                  ],
                );
              }
            },
          ),
        ));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
