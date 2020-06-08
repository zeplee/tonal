import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tonal/common/common.dart';

class ShopMinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ShopMinePageState();
}

class ShopMinePageState extends State<ShopMinePage> {
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
                  Navigator.of(context).pushNamed(Global.shopAboutPage),
            ),
            IconButton(
              icon: Icon(Icons.supervised_user_circle),
              onPressed: () =>
                  Navigator.of(context).pushNamed(Global.shopLoginPage),
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () =>
                  Navigator.of(context).pushNamed(Global.shopSettingsPage),
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
