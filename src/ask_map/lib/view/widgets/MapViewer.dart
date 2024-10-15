import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class MapViewer extends StatelessWidget {
  const MapViewer({
    super.key,
    required this.photoController,
    required this.image,
    required this.defaultImageScale,
  });

  final PhotoViewController photoController;
  final ImageProvider<Object> image;
  final double defaultImageScale;

  @override
  Widget build(BuildContext context) {
    return PhotoView(
      controller: photoController,
      imageProvider: image,
      initialScale: defaultImageScale,
      minScale: PhotoViewComputedScale.covered,
    );
  }
}
