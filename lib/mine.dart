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

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    curve = CurvedAnimation(parent: controller, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
        child: Container(
            child: FadeTransition(
                opacity: curve,
                child: FlutterLogo(
                  size: 100.0,
                )))),
    floatingActionButton: FloatingActionButton(
      tooltip: 'Fade',
      child: GestureDetector(
        child: RotationTransition(
            turns: curve,
            child: FlutterLogo(
              size: 200.0,
            )),
        onDoubleTap: () {
          if (controller.isCompleted) {
            controller.reverse();
          } else {
            controller.forward();
          }
        },
      ),
      onPressed: () {
        controller.forward();
      },
    ),
  );
}

