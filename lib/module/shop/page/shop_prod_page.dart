import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_base/flutter_base.dart';
import 'package:tonal/common/common.dart';

class ShopProdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('prodpage'),
        ),
        body: ShopProdBody(),
      );
}

//演示两个控件，一个控件控制另一个控件的显示状态时，父控件为有状态，两个子控件无状态
class ShopProdBody extends StatelessWidget {
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
                Text('Hey!', style: TextStyle(fontSize: 30)),
                Text('Hey!', style: TextStyle(fontSize: 50)),
                Text('Hey!', style: TextStyle(fontSize: 40)),
                RaisedButton(
                  child: Text('Hey'),
                  onPressed: () {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text(UserEntity.fromJson(json.decode(
                              '{"version":"1.0","timestamp":"190627T153330.389Z","status":0,"errorMsg":"全部成功","elapsed":0,"trackId":null,"data":"第二件0元起"}'))
                          .version),
                      action: SnackBarAction(
                        label: '取消',
                        onPressed: () {
                          Navigator.popUntil(context,
                              ModalRoute.withName(Global.shopIndexPage));
                        },
                      ),
                    ));
                    ToastHelper.show(context,
                        ToastHelper.getDefault(context, "点击了RaisedButton"));
                  },
                )
              ],
            )),
      ],
    );
  }
}
