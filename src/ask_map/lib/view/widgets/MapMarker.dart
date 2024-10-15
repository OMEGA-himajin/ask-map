import 'package:flutter/material.dart';

class MapMarker extends StatelessWidget {
  const MapMarker({
    super.key,
    required this.markerLeft,
    required this.markerTop,
    required this.markerSize,
  });

  final double markerLeft;
  final double markerTop;
  final double markerSize;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Image.asset("images/marker.png"),
      left: markerLeft,
      top: markerTop,
      width: markerSize,
    );
  }
}
