import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';

class BannerImage extends StatelessWidget {
  const BannerImage({
    super.key,
    required this.image,
  });

  final ImageProvider image;

  @override
  Widget build(BuildContext context) {
    return OctoImage(
      image: image,
      fit: BoxFit.cover,
      progressIndicatorBuilder: (context, progress) => const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LinearProgressIndicator(
            backgroundColor: Colors.transparent,
          )
        ],
      ),
    );
  }
}
