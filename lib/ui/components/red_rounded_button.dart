import 'package:flutter/material.dart';
import 'package:food_app_test/utils/app_colors.dart';

class RedRoundedButton extends StatelessWidget {
  const RedRoundedButton(
      {super.key, required this.label, this.width = 40, this.fontSize = 18});
  final String label;
  final double width;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
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
