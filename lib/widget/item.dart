// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class AnimatedItem extends AnimatedWidget {
  static final sizeTween = Tween<double>(begin: 30.0, end: 30.0);

  Widget child;

  AnimatedItem(
      {Key? key, required Animation<double> animation, required this.child})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;

    return SizedBox(
      height: sizeTween.evaluate(animation),
      width: sizeTween.evaluate(animation),
      child: child,
    );
  }
}
