import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  Future<RiveFile> preload() async {
    final data = await rootBundle.load('assets/animations/delivery.riv');
    RiveFile file = RiveFile.import(data);
    return file;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(11, 36, 251, 1),
      body: Center(
        child: FutureBuilder<RiveFile>(
            future: preload(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting &&
                  snapshot.connectionState == ConnectionState.waiting) {
                return const SizedBox.shrink();
              }
              return RiveAnimation.direct(
                snapshot.data!,
              );
            }),
      ),
    );
  }
}
