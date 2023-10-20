import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:food_app_test/models/product/product.dart';

class Cart extends Equatable {
  final List<Product> products;

  const Cart({this.products = const <Product>[]});

  Cart copyWith({
    List<Product>? products,
  }) {
    return Cart(
      products: products ?? this.products,
    );
  }

  @override
  List<Object?> get props => [products];

  Map itemQuantity(products) {
    var quantity = {};

    for (var item in products) {
      if (!quantity.containsKey(item)) {
        quantity[item] = 1;
      } else {
        quantity[item] += 1;
      }
    }

    return quantity;
  }

  double get subtotal => products.fold(
      0, (total, current) => total + (current.cost?.toInt() ?? 0));

  double total(subtotal) {
    return subtotal;
  }

  String get subtotalString => subtotal.toStringAsFixed(2);

  String get totalString => total(subtotal).toStringAsFixed(2);
}
