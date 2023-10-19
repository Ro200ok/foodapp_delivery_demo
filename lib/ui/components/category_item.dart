import 'package:flutter/material.dart';
import 'package:food_app_test/models/category/category.dart';
import 'package:food_app_test/utils/constants.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category});
  final ProductsCategory category;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 4,
      child: Stack(
        children: [
          Image.network(category.image_url ?? ''),
          Positioned(
              bottom: 20,
              left: 20,
              child: Text(
                category.category_name ?? '',
                style:
                    const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              ))
        ],
      ),
    );
  }
}
