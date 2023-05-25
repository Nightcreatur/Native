import 'package:flutter/material.dart';

class CustomPageRoute<T> extends PageRoute<T> {
  CustomPageRoute({
    required this.builder,
    RouteSettings? settings,
  }) : super(settings: settings);

  final WidgetBuilder builder;

  @override
  bool get opaque => false;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return builder(context);
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }

  @override
  Color? get barrierColor => throw UnimplementedError();

  @override
  String? get barrierLabel => throw UnimplementedError();
}
