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
  late Animation<double> _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
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
        bottomNavigationBar: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartIsLoaded) {
              _animation = Tween<double>(begin: _animation.value, end: 100)
                  .animate(_animationController);
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
                              label: _animation.value.toString(),
                              icon: const Icon(
                                  Icons.shopping_cart_checkout_rounded))
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
