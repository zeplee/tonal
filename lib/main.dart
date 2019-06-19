import 'dart:io';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
  if (Platform.isAndroid) {
    //android设置状态栏纯色，ios默认纯色
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        textSelectionColor: Colors.red,
      ),
      routes: {
        //路由
        'minePage': (BuildContext context) => MinePage(),
        'cartsPage': (BuildContext context) => CartsPage(),
        'categoryPage': (BuildContext context) => CategoryPage(),
        'searchPage': (BuildContext context) => SearchPage(),
      },
      home: MainPage());
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  static const List<Widget> mainPages = [
    HomePage(),
    CategoryPage(),
    CartsPage(),
    CartsPage(),
    MinePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: mainPages.elementAt(currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('首页'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('分类'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            title: Text('店铺'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text('购物车'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('我的'),
          ),
        ],
        onTap: onItemSelect,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  void onItemSelect(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: PreferredSize(
            child: AppBar(
              leading: IconButton(
                icon: Icon(Icons.mms),
                tooltip: 'Navigation menu',
                onPressed: () =>
                    Navigator.of(context).pushNamed('categoryPage'),
              ),
              title: TextField(
                  onSubmitted: (String text) {
                    if (text.isNotEmpty) {
                      Navigator.of(context).pushNamed('searchPage');
                    }
                  },
                  decoration: InputDecoration(hintText: "search hint")),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.face),
                  onPressed: () => Navigator.of(context).pushNamed('cartsPage'),
//                  Navigator.of(context).push(MaterialPageRoute(
//                  builder: (BuildContext context) => CartsPage())),
                ),
                IconButton(
                  icon: Icon(Icons.list),
                  onPressed: () => Navigator.of(context).pushNamed('minePage'),
                ),
              ],
            ),
            preferredSize: Size.fromHeight(40.0)),
        body: HomeBody(),
      );
}

class MinePage extends StatelessWidget {
  const MinePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('MinePage'),
        ),
        body: MineBody(),
      );
}

class CartsPage extends StatelessWidget {
  const CartsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('CartsPage'),
        ),
        body: CartsBody(),
      );
}

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('CategoryPage'),
        ),
        body: CategoryBody(),
      );
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('SearchPage'),
        ),
        body: SearchBody(),
      );
}

//演示两个控件，一个控件控制另一个控件的显示状态时，父控件为有状态，两个子控件无状态
class SearchBody extends StatelessWidget {
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
//class HomeAppBar extends StatefulWidget {
//  @override
//  State createState() => HomeAppBarState();
//}
//
//class HomeAppBarState extends State<HomeAppBar> {
//  @override
//  Widget build(BuildContext context) {
//    return null;
//  }
//}

class HomeBody extends StatefulWidget {
  @override
  HomeBodyState createState() => HomeBodyState();
}

class MineBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MineBodyState();
}

class CartsBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CartsBodyState();
}

class CategoryBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CategoryBodyState();
}

class CategoryBodyState extends State<CategoryBody> {
  List _datas = [];

  @override
  void initState() {
    super.initState();
    //网路数据
    loadData();
  }

  loadData() async {
    String url = "https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.get(url);
    setState(() {
      _datas = json.decode(response.body);
    });
  }

  @override
  Widget build(BuildContext context) => _datas.length == 0
      ? Center(child: CircularProgressIndicator()) //开始数量为0时，显示转圈进度
      : ListView.builder(
          padding: const EdgeInsets.all(16.0),
//      itemCount: _datas.length,//写上这个
          itemBuilder: (context, i) {
            if (i.isOdd) return Divider();
            final index = i ~/ 2; //item的真实位置
            if (true) {
              //无限列表
              if (index >= _datas.length) {
                //绘制到结尾了
                _datas.addAll(_datas.take(10));
              }
              if (index < _datas.length) {
                return CategoryListItem(_datas[index]);
              }
            } else {
              //有限列表
              return CategoryListItem(_datas[index]);
            }
          });
}

class CartsBodyState extends State<CartsBody> {
  List<Offset> _points = <Offset>[];

