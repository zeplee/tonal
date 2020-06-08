import 'package:flutter/material.dart';

///详情页-网络列表
class HomeDetail13Page extends StatelessWidget {
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
        //去除越界效果
        physics: ClampingScrollPhysics(),
        itemBuilder: (context, i) {
          return Text('你好');
        },
      ),
    );
  }
}
