import 'package:easy_localization/easy_localization.dart';
import 'package:food_app_test/generated/locale_keys.g.dart';

abstract class AppConstants {
  static const promoPizzaPath = 'assets/images/jalapeno_pizza.png';
  static const apiEndpoint =
      'https://gist.githubusercontent.com/moisey312/10b304f7b00ffd17535604f4b38ebe6a/raw/eeb0334ccf8e33fb4be7495a395ddc2ec22f3a75/test.json';

  static const categoriesNames = [
    LocaleKeys.susi,
    LocaleKeys.soups,
    LocaleKeys.salads,
    LocaleKeys.desserts,
  ];
}
