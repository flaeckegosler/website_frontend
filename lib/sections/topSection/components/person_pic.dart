import 'package:flutter/material.dart';

class PersonPic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      // constraints: BoxConstraints(maxWidth: 639, maxHeight: 860),
      child: Image.asset(
        "assets/images/tambi_2020.png",
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
