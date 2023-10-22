import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
@HiveType(typeId: 0, adapterName: 'ProductsAdapter')
abstract class Product with _$Product {
  Product._();

  factory Product(
    @HiveField(1) int? id,
    @HiveField(2) String? name,
    @HiveField(3) String? image_url,
    @HiveField(4) int? cost,
    @HiveField(5) String? sizes,
    @HiveField(6) int? categoryId,
    @HiveField(7) String? description,
  ) = _Product;

  factory Product.fromJson(Map<String, Object?> json) =>
      _$ProductFromJson(json);
}
