import 'package:arrow_path/arrow_path.dart';
import 'package:flutter/material.dart';

class ArrowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    TextSpan textSpan;
    TextPainter textPainter;
    Path path;

    // The arrows usually looks better with rounded caps.
    Paint paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..strokeWidth = 3.0;

    /// Draw a single arrow.
    path = Path();
    path.moveTo(size.width * 0.25, size.height * 0.10);
    path.relativeCubicTo(0, 0, size.width * 0.25, 50, size.width * 0.5, 0);
    path = ArrowPath.make(path: path);
    canvas.drawPath(path, paint..color = Colors.blue);

    textSpan = const TextSpan(
      text: 'Single arrow',
      style: TextStyle(color: Colors.blue),
    );
    textPainter = TextPainter(
      text: textSpan,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(minWidth: size.width);
    textPainter.paint(canvas, Offset(0, size.height * 0.06));

    /// Draw a double sided arrow.
    path = Path();
    path.moveTo(size.width * 0.25, size.height * 0.2);
    path.relativeCubicTo(0, 0, size.width * 0.25, 50, size.width * 0.5, 0);
    path = ArrowPath.make(path: path, isDoubleSided: true);
    canvas.drawPath(path, paint..color = Colors.cyan);

    textSpan = const TextSpan(
      text: 'Double sided arrow',
      style: TextStyle(color: Colors.cyan),
    );
    textPainter = TextPainter(
      text: textSpan,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(minWidth: size.width);
    textPainter.paint(canvas, Offset(0, size.height * 0.16));

    /// Use complex path.
    path = Path();
    path.moveTo(size.width * 0.25, size.height * 0.3);
    path.relativeCubicTo(0, 0, size.width * 0.25, 50, size.width * 0.5, 50);
    path.relativeCubicTo(0, 0, -size.width * 0.25, 0, -size.width * 0.5, 50);
    path.relativeCubicTo(0, 0, size.width * 0.125, 10, size.width * 0.25, -10);
    path = ArrowPath.make(path: path, isDoubleSided: true);
    canvas.drawPath(path, paint..color = Colors.blue);

    textSpan = const TextSpan(
      text: 'Complex path',
      style: TextStyle(color: Colors.blue),
    );
    textPainter = TextPainter(
      text: textSpan,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(minWidth: size.width);
    textPainter.paint(canvas, Offset(0, size.height * 0.28));

    /// Draw several arrows on the same path.
    path = Path();
    path.moveTo(size.width * 0.25, size.height * 0.53);
    path.relativeCubicTo(0, 0, size.width * 0.25, 50, size.width * 0.5, 50);
    path = ArrowPath.make(path: path);
    path.relativeCubicTo(0, 0, -size.width * 0.25, 0, -size.width * 0.5, 50);
    path = ArrowPath.make(path: path);
    Path subPath = Path();
    subPath.moveTo(size.width * 0.375, size.height * 0.53 + 100);
    subPath.relativeCubicTo(
        0, 0, size.width * 0.125, 10, size.width * 0.25, -10);
    subPath = ArrowPath.make(path: subPath, isDoubleSided: true);
    path.addPath(subPath, Offset.zero);
    canvas.drawPath(path, paint..color = Colors.cyan);

    textSpan = const TextSpan(
      text: 'Several arrows on the same path',
      style: TextStyle(color: Colors.cyan),
    );
    textPainter = TextPainter(
      text: textSpan,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(minWidth: size.width);
    textPainter.paint(canvas, Offset(0, size.height * 0.49));

    /// Adjusted
    path = Path();
    path.moveTo(size.width * 0.1, size.height * 0.8);
    path.relativeCubicTo(0, 0, size.width * 0.3, 50, size.width * 0.25, 75);
    path = ArrowPath.make(path: path, isAdjusted: true);
    canvas.drawPath(path, paint..color = Colors.blue);

    textSpan = const TextSpan(
      text: 'Adjusted',
      style: TextStyle(color: Colors.blue),
    );
    textPainter = TextPainter(
      text: textSpan,
      textAlign: TextAlign.left,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(size.width * 0.2, size.height * 0.77));

    /// Non adjusted.
    path = Path();
    path.moveTo(size.width * 0.6, size.height * 0.8);
    path.relativeCubicTo(0, 0, size.width * 0.3, 50, size.width * 0.25, 75);
    path = ArrowPath.make(path: path, isAdjusted: false);
    canvas.drawPath(path, paint..color = Colors.blue);

    textSpan = const TextSpan(
      text: 'Non adjusted',
      style: TextStyle(color: Colors.blue),
    );
    textPainter = TextPainter(
      text: textSpan,
      textAlign: TextAlign.left,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(size.width * 0.65, size.height * 0.77));
  }

  @override
  bool shouldRepaint(ArrowPainter oldDelegate) => true;
}

class ArrowPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // The arrows usually looks better with rounded caps.
    Paint paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..strokeWidth = 3.0;

    canvas.drawPath(arrowPathPaint(size.width, size.height), paint);
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
