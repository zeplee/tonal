import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_base/flutter_base.dart';
import 'package:tonal/common/common.dart';

///小组件
///http://www.luyixian.cn/news_show_397654.aspx
///https://blog.csdn.net/shayubuhuifei/article/details/86748327
///http://www.5imoban.net/jiaocheng/hbuilder/2019/1202/3637.html
///https://blog.csdn.net/qq_39081974/article/details/100544816
class HomeDetail12Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar() => PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          centerTitle: true,
          title: Text("prodpage"),
        ),
      );

  _buildBody() => Builder(
        builder: (BuildContext context) {
          return Column(
            children: <Widget>[
              Container(
                  width: double.infinity,
                  height: 200.0,
                  child: Row(
                    //字体底部对齐或首字母底部对齐,目前只对英文有效
                    textBaseline: TextBaseline.ideographic,
                    textDirection: TextDirection.ltr,
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
                            content: Text(UserEntity.fromJson(
                              json.decode(
                                  '{"version":"1.0","timestamp":"190627T153330.389Z","status":0,"errorMsg":"全部成功","elapsed":0,"trackId":null,"data":"第二件0元起"}'),
                            ).version),
                            action: SnackBarAction(
                              label: '取消',
                              onPressed: () {
                                Navigator.popUntil(context,
                                    ModalRoute.withName(Global.homePage));
                              },
                            ),
                          ));
                          ToastHelper.show(
                              context,
                              ToastHelper.getDefault(
                                  context, "点击了RaisedButton"));
                        },
                      )
                    ],
                  )),
              Container(
                width: 200.0,
                height: 100.0,
                child: Column(
//              textDirection: TextDirection.rtl,
//              mainAxisAlignment: MainAxisAlignment.center,
//              verticalDirection: VerticalDirection.up,
//              crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text('用户名:', style: TextStyle(fontSize: 30)),
                        Expanded(
                          child: TextField(
                            autofocus: true,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text('密码:', style: TextStyle(fontSize: 30)),
                        Expanded(
                          child: TextField(
                            autofocus: true,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      );
}
