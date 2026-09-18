import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_radii.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../data/models/payment_milestone_model.dart';

class MilestoneStepContent extends StatelessWidget {
  final PaymentMilestoneModel milestone;
  final String formattedAmount;

  const MilestoneStepContent({
    super.key,
    required this.milestone,
    required this.formattedAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: milestone.isCurrent ? AppColors.surfaceContainerHigh.withValues(alpha: 0.6) : AppColors.surfaceContainerLow.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(AppRadii.xl),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        milestone.title,
                        style: AppTextStyles.labelLg(color: milestone.isLocked ? AppColors.tertiary : AppColors.onSurface),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (milestone.isCurrent) ...[
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(AppRadii.full),
                        ),
                        child: Text('Current', style: AppTextStyles.labelSm(color: AppColors.primary)),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Text(
                formattedAmount,
                style: AppTextStyles.labelLg(
                  color: milestone.isCurrent ? AppColors.primary : (milestone.isLocked ? AppColors.tertiary : AppColors.onSurface),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Icon(
                milestone.isCompleted ? Icons.verified : (milestone.isCurrent ? Icons.bolt : Icons.hourglass_top),
                size: 13,
                color: milestone.isCompleted ? AppColors.secondary : (milestone.isCurrent ? AppColors.primary : AppColors.tertiary),
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  milestone.dateDescription,
                  style: AppTextStyles.bodySm(color: milestone.isCurrent ? AppColors.onSurface : AppColors.tertiary),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
