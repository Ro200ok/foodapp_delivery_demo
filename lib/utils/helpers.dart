import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Helpers {
  Widget setLocale(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.language),
      tooltip: 'Set locale',
      onPressed: () {
        if (context.locale == const Locale('ru')) {
          context.setLocale(const Locale('en'));
        } else {
          context.setLocale(const Locale('ru'));
        }
      },
    );
  }
}
