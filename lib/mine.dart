import 'dart:math';
import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MinePageState();
}

class MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('MinePage'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.import_contacts),
              onPressed: () => Navigator.of(context).pushNamed('aboutPage'),
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () => Navigator.of(context).pushNamed('settingsPage'),
            ),
          ],
        ),
        body: Text('fdasf'),
        floatingActionButton: FloatingActionButton(
          //TickerProviderStateMixin的界面不设置这个就会黑屏-why
          heroTag: 'fda',
          tooltip: 'Fade',
          child: FlutterLogo(
            size: 200.0,
          ),
          onPressed: () {},
        ),
      );
}
