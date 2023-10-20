import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_test/blocs/bloc/cart_bloc_bloc.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNestedNavigation extends StatefulWidget {
  const ScaffoldWithNestedNavigation({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;

  @override
  State<ScaffoldWithNestedNavigation> createState() =>
      _ScaffoldWithNestedNavigationState();
}

class _ScaffoldWithNestedNavigationState
    extends State<ScaffoldWithNestedNavigation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late bool canAnimate;
  int currentIndex = 1;

  _animateTotalCount(double total) {
    if (!canAnimate) return;
    _animation = Tween<double>(begin: 0, end: total).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.bounceIn));
    _animationController.forward(from: 0.0);
    canAnimate = true;
  }

  @override
  void initState() {
    canAnimate = true;
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    _animation = _animationController;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _goBranch(int index) {
    currentIndex = index;
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: widget.navigationShell,
        bottomNavigationBar: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartIsLoaded) {
              _animateTotalCount(state.cart.subtotal);
              return AnimatedBuilder(
                  animation: _animation,
                  builder: (context, __) {
                    return BottomNavigationBar(
                        selectedItemColor: Colors.grey[800],
                        onTap: _goBranch,
                        currentIndex: widget.navigationShell.currentIndex,
                        items: [
                          const BottomNavigationBarItem(
                              label: 'Еда', icon: Icon(Icons.coffee)),
                          BottomNavigationBarItem(
                              label: state.cart.products.isEmpty
                                  ? 'Корзина'
                                  : '${_animation.value.toStringAsFixed(0)} ₽',
                              icon: Icon(
                                Icons.shopping_cart_sharp,
                                color: state.cart.products.isEmpty
                                    ? Colors.grey[700]
                                    : Colors.green,
                              ))
                        ]);
                  });
            }

            return const Row();
          },
        ));
  }
}

class AnimatedCartBage extends StatefulWidget {
  const AnimatedCartBage(
      {super.key, required this.totalSum, required this.callback});

  final double totalSum;
  final Function(int) callback;

  @override
  State<AnimatedCartBage> createState() => _AnimatedCartBageState();
}

class _AnimatedCartBageState extends State<AnimatedCartBage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
