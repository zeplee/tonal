import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<String> tabTitles;
  List<Widget> tabBodys;

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
    tabBodys = [
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
  }

  @override
  Widget build(BuildContext context) =>
//      Container(
//      decoration: BoxDecoration(
//          image: DecorationImage(
//        image: NetworkImage(
//            'https://img.zcool.cn/community/0372d195ac1cd55a8012062e3b16810.jpg'),
//        fit: BoxFit.cover,
//      )),
//      child:
      DefaultTabController(
        length: tabTitles.length,
        child: Scaffold(
//          backgroundColor: Colors.transparent,
            appBar: appBar(context),
            body: TabBarView(children: tabBodys)),
      );

//  );

  appBar(BuildContext context) =>
//      PreferredSize(
//      child:
      AppBar(
//        backgroundColor: Colors.transparent,
        //是否占用状态栏
        primary: true,
        //是否占满剩余空间
        titleSpacing: 0.0,
        toolbarOpacity: 0.6,
        bottomOpacity: 0.6,
        leading: IconButton(
          icon: Icon(Icons.mms),
          tooltip: 'Navigation menu',
          onPressed: () => Navigator.of(context).pushNamed('/categoryPage'),
        ),
        title: TextField(
          textAlign: TextAlign.center,
          onSubmitted: (String text) {
            if (text.isNotEmpty) {
              Navigator.of(context).pushNamed('/searchPage');
            }
          },
          decoration: InputDecoration(
            hintText: "小苹果",
            border: OutlineInputBorder(
//                border: InputBorder.none,
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.face),
            onPressed: () => Navigator.pushNamed(context, '/cartsPage'),
          ),
        ],
        bottom: tabBar(),
//      ),
//      preferredSize: Size.fromHeight(40.0)
      );
  var _index;
  tabBar() => TabBar(
      onTap: (int index) {
        setState(() {
          _index = index;
        });
      },
      isScrollable: true,
      labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      labelColor: Colors.blueAccent,
      unselectedLabelColor: Colors.black45,
      labelPadding: EdgeInsets.only(left: 20, right: 20, top: 10),
      indicatorColor: Colors.blueAccent,
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: UnderlineTabIndicator(
          insets: EdgeInsets.only(left: 15, right: 15),
          borderSide: BorderSide(width: 4.0, color: Colors.blueAccent)),
      tabs: tabTitles
          .map((item) => Tab(
                text: tabTitles.indexOf(item).isOdd ? null : item,
                icon: tabTitles.indexOf(item).isOdd
                    ? tabTitles.indexOf(item) == _index
                        ? Image.network(
                            'https://img.zcool.cn/community/0372d195ac1cd55a8012062e3b16810.jpg')
                        : FlutterLogo()
                    : null,
              ))
          .toList());
}

class HomeBody extends StatefulWidget {
  @override
  HomeBodyState createState() => HomeBodyState();
}

class HomeBodyState extends State<HomeBody> with AutomaticKeepAliveClientMixin {
  //保存tab页面状态
  @override
  bool get wantKeepAlive => true;

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
                return HomeBodyListItem(index, _datas[index]);
              } else {
                //有限列表
                if (index < _datas.length) {
                  //如果不判断到话，会继续绘制null条目，因为这个不加itemCount的话是无限循环绘制；不判断也可以，加上itemCount属性
                  return HomeBodyListItem(index, _datas[index]);
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

class HomeBodyListItem extends StatelessWidget {
  final WordPair data;
  final int index;

  HomeBodyListItem(this.index, this.data) : super();

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        textDirection: TextDirection.rtl,
        children: <Widget>[
          Text('Column$index', style: Theme.of(context).primaryTextTheme.title),
          ListTile(
              title: Text(
                data.asPascalCase,
                style: TextStyle(fontSize: 10.0),
              ),
              onTap: () {
                Navigator.of(context).pushNamed('/shopPage');
              })
        ],
      );
}