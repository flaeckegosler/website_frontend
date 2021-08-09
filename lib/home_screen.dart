import 'package:flutter/material.dart';
import 'package:website_frontend/constants.dart';
import 'package:website_frontend/sections/news/news_section.dart';

import 'package:website_frontend/sections/top/top_section.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopSection(),
            const SizedBox(height: kDefaultPadding * 2),
            NewsSection(),
          ],
        ),
      ),
    );
  }
}
