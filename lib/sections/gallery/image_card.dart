import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:website_frontend/models/pictures.dart';

class GalerieImageCard extends StatelessWidget {
  const GalerieImageCard({required this.albumTitle, required this.imageData});

  final SpecificImage imageData;
  final String albumTitle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => GoRouter.of(context)
          .push('/galerie/$albumTitle/${imageData.pictureName}'),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: CachedNetworkImage(
            imageUrl: imageData.pictureUrl, fit: BoxFit.cover),
      ),
    );
  }
}
