import 'dart:math';

import 'package:flutter/material.dart';

class PercentageCircle extends CustomPainter {
  final double _arcAngle;

  PercentageCircle(this._arcAngle);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2);

    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    const startAngle = -pi / 2;
    final sweepAngle = _arcAngle;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(PercentageCircle oldDelegate) => true;
}
