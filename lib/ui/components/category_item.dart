import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_app_test/models/category/category.dart';
import 'package:food_app_test/models/product/product.dart';
import 'package:food_app_test/router/app_paths.dart';
import 'package:food_app_test/utils/constants.dart';
import 'package:go_router/go_router.dart';

class CategoryItem extends StatefulWidget {
  const CategoryItem({
    super.key,
    required this.category,
  });
  final ProductsCategory category;

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);

    _animation = Tween<double>(begin: 1.0, end: 1.1).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    final category = widget.category;
    return AnimatedBuilder(
        animation: _animation,
        builder: (context, widget) {
          return Transform.scale(
            scale: _animation.value,
            child: GestureDetector(
              onTap: () async {
                _controller.forward();
                await Future.delayed(const Duration(milliseconds: 400));
                if (context.mounted) {
                  context.goNamed(AppPaths.menuCategory,
                      extra: category.products as List<Product>);
                }
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
                        placeholder: (_, __) => SizedBox(
                          height: screenHeight / 7.1,
                          child: const Center(
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
                            (category.category_name ?? '').tr(),
                            style: const TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 18),
                          ),
                        ),
                      )
                    ],
                  )),
            ),
          );
        });
  }
}


// Stack(
//                   children: [
//                     Image.network(category.image_url ?? ''),
//                     Positioned(
//                         bottom: 20,
//                         left: 20,
                  //        child: Text(
                  //         category.category_name ?? '',
                  //         style: const TextStyle(
                  //             fontWeight: FontWeight.w700, fontSize: 18),
                  //       ))
                  // ],
//                 ),