import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('myshop'),
        ),
        body: CartsBody(),
      );
}

class CartsBody extends StatefulWidget {
  @override
  State createState() => CartsBodyState();
}

class CartsBodyState extends State<CartsBody> {
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
          return CartsBodyListItem(_datas[index]);
        } else {
          //有限列表
          if (index < _datas.length) {
            //如果不判断到话，会继续绘制null条目，因为这个不加itemCount的话是无限循环绘制；不判断也可以，加上itemCount属性
            return CartsBodyListItem(_datas[index]);
          }
        }
      });
}

class CartsBodyListItem extends StatefulWidget {
  final WordPair data;

  CartsBodyListItem(this.data) : super();

  @override
  State<StatefulWidget> createState() => CartsBodyListItemState();
}

class CartsBodyListItemState extends State<CartsBodyListItem> {
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
