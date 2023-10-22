import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_test/blocs/bloc/cart_bloc_bloc.dart';
import 'package:food_app_test/generated/locale_keys.g.dart';
import 'package:food_app_test/models/product/product.dart';
import 'package:food_app_test/ui/components/custom_app_bar.dart';
import 'package:food_app_test/ui/components/red_rounded_button.dart';
import 'package:food_app_test/utils/helpers.dart';

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
                                    callback: () {
                                      final cartBloc = context.read<CartBloc>();
                                      cartBloc.add(AddProduct(product!));
                                    },
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
      appBar: AppBar(
        actions: [Helpers().setLocale(context)],
        title: Text(
          LocaleKeys.menu_category.tr(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
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
                            childAspectRatio: 0.7,
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
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: CachedNetworkImage(
                                          fit: BoxFit.cover,
                                          placeholder: (_, __) => SizedBox(
                                              width: screenWidth,
                                              height: screenHeight / 6.8,
                                              child: const Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  strokeWidth: .5,
                                                ),
                                              )),
                                          imageUrl: (product?.image_url ?? '')),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      height: screenHeight / 10.26,
                                      child: Text(
                                        (product?.name ?? ''),
                                        maxLines: 3,
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
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
                                      RedRoundedButton(
                                        callback: () {
                                          context
                                              .read<CartBloc>()
                                              .add(AddProduct(product!));
                                        },
                                        label: '+',
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
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

// Row(
//                                     mainAxisAlignment =
//                                         MainAxisAlignment.spaceBetween,
//                                     children = [
//                                     
//                                       RedRoundedButton(
//                                         callback: () {
//                                           context
//                                               .read<CartBloc>()
//                                               .add(AddProduct(product!));
//                                         },
//                                         label: '+',
//                                       )
//                                     ],
//                                   ),