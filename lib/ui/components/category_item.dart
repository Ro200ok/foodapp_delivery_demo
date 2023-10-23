import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_app_test/models/category/category.dart';
import 'package:food_app_test/models/product/product.dart';
import 'package:food_app_test/router/app_paths.dart';
import 'package:go_router/go_router.dart';

class CategoryItem extends StatefulWidget {
  const CategoryItem(
      {super.key, required this.category, required this.categoryName});
  final ProductsCategory category;
  final String categoryName;

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem>
    with SingleTickerProviderStateMixin {
  late final _controller = AnimationController(
      duration: const Duration(milliseconds: 200), vsync: this);

  late final _animation =
      Tween<double>(begin: 1.0, end: 1.1).animate(_controller)
        ..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            _controller.reverse();
          }
        });

  Future<void> _animateAndNavigate(
      BuildContext context, ProductsCategory category) async {
    _controller.forward();
    await Future.delayed(const Duration(milliseconds: 400));
    if (context.mounted) {
      context.goNamed(AppPaths.menuCategory,
          extra: category.products as List<Product>);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final category = widget.category;
    // final categorieName = category.category_name ?? '';
    final categoryName = widget.categoryName;
    return AnimatedBuilder(
        animation: _animation,
        builder: (context, widget) {
          return Transform.scale(
            scale: _animation.value,
            child: GestureDetector(
              onTap: () {
                _animateAndNavigate(context, category);
              },
              child: Material(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 4,
                  child: Column(
                    children: [
                      CachedNetworkImage(
                        imageUrl: category.image_url ?? '',
                        placeholder: (_, __) => const SizedBox(
                          height: 110,
                          child: Center(
                            child: CircularProgressIndicator(
                              strokeWidth: .5,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              categoryName,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 18),
                            )),
                      )
                    ],
                  )),
            ),
          );
        });
  }
}
