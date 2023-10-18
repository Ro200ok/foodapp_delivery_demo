import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:food_app_test/models/category/category.dart';
import 'package:food_app_test/utils/constants.dart';

class ProductsRepository {
  final _client = Dio();
  Future<List<ProductsCategory>> fetchProductsCategories() async {
    Response response = await _client.get(AppConstants.apiEndpoint);
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.data);
      return result.map((e) => ProductsCategory.fromJson(e)).toList();
    } else {
      throw DioException.badResponse(
          statusCode: response.statusCode ?? 0,
          requestOptions: RequestOptions(),
          response: response);
    }
  }
}
