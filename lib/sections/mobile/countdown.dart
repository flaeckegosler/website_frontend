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

  @override
  Widget build(BuildContext context) {
    if (DateTime.parse('2023-01-07 17:00:00').isAfter(DateTime.now())) {
      var date1 = DateTime.parse('2023-01-07 17:00:00');
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
      return Padding(
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
      );
    } else {
      return const SizedBox(
        height: 0,
      );
    }
  }
}
