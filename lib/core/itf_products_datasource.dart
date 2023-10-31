import 'package:food_delivery_demo/models/product/product.dart';
import 'package:hive/hive.dart';

abstract class ItfProductsDataSource {
  Future<Box> init();
  List<Product> loadCart(Box box);
  Future<void> updateCart(Box box, List<Product> products);
  Future<void> clearCart(Box box);
}
