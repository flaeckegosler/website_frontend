import 'package:flutter/material.dart';

import 'bottom_bar_column.dart';
import 'info_text.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
  }) : super(key: key);
  static const Color gradientStartColor = Color(0xff11998e);
  static const Color gradientEndColor = Color(0xff0575E6);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: const BoxDecoration(
        image: DecorationImage(
          // fit: BoxFit.contain,
          image: AssetImage("assets/MUSTER_REPETIEREND.png"),
          repeat: ImageRepeat.repeat,
          scale: 0.2,
        ),
      ),
      padding: const EdgeInsets.all(30),
      //color: Colors.blueGrey[900],
      child: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const BottomBarColumn(
                heading: 'ABOUT',
                s1: 'Contact Us',
                s2: 'About Us',
                s3: 'Careers',
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('placeholer',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(2.5, 2.5),
                            blurRadius: 5.0,
                            color: Color.fromARGB(255, 0, 0, 1),
                          ),
                        ],
                      )),
                  SizedBox(height: 5),
                  Text(
                    "placeholder 2",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(2.5, 2.5),
                          blurRadius: 5.0,
                          color: Color.fromARGB(255, 0, 0, 1),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ],
          ),
          const Divider(
            thickness: 2,
            color: Colors.white,
          ),
          const SizedBox(height: 20),
          const Text(
            'Copyright © 2021 | Fläckegosler',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(2.5, 2.5),
                  blurRadius: 5.0,
                  color: Color.fromARGB(255, 0, 0, 1),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
