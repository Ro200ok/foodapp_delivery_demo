import 'package:flutter/material.dart';

class AnimatedTapWidget extends StatefulWidget {
  const AnimatedTapWidget({super.key, required this.child});
  final Widget child;

  @override
  State<StatefulWidget> createState() => _AnimatedTapWidget();
}

class _AnimatedTapWidget extends State<AnimatedTapWidget>
    with TickerProviderStateMixin {
  late final _controller = AnimationController(
      duration: const Duration(milliseconds: 700), vsync: this);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
        scale: Tween(begin: 0.75, end: 2.0).animate(
            CurvedAnimation(parent: _controller, curve: Curves.elasticOut)),
        child: widget.child);
  }
}
