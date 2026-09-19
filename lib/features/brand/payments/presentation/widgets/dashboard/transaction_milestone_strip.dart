import 'package:flutter/material.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_radii.dart';
import '../../../../../../core/theme/app_text_styles.dart';

/// Milestone info strip with dual flex constraints to guarantee zero overflow (<45 LOC).
class TransactionMilestoneStrip extends StatelessWidget {
  final String milestoneDescription;
  final String dateText;

  const TransactionMilestoneStrip({
    super.key,
    required this.milestoneDescription,
    required this.dateText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(AppRadii.lg),
      ),
      child: Row(
        children: [
          const Icon(Icons.flag_outlined, size: 14, color: AppColors.tertiary),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              milestoneDescription,
              style: AppTextStyles.labelSm(color: AppColors.tertiary),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              dateText,
              style: AppTextStyles.bodySm(color: AppColors.tertiary),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
