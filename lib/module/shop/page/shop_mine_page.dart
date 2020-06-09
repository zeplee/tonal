import 'package:flutter/material.dart';

class ShopMinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('MinePage'),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Text('fdasf'),
        floatingActionButton: FloatingActionButton(
          heroTag: '1',
          tooltip: 'Fade',
          child: FlutterLogo(
            size: 200.0,
          ),
          onPressed: () {},
        ),
      );
}
