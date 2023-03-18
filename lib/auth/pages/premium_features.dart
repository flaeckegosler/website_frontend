import 'package:flutter/material.dart';

class PremiumFeaturesPage extends StatelessWidget {
  Widget _premiumFeatures() {
    return SizedBox(
      width: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Als registrierter Benutzer hast du aktuell Zugriff auf folgende premium Features:',
          ),
          SizedBox(height: 10),
          Text(
            'Sektion Fotos:',
          ),
          Text(
            '⦁ Bilder herunterladen',
          ),
          SizedBox(height: 10),
          Text(
            'Sektion Mitglieder:',
          ),
          Text(
            '⦁ Bilder zoomen',
          ),
          Text(
            '⦁ Bilder herunterladen',
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Premium Features'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _premiumFeatures(),
          ],
        ),
      ),
    );
  }
}
