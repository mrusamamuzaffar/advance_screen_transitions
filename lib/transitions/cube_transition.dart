import 'package:advance_screen_transitions/transition.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class CubeTransition extends Transition {
  final Curve curve;
  final double perspectiveScale;
  final double angle;
  final AlignmentGeometry enterPageAlignment;
  final AlignmentGeometry exitPageAlignment;
  final Color backgroundColor;

  CubeTransition({
    this.curve = Curves.linear,
    this.perspectiveScale = 0.001,
    double angle = 90,
    this.enterPageAlignment = Alignment.centerLeft,
    this.exitPageAlignment = Alignment.centerRight,
    this.backgroundColor = Colors.black,
  }) : angle = math.pi / 180 * angle;

  @override
  Widget build(BuildContext context, Widget enterPage, Widget exitPage, Animation<double> animation) {
    animation = CurvedAnimation(parent: animation, curve: curve);
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(color: backgroundColor),
        Transform(
          alignment: exitPageAlignment,
          transform: Matrix4.identity()
            ..setEntry(3, 2, perspectiveScale)
            ..rotateY(angle * (animation.value))
            ..leftTranslate(
              -width * (animation.value),
            ),
          child: exitPage,
        ),
        Transform(
          alignment: enterPageAlignment,
          transform: Matrix4.identity()
            ..setEntry(3, 2, perspectiveScale)
            ..rotateY(-angle * (1 - animation.value))
            ..leftTranslate(
              width * (1 - animation.value),
            ),
          child: enterPage,
        ),
      ],
    );
  }
}