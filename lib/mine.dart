import 'dart:math';

import 'package:flutter/material.dart';

class MinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('MinePage'),
        ),
        body: MineBody(),
      );
}

class MineBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MineBodyState();
}

class MineBodyState extends State<MineBody> with TickerProviderStateMixin {
  AnimationController controller;
  CurvedAnimation curve;

  double _width = 50;
  double _height = 50;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);
  bool _visible = true;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    curve = CurvedAnimation(parent: controller, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(
          children: <Widget>[
            //动画形式Transition;AnimatedContainer;AnimatedOpacity
            Container(
                child: FadeTransition(
                    opacity: curve,
                    child: FlutterLogo(
                      size: 100.0,
                    ))),
            AnimatedContainer(
              width: _width,
              height: _height,
              decoration: BoxDecoration(
                color: _color,
                borderRadius: _borderRadius,
              ),
              duration: Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
            ),
            AnimatedOpacity(
              // If the widget is visible, animate to 0.0 (invisible).
              // If the widget is hidden, animate to 1.0 (fully visible).
              opacity: _visible ? 1.0 : 0.0,
              duration: Duration(milliseconds: 500),
              // The green box must be a child of the AnimatedOpacity widget.
              child: Container(
                width: 200.0,
                height: 200.0,
                color: Colors.green,
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Fade',
          child: GestureDetector(
            child: RotationTransition(
                turns: curve,
                child: FlutterLogo(
                  size: 200.0,
                )),
            onDoubleTap: () {
              setState(() {
                final random = Random();
                _width = random.nextInt(300).toDouble();
                _height = random.nextInt(300).toDouble();
                _color = Color.fromRGBO(
                  random.nextInt(256),
                  random.nextInt(256),
                  random.nextInt(256),
                  1,
                );
                _borderRadius =
                    BorderRadius.circular(random.nextInt(100).toDouble());
              });
            },
            onLongPress: (){
              setState(() {
                _visible = !_visible;
              });
            },
          ),
          onPressed: () {
            if (!controller.isAnimating) {
              if (!controller.isCompleted) {
                controller.forward();
              } else {
                controller.reverse();
              }
            }
          },
        ),
      );
}
