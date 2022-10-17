import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  final String paragraph =
      'Wir schreiben das Jahr 1989 n.Chr. als sich ein paar Jungs, alle so um 17-jährig, in geselliger Runde einfanden, um über ihre Zukunftspläne zu sinnieren. Die geistreiche Einstimmung, welche an einer in der Region Luzern-Land, änet dem Rotbachgraben, handelsüblichen “Hondsverlochete” durchgeführt wurde, brachte sie auf die Idee eine Guuggemusig zu gründen. Noch am selbigen Abend, äh Morgen, wird die Gründungs-Urkunde zu Papier gebracht. Die Fläckegosler Roteborg sind geboren. Schon bald einmal traten zahlreiche Kolleginnen und Kollegen der Gemeinschaft bei, und der Probe- und Bastelbetrieb konnte aufgenommen werden. Sehr engagierten Vorständen und Mitgliedern ist es zu verdanken, dass die Fläckegosler Roteborg bis zum heutigen Tag ein junger, begeisterter, mitreissender (zuweilen auch durstiger) Haufen Fasnachts-Chaoten geblieben sind.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(147, 90, 161, 1),
      ),
      body: Container(
        child: Text("TODO:" + paragraph),
      ),
    );
  }
}
