import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food_app_test/utils/helpers.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title});
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return AppBar(actions: [Helpers().setLocale(context)], title: title);
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
