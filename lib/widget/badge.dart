import 'package:flutter/material.dart';

class BadgeWidget extends StatefulWidget {
  final Widget icon;
  int num;

  BadgeWidget({
    @required this.icon,
    this.num,
  });

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
          widget.num == 0
              ? Container(
                  height: 14,
                  width: 14,
                )
              : Container(
                  height: 14,
                  width: 14,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 14,
                    minHeight: 14,
                  ),
                  child: Center(
                    child: Text(
                      widget.num > 99 ? '99+' : widget.num.toString(),
                      style: TextStyle(
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

  updateNum(int num) {
    setState(() {
      widget.num = num;
    });
  }
}
