import 'package:flutter/material.dart';
import 'package:website_frontend/models/news_model.dart';

class GalleryCard extends StatelessWidget {
  final News news;
  final String galleryLink;
  const GalleryCard(this.news, this.galleryLink);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed<bool>(
        context,
        '/specific_image/${news.id}',
        arguments: galleryLink,
      ),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: SizedBox(
          height: 200,
          width: MediaQuery.of(context).size.width - 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              galleryLink,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
