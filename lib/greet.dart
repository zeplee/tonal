import 'package:flutter/material.dart';

class GreetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => IconButton(
      icon: Icon(Icons.fiber_dvr),
      onPressed: () => Navigator.of(context).pop());
}

class GreetBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GreetBodyState();
}

class GreetBodyState extends State<GreetBody> {
  @override
  Widget build(BuildContext context) => IconButton(
      icon: Icon(Icons.fiber_dvr),
      onPressed: () => Navigator.of(context).pop());
}
