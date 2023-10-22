import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_app_test/models/cart_model.dart';
import 'package:food_app_test/models/product/product.dart';
import 'package:food_app_test/repositories/itf_local_storage.dart';
import 'package:hive/hive.dart';
import 'package:uuid/data.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/rng.dart';

class HiveStorageRepository {
  String boxName = 'cart';

  Future<Box> initBox() async {
    Box box = await Hive.openBox<Product>(boxName);
    return box;
  }

  List<Product> loadProductsList(Box box) {
    return box.values.toList() as List<Product>;
  }

  Future<void> addProductToBox(Box box, Product product) async {
    await box.put(product.id, product);
  }

  Future<void> removeProductFromBox(Box box, Product product) async {
    await box.delete(product.id);
  }

  Future<void> clearBox(Box box) async {
    await box.clear();
  }
}
