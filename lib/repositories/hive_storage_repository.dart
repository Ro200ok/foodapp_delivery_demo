import 'package:food_app_test/models/product/product.dart';
import 'package:food_app_test/repositories/itf_local_storage.dart';
import 'package:hive/hive.dart';

class HiveStorageRepository extends ItfLocalStorage {
  String boxName = 'cart';
  @override
  Future<Box> initBox() async {
    Box box = await Hive.openBox<Product>(boxName);
    return box;
  }

  @override
  List<Product> loadProductsList(Box box) {
    return box.values.toList() as List<Product>;
  }

  @override
  Future<void> addProductToBox(Box box, Product product) async {
    await box.put(product.id, product);
  }

  @override
  Future<void> removeProductFromBox(Box box, Product product) async {
    await box.delete(product.id);
  }

  @override
  Future<void> clearBox(Box box) async {
    await box.clear();
  }
}
