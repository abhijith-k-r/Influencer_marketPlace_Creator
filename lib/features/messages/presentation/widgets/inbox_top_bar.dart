import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_text_styles.dart';
import 'unread_pulse_badge.dart';

/// Top bar in the inbox featuring headline, unread count badge, filter, and compose actions.
class InboxTopBar extends StatelessWidget {
  final Animation<double> pulseAnimation;
  final VoidCallback onFilterTap;
  final VoidCallback onComposeTap;

  const InboxTopBar({
    super.key,
    required this.pulseAnimation,
    required this.onFilterTap,
    required this.onComposeTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text('Messages', style: AppTextStyles.h1),
            const SizedBox(width: 8),
            UnreadPulseBadge(pulseAnimation: pulseAnimation),
          ],
        ),
        Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.inputBackground,
                borderRadius: BorderRadius.circular(AppRadii.md),
              ),
              child: IconButton(
                icon: const Icon(Icons.tune_rounded, size: 20, color: AppColors.textPrimary),
                onPressed: onFilterTap,
              ),
            ),
            const SizedBox(width: 8),
            SizedBox(
              height: 40,
              child: ElevatedButton.icon(
                onPressed: onComposeTap,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.buttonPrimary,
                  foregroundColor: AppColors.textWhite,
                  elevation: 2,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadii.md)),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                ),
                icon: const Icon(Icons.edit_square, size: 16),
                label: Text(
                  'Compose',
                  style: AppTextStyles.caption.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.textWhite,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
