import 'package:flutter/material.dart';
import 'package:tonal/helper/route_helper.dart';
import 'package:tonal/helper/toast_helper.dart';

//欢迎页
class GreetPage extends StatefulWidget {
  @override
  _GreetPageState createState() => _GreetPageState();
}

class _GreetPageState extends State<GreetPage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        //拦截返回
        return false;
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            automaticallyImplyLeading: false, //是否自动加返回键
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
    setState(() {
      _counter = 1;
      _counter++;
    });
  }
}
