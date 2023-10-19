import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 400,
      color: Colors.redAccent,
    );
  }
}
