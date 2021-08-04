import 'package:flutter/material.dart';
import 'package:website_frontend/constants.dart';

import 'package:website_frontend/sections/topSection/top_section.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopSection(),
            SizedBox(height: kDefaultPadding * 2),
          ],
        ),
      ),
    );
  }
}
