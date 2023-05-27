import 'package:flutter/material.dart';

class MusicSheetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Music Sheets'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Music Sheets',
            ),
          ],
        ),
      ),
    );
  }
}
