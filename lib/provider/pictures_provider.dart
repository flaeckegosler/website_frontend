import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:website_frontend/models/pictures.dart';

class PicturesProvider with ChangeNotifier {
  List<Pictures> _pictures = [];

  List<Pictures> get allPictures {
    return List.from(_pictures);
  }

  Future<void> fetchPicturesList() async {
    final url = Uri.parse('https://flaeckegosler.ch/app/pics-to-json/');
    final response = await http.get(
      url,
    );

    final List<Pictures> fetchedPicturesList = [];
    final Map<String, dynamic> picturesListData =
        json.decode(response.body) as Map<String, dynamic>;
    picturesListData.forEach((
      String picturesId,
      dynamic picturesData,
    ) {
      //Resolve map to List
      List<SpecificImage> temp = [];
      picturesData['pictures'].forEach((k, v) => temp.add(
          SpecificImage(pictureName: k as String, pictureLink: v as String)));
      final Pictures pictures = Pictures(
          id: picturesId.toString(),
          menuTitle: picturesData['menuTitle'] as String,
          albumTitle: picturesData['albumTitle'] as String,
          bodyText: picturesData['bodyText'] as String,
          dateUnix: picturesData['dateUnix'] as int,
          dateFormatted: picturesData['dateFormatted'] as String,
          specificImage: temp);
      fetchedPicturesList.add(pictures);
    });
    _pictures = fetchedPicturesList;
  }
}
