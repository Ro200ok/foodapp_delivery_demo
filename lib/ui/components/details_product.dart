import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_demo/blocs/cart/cart_bloc.dart';
import 'package:food_delivery_demo/generated/locale_keys.g.dart';
import 'package:food_delivery_demo/models/product/product.dart';
import 'package:food_delivery_demo/ui/components/red_rounded_button.dart';

class DetailsProduct extends StatelessWidget {
  const DetailsProduct({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF737373),
      child: SizedBox(
        height: 700,
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 20),
                        child: Container(
                          width: 40,
                          height: 5,
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(216, 222, 233, 1),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      CachedNetworkImage(
                        imageUrl: product.image_url ?? '',
                        fit: BoxFit.cover,
                        placeholder: (_, __) => const SizedBox(
                          child: Center(
                            child: CircularProgressIndicator(
                              strokeWidth: .5,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          product.name ?? '',
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            ('${product.cost.toString()} ₽'),
                            style: const TextStyle(
                                fontWeight: FontWeight.w800, fontSize: 20),
                          ),
                          RedRoundedButton(
                            callback: () {
                              final cartBloc = context.read<CartBloc>();
                              cartBloc.add(
                                AddProduct(product),
                              );
                            },
                            label: LocaleKeys.wantit.tr(),
                            width: 40,
                            fontSize: 12,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SingleChildScrollView(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            (product.description ?? ''),
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
  }
}
