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
            const Text('You are logged in.'),
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
}
