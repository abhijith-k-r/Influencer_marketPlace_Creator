import 'package:flutter/material.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_radii.dart';
import '../../../../../../core/theme/app_text_styles.dart';

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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.flag_outlined, size: 14, color: AppColors.tertiary),
              const SizedBox(width: 6),
              Text(
                milestoneDescription,
                style: AppTextStyles.labelSm(color: AppColors.tertiary),
              ),
            ],
          ),
          Text(dateText, style: AppTextStyles.bodySm(color: AppColors.tertiary)),
        ],
      ),
    );
  }
}
