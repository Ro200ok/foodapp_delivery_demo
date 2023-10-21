import 'package:food_app_test/models/product/product.dart';
import 'package:hive/hive.dart';

abstract class ItfLocalStorage {
  Future<Box> initBox();
  Map<int, Product> loadProductsList(Box box);
  Future<void> addProductToBox(Box box, Product product);
  Future<void> removeProductFromBox(Box box, Product product);
  Future<void> clearBox(Box box);
}
