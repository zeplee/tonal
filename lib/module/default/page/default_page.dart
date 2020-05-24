import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//缺省页
class DefaultPage extends StatelessWidget {
  final ValueNotifier<int> _counter = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
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
                  Consumer<ValueNotifier<int>>(
                    builder: (context, counter, child) =>
                        Text("${counter.value}"),
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

//class Counter with ChangeNotifier {
//  int value = 0;
//
//  void increment() {
//    value += 1;
//    notifyListeners();
//  }
//}
