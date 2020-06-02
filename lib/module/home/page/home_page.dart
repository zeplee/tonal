import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tonal/common/helper/helper.dart';
import 'package:tonal/common/utils/utils.dart';
import 'package:tonal/common/widget/widget.dart';

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
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.face),
                onPressed: () => RouteHelper.push(
                  RouteHelper.homeRecommendPage,
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
                  RouteHelper.homeDetailPage,
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
      ),
    );
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
}
