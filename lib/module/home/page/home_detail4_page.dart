import 'package:flutter/material.dart';
import 'package:flutter_base/flutter_base.dart';

///详情页-ValueListenableProvider(ValueListenableProvider+ValueNotifier状态管理框架实现局部刷新,只支持单一数据，但是像原生的ValueListenableBuilder用法很像)
class HomeDetail4Page extends StatelessWidget {
  final ValueNotifier<int> _counter = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return ValueListenableProvider(
      create: (context) => _counter,
      child: Builder(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(50.0),
              child: AppBar(
                centerTitle: true,
                title: Text("空页面"),
              ),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Consumer<int>(
                    builder: (context, counter, child) => Text("${counter}"),
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => _counter.value += 1,
              child: Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}
