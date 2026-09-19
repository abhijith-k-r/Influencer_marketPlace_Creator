import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';

/// Sub-header bar with back button, screen titles, and reset action.
class WorkFilterHeader extends StatelessWidget {
  final VoidCallback onBack;
  final VoidCallback onResetAll;

  const WorkFilterHeader({
    super.key,
    required this.onBack,
    required this.onResetAll,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: CreatorColors.surfaceContainerLowest,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
              color: CreatorColors.onSurface,
              onPressed: onBack,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Filter Works',
                style: AppTextStyles.headlineSm(
                  color: CreatorColors.onSurface,
                ).copyWith(fontWeight: FontWeight.w700),
              ),
              Text(
                'Active Campaign Telemetry',
                style: AppTextStyles.labelSm(color: CreatorColors.onSurfaceVariant),
              ),
            ],
          ),
          TextButton(
            onPressed: onResetAll,
            child: Text(
              'Reset All',
              style: AppTextStyles.labelMd(
                color: CreatorColors.primary,
              ).copyWith(fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}
