import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';
import 'package:website_frontend/models/pictures.dart';
import 'package:website_frontend/provider/pictures_provider.dart';

class GaleriePhotoViewPage extends StatefulWidget {
  final String albumTitle;
  final String pictureName;

  const GaleriePhotoViewPage(this.albumTitle, this.pictureName);

  @override
  _GaleriePhotoViewPageState createState() => _GaleriePhotoViewPageState();
}

class _GaleriePhotoViewPageState extends State<GaleriePhotoViewPage> {
  late PhotoViewController controller;
  late SpecificImage specificImage;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      _isLoading = true;
    });
    if (Provider.of<PicturesProvider>(context, listen: false)
        .allPictures
        .isEmpty) {
      Provider.of<PicturesProvider>(context, listen: false)
          .fetchPicturesList()
          .then((value) => specificImage =
              Provider.of<PicturesProvider>(context, listen: false)
                  .getGalleryLink(
                      this.widget.albumTitle, this.widget.pictureName))
          .then((value) => setState(() {
                _isLoading = false;
              }));
    } else {
      specificImage = Provider.of<PicturesProvider>(context, listen: false)
          .getGalleryLink(this.widget.albumTitle, this.widget.pictureName);
      setState(() {
        _isLoading = false;
      });
    }
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
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(147, 90, 161, 1),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: Color.fromRGBO(147, 90, 161, 1),
              ),
            )
          : PhotoView(
              imageProvider: CachedNetworkImageProvider(
                specificImage.pictureUrl,
              ),
              loadingBuilder: (context, event) => const Center(
                child: CircularProgressIndicator(
                  color: Color.fromRGBO(147, 90, 161, 1),
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
