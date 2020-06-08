import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tonal/common/common.dart';

class ShopCategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('CategoryPage'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () => showSearch(
                    context: context, delegate: CustomSearchDelegate())),
          ],
        ),
        body: ShopCategoryBody(),
      );
}

class ShopCategoryBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ShopCategoryBodyState();
}

class ShopCategoryBodyState extends State<ShopCategoryBody> {
  List _datas = [];

  @override
  void initState() {
    super.initState();
    //网路数据
    loadData();
  }

  loadData() async {
    var response =
        await Dio().get("https://jsonplaceholder.typicode.com/posts");
    setState(() {
      _datas = response.data;
    });
  }

  @override
  Widget build(BuildContext context) => _datas.isEmpty
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
              return ShopCategoryListItem(_datas[index]);
            }
            // else {
            //   //有限列表
            //   return CategoryListItem(_datas[index]);
            // }
          });
}

class ShopCategoryListItem extends StatefulWidget {
  final data;

  ShopCategoryListItem(this.data) : super();

  @override
  State<StatefulWidget> createState() => ShopCategoryItemState();
}

class ShopCategoryItemState extends State<ShopCategoryListItem> {
  @override
  Widget build(BuildContext context) => ListTile(
      title: Text(
        widget.data['title'],
        style: TextStyle(fontSize: 10.0),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(Global.shopShopPage);
      });
}
