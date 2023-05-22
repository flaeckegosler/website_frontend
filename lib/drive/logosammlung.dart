import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:website_frontend/components/section_title.dart';
import 'package:website_frontend/sections/footer/bottom_bar.dart';
import 'package:website_frontend/sections/news/mobile/title_default.dart';

class LogoSammlung extends StatelessWidget {
  const LogoSammlung();

  _launchURL() async {
    const url =
        'https://drive.google.com/drive/folders/1yUKOnqf9GsS_hqWENdJc56myZz7zbxUI';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _buildTitelBild() {
    return const Padding(
      padding: EdgeInsets.only(
        right: 20.0,
        left: 20,
      ),
      child: Center(
        child: SizedBox(
          height: 200,
          child: Image(
            image: AssetImage('assets/flaeckegosler_webseite_logo.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Center(
              child: SizedBox(
                //  color: Colors.red,
                width: 480,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 10),
                      child: SectionTitle(
                        title: "Assets",
                        subTitle: "Logosammlung!",
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    _buildTitelBild(),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        top: 10.0,
                        right: 20,
                        left: 20,
                      ),
                      child: const Text(
                        "Unsere Logo-Sammlung ist auf Google Drive zu finden. Nutze den nachfolgenden Button um die Sammlung zu öffnen.",
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Theme.of(context).primaryColor),
                        ),
                        onPressed: _launchURL,
                        child: const Text('Google Drive'),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            const BottomBar(),
          ],
        ),
      ),
    );
  }
}
