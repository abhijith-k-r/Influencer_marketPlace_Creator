import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_radii.dart';
import '../../../../../core/theme/app_text_styles.dart';

class CampaignCardFooter extends StatelessWidget {
  final double budget;
  final VoidCallback onViewDetails;

  const CampaignCardFooter({
    super.key,
    required this.budget,
    required this.onViewDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total Budget',
              style: AppTextStyles.labelSm(color: AppColors.tertiary),
            ),
            const SizedBox(height: 2),
            Text(
              '₹${budget.toInt().toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}',
              style: AppTextStyles.currencyDisplay(color: AppColors.primary),
            ),
          ],
        ),
        InkWell(
          onTap: onViewDetails,
          borderRadius: BorderRadius.circular(AppRadii.md),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(AppRadii.md),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x0A0B1C30),
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'View Details',
                  style: AppTextStyles.labelMd(color: AppColors.primary),
                ),
                const SizedBox(width: 4),
                const Icon(
                  Icons.chevron_right_rounded,
                  size: 16,
                  color: AppColors.primary,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
