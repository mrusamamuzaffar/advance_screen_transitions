import 'package:advance_screen_transitions/transition.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class TabletTransition extends Transition {
  final Curve curve;
  final Color backgroundColor;
  final double angle;

  TabletTransition({
    this.curve = Curves.easeOutSine,
    this.backgroundColor = Colors.black,
    double angle = 45,
  }) : angle = math.pi / 180 * angle;

  @override
  Widget build(BuildContext context, Widget enterPage, Widget exitPage,
      Animation<double> animation) {
    animation = CurvedAnimation(parent: animation, curve: curve);
    final double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(color: backgroundColor),
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.002)
            ..rotateY(angle * animation.value)
            ..leftTranslate(width * animation.value),
          child: exitPage,
        ),
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.002)
            ..rotateY(-angle * (1.0 - animation.value))
            ..leftTranslate(-width * (1.0 - animation.value)),
          child: enterPage,
        ),
      ],
    );
  }
}