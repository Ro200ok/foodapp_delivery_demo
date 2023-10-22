import 'package:flutter/material.dart';
import 'package:food_app_test/ui/components/set_locale_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title});
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return AppBar(actions: const [SetLocaleButton()], title: title);
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
