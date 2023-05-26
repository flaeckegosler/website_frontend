import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:website_frontend/auth/auth.dart';

class AuthHomePage extends StatefulWidget {
  @override
  State<AuthHomePage> createState() => _AuthHomePageState();
}

class _AuthHomePageState extends State<AuthHomePage> {
  late ConfettiController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ConfettiController(duration: const Duration(seconds: 3));
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Text(
                'Hallo ${Provider.of<Auth>(context, listen: false).goslerUser.firstName}',
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'Gosler',
                  fontSize: 30,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.library_music),
              title: const Text('Noten'),
              onTap: () {
                GoRouter.of(context).push('/auth/noten');
              },
            ),
            ListTile(
              leading: const Icon(Icons.branding_watermark_outlined),
              title: const Text('Brand Assets'),
              onTap: () {
                // do something
              },
            ),
            ListTile(
              leading: const Icon(Icons.star),
              title: const Text('Premium Features'),
              onTap: () {
                GoRouter.of(context).push('/auth/premium/features');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Stack(
          children: [
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: ConfettiWidget(
                    confettiController: _controller,
                    blastDirectionality: BlastDirectionality.explosive,
                    colors: const [
                      Colors.green,
                      Colors.blue,
                      Colors.pink,
                      Colors.orange,
                    ],
                    numberOfParticles: 30,
                  ),
                ),
              ],
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    '${Auth().user?.email}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 5),
                  const Text('Du bist eingeloggt.'),
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
          ],
        ),
      ),
    );
  }
}
