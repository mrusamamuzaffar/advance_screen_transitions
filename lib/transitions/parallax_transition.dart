import 'package:advance_screen_transitions/transition.dart';
import 'package:flutter/material.dart';

class ParallaxTransition extends Transition {
  final Curve curve;
  final double offset;

  ParallaxTransition({
    this.curve = Curves.easeOutSine,
    this.offset = 0.2,
  });

  @override
  Widget build(BuildContext context, Widget enterPage, Widget exitPage,
      Animation<double> animation) {
    animation = CurvedAnimation(parent: animation, curve: curve);
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Transform(
          transform: Matrix4.identity()..translate(-width * animation.value),
          child: exitPage,
        ),
        ClipRect(
          clipper: ParallaxClipper(value: animation.value),
          child: Transform(
            transform: Matrix4.identity()
              ..translate(width * offset * (1.0 - animation.value)),
            child: enterPage,
          ),
        ),
      ],
    );
  }
}

class ParallaxClipper extends CustomClipper<Rect> {
  final double value;

  ParallaxClipper({required this.value});

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(size.width * (1 - value), 0, size.width, size.height);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}