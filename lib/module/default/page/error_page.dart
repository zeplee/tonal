import 'package:flutter/material.dart';

//错误页
class ErrorPage extends StatelessWidget {
  ErrorPage({Key key, this.errorDetails}) : super(key: key);
  final FlutterErrorDetails errorDetails;

  @override
  Widget build(BuildContext context) {
    print("FlutterErrorDetails" +
        (errorDetails == null ? "" : errorDetails.toString()));
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          centerTitle: true,
          title: Text("错误页"),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '错误页',
            ),
          ],
        ),
      ),
    );
  }
}
