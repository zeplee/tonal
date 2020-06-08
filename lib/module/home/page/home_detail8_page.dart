import 'package:flutter/material.dart';

///画板
class HomeDetail8Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: _buildAppBar(),
        body: ShopAboutBody(),
      );
}

_buildAppBar() => PreferredSize(
      preferredSize: Size.fromHeight(50),
      child: AppBar(
        centerTitle: true,
        title: Text("HomeDetail8Page"),
      ),
    );

class ShopAboutBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ShopAboutBodyState();
}

class ShopAboutBodyState extends State<ShopAboutBody> {
  List<Offset> _points = <Offset>[];

  @override
  Widget build(BuildContext context) => GestureDetector(
        onPanUpdate: (DragUpdateDetails details) {
          setState(() {
            RenderBox referenceBox = context.findRenderObject();
            _points = List.from(_points)
              ..add(referenceBox.globalToLocal(details.globalPosition));
          });
        },
        onPanEnd: (DragEndDetails details) => _points.add(null),
        child: CustomPaint(
            painter: SignaturePainter(_points), size: Size.infinite),
      );
}

class SignaturePainter extends CustomPainter {
  SignaturePainter(this.points);

  final List<Offset> points;

  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i], points[i + 1], paint);
      }
    }
  }

  bool shouldRepaint(SignaturePainter other) => other.points != points;
}
