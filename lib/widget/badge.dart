import 'package:flutter/material.dart';

class BadgeWidget extends StatefulWidget {
  final Widget icon;

  BadgeWidget(
    this.icon,
  );

  @override
  State<StatefulWidget> createState() => BadgeWidgetState();
}

class BadgeWidgetState extends State<BadgeWidget> {
  @override
  Widget build(BuildContext context) => Stack(
        children: <Widget>[
          Container(
            child: widget.icon,
            height: 24,
            width: 36,
          ),
          Container(
            height: 14,
            width: 14,
            decoration: new BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(12),
            ),
            constraints: BoxConstraints(
              minWidth: 14,
              minHeight: 14,
            ),
            child: Center(
              child: new Text(
                '1',
                style: new TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
        alignment: Alignment.topRight,
        overflow: Overflow.visible,
      );
}
