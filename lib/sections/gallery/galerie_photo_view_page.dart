import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';
import 'package:website_frontend/models/album.dart';
import 'package:website_frontend/provider/album_provider.dart';

class GaleriePhotoViewPage extends StatefulWidget {
  final String albumTitleRoute;
  final String pictureIndex;

  const GaleriePhotoViewPage(this.albumTitleRoute, this.pictureIndex);

  @override
  _GaleriePhotoViewPageState createState() => _GaleriePhotoViewPageState();
}

class _GaleriePhotoViewPageState extends State<GaleriePhotoViewPage> {
  late PhotoViewController controller;
  late SpecificImage specificImage;
  bool _isLoading = false;
  late int startIndex;
  late int maxIndex;

  @override
  void initState() {
    super.initState();
    setState(() {
      _isLoading = true;
    });
    startIndex = int.parse(this.widget.pictureIndex);
    if (Provider.of<PicturesProvider>(context, listen: false)
        .allPictures
        .isEmpty) {
      Provider.of<PicturesProvider>(context, listen: false)
          .fetchAlbumList()
          .then((value) => specificImage =
              Provider.of<PicturesProvider>(context, listen: false)
                  .getGalleryLink(
                      this.widget.albumTitleRoute, this.widget.pictureIndex))
          .then((value) => setState(() {
                maxIndex = Provider.of<PicturesProvider>(context, listen: false)
                    .getAmountOfPictures(widget.albumTitleRoute);
                _isLoading = false;
              }));
    } else {
      specificImage = Provider.of<PicturesProvider>(context, listen: false)
          .getGalleryLink(
              this.widget.albumTitleRoute, this.widget.pictureIndex);
      maxIndex = Provider.of<PicturesProvider>(context, listen: false)
          .getAmountOfPictures(widget.albumTitleRoute);
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

  Widget buildButtons({bool stretch = false}) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: startIndex < 2
                    ? Colors.grey
                    : const Color.fromRGBO(147, 90, 162, 1),
                padding:
                    const EdgeInsets.symmetric(horizontal: 28, vertical: 15)),
            onPressed: previous,
            child: const Icon(
              Icons.arrow_back,
              size: 32,
            ),
          ),
          if (stretch)
            const Spacer()
          else
            const SizedBox(
              width: 32,
            ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: startIndex > (maxIndex - 1)
                    ? Colors.grey
                    : const Color.fromRGBO(147, 90, 162, 1),
                padding:
                    const EdgeInsets.symmetric(horizontal: 28, vertical: 15)),
            onPressed: next,
            child: const Icon(
              Icons.arrow_forward,
              size: 32,
            ),
          ),
        ],
      );

  void previous() {
    if (startIndex > 2) {
      setState(() {
        String newIndex = (startIndex + 1).toString();
        context.replace(
          context.namedLocation(
            'galerie',
            params: <String, String>{
              'albumTitleRoute': this.widget.albumTitleRoute,
              'pictureIndex': "${startIndex - 1}",
            },
          ),
        );
      });
    }
  }

  void next() {
    if (startIndex < maxIndex) {
      setState(() {
        context.replace(
          context.namedLocation(
            'galerie',
            params: <String, String>{
              'albumTitleRoute': this.widget.albumTitleRoute,
              'pictureIndex': "${startIndex + 1}",
            },
          ),
        );
      });
    }
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
          : Column(
              children: [
                Expanded(
                  child: PhotoView(
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
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: buildButtons(),
                )
              ],
            ),
    );
  }
}