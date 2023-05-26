import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:website_frontend/models/album.dart';

class GalerieImageCard extends StatelessWidget {
  const GalerieImageCard({
    required this.albumTitleRoute,
    required this.imageData,
  });

  final SpecificImage imageData;
  final String albumTitleRoute;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push(
        //change to go to see route...
        context.namedLocation(
          'galerie',
          pathParameters: <String, String>{
            'albumTitleRoute': albumTitleRoute,
            'pictureIndex': imageData.pictureIndex,
          },
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: CachedNetworkImage(
          imageUrl: imageData.pictureUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
