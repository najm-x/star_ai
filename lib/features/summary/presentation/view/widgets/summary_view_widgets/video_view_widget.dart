import 'package:business_tools/features/summary/presentation/bloc/summary_view_bloc/summary_view_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoViewWidget extends StatelessWidget {
  const VideoViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SummaryViewBloc, SummaryViewState>(builder: (context, state) {
      String videoID = VideoId.parseVideoId(state.vdInfoMod?.vdUrl ?? "") ?? "";
      print(videoID);
      return state.state == ViewSummaryStates.successGetSummary || state.state == ViewSummaryStates.successGetSummaryStored
          ? _containerWidget(
              YoutubePlayer(
  controller: YoutubePlayerController.fromVideoId(
  videoId: videoID,
  autoPlay: false,
),
  aspectRatio: 16 / 9,
),
            )
          : _containerWidget(Container(
              color: Colors.black26,
            ));
    });
  }

  Widget _containerWidget(Widget widget) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: widget,
    );
  }
}
