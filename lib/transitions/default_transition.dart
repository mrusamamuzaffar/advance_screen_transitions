import 'package:advance_screen_transitions/transition.dart';
import 'package:flutter/material.dart';

class DefaultTransition extends Transition {
  final Curve curve;
  final AxisDirection direction;

  DefaultTransition({
    this.curve = Curves.easeOutSine,
    this.direction = AxisDirection.left,
  });

  @override
  Widget build(BuildContext context, Widget enterPage, Widget exitPage,
      Animation<double> animation) {
    animation = CurvedAnimation(parent: animation, curve: curve);
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Transform(
          transform: Matrix4.identity()
            ..translate(
                direction == AxisDirection.left
                    ? -width * animation.value
                    : direction == AxisDirection.right
                    ? width * animation.value
                    : 0.0,
                direction == AxisDirection.up
                    ? -height * animation.value
                    : direction == AxisDirection.down
                    ? height * animation.value
                    : 0.0),
          child: exitPage,
        ),
        Transform(
          transform: Matrix4.identity()
            ..translate(
                direction == AxisDirection.left
                    ? width * (1.0 - animation.value)
                    : direction == AxisDirection.right
                    ? -width * (1.0 - animation.value)
                    : 0.0,
                direction == AxisDirection.up
                    ? height * (1.0 - animation.value)
                    : direction == AxisDirection.down
                    ? -height * (1.0 - animation.value)
                    : 0.0),
          child: enterPage,
        ),
      ],
    );
  }
}