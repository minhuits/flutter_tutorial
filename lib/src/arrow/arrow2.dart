import 'package:arrow_path/arrow_path.dart';
import 'package:flutter/material.dart';

class ArrowPainter2 extends CustomPainter {
  final Color? color;

  ArrowPainter2({
    this.color = Colors.blueAccent,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // The arrows usually looks better with rounded caps.
    Paint paint = Paint()
      ..color = color!
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..strokeWidth = 2.4;

    Path arrowPaint = arrowPathPaint(size.width, size.height);

    canvas.drawPath(arrowPaint, paint);
  }

  Path arrowPathPaint(double x, double y) {
    /// Draw a double sided arrow.
    Path path = Path()
      ..moveTo(x * 0, y * 0)
      ..relativeLineTo(x, y * 0);
    path = ArrowPath.make(path: path, isDoubleSided: true);

    return path;
  }

  @override
  bool shouldRepaint(ArrowPainter2 oldDelegate) {
    return false;
  }
}
