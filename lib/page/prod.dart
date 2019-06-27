import 'package:flutter/material.dart';
import 'package:tonal/widget/toast.dart';

class ProdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('prodpage'),
        ),
        body: ProdBody(),
      );
}

//演示两个控件，一个控件控制另一个控件的显示状态时，父控件为有状态，两个子控件无状态
class ProdBody extends StatelessWidget {
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
                      content: Text('点击了RaisedButton'),
                      action: SnackBarAction(
                        label: '取消',
                        onPressed: () {
                          Navigator.popUntil(
                              context, ModalRoute.withName("/mainPage"));
                        },
                      ),
                    ));
                    Toast.show(context, '点击了RaisedButton');
                  },
                )
              ],
            )),
      ],
    );
  }
}