import 'package:flutter/material.dart';

///动画-Transition
class HomeDetail11Page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeDetail11PageState();
}

class HomeDetail11PageState extends State<HomeDetail11Page>
    with TickerProviderStateMixin {
  AnimationController _controller;
  CurvedAnimation _curve;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    _curve = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Fade',
        child: RotationTransition(
          turns: _curve,
          child: FlutterLogo(
            size: 200.0,
          ),
        ),
        onPressed: () {
          if (!_controller.isAnimating) {
            if (!_controller.isCompleted) {
              _controller.forward();
            } else {
              _controller.reverse();
            }
          }
        },
      ),
    );
  }

  _buildAppBar() => PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          centerTitle: true,
          title: Text("动画-Transition"),
        ),
      );

  _buildBody() => Column(
        children: <Widget>[
          Container(
            child: FadeTransition(
              opacity: _curve,
              child: FlutterLogo(
                size: 100.0,
              ),
            ),
          ),
        ],
      );
}
