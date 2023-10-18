import 'dart:developer';

import 'package:flutter/material.dart';

class PromoTimer extends StatelessWidget {
  const PromoTimer({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    log('$screenWidth  <<<< screenWidth');
    log('$screenHeight  <<<< screenHeight');
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      width: screenWidth / 5.6,
      height: screenHeight / 32.84,
      child: const Text(
        '10:00',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
      ),
    );
  }
}
