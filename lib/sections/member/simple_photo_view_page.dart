import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class SimplePhotoViewPage extends StatefulWidget {
  final String galleryLink;

  const SimplePhotoViewPage(this.galleryLink);

  @override
  _SimplePhotoViewPageState createState() => _SimplePhotoViewPageState();
}

class _SimplePhotoViewPageState extends State<SimplePhotoViewPage> {
  late PhotoViewController controller;

  @override
  void initState() {
    super.initState();
    controller = PhotoViewController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PhotoView(
        filterQuality: FilterQuality.high,
        imageProvider: CachedNetworkImageProvider(
          widget.galleryLink,
        ),
        loadingBuilder: (context, event) => Center(
          child: CircularProgressIndicator(
            color: Theme.of(context).primaryColor,
          ),
        ),
        // Contained = the smallest possible size to fit one dimension of the screen
        minScale: PhotoViewComputedScale.contained * 0.8,
        // Covered = the smallest possible size to fit the whole screen
        maxScale: PhotoViewComputedScale.covered * 2,
        enableRotation: true,
        // Set the background color to the "classic white"
        backgroundDecoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
        ),
      ),
    );
  }
}
