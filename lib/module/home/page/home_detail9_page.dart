import 'package:flutter/material.dart';

///动画-AnimatedOpacity 透明度变化
class HomeDetail9Page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeDetail9PageState();
}

class HomeDetail9PageState extends State<HomeDetail9Page> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: AnimatedOpacity(
        opacity: _visible ? 1.0 : 0.0,
        duration: Duration(milliseconds: 500),
        child: Container(
          width: 200.0,
          height: 200.0,
          color: Colors.green,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Fade',
        child: GestureDetector(
          child: FlutterLogo(
            size: 200.0,
          ),
        ),
        onPressed: () {
          setState(() {
            _visible = !_visible;
          });
        },
      ),
    );
  }

  _buildAppBar() => PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          centerTitle: true,
          title: Text("动画-AnimatedOpacity"),
        ),
      );
}
