import 'package:flutter/material.dart';

class HomeRecommendPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          centerTitle: true,
          title: Text("推荐页"),
        ),
      ),
      body: ListView.builder(
        physics: ClampingScrollPhysics(),
        itemBuilder: (context, i) {
          return Text('你好');
        },
      ),
    );
  }
}
