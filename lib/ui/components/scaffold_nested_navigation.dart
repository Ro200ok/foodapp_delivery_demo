import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_test/blocs/bloc/cart_bloc.dart';
import 'package:food_app_test/generated/locale_keys.g.dart';
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

  void _animateTotalCount(double total) {
    if (!canAnimate) return;
    _animation = Tween<double>(begin: 0, end: total).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.bounceIn));
    _animationController.forward(from: 0.0);
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
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: widget.navigationShell,
        bottomNavigationBar: BlocListener<CartBloc, CartState>(
          listenWhen: (previous, current) => current is CartIsLoaded,
          listener: (context, state) {
            if (state is CartIsLoaded && state.canAnimate) {
              _animateTotalCount(state.cart.subtotal);
            }
          },
          child: BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state is! CartIsLoaded) return const SizedBox();
              return AnimatedBuilder(
                  animation: _animation,
                  builder: (context, __) {
                    return BottomNavigationBar(
                        selectedItemColor: Colors.grey[800],
                        onTap: (i) {
                          state.canAnimate = false;
                          _goBranch(i);
                        },
                        currentIndex: widget.navigationShell.currentIndex,
                        items: [
                          BottomNavigationBarItem(
                            label: LocaleKeys.food.tr(),
                            icon: const Icon(Icons.coffee),
                          ),
                          state.cart.products.isEmpty
                              ? BottomNavigationBarItem(
                                  icon: Icon(
                                    Icons.shopping_cart_sharp,
                                    color: Colors.grey[700],
                                  ),
                                  label: LocaleKeys.cart.tr(),
                                )
                              : BottomNavigationBarItem(
                                  label:
                                      '${_animation.value.toStringAsFixed(0)} ₽',
                                  icon: const Icon(
                                    Icons.shopping_cart_sharp,
                                    color: Colors.green,
                                  ),
                                ),
                        ]);
                  });
            },
          ),
        ));
  }
}
