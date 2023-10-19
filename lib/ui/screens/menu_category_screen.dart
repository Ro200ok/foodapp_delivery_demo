import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_app_test/models/category/category.dart';
import 'package:food_app_test/models/product/product.dart';
import 'package:food_app_test/router/app_paths.dart';
import 'package:food_app_test/ui/components/custom_app_bar.dart';
import 'package:food_app_test/ui/components/red_rounded_button.dart';
import 'package:go_router/go_router.dart';

class MenuCategoryScreen extends StatelessWidget {
  const MenuCategoryScreen({super.key, required this.products});
  final List<Product>? products;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    void slideSheet(Product? product) {
      showModalBottomSheet(
          isScrollControlled: true,
          enableDrag: true,
          context: context,
          builder: (context) {
            return Container(
              color: const Color(0xFF737373),
              child: SizedBox(
                height: screenHeight - (screenHeight / 6.84),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12, right: 12),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 20),
                                child: Container(
                                  width: 40,
                                  height: 5,
                                  decoration: const BoxDecoration(
                                      color: Color.fromRGBO(216, 222, 233, 1),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                ),
                              ),
                              Image.network(product?.image_url ?? ''),
                              SizedBox(
                                height: screenHeight / 27.36,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  product?.name ?? '',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                ),
                              ),
                              SizedBox(
                                height: screenHeight / 27.36,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    ('${product?.cost.toString()} ₽'),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 20),
                                  ),
                                  RedRoundedButton(
                                    label: 'Хочу!',
                                    width: screenWidth / 7.84,
                                    fontSize: 16,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: screenHeight / 27.36,
                              ),
                              SingleChildScrollView(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: SizedBox(
                                    height: screenHeight / 4.1,
                                    child: Text((product?.description ?? '')),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
    }

    return Scaffold(
      appBar: const CustomAppBar(title: 'Mеню Категории'),
      body: Container(
        decoration: BoxDecoration(color: Colors.grey[100]),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                    itemCount: products?.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 0.8,
                            crossAxisCount: 2),
                    itemBuilder: (contex, index) {
                      final product = products?[index];
                      return GestureDetector(
                        onTap: () {
                          slideSheet(product);
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  product?.image_url ?? '',
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Positioned(
                                  bottom: 70,
                                  left: 10,
                                  child: SizedBox(
                                    width: screenWidth / 2.8,
                                    child: Text(
                                      product?.name ?? '',
                                      maxLines: 2,
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )),
                              Positioned.fill(
                                  bottom: 10,
                                  left: 10,
                                  right: 10,
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          ('${product?.cost.toString()} ₽'),
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w900),
                                        ),
                                        const RedRoundedButton(
                                          label: '+',
                                        )
                                      ],
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
