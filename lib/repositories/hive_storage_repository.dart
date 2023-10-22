import 'dart:developer';
import 'package:food_app_test/models/product/product.dart';
import 'package:food_app_test/repositories/itf_local_storage.dart';
import 'package:hive/hive.dart';

class HiveStorageRepository extends ItfLocalStorage {
  String boxName = 'cart';
  @override
  Future<Box> initBox() async {
    Box box = await Hive.openBox(boxName);
    return box;
  }

  @override
  List<Product> loadProductsList(Box box) {
    if (box.isEmpty) {
      return [];
    }
    List<Product> productList = [];
    for (var element in box.toMap().values.first) {
      productList.add(element as Product);
    }

    return productList;
  }

  @override
  Future<void> updateProductsBox(Box box, List<Product> products) async {
    await box.clear();
    await box.add(products);
  }

  @override
  Future<void> clearBox(Box box) async {
    await box.clear();
  }
}
