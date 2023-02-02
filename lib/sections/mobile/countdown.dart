import 'dart:async';

import 'package:flutter/material.dart';

class Countdown extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CountdownState();
}

class _CountdownState extends State<Countdown> {
  var _counterSeconds;
  var _counterMinutes;
  var _counterHours;
  var _counterDays;

  @override
  initState() {
    super.initState();
  }

  TextStyle textStyle() {
    return const TextStyle(color: Colors.white, fontSize: 16);
  }

  @override
  Widget build(BuildContext context) {
    if (DateTime.parse('2023-02-16 05:00:00').isAfter(DateTime.now())) {
      var date1 = DateTime.parse('2023-02-16 05:00:00');
      _counterSeconds = date1.difference(DateTime.now()).inSeconds % 60;
      _counterMinutes = date1.difference(DateTime.now()).inMinutes % 60;
      _counterHours = date1.difference(DateTime.now()).inHours % 24;
      _counterDays = date1.difference(DateTime.now()).inDays;
      String _days;
      Timer.periodic(const Duration(seconds: 1), (timer) {
        if (mounted) {
          setState(() {
            --_counterSeconds;
          });
        }
      });

      if (_counterDays == 1) {
        _days = 'Tag';
      } else {
        _days = 'Tage';
      }
      String _hours;
      if (_counterHours == 1) {
        _hours = 'Stunde';
      } else {
        _hours = 'Stunden';
      }
      String _minutes;
      if (_counterMinutes == 1) {
        _minutes = 'Minute';
      } else {
        _minutes = 'Minuten';
      }
      String _seconds;
      if (_counterSeconds == 1) {
        _seconds = 'Sekunde';
      } else {
        _seconds = 'Sekunden';
      }
      return ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Container(
            color: Color.fromRGBO(121, 28, 28, 1),
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
                          'Fasnachtscountdown  ',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Icon(
                          Icons.theater_comedy_rounded,
                          color: Colors.white,
                          size: 20.0,
                        ),
                      ],
                    ),
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),
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
                        Text(_counterDays.toString(), style: textStyle()),
                        Text(_days, style: textStyle())
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(_counterHours.toString(), style: textStyle()),
                        Text(_hours, style: textStyle())
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(_counterMinutes.toString(), style: textStyle()),
                        Text(_minutes, style: textStyle())
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(_counterSeconds.toString(), style: textStyle()),
                        Text(_seconds, style: textStyle())
                      ],
                    ),
                  ],
                ),
              ],
            )
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
