import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_demo/blocs/cart/cart_bloc.dart';
import 'package:food_delivery_demo/generated/locale_keys.g.dart';
import 'package:food_delivery_demo/models/product/product.dart';
import 'package:food_delivery_demo/ui/components/details_product.dart';
import 'package:food_delivery_demo/ui/components/red_rounded_button.dart';
import 'package:food_delivery_demo/utils/helper.dart';

class MenuCategoryScreen extends StatelessWidget {
  const MenuCategoryScreen({super.key, required this.products});
  final List<Product>? products;

  _showBTS(BuildContext context, Product? product) {
    return showModalBottomSheet(
        isScrollControlled: true,
        enableDrag: true,
        context: context,
        builder: (context) {
          return DetailsProduct(
            product: product!,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              HelperLocale.setLocale(context);
            },
            icon: const Icon(Icons.language),
          )
        ],
        title: Text(
          LocaleKeys.menuCategory.tr(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: DecoratedBox(
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
                          _showBTS(context, product);
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
                                          placeholder: (_, __) =>
                                              const SizedBox(
                                                  height: 120,
                                                  child: Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                      strokeWidth: .5,
                                                    ),
                                                  )),
                                          imageUrl: (product?.image_url ?? '')),
                                    ),
                                    Container(
                                      height: 80,
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
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
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
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
