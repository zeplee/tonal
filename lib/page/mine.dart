import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tonal/helper/route_helper.dart';

class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MinePageState();
}

class MinePageState extends State<MinePage> {
  @override
  void initState() {
    HttpClient();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('MinePage'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.import_contacts),
              onPressed: () =>
                  Navigator.of(context).pushNamed(RouteHelper.aboutPage),
            ),
            IconButton(
              icon: Icon(Icons.supervised_user_circle),
              onPressed: () =>
                  Navigator.of(context).pushNamed(RouteHelper.loginPage),
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () =>
                  Navigator.of(context).pushNamed(RouteHelper.settingsPage),
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
