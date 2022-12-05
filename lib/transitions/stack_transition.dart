import 'package:advance_screen_transitions/transition.dart';
import 'package:flutter/material.dart';

class StackTransition extends Transition {
  final Curve curve;

  StackTransition({
    this.curve = Curves.easeOutSine,
  });

  @override
  Widget build(BuildContext context, Widget enterPage, Widget exitPage,
      Animation<double> animation) {
    animation = CurvedAnimation(parent: animation, curve: curve);
    double width = MediaQuery.of(context).size.width;
    return Transform(
      transform: Matrix4.identity()..translate(width * (1.0 - animation.value)),
      child: enterPage,
    );
  }
}