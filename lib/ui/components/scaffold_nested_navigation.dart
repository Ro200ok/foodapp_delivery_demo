import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: navigationShell,
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.grey[800],
            onTap: _goBranch,
            currentIndex: navigationShell.currentIndex,
            items: const [
              BottomNavigationBarItem(label: 'Еда', icon: Icon(Icons.coffee)),
              BottomNavigationBarItem(
                  label: 'Корзина',
                  icon: Icon(Icons.shopping_cart_checkout_rounded))
            ]));
  }
}
