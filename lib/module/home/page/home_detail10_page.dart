import 'dart:math';

import 'package:flutter/material.dart';

///动画-AnimatedContainer 大小，颜色，圆角
class HomeDetail10Page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeDetail10PageState();
}

class HomeDetail10PageState extends State<HomeDetail10Page> {
  double _width = 50;
  double _height = 50;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Fade',
        child: FlutterLogo(
          size: 200.0,
        ),
        onPressed: () {
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
      ),
    );
  }

  _buildAppBar() => PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          centerTitle: true,
          title: Text("动画-AnimatedContainer"),
        ),
      );

  _buildBody() => AnimatedContainer(
        width: _width,
        height: _height,
        decoration: BoxDecoration(
          color: _color,
          borderRadius: _borderRadius,
        ),
        duration: Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
      );
}
