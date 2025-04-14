import 'package:flutter/material.dart';
import 'dart:math';

class HealthRing extends StatefulWidget {
  const HealthRing({Key? key}) : super(key: key);

  @override
  _HealthRingState createState() => _HealthRingState();
}

class _HealthRingState extends State<HealthRing> {
  double sleepProgress = 0;
  double caloriesProgress = 0;
  double stepsProgress = 0;

  @override
  void initState() {
    super.initState();

    _startProgressAnimation();
  }

  void _startProgressAnimation() async {
    await Future.delayed(Duration(milliseconds: 500));

    await Future.wait([
      _animateProgress(() => setState(() => sleepProgress += 0.01), 0.75),
      _animateProgress(() => setState(() => caloriesProgress += 0.01), 0.50),
      _animateProgress(() => setState(() => stepsProgress += 0.01), 0.30),
    ]);
  }

  Future<void> _animateProgress(
      VoidCallback updateProgress, double target) async {
    for (double i = 0; i <= target; i += 0.01) {
      await Future.delayed(Duration(milliseconds: 20));
      if (!mounted) return;
      updateProgress();
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(200, 200),
      painter: RingsPainter(
        sleepProgress: sleepProgress,
        caloriesProgress: caloriesProgress,
        stepsProgress: stepsProgress,
      ),
    );
  }
}

class RingsPainter extends CustomPainter {
  final double sleepProgress;
  final double caloriesProgress;
  final double stepsProgress;

  RingsPainter({
    required this.sleepProgress,
    required this.caloriesProgress,
    required this.stepsProgress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    final outerRadius = size.width / 1.8;
    final spacing = 40.0;

    final middleRadius = outerRadius - spacing;
    final innerRadius = middleRadius - 35;

    final outerThickness = outerRadius * 0.17;
    final middleThickness = outerRadius * 0.17;
    final innerThickness = outerRadius * 0.17;

    final sleepColor = const Color(0xFF7AD8F5);
    final sleepBgColor = sleepColor.withOpacity(0.2);
    final caloriesColor = const Color(0xFFF58F98);
    final caloriesBgColor = caloriesColor.withOpacity(0.2);
    final stepsColor = const Color(0xFFFFC278);
    final stepsBgColor = stepsColor.withOpacity(0.2);

    _drawRing(canvas, center, outerRadius, outerThickness, sleepBgColor, 1.0);
    _drawRing(
        canvas, center, middleRadius, middleThickness, caloriesBgColor, 1.0);
    _drawRing(canvas, center, innerRadius, innerThickness, stepsBgColor, 1.0);

    _drawRing(
        canvas, center, outerRadius, outerThickness, sleepColor, sleepProgress);
    _drawRing(canvas, center, middleRadius, middleThickness, caloriesColor,
        caloriesProgress);
    _drawRing(
        canvas, center, innerRadius, innerThickness, stepsColor, stepsProgress);

    _drawIndicatorDot(
        canvas, center, outerRadius, outerThickness, sleepColor, sleepProgress);
    _drawIndicatorDot(canvas, center, middleRadius, middleThickness,
        caloriesColor, caloriesProgress);
    _drawIndicatorDot(
        canvas, center, innerRadius, innerThickness, stepsColor, stepsProgress);
  }

  void _drawRing(Canvas canvas, Offset center, double radius, double thickness,
      Color color, double progress) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = thickness
      ..strokeCap = StrokeCap.round;

    final rect = Rect.fromCircle(center: center, radius: radius);

    final startAngle = -pi / 2;
    final sweepAngle = 2 * pi * progress;

    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
  }

  void _drawIndicatorDot(Canvas canvas, Offset center, double radius,
      double thickness, Color color, double progress) {
    if (progress <= 0) return;

    final dotRadius = thickness / 2.7;
    final angle = -pi / 2;

    final dotCenter = Offset(
      center.dx + radius * cos(angle),
      center.dy + radius * sin(angle),
    );

    final dotPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawCircle(dotCenter, dotRadius, dotPaint);
    canvas.drawCircle(dotCenter, dotRadius, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