  @override
  Widget build(BuildContext context) => GestureDetector(
        onPanUpdate: (DragUpdateDetails details) {
          setState(() {
            RenderBox referenceBox = context.findRenderObject();
            _points = List.from(_points)
              ..add(referenceBox.globalToLocal(details.globalPosition));
          });
        },
        onPanEnd: (DragEndDetails details) => _points.add(null),
        child: CustomPaint(
            painter: SignaturePainter(_points), size: Size.infinite),
      );
}

class SignaturePainter extends CustomPainter {
  SignaturePainter(this.points);

  final List<Offset> points;

  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i], points[i + 1], paint);
      }
    }
  }

  bool shouldRepaint(SignaturePainter other) => other.points != points;
}

class MineBodyState extends State<MineBody> with TickerProviderStateMixin {
  AnimationController controller;
  CurvedAnimation curve;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    curve = CurvedAnimation(parent: controller, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
            child: Container(
                child: FadeTransition(
                    opacity: curve,
                    child: FlutterLogo(
                      size: 100.0,
                    )))),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Fade',
          child: GestureDetector(
            child: RotationTransition(
                turns: curve,
                child: FlutterLogo(
                  size: 200.0,
                )),
            onDoubleTap: () {
              if (controller.isCompleted) {
                controller.reverse();
              } else {
                controller.forward();
              }
            },
          ),
          onPressed: () {
            controller.forward();
          },
        ),
      );
}

class HomeBodyState extends State<HomeBody> {
  final _datas = <WordPair>[];

  @override
  void initState() {
    super.initState();
    //本地数据
    _datas.addAll(generateWordPairs().take(10));
  }

  @override
  Widget build(BuildContext context) => ListView.builder(
      //使用builder有自动回收功能
      padding: const EdgeInsets.all(16.0),
//      itemCount: _datas.length,//有分割线的话得好好算算这个数量，或者用另一种办法，将分割线放入item中，位置就对了，但是没这个酷炫
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider();
        final index = i ~/ 2; //item的真实位置
        if (true) {
          //无限列表
          if (index >= _datas.length) {
            //绘制到结尾了
            _datas.addAll(generateWordPairs().take(10));
          }
          return HomeBodyListItem(_datas[index]);
        } else {
          //有限列表
          if (index < _datas.length) {
            //如果不判断到话，会继续绘制null条目，因为这个不加itemCount的话是无限循环绘制；不判断也可以，加上itemCount属性
            return HomeBodyListItem(_datas[index]);
          }
        }
      });
}

class HomeBodyListItem extends StatefulWidget {
  final WordPair data;

  HomeBodyListItem(this.data) : super();

  @override
  State<StatefulWidget> createState() => HomeBodyListItemState();
}

class HomeBodyListItemState extends State<HomeBodyListItem> {
  var _isFavorite = false;
  String _errorText;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Column One', style: Theme.of(context).primaryTextTheme.title),
          IconButton(
            icon: Icon(Icons.backspace),
            onPressed: () {
              _saveSp();
            },
          ),
          Center(
            child: TextField(
              onSubmitted: (String text) {
                setState(() {
                  if (!RegExp(
                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                      .hasMatch(text)) {
                    _errorText = 'Error: This is not an email';
                  } else {
                    _errorText = null;
                  }
                });
              },
              decoration: InputDecoration(
                  hintText: "This is a hint", errorText: _errorText),
            ),
          ),
          ListTile(
              title: Text(
                widget.data.asPascalCase,
                style: TextStyle(fontSize: 10.0),
              ),
              trailing: IconButton(
                icon:
                    Icon(_isFavorite ? Icons.favorite_border : Icons.favorite),
                onPressed: () => setState(() => _isFavorite = !_isFavorite),
              ),
              onTap: () {
                print("tap");
              })
        ],
      );

  _saveSp() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter = (prefs.getInt('counter') ?? 0) + 1;
    print('Pressed $counter times.');
    prefs.setInt('counter', counter);
  }
}

class CategoryListItem extends StatefulWidget {
  var data;

  CategoryListItem(this.data) : super();

  @override
  State<StatefulWidget> createState() => CategoryItemState();
}

class CategoryItemState extends State<CategoryListItem> {
  var _isFavorite = false;

  @override
  Widget build(BuildContext context) => ListTile(
      title: Text(
        widget.data['title'],
        style: TextStyle(fontSize: 10.0),
      ),
      onTap: () {});
}
