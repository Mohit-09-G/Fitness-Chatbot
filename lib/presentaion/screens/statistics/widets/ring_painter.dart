import 'dart:math';

import 'package:flutter/material.dart';

class RingPainter extends CustomPainter {
  final double sleepProgress;
  final double caloriesProgress;
  final double stepProgress;

  RingPainter(
      {super.repaint,
      required this.sleepProgress,
      required this.caloriesProgress,
      required this.stepProgress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final outerRadius = size.width / 2;
    final middleRadius = outerRadius * 0.75;
    final innerRadius = outerRadius * 0.5;
    final thickness = outerRadius * 0.15;

    final sleepColor = const Color(0xFF7AD8F5);
    final sleepBgColor = sleepColor.withOpacity(0.2);
    final caloriesColor = const Color(0xFFF58F98);
    final caloriesBgColor = caloriesColor.withOpacity(0.2);
    final stepsColor = const Color(0xFFFFC278);
    final stepsBgColor = stepsColor.withOpacity(0.2);

    _drawRing(canvas, center, outerRadius, thickness, sleepBgColor, 1.0);
    _drawRing(canvas, center, middleRadius, thickness, caloriesBgColor, 1.0);
    _drawRing(canvas, center, innerRadius, thickness, stepsBgColor, 1.0);

    _drawRing(
        canvas, center, outerRadius, thickness, sleepColor, sleepProgress);
    _drawRing(canvas, center, middleRadius, thickness, caloriesColor,
        caloriesProgress);
    _drawRing(canvas, center, innerRadius, thickness, stepsColor, stepProgress);

    _drawIndicatorDot(
        canvas, center, outerRadius, thickness, sleepColor, sleepProgress);
    _drawIndicatorDot(canvas, center, middleRadius, thickness, caloriesColor,
        caloriesProgress);
    _drawIndicatorDot(
        canvas, center, innerRadius, thickness, stepsColor, stepProgress);
  }

  void _drawRing(Canvas canvas, Offset centre, double radius, double thickness,
      Color color, double progress) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = thickness
      ..strokeCap = StrokeCap.round;

    final rect = Rect.fromCircle(center: centre, radius: radius);
    final startAngle = -pi / 2;
    final sweepAngle = 2 * pi * progress;
    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
  }

  void _drawIndicatorDot(Canvas canvas, Offset center, double radius,
      double thickness, Color color, double progress) {
    if (progress <= 0) return;
    final dotRadius = thickness / 2;
    final angle = -pi / 2 + (2 * pi * progress);
    final dotcentre = Offset(
      center.dx + radius * cos(angle),
      center.dy + radius * sin(angle),
    );

    final dotpaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    final borderPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawCircle(dotcentre, dotRadius, dotpaint);
    canvas.drawCircle(dotcentre, dotRadius, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
