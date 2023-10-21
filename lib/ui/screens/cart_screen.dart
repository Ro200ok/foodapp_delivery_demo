import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_test/blocs/bloc/cart_bloc_bloc.dart';
import 'package:food_app_test/generated/locale_keys.g.dart';
import 'package:food_app_test/ui/components/custom_app_bar.dart';
import 'package:food_app_test/utils/helpers.dart';

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
      appBar: AppBar(
        actions: [Helpers().setLocale(context)],
        title: Text(
          LocaleKeys.cart.tr(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartIsLoading) {
            return const CircularProgressIndicator(
              strokeWidth: .5,
            );
          } else if (state is CartIsLoaded) {
            return state.cart.products.isNotEmpty
                ? ListView.separated(
                    itemBuilder: (context, index) {
                      final product = state.cart
                          .itemQuantity(state.cart.products)
                          .keys
                          .elementAt(index);
                      final productCount = state.cart
                          .itemQuantity(state.cart.products)
                          .entries
                          .elementAt(index)
                          .value;

                      return Stack(
                        children: [
                          ListTile(
                            title: Padding(
                              padding: EdgeInsets.only(
                                  bottom: 20, right: screenWidth / 3.92),
                              child: Text(product.name ?? ''),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  ('${product.cost.toString()} ₽'),
                                  maxLines: 4,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                SizedBox(
                                  width: screenWidth / 3.2,
                                  child: SizedBox(
                                    child: Text(product.sizes.toString()),
                                  ),
                                )
                              ],
                            ),
                            leading: Image.network(
                              product.image_url ?? '',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 20,
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: Color.fromRGBO(241, 244, 249, 1)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                        style: _textButtonstyle,
                                        onPressed: () {
                                          context
                                              .read<CartBloc>()
                                              .add(RemoveProduct(product));
                                        },
                                        child: const Icon(
                                          Icons.remove,
                                          size: 20,
                                        )),
                                    Text(productCount.toString()),
                                    TextButton(
                                        style: _textButtonstyle,
                                        onPressed: () {
                                          context
                                              .read<CartBloc>()
                                              .add(AddProduct(product));
                                        },
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
                    itemCount: state.cart
                        .itemQuantity(state.cart.products)
                        .keys
                        .length)
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shopping_cart,
                          size: 200,
                          color: Colors.grey[200],
                        ),
                        const Expanded(
                          flex: 0,
                          child: Text(
                            'Корзина пустая',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  );
          } else {
            return const Center(
              child: Text('Ошибка'),
            );
          }
        },
      ),
    );
  }
}
