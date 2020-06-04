import 'package:flutter/material.dart';
import 'package:flutter_base/flutter_base.dart';

///首页
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBack(context),
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
      ),
    );
  }

  _buildAppBar() => PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          centerTitle: true,
          title: Text("首页"),
        ),
      );

  _buildBody() => ListView.builder(
        //去除越界效果
        physics: ClampingScrollPhysics(),
        itemBuilder: (context, i) {
          return Text('你好');
        },
      );

  _onBack(BuildContext context) => () async {
        if (!AppUtils.doubleClickExit(1)) {
          ToastHelper.show(context, "再次点击返回");
          return false;
        }
        return true;
      };
}
