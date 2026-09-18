import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class StatsStrip extends StatelessWidget {
  final int campaignsCount;
  final double creatorScore;
  final int escrowSafePercent;

  const StatsStrip({
    super.key,
    required this.campaignsCount,
    required this.creatorScore,
    required this.escrowSafePercent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Stat 1: Campaigns
          Expanded(
            child: Column(
              children: [
                Text(
                  '$campaignsCount',
                  style: AppTextStyles.currencyDisplay(
                    color: AppColors.onSurface,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Campaigns',
                  style: AppTextStyles.labelSm(color: AppColors.tertiary),
                ),
              ],
            ),
          ),

          // Divider
          Container(
            width: 1,
            height: 36,
            color: AppColors.surfaceContainer,
          ),

          // Stat 2: Creator Score
          Expanded(
            child: Column(
              children: [
                Text(
                  '${creatorScore.toStringAsFixed(1)}★',
                  style: AppTextStyles.currencyDisplay(
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Creator Score',
                  style: AppTextStyles.labelSm(color: AppColors.tertiary),
                ),
              ],
            ),
          ),

          // Divider
          Container(
            width: 1,
            height: 36,
            color: AppColors.surfaceContainer,
          ),

          // Stat 3: Escrow Safe
          Expanded(
            child: Column(
              children: [
                Text(
                  '$escrowSafePercent%',
                  style: AppTextStyles.currencyDisplay(
                    color: AppColors.secondary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Escrow Safe',
                  style: AppTextStyles.labelSm(color: AppColors.tertiary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
