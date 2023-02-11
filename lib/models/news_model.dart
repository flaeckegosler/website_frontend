import 'package:flutter/material.dart';

class News with ChangeNotifier {
  final String id;
  final String newsTitle;
  final String imageURL;
  final String cropImageURL;
  final int timeCreatedUnix;
  final String timeCreatedFormatted;
  final String newsCreatedBy;
  final String newsIntroText;
  final String newsMainText;
  final String? imageDescription;
  final String newsTags;
  final String galleryLink;

  News({
    required this.id,
    required this.newsTitle,
    required this.imageURL,
    required this.cropImageURL,
    required this.timeCreatedUnix,
    required this.timeCreatedFormatted,
    required this.newsCreatedBy,
    required this.newsIntroText,
    required this.newsMainText,
    this.imageDescription,
    required this.newsTags,
    required this.galleryLink,
  });
}
