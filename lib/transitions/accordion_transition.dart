import 'package:advance_screen_transitions/transition.dart';
import 'package:flutter/material.dart';

class AccordionTransition extends Transition {
  final Curve curve;
  final AxisDirection direction;
  final AlignmentGeometry _enterPageAlignment;
  final AlignmentGeometry _exitPageAlignment;

  AccordionTransition({
    this.curve = Curves.easeOutSine,
    this.direction = AxisDirection.left,
    required AlignmentGeometry enterPageAlignment,
    required AlignmentGeometry exitPageAlignment,
  })  : _enterPageAlignment =
  _getEnterPageAlignment(direction, enterPageAlignment),
        _exitPageAlignment =
        _getExitPageAlignment(direction, exitPageAlignment);

  @override
  Widget build(BuildContext context, Widget enterPage, Widget exitPage,
      Animation<double> animation) {
    animation = CurvedAnimation(parent: animation, curve: curve);
    return Stack(
      children: [
        Transform(
          alignment: _exitPageAlignment,
          transform: (direction == AxisDirection.left ||
              direction == AxisDirection.right)
              ? (Matrix4.identity()..scale(1.0 - animation.value, 1.0))
              : (Matrix4.identity()..scale(1.0, 1.0 - animation.value)),
          child: exitPage,
        ),
        Transform(
          alignment: _enterPageAlignment,
          transform: (direction == AxisDirection.left ||
              direction == AxisDirection.right)
              ? (Matrix4.identity()..scale(animation.value, 1.0))
              : (Matrix4.identity()..scale(1.0, animation.value)),
          child: enterPage,
        ),
      ],
    );
  }

  static AlignmentGeometry _getEnterPageAlignment(
      AxisDirection direction, AlignmentGeometry alignmentGeometry) {
    return alignmentGeometry;
    /*switch (direction) {
      case AxisDirection.up:
        return Alignment.bottomCenter;
      case AxisDirection.right:
        return Alignment.centerLeft;
      case AxisDirection.down:
        return Alignment.topCenter;
      case AxisDirection.left:
      default:
        return Alignment.centerRight;
    }*/
  }

  static AlignmentGeometry _getExitPageAlignment(
      AxisDirection direction, AlignmentGeometry alignmentGeometry) {
    return alignmentGeometry;
    /*switch (direction) {
      case AxisDirection.up:
        return Alignment.topCenter;
      case AxisDirection.right:
        return Alignment.centerRight;
      case AxisDirection.down:
        return Alignment.bottomCenter;
      case AxisDirection.left:
      default:
        return Alignment.centerLeft;
    }*/
  }
}