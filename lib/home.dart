import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  List<String> tabTitles;
  List<Widget> tabBodys;
  TabController controller;

  @override
  void initState() {
    super.initState();
    tabTitles = [
      "tab1",
      "tab2",
      "tab3",
      "tab4",
      "tab5",
      "tab6",
      "tab7",
      "tab8",
      "tab9",
    ];
    tabBodys=[
      HomeBody(),
      HomeBody(),
      HomeBody(),
      HomeBody(),
      HomeBody(),
      HomeBody(),
      HomeBody(),
      HomeBody(),
      HomeBody(),
    ];
    controller = TabController(
      length: tabTitles.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: appbar(context),
      body: TabBarView(
          controller: controller,
          children: tabBodys));

  appbar(BuildContext context) =>
//      PreferredSize(
//      child:
      AppBar(
        leading: IconButton(
          icon: Icon(Icons.mms),
          tooltip: 'Navigation menu',
          onPressed: () => Navigator.of(context).pushNamed('categoryPage'),
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
        bottom: tabview(),
//      ),
//      preferredSize: Size.fromHeight(40.0)
  );

  tabview() => TabBar(
      isScrollable: true,
      controller: controller,
      labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      labelColor: Colors.black,
      unselectedLabelColor: Colors.black45,
      indicatorColor :Colors.red,
      indicatorSize :TabBarIndicatorSize.tab,
      indicator: UnderlineTabIndicator(
          insets: EdgeInsets.only(left: 15, right: 15),
          borderSide: BorderSide(width: 4.0, color: Colors.red)),
      tabs: tabTitles.map((item) => Tab(text: item)).toList());
}

class HomeBody extends StatefulWidget {
  @override
  HomeBodyState createState() => HomeBodyState();
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
  Widget build(BuildContext context) => RefreshIndicator(
    //下拉刷新
    child: ListView.builder(
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
        }),
    onRefresh: refresh,
  );

  Future refresh() async {
    // 延迟3秒后添加新数据， 模拟网络加载
    await Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _datas.clear();
        _datas.addAll(generateWordPairs().take(20));
      });
    });
  }
}

class HomeBodyListItem extends StatefulWidget {
  final WordPair data;

  HomeBodyListItem(this.data) : super();

  @override
  State<StatefulWidget> createState() => HomeBodyListItemState();
}

class HomeBodyListItemState extends State<HomeBodyListItem> {
  var _isFavorite = false;

  @override
  Widget build(BuildContext context) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text('Column One', style: Theme.of(context).primaryTextTheme.title),
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
          onTap: () {})
    ],
  );
}