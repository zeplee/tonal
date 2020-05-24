import 'package:flutter/material.dart';
import 'package:tonal/helper/route_helper.dart';
import 'package:tonal/helper/toast_helper.dart';
import 'package:tonal/utils/app_utils.dart';

//首页
class HomePage extends StatefulWidget {
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
          ToastHelper.show(context, "再次点击返回");
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            centerTitle: true,
            title: Text("首页"),
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
                  onTap: () => RouteHelper.push(RouteHelper.defaultPage,
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
        ),
      ),
    );
  }

  void _incrementCounter() {
    setState(() {
      _counter = 1;
      _counter++;
    });
  }
}
