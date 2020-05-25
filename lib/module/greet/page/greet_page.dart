import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tonal/helper/route_helper.dart';
import 'package:tonal/helper/toast_helper.dart';

//欢迎页
class GreetPage extends StatelessWidget {
  final ValueNotifier<int> _counter = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        //拦截返回
        return false;
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://img.zcool.cn/community/0372d195ac1cd55a8012062e3b16810.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          //背景色改成透明
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
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
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  child: Text(
                    'goBack',
                  ),
                  onTap: () {
                    ToastHelper.show(context, "退出欢迎页");
                    RouteHelper.pop();
                  },
                ),
                ValueListenableBuilder<int>(
                  valueListenable: _counter,
                  builder: (BuildContext context, int value, Widget child) =>
                      Text(
                    '$value',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _counter.value++,
            child: Icon(Icons.add),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ),
      ),
    );
  }
}
