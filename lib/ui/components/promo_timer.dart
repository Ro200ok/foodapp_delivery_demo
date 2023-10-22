import 'dart:developer';
import 'package:flutter/material.dart';

class PromoTimer extends StatelessWidget {
  const PromoTimer({super.key});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<Duration>(
        duration: const Duration(minutes: 10),
        tween: Tween(begin: const Duration(minutes: 10), end: Duration.zero),
        onEnd: () {
          log('Timer ended');
        },
        builder: (BuildContext context, Duration value, Widget? child) {
          final minutes = value.inMinutes;
          final seconds = value.inSeconds % 60;
          final minutesString = '$minutes'.padLeft(2, '0');
          final secondsString = '$seconds'.padLeft(2, '0');
          return Container(
            width: 80,
            height: 25,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Text(
              '$minutesString:$secondsString',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
          );
        });
  }
}
