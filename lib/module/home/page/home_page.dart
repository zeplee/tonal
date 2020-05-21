import 'package:flutter/material.dart';
import 'package:tonal/helper/route_helper.dart';
import 'package:tonal/helper/toast_helper.dart';
import 'package:tonal/utils/app_utils.dart';

//首页
class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (!AppUtils.doubleClickExit(1)) {
          ToastHelper.show(context, "再次点击返回", duration: 2);
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            centerTitle: true,
            title: Text(widget.title),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                  child: Text(
                    'You have pushed the button this many times:',
                  ),
                  onTap: () => RouteHelper.push(RouteHelper.detailPage,
                      arguments: {"title": "DetailPage"})),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          child: Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }

  void _incrementCounter() {
//    Navigator.pushna(context, AppPageRouteBuilder(CartsPage()));
    setState(() {
      _counter = 1;
      _counter++;
    });
  }
}
