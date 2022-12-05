import 'package:flutter/material.dart';

abstract class Transition {
  Widget build(BuildContext context, Widget enterPage, Widget exitPage, Animation<double> animation);
}