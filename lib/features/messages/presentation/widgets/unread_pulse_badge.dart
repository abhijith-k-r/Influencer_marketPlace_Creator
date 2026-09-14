import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Pill badge with an animated pulsing dot showing the unread threads count.
class UnreadPulseBadge extends StatelessWidget {
  final Animation<double> pulseAnimation;
  final String text;

  const UnreadPulseBadge({
    super.key,
    required this.pulseAnimation,
    this.text = '3 Unread',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.pillBackground,
        borderRadius: BorderRadius.circular(AppRadii.pill),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedBuilder(
            animation: pulseAnimation,
            builder: (context, child) => Transform.scale(
              scale: pulseAnimation.value,
              child: Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          const SizedBox(width: 6),
          Text(text, style: AppTextStyles.brandPill),
        ],
      ),
    );
  }
}
