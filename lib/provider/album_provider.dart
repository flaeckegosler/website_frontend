import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:website_frontend/models/album.dart';

class PicturesProvider with ChangeNotifier {
  List<Album> _albums = [];

  List<Album> get allPictures {
    return List.from(_albums);
  }

  int getAmountOfPictures(String albumTitleRoute) {
    return int.parse(_albums
        .where((element) => element.albumTitleRoute == albumTitleRoute)
        .first
        .specificImage
        .last
        .pictureIndex);
  }

  SpecificImage getGalleryLink(albumTitleRoute, pictureIndex) {
    Album selectedGalerie = _albums
        .firstWhere((element) => (element.albumTitleRoute == albumTitleRoute));
    return selectedGalerie.specificImage.firstWhere((element) =>
        element.pictureIndex.toString() == pictureIndex.toString());
  }

  Future<void> fetchAlbumList() async {
    final url = Uri.parse('https://api.flaeckegosler.ch/app/pics-to-json/');
    final response = await http.get(
      url,
    );
    int pictureIndex = 1;
    final List<Album> fetchedPicturesList = [];
    final Map<String, dynamic> picturesListData =
        json.decode(response.body) as Map<String, dynamic>;

    picturesListData.forEach((
      String picturesId,
      dynamic picturesData,
    ) {
      //Resolve map to List
      List<SpecificImage> temp = [];
      picturesData['pictures'].forEach(
        (k, v) => {
          temp.add(
            SpecificImage(
              pictureName: k as String,
              pictureUrl: v.toString().replaceFirst(
                  'https://flaeckegosler.ch', 'https://api.flaeckegosler.ch'),
              pictureIndex: pictureIndex.toString(),
            ),
          ),
          pictureIndex = pictureIndex + 1
        },
      );
      pictureIndex = 1;
      final Album pictures = Album(
          id: picturesId.toString(),
          menuTitle: picturesData['menuTitle'] as String,
          albumTitle: picturesData['albumTitle'] as String,
          albumTitleRoute: (picturesData['albumTitle'])
              .toString()
              .toLowerCase()
              .replaceAll(" ", "-"),
          bodyText: picturesData['bodyText'] as String,
          dateUnix: picturesData['dateUnix'] as int,
          dateFormatted: picturesData['dateFormatted'] as String,
          specificImage: temp);
      fetchedPicturesList.add(pictures);
    });
    _albums = fetchedPicturesList;
  }
}
