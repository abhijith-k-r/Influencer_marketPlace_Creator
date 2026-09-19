import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';

class CreatorMilestoneEscrowTracker extends StatelessWidget {
  final String activeMilestone;
  final String amount;
  final double progress;

  const CreatorMilestoneEscrowTracker({
    super.key,
    this.activeMilestone = 'Milestone 2: Reel Video Cut (4K)',
    this.amount = '₹15,000',
    this.progress = 0.66,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(14),
      decoration: const BoxDecoration(
        color: CreatorColors.surfaceContainerLowest,
        borderRadius: AppRadii.roundedMd,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'CURRENT DELIVERABLE',
                style: AppTextStyles.labelSm(
                  color: CreatorColors.outline,
                ).copyWith(letterSpacing: 0.5, fontSize: 10),
              ),
              Text(
                amount,
                style: AppTextStyles.labelLg(
                  color: CreatorColors.primary,
                ).copyWith(fontWeight: FontWeight.w800),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            activeMilestone,
            style: AppTextStyles.labelMd(
              color: CreatorColors.onSurface,
            ).copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: AppRadii.roundedFull,
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 5,
              backgroundColor: CreatorColors.surfaceContainerHighest,
              valueColor: const AlwaysStoppedAnimation<Color>(CreatorColors.primary),
            ),
          ),
        ],
      ),
    );
  }
}
