import 'dart:math';

import 'package:flutter/cupertino.dart';

class CircularPainter extends CustomPainter {
  Color? backgroundColor;
  Color? lineColor;
  double? width;

  CircularPainter({@required this.backgroundColor,
    @required this.lineColor,
    @required this.width});

  @override
  void paint(Canvas canvas, Size size) {
    Paint backgroundLine = Paint()
      ..color = backgroundColor!
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width!;
    Paint completeLine = Paint()
      ..color = lineColor!
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width!;
    Offset cen = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);
    double sweepAngle = 2 * pi;
    canvas.drawCircle(cen, radius, backgroundLine);
    canvas.drawArc(Rect.fromCircle(center: cen, radius: radius), -pi / 2,
        sweepAngle, false, completeLine);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}