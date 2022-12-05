import 'package:advance_screen_transitions/transition.dart';
import 'package:flutter/material.dart';

class AdvancePageRoute extends PageRouteBuilder {
  AdvancePageRoute({
    Duration transitionDuration = const Duration(milliseconds: 300),
    bool opaque = true,
    bool barrierDismissible = false,
    bool maintainState = true,
    bool fullscreenDialog = false,
    required Widget enterPage,
    required Widget exitPage,
    required Transition transition,
  }) : super(
    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) => enterPage,
    transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) =>
        transition.build(context, enterPage, exitPage, animation),
    transitionDuration: transitionDuration,
    opaque: opaque,
    barrierDismissible: barrierDismissible,
    maintainState: maintainState,
    fullscreenDialog: fullscreenDialog,
    reverseTransitionDuration: transitionDuration,
  );
}
