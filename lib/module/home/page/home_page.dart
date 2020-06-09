import 'package:flutter/material.dart';
import 'package:flutter_base/flutter_base.dart';
import 'package:tonal/common/common.dart';

///首页
class HomePage extends StatelessWidget {
  final items = {
    'StatefulBuilder': Global.homeDetail1Page,
    'ChangeNotifierProvider': Global.homeDetail2Page,
    'ValueListenableBuilder': Global.homeDetail3Page,
    'ValueListenableProvider': Global.homeDetail4Page,
    '自创ValueNotifier': Global.homeDetail5Page,
    'StatefulWidget': Global.homeDetail6Page,
    'StatefulWidget+': Global.homeDetail7Page,
    '画板': Global.homeDetail8Page,
    '动画-AnimatedOpacity': Global.homeDetail9Page,
    '动画-AnimatedContainer': Global.homeDetail10Page,
    '动画-Transition': Global.homeDetail11Page,
    '小组件': Global.homeDetail12Page,
    '本地列表': Global.homeDetail13Page,
    '网络列表': Global.homeDetail14Page,
    '商城模版': Global.shopIndexPage,
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
        //去除越界效果
        physics: ClampingScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, i) => _buildItem(context, i),
      );

  _buildItem(context, int i) => SizedBox(
        height: 50,
        child: FlatButton(
          child: Text(
            items.keys.toList()[i],
          ),
          onPressed: () {
            RouteHelper.push(
              items.values.toList()[i],
              arguments: {"title": "dfahomeDetailPage"},
            );
          },
        ),
      );

  _onBack(BuildContext context) => () async {
        if (!AppUtils.doubleClickExit(1)) {
          ToastHelper.show(context, ToastHelper.getDefault(context, "再次点击返回"));
          return false;
        }
        return true;
      };
}
