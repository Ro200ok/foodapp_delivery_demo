import 'package:food_app_test/models/product/product.dart';
import 'package:hive/hive.dart';

abstract class ItfLocalStorage {
  Future<Box> initBox();
  List<Product> loadProductsList(Box box);
  Future<void> updateProductsBox(Box box, List<Product> products);
  Future<void> clearBox(Box box);
}
