import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class MyAnimation extends StatelessWidget {
  final Widget child;

  MyAnimation(this.child);

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return PlayAnimation<double>(
        tween: Tween(begin: 0.0, end: 1.0),
        duration: const Duration(seconds: 1),
        curve: Curves.easeOut,
        builder: (context, child, value) {
          return Transform.scale(
            scale: value,
            child: child,
          );
        },
        child: child);
  }
}
