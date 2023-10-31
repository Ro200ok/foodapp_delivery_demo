import 'package:flutter/material.dart';

class TestAuthSuccessScreen extends StatefulWidget {
  const TestAuthSuccessScreen({super.key});

  @override
  State<TestAuthSuccessScreen> createState() => _TestAuthSuccessScreenState();
}

class _TestAuthSuccessScreenState extends State<TestAuthSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Auth success',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }
}
