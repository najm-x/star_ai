import 'package:business_tools/features/video_translator/presentation/bloc/vd_view_cubit/vd_view_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewWidget extends StatelessWidget {
  const ViewWidget({super.key, required this.defaultWidegt, required this.directTransWidegt});
  final Widget defaultWidegt;
  final Widget directTransWidegt;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.of<VdViewCubit>(context).dataVdModel.videoInfo == null ? defaultWidegt : directTransWidegt;
  }
}
