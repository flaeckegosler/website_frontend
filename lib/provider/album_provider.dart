import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:website_frontend/models/album.dart';

class PicturesProvider with ChangeNotifier {
  List<Album> _albums = [];

  late Album _firstAlbum;

  Album getFirstAlbum() {
    return _firstAlbum;
  }

  List<Album> get allPictures {
    return List.from(_albums);
  }

  int getAmountOfPictures(String albumTitleRoute) {
    return int.parse(
      _albums
          .where((element) => element.albumTitleRoute == albumTitleRoute)
          .first
          .specificImage
          .last
          .pictureIndex,
    );
  }

  SpecificImage getGalleryLink(albumTitleRoute, pictureIndex) {
    final Album selectedGalerie = _albums
        .firstWhere((element) => element.albumTitleRoute == albumTitleRoute);
    return selectedGalerie.specificImage.firstWhere(
      (element) => element.pictureIndex == pictureIndex.toString(),
    );
  }

  Future<List<SpecificImage>> fetchSpecificImages(
    Map<String, dynamic> picturesData,
  ) async {
    final List<SpecificImage> specificImages = [];

    int pictureIndex = 1;
    for (final entry in picturesData.entries) {
      final k = entry.key;
      final v = entry.value.toString();

      specificImages.add(
        SpecificImage(
          pictureName: k,
          pictureUrl: v,
          pictureIndex: pictureIndex.toString(),
        ),
      );
      pictureIndex++;
    }

    return specificImages;
  }

  Future<Album> fetchAlbum(String url) async {
    final response = await http.get(Uri.parse(url));
    final albumData = json.decode(response.body) as Map<String, dynamic>;

    final specificImages = await fetchSpecificImages(
      albumData['pictures'] as Map<String, dynamic>,
    );

    return Album(
      id: albumData['id'].toString(),
      menuTitle: albumData['menuTitle'] as String,
      albumTitle: albumData['albumTitle'] as String,
      albumTitleRoute:
          albumData['albumTitle'].toString().toLowerCase().replaceAll(" ", "-"),
      bodyText: albumData['bodyText'] as String,
      dateUnix: albumData['dateUnix'] as int,
      dateFormatted: albumData['dateFormatted'] as String,
      specificImage: specificImages,
    );
  }

  Future<void> fetchFirstAlbum() async {
    const url = 'https://api.flaeckegosler.ch/app/pics-to-json-only-first/';
    _firstAlbum = await fetchAlbum(url);
  }

  Future<void> fetchAlbumList() async {
    const url = 'https://api.flaeckegosler.ch/app/pics-to-json/';
    final response = await http.get(Uri.parse(url));
    final albumData = json.decode(response.body) as Map<String, dynamic>;

    _albums = await Future.wait(
      albumData.entries.map((entry) async {
        final picturesId = entry.key;
        final albumData = entry.value;

        final specificImages = await fetchSpecificImages(
          albumData['pictures'] as Map<String, dynamic>,
        );

        return Album(
          id: picturesId,
          menuTitle: albumData['menuTitle'] as String,
          albumTitle: albumData['albumTitle'] as String,
          albumTitleRoute: albumData['albumTitle']
              .toString()
              .toLowerCase()
              .replaceAll(" ", "-"),
          bodyText: albumData['bodyText'] as String,
          dateUnix: albumData['dateUnix'] as int,
          dateFormatted: albumData['dateFormatted'] as String,
          specificImage: specificImages,
        );
      }),
    );
  }
}
