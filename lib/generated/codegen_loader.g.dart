// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ru = {
  "food": "Еда",
  "cart": "Корзина",
  "categories": "Категории",
  "menuCategory": "Меню категории",
  "susi": "Суши",
  "soups": "Супы",
  "salads": "Салаты",
  "desserts": "Десерты",
  "wantit": "Хочу!"
};
static const Map<String,dynamic> en = {
  "food": "Food",
  "cart": "Cart",
  "categories": "Categories",
  "menuCategory": "Menu categoriy",
  "susi": "Susi",
  "soups": "Soups",
  "salads": "Salads",
  "desserts": "Desserts",
  "wantit": "I want it!"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ru": ru, "en": en};
}
