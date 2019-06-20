import 'package:flutter/material.dart';

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

  appbar(BuildContext context) => PreferredSize(
      child: AppBar(
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
      ),
      preferredSize: Size.fromHeight(40.0));

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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Text('dfa');
}
