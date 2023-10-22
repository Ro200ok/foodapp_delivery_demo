import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_test/models/product/product.dart';
import 'package:food_app_test/utils/app_colors.dart';

class RedRoundedButton extends StatelessWidget {
  const RedRoundedButton(
      {super.key,
      required this.label,
      required this.callback,
      this.width = 40,
      this.fontSize = 16});
  final String label;
  final double width;
  final double fontSize;
  final void Function() callback;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttonRed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      child: SizedBox(
        width: width,
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: fontSize),
        ),
      ),
    );
  }
}
