import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_text_styles.dart';
import 'milestone_status.dart';

/// Milestone information card displaying title, amount, and linear progress.
class MilestoneTileCard extends StatelessWidget {
  final String title;
  final String amount;
  final String description;
  final MilestoneStatus status;
  final double progress;

  const MilestoneTileCard({
    super.key,
    required this.title,
    required this.amount,
    required this.description,
    required this.status,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    final bool isReady = status == MilestoneStatus.ready;
    final bool isPaid = status == MilestoneStatus.paid;
    final bool isLocked = status == MilestoneStatus.locked;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isReady ? AppColors.indigoLight : AppColors.surfaceWhite,
        borderRadius: AppRadii.roundedMd,
        border: Border.all(
          color: isReady ? AppColors.indigoBorder : AppColors.borderLight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: AppTextStyles.bodyMedium.copyWith(
                  fontWeight: FontWeight.w600,
                  color: isLocked ? AppColors.textSecondary : AppColors.textPrimary,
                ),
              ),
              Text(
                amount,
                style: AppTextStyles.bodyMedium.copyWith(
                  fontWeight: FontWeight.w700,
                  color: isPaid ? AppColors.emeraldDark : AppColors.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: AppTextStyles.caption.copyWith(
              color: isReady ? AppColors.indigo : AppColors.textSecondary,
              fontWeight: isReady ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
          if (progress > 0 && progress < 1.0) ...[
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 5,
                backgroundColor: AppColors.borderLight,
                valueColor: const AlwaysStoppedAnimation(AppColors.amber),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
