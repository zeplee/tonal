import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/flutter_base.dart';

///详情页-ValueListenableBuilder(ValueNotifier+ValueListenableBuilder最简单方便的方案实现局部刷新)
class HomeDetail3Page extends StatelessWidget {
  final ValueNotifier<int> _counter = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          automaticallyImplyLeading: false, //是否自动加返回键
          centerTitle: true,
          title: Text("HomeDetail3Page"),
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
                RouteHelper.pop();
              },
            ),
            ValueListenableBuilder<int>(
              valueListenable: _counter,
              builder: (BuildContext context, int value, Widget child) => Text(
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
    );
  }
}
