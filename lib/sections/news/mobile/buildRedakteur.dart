import 'package:flutter/material.dart';
import 'package:website_frontend/models/authors.dart';

Widget buildRedakteurHomeNews(String newsCreatedBy, BuildContext context) {
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
          backgroundColor: Theme.of(context).primaryColor,
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
