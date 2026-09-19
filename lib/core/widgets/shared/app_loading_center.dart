import 'package:flutter/material.dart';
import 'app_progress_indicator.dart';

/// Centered AppProgressIndicator with consistent padding and color.
/// Used in every BlocBuilder loading branch (<30 LOC).
class AppLoadingCenter extends StatelessWidget {
  final Color? color;
  final EdgeInsetsGeometry padding;
  final double size;

  const AppLoadingCenter({
    super.key,
    this.color,
    this.padding = const EdgeInsets.all(32),
    this.size = 36,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: padding,
        child: AppProgressIndicator(
          size: size,
          strokeWidth: 3.0,
          color: color,
        ),
      ),
    );
  }
}
