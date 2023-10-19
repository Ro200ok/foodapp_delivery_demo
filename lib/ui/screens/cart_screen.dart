import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_app_test/ui/components/custom_app_bar.dart';

final _textButtonstyle = TextButton.styleFrom(
    padding: EdgeInsets.zero, minimumSize: const Size(10, 10));

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    log('$screenWidth screenWidth');
    log('$screenHeight screenHeight');
    return Scaffold(
      appBar: const CustomAppBar(title: 'Корзина'),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return Stack(
              children: [
                ListTile(
                  title: Padding(
                    padding:
                        EdgeInsets.only(bottom: 20, right: screenWidth / 3.92),
                    child: const Text('title'),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        'price',
                        maxLines: 4,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(
                        width: screenWidth / 3.2,
                        child: const SizedBox(
                          child: Text('weight'),
                        ),
                      )
                    ],
                  ),
                  leading: Image.network(
                      'https://storage.yandexcloud.net/cdn-staging/cache/51/d4/51d423094a32e41cdb6951b611339c82.jpg'),
                ),
                Positioned(
                  bottom: 0,
                  right: 20,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(241, 244, 249, 1)),
                      width: screenWidth / 3.2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              style: _textButtonstyle,
                              onPressed: () {},
                              child: const Icon(
                                Icons.remove,
                                size: 20,
                              )),
                          const Text('3'),
                          TextButton(
                              style: _textButtonstyle,
                              onPressed: () {},
                              child: const Icon(
                                Icons.add,
                                size: 20,
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
          separatorBuilder: (_, __) {
            return const Divider(
              color: Color.fromRGBO(241, 244, 249, 1),
            );
          },
          itemCount: 20),
    );
  }
}
