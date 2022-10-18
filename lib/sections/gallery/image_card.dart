import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:website_frontend/models/pictures.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({required this.imageData});

  final SpecificImage imageData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          context.vxNav.push(Uri(path: '/image'), params: imageData.pictureUrl),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: CachedNetworkImage(
            imageUrl: imageData.pictureUrl, fit: BoxFit.cover),
      ),
    );
  }
}
