import 'package:flutter/material.dart';
import 'package:food_app_test/utils/constants.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 4,
      child: Column(
        children: [
          Image.asset(AppConstants.promoPizzaPath),
          const Text('Название товара')
        ],
      ),
    );
  }
}
