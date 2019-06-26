import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Login'),
        ),
        body: LoginBody(),
      );
}

//演示两个控件，一个控件控制另一个控件的显示状态时，父控件为有状态，两个子控件无状态
class LoginBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            width: 200.0,
            height: 200.0,
            child: Column(
//              textDirection: TextDirection.rtl,
//              mainAxisAlignment: MainAxisAlignment.center,
//              verticalDirection: VerticalDirection.up,
//              crossAxisAlignment: CrossAxisAlignment.baseline,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text('用户名:', style: TextStyle(fontSize: 30)),
                    TextField(
                      autofocus: true,
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text('密码:', style: TextStyle(fontSize: 30)),
                    TextField(
                      autofocus: true,
                    )
                  ],
                ),
              ],
            )),
      ],
    );
  }
}
