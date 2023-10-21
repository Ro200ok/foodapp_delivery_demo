import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_app_test/models/product/product.dart';
import 'package:food_app_test/repositories/itf_local_storage.dart';
import 'package:hive/hive.dart';
import 'package:uuid/data.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/rng.dart';

class HiveStorageRepository extends ItfLocalStorage {
  String boxName = 'cart';
  @override
  Future<Box> initBox() async {
    Box box = await Hive.openBox(boxName);
    return box;
  }

  @override
  Map<int, Product> loadProductsList(Box box) {
    return box
        .toMap()
        .map((key, value) => MapEntry(key as int, value as Product));
  }

  @override
  Future<void> addProductToBox(Box box, Product product) async {
    log('${product.hashCode}');

    await box.put(product.hashCode, product);
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
