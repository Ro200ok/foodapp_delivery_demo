import 'dart:developer';

import 'package:flutter/material.dart';

class MenuCategoryScreen extends StatelessWidget {
  const MenuCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    itemCount: 20,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 0.8,
                            crossAxisCount: 2),
                    itemBuilder: (contex, index) {
                      // final category = state.data[index];
                      return Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                'https://storage.yandexcloud.net/cdn-staging/cache/70/3a/703a436d2b8a7425a18d8b2b0b7910fb.jpg',
                                fit: BoxFit.fill,
                              ),
                            ),
                            const Positioned(
                              bottom: 80,
                              left: 10,
                              child: Text(
                                'Название товара',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                            ),
                            Positioned(
                                bottom: 10,
                                left: 10,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      '1000 ₽',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    ElevatedButton(
                                      onPressed: null,
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                      ),
                                      child: const Text("+"),
                                    ),
                                  ],
                                ))
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: screenWidth,
        height: 60,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: null, child: Text('Еда')),
            TextButton(onPressed: null, child: Text('Корзина'))
          ],
        ),
      ),
    );
  }
}
