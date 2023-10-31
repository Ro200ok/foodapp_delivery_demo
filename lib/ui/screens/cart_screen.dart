import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_demo/blocs/cart/cart_bloc.dart';
import 'package:food_delivery_demo/generated/locale_keys.g.dart';
import 'package:food_delivery_demo/models/product/product.dart';
import 'package:food_delivery_demo/ui/components/plus_minus_button.dart';
import 'package:food_delivery_demo/utils/app_colors.dart';
import 'package:food_delivery_demo/utils/helper.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                HelperLocale.setLocale(context);
              },
              icon: const Icon(Icons.language))
        ],
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
            final products = state.cart.itemQuantity(state.cart.products);
            if (state.cart.products.isNotEmpty) {
              return ListView.separated(
                separatorBuilder: (_, __) {
                  return const Divider(
                    color: AppColors.lightGrey,
                  );
                },
                itemCount: products.keys.length,
                itemBuilder: (context, index) {
                  final product = products.keys.elementAt(index) as Product;
                  final productCount = products.entries.elementAt(index).value;

                  return Stack(
                    children: [
                      ListTile(
                        title: Padding(
                          padding:
                              const EdgeInsets.only(bottom: 20, right: 100),
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
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            SizedBox(
                              width: 122,
                              child: SizedBox(
                                child: Text(product.sizes.toString()),
                              ),
                            )
                          ],
                        ),
                        leading: CachedNetworkImage(
                          imageUrl: product.image_url ?? '',
                          fit: BoxFit.cover,
                          placeholder: (_, __) => const SizedBox(
                            width: 80,
                            child: Center(
                              child: CircularProgressIndicator(
                                strokeWidth: .5,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 20,
                        child: PlusMinusButton(
                          product: product,
                          productCount: productCount,
                        ),
                      ),
                    ],
                  );
                },
              );
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.shopping_cart,
                      size: 200,
                      color: AppColors.lightGrey,
                    ),
                    Expanded(
                      flex: 0,
                      child: Text(
                        LocaleKeys.cartIsEmpty.tr(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              );
            }
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
