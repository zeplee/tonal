import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base/flutter_base.dart';

///欢迎页
class GreetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBack(),
      child: Container(
//        decoration: BoxDecoration(
//          image: DecorationImage(
////            image: NetworkImage(
////                'https://img.zcool.cn/community/0372d195ac1cd55a8012062e3b16810.jpg'),
//            image: CachedNetworkImageProvider(
//              'https://img.zcool.cn/community/0372d195ac1cd55a8012062e3b16810.jpg',
//            ),
//            fit: BoxFit.cover,
//          ),
//        ),
        child: Scaffold(
          //背景色改成透明
          backgroundColor: Colors.transparent,
          appBar: _buildAppBar(),
          body: _buildBody(context),
        ),
      ),
    );
  }

  _buildAppBar() => PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          //状态栏是否是亮色
          brightness: Brightness.dark,
          //背景色改成透明
          backgroundColor: Colors.transparent,
          //appbar的阴影
          elevation: 0,
          //是否自动加返回键
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text("GreetPage"),
        ),
      );

  _buildBody(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              child: SvgPicture.asset(
                'assets/images/svg2.svg',
                width: 100,
              ),
              onTap: () {
                ToastHelper.show(
                    context, ToastHelper.getDefault(context, "退出欢迎页"));
                RouteHelper.pop();
              },
            ),
          ],
        ),
      );

  _onBack() => () async => false; //拦截返回
}
