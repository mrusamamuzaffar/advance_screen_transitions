import 'package:advance_screen_transitions/transition.dart';
import 'package:flutter/material.dart';

class ForegroundToBackgroundTransition extends Transition {
  final Curve curve;
  final Color backgroundColor;
  final double scale;

  ForegroundToBackgroundTransition({
    this.curve = Curves.easeOutSine,
    this.backgroundColor = Colors.black,
    this.scale = 0.5,
  });

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
            ..scale(1.0 - (1.0 - scale) * animation.value)
            ..leftTranslate(-width * animation.value),
          child: exitPage,
        ),
        Transform(
          transform: Matrix4.identity()
            ..translate(width * (1.0 - animation.value)),
          child: enterPage,
        ),
      ],
    );
  }
}