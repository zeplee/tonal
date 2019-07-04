import 'dart:math';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:tonal/helper/route_helper.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  List<String> tabTitles;
  List<Widget> tabBodys;
  TabController tabController;
  var _tabCurIndex;

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
    tabController = TabController(length: tabTitles.length, vsync: this)
      ..addListener(() {
        //点击tab时会触发两次监听-https://juejin.im/post/5c9c3323e51d45360d0064f0
        if (tabController.index.toDouble() == tabController.animation.value) {
          print(tabController.index);
          setState(() {
            _tabCurIndex = tabController.index;
          });
        }
      });
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
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
      Scaffold(
//          backgroundColor: Colors.transparent,
          appBar: appBar(context),
          body: TabBarView(controller: tabController, children: tabBodys));

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
          onPressed: () =>
              Navigator.of(context).pushNamed(RouteHelper.categoryPage),
        ),
        title: TextField(
          textAlign: TextAlign.center,
          onSubmitted: (String text) {
            if (text.isNotEmpty) {
              Navigator.of(context).pushNamed(RouteHelper.searchPage);
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
            onPressed: () =>
                Navigator.pushNamed(context, RouteHelper.cartsPage),
          ),
        ],
        bottom: tabBar(),
//      ),
//      preferredSize: Size.fromHeight(40.0)
      );

  tabBar() => TabBar(
//      onTap: (int index) {
//        setState(() {
//          _tabCurIndex = index;
//        });
//      },
      isScrollable: true,
      controller: tabController,
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
                    ? tabTitles.indexOf(item) == _tabCurIndex
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
  List<String> tabTitles;

  @override
  void initState() {
    super.initState();
    //本地数据
    _datas.addAll(generateWordPairs().take(10));
    tabTitles = [
      "time1",
      "time2",
      "time3",
      "time4",
      "time5",
      "time6",
      "time7",
      "time8",
      "time9",
    ];
  }

  @override
  Widget build(BuildContext context) => RefreshIndicator(
        //下拉刷新
        child: CustomScrollView(
//          physics: ScrollPhysics(),
          //使用builder有自动回收功能
          slivers: <Widget>[
            HomeBodyTopWidget(),
            ceilingBar(),
            HomeBodyBottomWidget()
          ],
        ),
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

  ceilingBar() => SliverPersistentHeader(
      pinned: true, //是否固定在顶部
      floating: false,
      delegate: _SliverAppBarDelegate(
          minHeight: 50, //收起的高度
          maxHeight: 60, //展开的最大高度
          child: DefaultTabController(
            initialIndex: 4,
            length: tabTitles.length,
            child: Material(
                color: Colors.pinkAccent,
                child: TabBar(
                    isScrollable: true,
                    unselectedLabelStyle:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    labelStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    labelColor: Colors.blueAccent,
                    unselectedLabelColor: Colors.black45,
                    labelPadding: EdgeInsets.only(left: 20, right: 20, top: 10),
                    indicatorColor: Colors.blueAccent,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: UnderlineTabIndicator(
                        insets: EdgeInsets.only(left: 15, right: 15),
                        borderSide:
                            BorderSide(width: 4.0, color: Colors.blueAccent)),
                    tabs: tabTitles
                        .map((item) => Tab(
                              text: item,
                            ))
                        .toList())),
          )));
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class HomeBodyTopWidget extends StatefulWidget {
  @override
  State createState() => HomeBodyTopState();
}

class HomeBodyTopState extends State<HomeBodyTopWidget> {
  final _datas = <WordPair>[];

  @override
  void initState() {
    super.initState();
    //本地数据
    _datas.addAll(generateWordPairs().take(10));
  }

  @override
  Widget build(BuildContext context) =>
      SliverList(delegate: SliverChildBuilderDelegate(
        (context, i) {
          if (i.isOdd) return Divider();
          final index = i ~/ 2; //item的真实位置
          if (false) {
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
        },
      ));
}

class HomeBodyBottomWidget extends StatefulWidget {
  @override
  State createState() => HomeBodyBottomState();
}

class HomeBodyBottomState extends State<HomeBodyBottomWidget> {
  final _datas = <WordPair>[];

  @override
  void initState() {
    super.initState();
    //本地数据
    _datas.addAll(generateWordPairs().take(10));
  }

  @override
  Widget build(BuildContext context) =>
      SliverList(delegate: SliverChildBuilderDelegate(
        (context, i) {
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
        },
      ));
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
                Navigator.of(context).pushNamed(RouteHelper.shopPage);
              })
        ],
      );
}
