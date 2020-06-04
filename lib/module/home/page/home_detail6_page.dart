import 'package:flutter/material.dart';
import 'package:flutter_base/flutter_base.dart';
import 'package:tonal/common/common.dart';

///详情页-StatefulWidget实现状态刷新
class HomeDetail6Page extends StatefulWidget {
  @override
  _HomeDetail6PageState createState() => _HomeDetail6PageState();
}

class _HomeDetail6PageState extends State<HomeDetail6Page> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          centerTitle: true,
          title: Text("HomeDetail6Page"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.face),
              onPressed: () => RouteHelper.push(
                Global.homeDetail3Page,
              ),
            ),
            IconButton(
              icon: Icon(Icons.developer_mode),
              onPressed: () {
                DebugFloat.show(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              child: Text(
                'You have pushed the button this famany times:',
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontFamily: 'Gotham-Book',
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                  wordSpacing: 3.0,
                  textBaseline: TextBaseline.alphabetic,
                  shadows: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(-1, -1),
                      blurRadius: 5,
                    )
                  ],
                ),
              ),
              onTap: () => RouteHelper.push(
                Global.homeDetail1Page,
                arguments: {"title": "dfahomeDetailPage"},
              ),
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
      ),
    );
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
}
