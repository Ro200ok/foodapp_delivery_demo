import 'package:food_app_test/models/product/product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'category.freezed.dart';
part 'category.g.dart';

@freezed
abstract class ProductsCategory with _$ProductsCategory {
  const factory ProductsCategory(
    int? id,
    String? image_url,
    String? category_name,
    List<Product>? products,
  ) = _ProductsCategory;

  factory ProductsCategory.fromJson(Map<String, Object?> json) =>
      _$ProductsCategoryFromJson(json);
}
