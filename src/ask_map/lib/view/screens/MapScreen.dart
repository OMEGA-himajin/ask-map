import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import 'package:ask_map/view/widgets/MapMarker.dart';
import 'package:ask_map/view/widgets/MapViewer.dart';
import 'package:ask_map/view/widgets/MapScreenAppBar.dart';
import 'package:ask_map/view/widgets/FloorSelector.dart';
import 'SearchScreen.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key, required this.title});

  final String title;

  @override
  _MapScreen createState() => _MapScreen();
}

const DEFAULT_MARKER_SIZE = 50.0;

class _MapScreen extends State<MapScreen> {
  late ImageProvider image;
  final photoController = PhotoViewController();

  // Default map image scale value.
  double defaultImageScale = 0.095;

  // Size of the area for displaying the map's image.
  late double viewportWidth;
  late double viewportHeight;

  // Size of the map's original image
  late double imageWidth;
  late double imageHeight;

  // Position of the marker on the map image
  double markerPositionX = 633;
  double markerPositionY = 1103;

  // Marker's position on the screen
  double markerLeft = 0;
  double markerTop = 0;

  // Marker display size
  double markerSize = DEFAULT_MARKER_SIZE;

  // The initial display should be such that the marker is at the center of the screen.
  bool initialized = false;

  // Get the size of the map image.
  void _resolveImageProvider() {
    ImageStream stream = image.resolve(createLocalImageConfiguration(context));
    stream.addListener(ImageStreamListener((ImageInfo info, bool _) {
      imageWidth = info.image.width.toDouble();
      imageHeight = info.image.height.toDouble();
    }));
  }

  void _loadImage(int floor) {
    setState(() {
      image = AssetImage('images/${floor}F.drawio.png');
      _resolveImageProvider();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _resolveImageProvider();
  }

  @override
  void initState() {
    photoController.outputStateStream.listen(
      (event) {
        // Size of the map image on the screen.
        double virtualImageWidth = imageWidth * (event.scale ?? 1.0);
        double virtualImageHeight = imageHeight * (event.scale ?? 1.0);

        // Width and height of the map image protrudes from the screen
        double overWidth = (virtualImageWidth - viewportWidth) / 2;
        double overHeight = (virtualImageHeight - viewportHeight) / 2;

        // The current scale value relative to the default scale value.
        double diffScale = (event.scale ?? 1.0) / defaultImageScale;

        // Location of the marker on the map image
        double absoluteMarkerPositionX =
            markerPositionX * (event.scale ?? 1.0) - markerSize / 2;
        double absoluteMarkerPositionY =
            markerPositionY * (event.scale ?? 1.0) - markerSize;

        setState(() {
          // Resize the marker image to fit the scale.
          markerSize = DEFAULT_MARKER_SIZE * diffScale;

          // Position of the marker on the screen
          markerLeft = event.position.dx - overWidth + absoluteMarkerPositionX;
          markerTop = event.position.dy - overHeight + absoluteMarkerPositionY;

          if (!initialized) {
            // The initial display should be such that the marker is centered on the screen.
            photoController.position = Offset(
              virtualImageWidth / 2 - absoluteMarkerPositionX - markerSize / 2,
              virtualImageHeight / 2 - absoluteMarkerPositionY - markerSize,
            );
            initialized = true;
          }
        });
      },
    );

    image = AssetImage('images/1F.drawio.png');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: MapScreenAppBar.appBar(),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          // Size of the area to display the map image.
          viewportWidth = constraints.maxWidth;
          viewportHeight = constraints.maxHeight;

          return Stack(
            children: [
              MapViewer(
                  photoController: photoController,
                  image: image,
                  defaultImageScale: defaultImageScale),
              MapMarker(
                  markerLeft: markerLeft,
                  markerTop: markerTop,
                  markerSize: markerSize),
              Positioned(
                top: 50, // Adjust the position as needed
                left: 50, // Adjust the position as needed
                child: FloorSelector(
                  onFloorSelected: (floor) {
                    _loadImage(floor);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
