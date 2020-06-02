import 'package:flutter/material.dart';

//拖拽组件 http://www.zyiz.net/tech/detail-110265.html
class DragWidget extends StatefulWidget {
  final Widget child;

  DragWidget({@required this.child});

  @override
  _DragWidgetState createState() => _DragWidgetState();
}

class _DragWidgetState extends State<DragWidget> {
  Offset _offset = Offset(0.0, 0.0);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: _offset.dx,
      top: _offset.dy,
      child: Draggable(
        //描述的可拖动的组件
        child: widget.child,
        //拖动后原位置显示的组件
        childWhenDragging: Container(),
        //拖动控件时子元素的样子
        feedback: widget.child,
        //松手的时候
        onDraggableCanceled: (Velocity velocity, Offset offset) {
          setState(() {
            this._offset = _getScope(offset);
          });
        },
      ),
    );
  }

  //获取移动范围
  Offset _getScope(Offset offset) {
    double dx;
    if (offset.dx < 0.0)
      dx = 0.0;
    else if (offset.dx > MediaQuery.of(context).size.width - 50.0)
      dx = MediaQuery.of(context).size.width - 50.0;
    else
      dx = offset.dx;
    double dy;
    if (offset.dy < 0.0)
      dy = 0.0;
    else if (offset.dy > MediaQuery.of(context).size.height - 50.0)
      dy = MediaQuery.of(context).size.height - 50.0;
    else
      dy = offset.dy;
    return Offset(dx, dy);
  }
}
//
//class DragWidget extends StatefulWidget {
//  @override
//  _DragWidgetState createState() => _DragWidgetState();
//}
//
//class _DragWidgetState extends State<DragWidget> {
//  Offset offset = Offset(10, kToolbarHeight + 100);
//
//  Offset _calOffset(Size size, Offset offset, Offset nextOffset) {
//    double dx = 0;
//    if (offset.dx + nextOffset.dx <= 0) {
//      dx = 0;
//    } else if (offset.dx + nextOffset.dx >= (size.width - 50)) {
//      dx = size.width - 50;
//    } else {
//      dx = offset.dx + nextOffset.dx;
//    }
//    double dy = 0;
//    if (offset.dy + nextOffset.dy >= (size.height - 100)) {
//      dy = size.height - 100;
//    } else if (offset.dy + nextOffset.dy <= kToolbarHeight) {
//      dy = kToolbarHeight;
//    } else {
//      dy = offset.dy + nextOffset.dy;
//    }
//    return Offset(
//      dx,
//      dy,
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Theme(
//      data: Theme.of(context).copyWith(
//        highlightColor: Colors.transparent,
//        appBarTheme: AppBarTheme.of(context).copyWith(
//          brightness: Brightness.dark,
//        ),
//      ),
//      child: Positioned(
//        left: offset.dx,
//        top: offset.dy,
//        child: GestureDetector(
//          onPanUpdate: (detail) {
//            setState(() {
//              offset =
//                  _calOffset(MediaQuery.of(context).size, offset, detail.delta);
//            });
//          },
//          onTap: () {
//            Scaffold.of(context).showSnackBar(
//              SnackBar(content: new Text('你戳到我了!')),
//            );
//          },
//          onPanEnd: (detail) {},
//          child: Container(
//            height: 50,
//            width: 50,
//            color: Colors.blueAccent,
//            child: Text(
//              "Box",
//              style: TextStyle(
//                fontSize: 20,
//                color: Colors.black,
//                decoration: TextDecoration.none,
//              ),
//            ),
//          ),
//        ),
//      ),
//    );
//  }
//}
