import 'package:flutter/material.dart';
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
              IncrementWidget(counter: _counter),
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
    _counter.value++;
  }
}

class IncrementWidget extends StatefulWidget {
  final ValueNotifier<int> counter;

  IncrementWidget({Key key, this.counter}) : super(key: key);

  @override
  _IncrementWidgetState createState() => _IncrementWidgetState();
}

class _IncrementWidgetState extends State<IncrementWidget> {
  didValueChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    widget.counter.addListener(didValueChange);
    return Text(
      '${widget.counter.value}',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
