import 'package:advance_screen_transitions/transition.dart';
import 'package:flutter/material.dart';

class ZoomOutSlideTransition extends Transition {
  final Curve curve;
  final AlignmentGeometry enterPageAlignment;
  final AlignmentGeometry exitPageAlignment;
  final double scale;
  final Color backgroundColor;

  ZoomOutSlideTransition({
    this.curve = Curves.easeOutSine,
    this.enterPageAlignment = Alignment.center,
    this.exitPageAlignment = Alignment.center,
    this.scale = 0.8,
    this.backgroundColor = Colors.black,
  });

  @override
  Widget build(BuildContext context, Widget enterPage, Widget exitPage,
      Animation<double> animation) {
    animation = CurvedAnimation(parent: animation, curve: curve);
    double scaleEnter =
    animation.value > scale ? scale + (animation.value - scale) : scale;
    double scaleExit = (1 - animation.value) > scale
        ? scale + (1 - animation.value - scale)
        : scale;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(color: backgroundColor),
        Transform(
          alignment: exitPageAlignment,
          transform: Matrix4.identity()
            ..scale(scaleExit)
            ..leftTranslate(-width * animation.value),
          child: exitPage,
        ),
        Transform(
          alignment: enterPageAlignment,
          transform: Matrix4.identity()
            ..scale(scaleEnter)
            ..leftTranslate(width * (1 - animation.value)),
          child: enterPage,
        ),
      ],
    );
  }
}