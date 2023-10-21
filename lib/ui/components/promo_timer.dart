import 'dart:developer';
import 'package:flutter/material.dart';

class PromoTimer extends StatelessWidget {
  const PromoTimer({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

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
            width: screenWidth / 5.6,
            height: screenHeight / 32.84,
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
