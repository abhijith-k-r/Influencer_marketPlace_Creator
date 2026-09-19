import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_colors.dart';

/// Single-source-of-truth progress indicator for uniform spinners across the app (<50 LOC).
class AppProgressIndicator extends StatelessWidget {
  final double size;
  final double strokeWidth;
  final Color? color;
  final Color? backgroundColor;
  final double? value;

  const AppProgressIndicator({
    super.key,
    this.size = 20,
    this.strokeWidth = 2.0,
    this.color,
    this.backgroundColor,
    this.value,
  });

  /// Factory constructor for small white button/tile spinners.
  const AppProgressIndicator.inline({
    super.key,
    this.size = 18,
    this.strokeWidth = 2.0,
    this.color = Colors.white,
    this.backgroundColor,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        value: value,
        strokeWidth: strokeWidth,
        backgroundColor: backgroundColor,
        valueColor: AlwaysStoppedAnimation<Color>(color ?? AppColors.primary),
      ),
    );
  }
}
