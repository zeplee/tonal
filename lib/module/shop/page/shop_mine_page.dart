import 'dart:io';

import 'package:flutter/material.dart';

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
        ),
        body: Text('fdasf'),
        floatingActionButton: FloatingActionButton(
          //TickerProviderStateMixin的界面不设置这个就会黑屏-why
          heroTag: '1',
          tooltip: 'Fade',
          child: FlutterLogo(
            size: 200.0,
          ),
          onPressed: () {},
        ),
      );
}
