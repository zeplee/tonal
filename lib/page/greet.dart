import 'package:flutter/material.dart';

class GreetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('fdafa'),
        ),
        body: GreetBody(),
      );
}

class GreetBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GreetBodyState();
}

class GreetBodyState extends State<GreetBody> {
  @override
  Widget build(BuildContext context) => Container(
      height: 200.0,
      child: IconButton(
          icon: Icon(Icons.fiber_dvr),
          onPressed: () => Navigator.of(context).pop()));
}
