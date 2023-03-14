import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:website_frontend/auth/auth.dart';

class AuthHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Text(
              '${Auth().user?.email}',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 5),
            const Text('Du bist eingeloggt.'),
            const SizedBox(height: 20),
            _premiumFeatures(),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
              ),
              onPressed: () {
                Auth().signOut();
                GoRouter.of(context).pushReplacement('/auth');
              },
              child: const Text('Sign out'),
            ),
          ],
        ),
      ),
    );
  }

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
}
