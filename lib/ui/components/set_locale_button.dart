import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SetLocaleButton extends StatelessWidget {
  const SetLocaleButton({super.key});

  @override
  Widget build(BuildContext context) {
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
