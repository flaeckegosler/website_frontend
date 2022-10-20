import 'package:flutter/material.dart';
import 'package:website_frontend/models/authors.dart';
import 'package:website_frontend/provider/color_singleton.dart';

Widget buildRedakteurHomeNews(String newsCreatedBy) {
  if (Authors.getRedakteur(newsCreatedBy) != "") {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              blurRadius: 6,
              offset: Offset(2.0, 2.0),
            )
          ],
        ),
        child: CircleAvatar(
          radius: 35,
          backgroundColor: ColorSingleton().mainTheme,
          backgroundImage: AssetImage(
            Authors.getRedakteur(newsCreatedBy),
          ),
        ),
      ),
    );
  } else {
    return const SizedBox();
  }
}
