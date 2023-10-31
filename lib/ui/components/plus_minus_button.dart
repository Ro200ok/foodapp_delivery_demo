import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_demo/blocs/cart/cart_bloc.dart';
import 'package:food_delivery_demo/models/product/product.dart';
import 'package:food_delivery_demo/utils/app_colors.dart';

class PlusMinusButton extends StatelessWidget {
  const PlusMinusButton(
      {super.key, required this.product, required this.productCount});
  final Product product;
  final int productCount;

  void _addProduct(CartBloc bloc) {
    bloc.add(
      AddProduct(product),
    );
  }

  void _removeProduct(CartBloc bloc) {
    bloc.add(
      RemoveProduct(product),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CartBloc>();
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(20),
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.lightGrey,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              style: _textButtonstyle,
              onPressed: () {
                _removeProduct(bloc);
              },
              child: const Icon(
                Icons.remove,
                size: 20,
              ),
            ),
            Text(productCount.toString()),
            TextButton(
              style: _textButtonstyle,
              onPressed: () {
                _addProduct(bloc);
              },
              child: const Icon(
                Icons.add,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final _textButtonstyle = TextButton.styleFrom(
    padding: EdgeInsets.zero, minimumSize: const Size(10, 10));
