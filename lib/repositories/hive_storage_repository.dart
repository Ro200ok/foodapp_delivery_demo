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
    Box box = await Hive.openBox(boxName);
    return box;
  }

  List<Product> loadProductsList(Box box) {
    if (box.isEmpty) {
      return [];
    }
    log('load box');
    List<Product> productList = [];
    for (var element in box.toMap().values.first) {
      log(element.toString());
      productList.add(element as Product);
    }

    return productList;
  }

  Future<void> addProductToBox(Box box, List<Product> product) async {
    await box.clear();
    await box.add(product);
  }

  Future<void> removeProductFromBox(Box box, List<Product> product) async {
    await box.clear();
    await box.add(product);
  }

  Future<void> clearBox(Box box) async {
    await box.clear();
  }
}
