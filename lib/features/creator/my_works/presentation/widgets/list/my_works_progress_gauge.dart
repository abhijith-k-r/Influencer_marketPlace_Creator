import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';

/// Circular progress ring gauge rendering completion percentage.
class MyWorksProgressGauge extends StatelessWidget {
  final double percentage;
  final double size;

  const MyWorksProgressGauge({
    super.key,
    this.percentage = 0.68,
    this.size = 56,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(size, size),
            painter: _GaugePainter(percentage: percentage),
          ),
          Text(
            '${(percentage * 100).round()}%',
            style: AppTextStyles.labelMd(
              color: CreatorColors.onSurface,
            ).copyWith(fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
  }
}

class _GaugePainter extends CustomPainter {
  final double percentage;

  _GaugePainter({required this.percentage});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - 6) / 2;

    final bgPaint = Paint()
      ..color = CreatorColors.surfaceContainerHigh
      ..strokeWidth = 3.5
      ..style = PaintingStyle.stroke;

    final progressPaint = Paint()
      ..color = CreatorColors.primaryContainer
      ..strokeWidth = 3.5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, radius, bgPaint);

    final sweepAngle = 2 * math.pi * percentage;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _GaugePainter oldDelegate) =>
      oldDelegate.percentage != percentage;
}
