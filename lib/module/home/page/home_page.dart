import 'package:flutter/material.dart';
import 'package:flutter_base/flutter_base.dart';
import 'package:tonal/common/common.dart';

///首页
class HomePage extends StatelessWidget {
  final items = {
    Global.homeDetail1Page: 'StatefulBuilder',
    Global.homeDetail2Page: 'ChangeNotifierProvider',
    Global.homeDetail3Page: 'ValueListenableBuilder',
    Global.homeDetail4Page: 'ValueListenableProvider',
    Global.homeDetail5Page: '自创ValueNotifier',
    Global.homeDetail6Page: 'StatefulWidget',
    Global.homeDetail7Page: '网络列表',
  };

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
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          centerTitle: true,
          title: Text("首页"),
        ),
      );

  _buildBody() => ListView.builder(
        itemCount: items.length,
        //去除越界效果
        physics: ClampingScrollPhysics(),
        itemBuilder: (context, i) {
          return SizedBox(
            height: 40,
            child: FlatButton(
              color: Colors.blue,
              shape: StadiumBorder(),
              child: Text(items.values.toList()[i]),
              onPressed: () {
                RouteHelper.push(
                  items.keys.toList()[i],
                  arguments: {"title": "dfahomeDetailPage"},
                );
              },
            ),
          );
        },
      );

  _onBack(BuildContext context) => () async {
        if (!AppUtils.doubleClickExit(1)) {
          ToastHelper.show(context, ToastHelper.getDefault(context, "再次点击返回"));
          return false;
        }
        return true;
      };
}
