import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_app_test/models/category/category.dart';
import 'package:food_app_test/models/product/product.dart';
import 'package:food_app_test/router/app_paths.dart';
import 'package:go_router/go_router.dart';

class MenuCategoryScreen extends StatelessWidget {
  const MenuCategoryScreen({super.key, required this.products});
  final List<Product>? products;

  @override
  Widget build(BuildContext context) {
    void slideSheet(Product? product) {
      showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return Container(
              color: const Color(0xFF737373),
              child: SizedBox(
                  height: MediaQuery.of(context).size.height - 120,
                  child: Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          color: Colors.white,
                        ),
                      ),
                      Positioned.fill(
                        top: 10,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            width: 50,
                            height: 5,
                            decoration: const BoxDecoration(
                                color: Color.fromRGBO(216, 222, 233, 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                          ),
                        ),
                      ),
                      Positioned.fill(child: Text(product?.name ?? ''))
                    ],
                  )),
            );
          });
    }

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      //TODO
      appBar: AppBar(
        title: const Text('Категория меню'),
      ),
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
                                        ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromRGBO(
                                                    251, 81, 30, 1),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                          ),
                                          child: const SizedBox(
                                              width: 40,
                                              child: Text(
                                                "+",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18),
                                              )),
                                        ),
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
