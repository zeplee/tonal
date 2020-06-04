import 'package:flutter/material.dart';

///详情页-StatefulBuilder(实现最简单的statefulWidget)
class HomeDetail1Page extends StatelessWidget {
  Map arguments = {};
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    arguments = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          centerTitle: true,
          title: Text(arguments["title"]),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) =>
                  GestureDetector(
                child: Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headline4,
                ),
                onTap: () => {
                  setState(() {
                    _counter++;
                  }),
                },
              ),
            )
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
//    setState(() {
//      _counter = 1;
//      _counter++;
//    });
  }
}
