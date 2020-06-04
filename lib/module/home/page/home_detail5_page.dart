import 'package:flutter/material.dart';
import 'package:flutter_base/flutter_base.dart';

///详情页-自创ValueNotifier实现控件调用其他控件的setState方法
class HomeDetail5Page extends StatelessWidget {
  final ValueNotifier<int> _counter = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          automaticallyImplyLeading: false, //是否自动加返回键
          centerTitle: true,
          title: Text("HomeDetail5Page"),
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
            IncrementWidget(counter: _counter),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
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
