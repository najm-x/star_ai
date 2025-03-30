import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class VdCardWidget extends StatelessWidget {
  final String vdImage;
  final String vdTitle;
  const VdCardWidget({super.key, required this.vdImage, required this.vdTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 0,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey,
                    boxShadow: [BoxShadow(color: Colors.black45, blurRadius: 8, offset: Offset(0, 5))]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(height: 95, width: 130, fit: BoxFit.cover, imageUrl: vdImage),
                ),
              ),
              Expanded(
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
              )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_vert_rounded,
                    color: Colors.grey,
                  ))
            ],
          ),
        ),
        Divider()
      ],
    );
  }
}
