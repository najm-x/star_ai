import 'package:business_tools/core/constant/app_routes_name.dart';
import 'package:business_tools/features/summary/presentation/bloc/summary_home_cubit/summary_home_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:uicons/uicons.dart';

class VdCardWidget extends StatelessWidget {
  final String vdImage;
  final String vdTitle;
  final int id;
  const VdCardWidget({super.key, required this.vdImage, required this.vdTitle, required this.id});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push(AppRouteName.summaryView, extra: id),
      child: Column(
        spacing: 0,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                _buildImageContainer(),
                _buildTitle(context),
                _buildDeleteButton(context),
              ],
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }

  Widget _buildImageContainer() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey.shade600,
        boxShadow: const [
          BoxShadow(color: Colors.black45, blurRadius: 8, offset: Offset(0, 5)),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: CachedNetworkImage(
          height: 95,
          width: 130,
          fit: BoxFit.cover,
          imageUrl: vdImage,
          errorWidget: (context, url, error) =>  Center(
            child: Icon(UIcons.regularRounded.file_video),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Expanded(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            vdTitle,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _buildDeleteButton(BuildContext context) {
    return IconButton(
      onPressed: () => context.read<SummaryHomeCubit>().deleteSummary(id),
      icon: Icon(
        Icons.delete_rounded,
        color: Theme.of(context).colorScheme.error,
      ),
    );
  }
}
