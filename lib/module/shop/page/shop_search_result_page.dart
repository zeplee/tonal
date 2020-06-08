import 'package:flutter/material.dart';

class ShopSearchResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('SearchPage'),
        ),
        endDrawer: Drawer(
          child: ListView(
            //少量列表不需要使用listview.builder
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Drawer Header'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Item 1'),
                onTap: () {
                  //close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: ShopSearchResultBody(),
      );
}

//演示两个控件，一个控件控制另一个控件的显示状态时，父控件为有状态，两个子控件无状态
class ShopSearchResultBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            width: double.infinity,
            height: 200.0,
            child: Row(
              //字体底部对齐或首字母底部对齐,目前只对英文有效
              textBaseline: TextBaseline.ideographic,
              //想象一个坐标轴
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.center,
              verticalDirection: VerticalDirection.up,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              children: <Widget>[
                CounterWidget(),
                BlueBox(),
                BlueBox(),
//            Text('Hey!', style: TextStyle(fontSize: 30)),
//            Text('Hey!', style: TextStyle(fontSize: 50)),
//            Text('Hey!', style: TextStyle(fontSize: 40)),
              ],
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              fit: FlexFit.loose,
              flex: 1,
              child: BlueBox(),
            ),
            Flexible(
              fit: FlexFit.loose,
              flex: 1,
              child: BlueBox(),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: BlueBox(),
            ),
          ],
        )
      ],
    );
  }
}

//演示两个控件，一个控件控制另一个控件的显示状态时，父控件为有状态，两个子控件无状态
class CounterWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CounterWidgetState();
}

class CounterWidgetState extends State<CounterWidget> {
  int _count = 0;

  void _increment() {
    setState(() {
      ++_count;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      CounterIncrementor(onPressed: _increment),
      CounterDisplay(count: _count),
    ]);
  }
}

//显示计数器
class CounterDisplay extends StatelessWidget {
  final int count;

  CounterDisplay({this.count});

  @override
  Widget build(BuildContext context) {
    return Text('Count: $count');
  }
}

//更改计数器
class CounterIncrementor extends StatelessWidget {
  final VoidCallback onPressed;

  CounterIncrementor({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      child: Text('Increment'),
    );
  }
}

class BlueBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      child: Text(
        'fdaf',
        textAlign: TextAlign.center,
        textScaleFactor: 1.8,
      ),
      decoration: BoxDecoration(
          color: Colors.blue,
          border: Border.all(color: Colors.black),
          boxShadow: [
            BoxShadow(
                color: Colors.red,
                offset: Offset(-5.0, 1.0),
                blurRadius: 5.0,
                spreadRadius: 0.0)
          ]),
    );
  }
}
