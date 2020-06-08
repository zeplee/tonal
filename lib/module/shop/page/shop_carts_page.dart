import 'package:flutter/material.dart';

class ShopCartsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: _buildAppBar(),
        body: ShopCartsBody(),
      );

  _buildAppBar() => PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          centerTitle: true,
          title: Text("carts"),
        ),
      );
}

class ShopCartsBody extends StatefulWidget {
  @override
  State createState() => ShopCartsBodyState();
}

class ShopCartsBodyState extends State<ShopCartsBody> {
  final _datas = [
    'fdasnifds',
    'fdasnifds',
    'fdasnifds',
    'fdasnifds',
    'fdasnifds',
    'fdasnifds',
    'fdasnifds',
    'fdasnifds',
    'fdasnifds',
    'fdafas',
    'fdafas',
    'fdafas',
    'fdafas',
    'fdafas',
  ];

  @override
  void initState() {
    super.initState();
    //本地数据
    _datas.addAll(_datas.take(10));
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
            _datas.addAll(_datas.take(10));
          }
          return _buildItem(_datas[index]);
        }
        // else {
        //   //有限列表
        //   if (index < _datas.length) {
        //     //如果不判断到话，会继续绘制null条目，因为这个不加itemCount的话是无限循环绘制；不判断也可以，加上itemCount属性
        //     return CartsBodyListItem(_datas[index]);
        //   }
        // }
      });

  _buildItem(str) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Column One' + str,
              style: Theme.of(context).primaryTextTheme.headline6),
        ],
      );
}
