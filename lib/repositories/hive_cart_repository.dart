import 'package:food_app_test/models/product/product.dart';
import 'package:food_app_test/repositories/itf_products_datasource.dart';
import 'package:hive/hive.dart';

class HiveCartRepository extends ItfProductsDataSource {
  String boxName = 'cart';
  @override
  Future<Box> init() => Hive.openBox(boxName);

  @override
  List<Product> loadCart(Box box) {
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
  Future<void> updateCart(Box box, List<Product> products) async {
    await box.clear();
    await box.add(products);
  }

  @override
  Future<void> clearCart(Box box) async {
    await box.clear();
  }
}
