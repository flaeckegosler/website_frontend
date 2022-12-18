import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';
import 'package:website_frontend/provider/member_provider.dart';

class MitgliederPhotoViewPage extends StatefulWidget {
  final String firstName;
  final String lastName;

  const MitgliederPhotoViewPage(this.firstName, this.lastName);

  @override
  _MitgliederPhotoViewPageState createState() =>
      _MitgliederPhotoViewPageState();
}

class _MitgliederPhotoViewPageState extends State<MitgliederPhotoViewPage> {
  late PhotoViewController controller;
  late String galleryLink;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = true;
    });
    if (Provider.of<MemberProvider>(context, listen: false)
        .allMembers
        .isEmpty) {
      Provider.of<MemberProvider>(context, listen: false).createMembers();
      galleryLink = Provider.of<MemberProvider>(context, listen: false)
          .getPictureLink(widget.firstName, widget.lastName);
    } else {
      galleryLink = Provider.of<MemberProvider>(context, listen: false)
          .getPictureLink(widget.firstName, widget.lastName);
    }
    setState(() {
      isLoading = false;
    });
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
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Color.fromRGBO(147, 90, 161, 1),
              ),
            )
          : PhotoView(
              imageProvider: CachedNetworkImageProvider(
                galleryLink,
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
