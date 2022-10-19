import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:website_frontend/sections/footer/pages/history.dart';

enum SocialMedia { facebook, twitter, email, linkedin, whatsapp, instagram }

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
  }) : super(key: key);
  static const Color gradientStartColor = Color(0xff11998e);
  static const Color gradientEndColor = Color(0xff0575E6);

  Future share(SocialMedia socialPlatform) async {
    const subject = "Kontaktanfrage Fläckegosler";
    const text = "Besuche die geile Fläckegosler Webseite! ";
    final urlShare = Uri.encodeComponent("https://flaeckegosler.ch");

    final urls = {
      SocialMedia.facebook: "https://www.facebook.com/Flaeckegosler",
      SocialMedia.instagram: "https://www.instagram.com/flaeckegosler",
      SocialMedia.linkedin: "https://www.linkedin.com/company/flaeckegosler",
      SocialMedia.email: "mailto:?subject=$subject&body=$text\n\n$urlShare",
      SocialMedia.whatsapp: "https://api.whatsapp.com/send?text=$text$urlShare",
    };
    final url = urls[socialPlatform]!;

    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  Widget buildSocialButton(
          {required IconData icon,
          Color? color,
          required VoidCallback onClicked}) =>
      InkWell(
        onTap: onClicked,
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              boxShadow: const [
                BoxShadow(
                  spreadRadius: 5,
                  offset: Offset(2.5, 2.5),
                  blurRadius: 5.0,
                  color: Color.fromARGB(122, 0, 0, 0),
                ),
              ],
            ),
            child: FaIcon(icon, color: Colors.white, size: 60)),
      );

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    if (width < 600) {
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => GoRouter.of(context).go('/honorary_members'),
              child: const Text(
                "Ehrenmitglieder",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(2.5, 2.5),
                      blurRadius: 5.0,
                      color: Color.fromARGB(255, 0, 0, 1),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () => GoRouter.of(context).go('/history'),
              child: const Text(
                "Geschichte",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(2.5, 2.5),
                      blurRadius: 5.0,
                      color: Color.fromARGB(255, 0, 0, 1),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Sponsoring",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(2.5, 2.5),
                    blurRadius: 5.0,
                    color: Color.fromARGB(255, 0, 0, 1),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildSocialButton(
                    icon: FontAwesomeIcons.instagram,
                    color: Color(0xFF0075fc),
                    onClicked: () => share(SocialMedia.instagram),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  buildSocialButton(
                    icon: FontAwesomeIcons.facebook,
                    color: Color(0xFF0075fc),
                    onClicked: () => share(SocialMedia.facebook),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  buildSocialButton(
                    icon: FontAwesomeIcons.linkedin,
                    color: Color(0xFF0075fc),
                    onClicked: () => share(SocialMedia.linkedin),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  buildSocialButton(
                    icon: FontAwesomeIcons.whatsapp,
                    color: Color(0xFF0075fc),
                    onClicked: () => share(SocialMedia.whatsapp),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 2,
              color: Colors.white,
            ),
            const SizedBox(height: 20),
            const Text(
              'Copyright © 2022 | Fläckegosler Roteborg',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(1.5, 1.5),
                    blurRadius: 6.0,
                    color: Color.fromARGB(122, 0, 0, 0),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    } else {
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Ehrenmitglieder",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
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
                      height: 10,
                    ),
                    Text(
                      "Geschichte",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
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
                      height: 10,
                    ),
                    Text(
                      "Sponsoring",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
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
                SizedBox(
                  height: 150,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildSocialButton(
                        icon: FontAwesomeIcons.instagram,
                        color: Color(0xFF0075fc),
                        onClicked: () => share(SocialMedia.instagram),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      buildSocialButton(
                        icon: FontAwesomeIcons.facebook,
                        color: Color(0xFF0075fc),
                        onClicked: () => share(SocialMedia.facebook),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      buildSocialButton(
                        icon: FontAwesomeIcons.linkedin,
                        color: Color(0xFF0075fc),
                        onClicked: () => share(SocialMedia.linkedin),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      buildSocialButton(
                        icon: FontAwesomeIcons.whatsapp,
                        color: Color(0xFF0075fc),
                        onClicked: () => share(SocialMedia.whatsapp),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(
              thickness: 2,
              color: Colors.white,
            ),
            const SizedBox(height: 20),
            const Text(
              'Copyright © 2022 | Fläckegosler Roteborg',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(1.5, 1.5),
                    blurRadius: 6.0,
                    color: Color.fromARGB(122, 0, 0, 0),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}
