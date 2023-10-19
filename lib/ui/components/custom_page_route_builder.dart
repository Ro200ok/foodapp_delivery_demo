import 'package:flutter/material.dart';

class CustomPageRouteBuilder<T> extends PageRouteBuilder<T> {
  CustomPageRouteBuilder({
    required this.widget,
  }) : super(
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return widget;
          },
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            final Widget transition = SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.0, 1.0),
                end: Offset.zero,
              ).animate(animation),
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: Offset.zero,
                  end: const Offset(0.0, -0.7),
                ).animate(secondaryAnimation),
                child: child,
              ),
            );

            return transition;
          },
        );

  final Widget widget;
}

typedef TransitionAnimationBuilder = Widget Function(
  BuildContext,
  Animation<double>,
  Animation<double>,
  Widget,
);

///Each Screen must extend this class and provide its functionality
abstract class AppPage extends Page<dynamic> {
  const AppPage({
    required this.args,
    this.transitionDuration = 100,
    this.reverseTransitionDuration = 100,
    this.animationBuilder,
  });

  final Map<String, dynamic> args;
  final int transitionDuration, reverseTransitionDuration; //milliseconds

  ///Give each individual screen the option to define a special entry animation
  final TransitionAnimationBuilder? animationBuilder;

  Widget build(BuildContext context);

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder<dynamic>(
      settings: this,
      transitionDuration: Duration(milliseconds: transitionDuration),
      reverseTransitionDuration:
          Duration(milliseconds: reverseTransitionDuration),
      transitionsBuilder: (
        context,
        animation,
        secondaryAnimation,
        child,
      ) =>
          animationBuilder?.call(
            context,
            animation,
            secondaryAnimation,
            child,
          ) ??
          _defaultAnimationBuilder(
            context,
            animation,
            secondaryAnimation,
            child,
          ),
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> animation2,
      ) =>
          build(context),
    );
  }

  Widget _defaultAnimationBuilder(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return SlideTransition(
      textDirection: TextDirection.rtl,
      position: Tween<Offset>(
        begin: const Offset(1, 0),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }
}
