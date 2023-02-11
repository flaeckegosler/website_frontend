import 'dart:async';

import 'package:flutter/material.dart';

class Countdown extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CountdownState();
}

class _CountdownState extends State<Countdown> {
  int counterSeconds = 0;
  int counterMinutes = 0;
  int counterHours = 0;
  int counterDays = 0;

  @override
  void initState() {
    super.initState();
  }

  TextStyle textStyle() {
    return const TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontFamily: "Shakuro",
    );
  }

  @override
  Widget build(BuildContext context) {
    if (DateTime.parse('2023-02-16 05:00:00').isAfter(DateTime.now())) {
      final date1 = DateTime.parse('2023-02-16 05:00:00');
      counterSeconds = date1.difference(DateTime.now()).inSeconds % 60;
      counterMinutes = date1.difference(DateTime.now()).inMinutes % 60;
      counterHours = date1.difference(DateTime.now()).inHours % 24;
      counterDays = date1.difference(DateTime.now()).inDays;
      String days;
      Timer.periodic(const Duration(seconds: 1), (timer) {
        if (mounted) {
          setState(() {
            --counterSeconds;
          });
        }
      });

      if (counterDays == 1) {
        days = 'Tag';
      } else {
        days = 'Tage';
      }
      String hours;
      if (counterHours == 1) {
        hours = 'Stunde';
      } else {
        hours = 'Stunden';
      }
      String minutes;
      if (counterMinutes == 1) {
        minutes = 'Minute';
      } else {
        minutes = 'Minuten';
      }
      String seconds;
      if (counterSeconds == 1) {
        seconds = 'Sekunde';
      } else {
        seconds = 'Sekunden';
      }
      return ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Container(
          color: const Color.fromRGBO(121, 28, 28, 1),
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: const [
                      Text(
                        'FASNACHTSCOUNTDOWN  ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: "Shakuro",
                        ),
                      ),
                      Icon(
                        Icons.theater_comedy_rounded,
                        color: Colors.white,
                        size: 20.0,
                      ),
                    ],
                  ),
                  const SizedBox(),
                  const SizedBox(),
                  const SizedBox(),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(counterDays.toString(), style: textStyle()),
                      Text(days, style: textStyle())
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(counterHours.toString(), style: textStyle()),
                      Text(hours, style: textStyle())
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(counterMinutes.toString(), style: textStyle()),
                      Text(minutes, style: textStyle())
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(counterSeconds.toString(), style: textStyle()),
                      Text(seconds, style: textStyle())
                    ],
                  ),
                ],
              ),
            ],
          ),
          /*  child: Padding(
            padding: const EdgeInsets.only(bottom: 10, top: 10),
            child: SizedBox(
              height: 30,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  ' $_counterDays $_days, $_counterHours $_hours, $_counterMinutes $_minutes, $_counterSeconds $_seconds ',
                  style: TextStyle(
                    height: 1.2,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Oswald',
                    color: Colors.white,
                    background: Paint()..color = Colors.black,
                  ),
                ),
              ),
            ),
          ), */
        ),
      );
    } else {
      return const SizedBox(
        height: 0,
      );
    }
  }
}
