import 'package:advance_screen_transitions/transition.dart';
import 'package:advance_screen_transitions/transitions/accordion_transition.dart';
import 'package:advance_screen_transitions/transitions/background_to_foreground_transition.dart';
import 'package:advance_screen_transitions/transitions/cube_transition.dart';
import 'package:advance_screen_transitions/transitions/default_transition.dart';
import 'package:advance_screen_transitions/transitions/depth_transition.dart';
import 'package:advance_screen_transitions/transitions/flip_horizontal_transition.dart';
import 'package:advance_screen_transitions/transitions/flip_vertical_transition.dart';
import 'package:advance_screen_transitions/transitions/foreground_to_background_transition.dart';
import 'package:advance_screen_transitions/transitions/parallax_transition.dart';
import 'package:advance_screen_transitions/transitions/rotate_down_transition.dart';
import 'package:advance_screen_transitions/transitions/rotate_up_transition.dart';
import 'package:advance_screen_transitions/transitions/stack_transition.dart';
import 'package:advance_screen_transitions/transitions/tablet_transition.dart';
import 'package:advance_screen_transitions/transitions/zoom_out_slide_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'advance_page_route.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Advance Screen Transitions',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {

  final Map<String, Transition> transitionsMap = {
    'Cube': CubeTransition(),
    'Accordion': AccordionTransition(enterPageAlignment: Alignment.bottomCenter, exitPageAlignment: Alignment.topCenter),
    'Background To Foreground': BackgroundToForegroundTransition(),
    'Foreground To Background': ForegroundToBackgroundTransition(),
    'Depth': DepthTransition(),
    'Flip Horizontal': FlipHorizontalTransition(),
    'Flip Vertical': FlipVerticalTransition(),
    'Parallax': ParallaxTransition(),
    'Rotate Down': RotateDownTransition(),
    'Rotate Up': RotateUpTransition(),
    'Stack': StackTransition(),
    'Tablet': TabletTransition(),
    'Zoom Out Slide': ZoomOutSlideTransition(),
    'Default': DefaultTransition(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.yellow,
        child: Wrap(
          spacing: 10,
          runSpacing: 20,
          alignment: WrapAlignment.center,
          children: transitionsMap.entries.map((MapEntry<String, Transition> e) => ElevatedButton(
            child: Text(e.key),
            onPressed: () => Navigator.push(
              context,
              AdvancePageRoute(
                transitionDuration: const Duration(milliseconds: 1000),
                exitPage: widget,
                enterPage: const SecondScreen(),
                transition: e.value,
              ),
            ),
          ),
          ).toList(),
        ),
        /*child: ElevatedButton(
          child: const Text("Open"),
          onPressed: () => Navigator.push(
            context,
            AdvancePageRoute(
              transitionDuration: const Duration(milliseconds: 1000),
              exitPage: widget,
              enterPage: const SecondScreen(),
              transition: CubeTransition(),
            ),
          ),
        ),*/
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.red,
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Go Back"),
        ),
      ),
    );
  }
}
