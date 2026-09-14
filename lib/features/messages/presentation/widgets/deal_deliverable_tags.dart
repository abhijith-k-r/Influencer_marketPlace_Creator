import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Tag chips showing active campaign name and deliverable formats.
class DealDeliverableTags extends StatelessWidget {
  final String campaignName;
  final String deliverableSummary;
  final IconData deliverableIcon;

  const DealDeliverableTags({
    super.key,
    required this.campaignName,
    required this.deliverableSummary,
    required this.deliverableIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 6,
      runSpacing: 4,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
          decoration: BoxDecoration(
            color: AppColors.pillBackground,
            borderRadius: BorderRadius.circular(AppRadii.xs),
          ),
          child: Text(
            campaignName,
            style: AppTextStyles.brandPill,
          ),
        ),
        if (deliverableSummary.isNotEmpty)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: AppColors.inputBackground,
              borderRadius: BorderRadius.circular(AppRadii.xs),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(deliverableIcon, size: 13, color: AppColors.primary),
                const SizedBox(width: 4),
                Text(
                  deliverableSummary,
                  style: AppTextStyles.caption.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
