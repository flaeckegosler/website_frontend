import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:website_frontend/auth/auth.dart';
import 'package:website_frontend/components/basic_cart.dart';
import 'package:website_frontend/components/birthday_card.dart';
import 'package:website_frontend/provider/birthday_provider.dart';

class AuthHomePage extends StatefulWidget {
  @override
  State<AuthHomePage> createState() => _AuthHomePageState();
}

class _AuthHomePageState extends State<AuthHomePage> {
  late ConfettiController _controller;
  bool _isLoading = true;

// Define a list of BasicCards
  final List<BasicCard> basicCards = [
    const BasicCard(
      title: "Aufnahmen",
      icon: Icons.library_music,
      link: 'www.example1.com',
    ),
    const BasicCard(
      title: "Kalender",
      icon: Icons.calendar_month,
      link: 'www.example2.com',
    ),
    const BasicCard(
      title: "Noten",
      icon: Icons.music_note,
      link: 'www.example2.com',
    ),
    const BasicCard(
      title: "Gosler Brand Assets",
      icon: Icons.business_center_rounded,
      link: 'www.example2.com',
    ),
    const BasicCard(
      title: "Sujet Assets",
      icon: Icons.celebration,
      link: 'www.example2.com',
    ),
    const BasicCard(
      title: "Archiv-Bilder",
      icon: Icons.photo,
      link: 'www.example2.com',
    ),
  ];

  @override
  initState() {
    super.initState();
    fetchBirthdayAsync();
    _controller = ConfettiController(duration: const Duration(seconds: 3));
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  //Fetch all Listings
  Future fetchBirthdayAsync() async {
    setState(() {
      _isLoading = true;
    });
    await Provider.of<BirthdayProvider>(context, listen: false)
        .readBirthdayJson();
    setState(() {
      _isLoading = false;
    });
  }

  bool validateBasicCard(BasicCard card) {
    // Define your validation logic here
    // For example, you might check if the link is valid, or if some property meets a condition
    // Return true if the card meets the criteria, false otherwise
    if (card.title == "") {
      return false;
    } else {
      return true;
    }
  }

  List<Widget> _buildCardRows() {
    final List<BasicCard> validCards =
        basicCards.where(validateBasicCard).toList();
    final List<Widget> rows = [];

    for (int i = 0; i < validCards.length; i += 2) {
      rows.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              validCards[i],
              // Add the second card only if it exists
              if (i + 1 < validCards.length) validCards[i + 1],
            ],
          ),
        ),
      );
    }
    return rows;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Gosler Area',
          style: TextStyle(fontFamily: 'Gosler', color: Colors.white),
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
              child: ListView(
                children: [
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BirthdayCard(
                      birthdays: Provider.of<BirthdayProvider>(context)
                          .nextThreeBirthdays,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ..._buildCardRows(),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Text(
                      '${Auth().user?.email}',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Center(
                    child: Text('Du bist eingeloggt.'),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                      onPressed: () {
                        Auth().signOut();
                        GoRouter.of(context).pushReplacement('/auth');
                      },
                      child: const Text('Sign out'),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
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
