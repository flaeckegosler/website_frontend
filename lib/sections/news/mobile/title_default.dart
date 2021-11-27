import 'package:flutter/material.dart';

class TitleDefault extends StatelessWidget {
  final String title;

  const TitleDefault(this.title);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 34.0, fontWeight: FontWeight.bold, fontFamily: 'Oswald'),
      ),
    );
  }
}
