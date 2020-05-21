import 'package:flutter/material.dart';

//缺省页
class DefaultPage extends StatefulWidget {
  DefaultPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DefaultPageState createState() => _DefaultPageState();
}

class _DefaultPageState extends State<DefaultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          centerTitle: true,
          title: Text(widget.title),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'DefaultPage',
            ),
          ],
        ),
      ),
    );
  }
}
