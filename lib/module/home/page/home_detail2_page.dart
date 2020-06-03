import 'package:flutter/material.dart';
import 'package:flutter_base/flutter_base.dart';

class HomeDetail2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Counter>(
      create: (context) => Counter(),
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
                  Text("${Provider.of<Counter>(context, listen: true).value}"),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () =>
                  Provider.of<Counter>(context, listen: false).increment(),
              child: Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}

class Counter with ChangeNotifier {
  int value = 0;

  void increment() {
    value++;
    notifyListeners();
  }
}
