import 'package:advance_screen_transitions/transition.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class FlipVerticalTransition extends Transition {
  final Curve curve;
  final Color backgroundColor;
  final AlignmentGeometry enterPageAlignment;
  final AlignmentGeometry exitPageAlignment;
  final bool reverse;

  FlipVerticalTransition({
    this.curve = Curves.easeOutSine,
    this.backgroundColor = Colors.black,
    this.enterPageAlignment = Alignment.center,
    this.exitPageAlignment = Alignment.center,
    this.reverse = false,
  });

  @override
  Widget build(BuildContext context, Widget enterPage, Widget exitPage,
      Animation<double> animation) {
    animation = CurvedAnimation(parent: animation, curve: curve);
    return Stack(
      children: [
        Container(color: backgroundColor),
        animation.value > 0.5
            ? Container()
            : Transform(
          alignment: exitPageAlignment,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.002)
            ..rotateX(math.pi * animation.value * (reverse ? -1 : 1)),
          child: exitPage,
        ),
        animation.value > 0.5
            ? Transform(
          alignment: enterPageAlignment,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.002)
            ..rotateX(
                -math.pi * (1 - animation.value) * (reverse ? -1 : 1)),
          child: enterPage,
        )
            : Container(),
      ],
    );
  }
}