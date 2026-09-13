import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_colors.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';

/// Text details and metrics chip for a verified campaign.
class VerifiedCampaignDetails extends StatelessWidget {
  final String platform;
  final String metricText;
  final IconData metricIcon;
  final String brandTitle;
  final String campaignSubtitle;

  const VerifiedCampaignDetails({
    super.key,
    required this.platform,
    required this.metricText,
    required this.metricIcon,
    required this.brandTitle,
    required this.campaignSubtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                platform.toUpperCase(),
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.brandPill.copyWith(
                  fontSize: 11,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(width: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: const BoxDecoration(
                color: AppColors.trustBadgeBackground,
                borderRadius: AppRadii.roundedPill,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(metricIcon, size: 12, color: AppColors.primary),
                  const SizedBox(width: 4),
                  Text(
                    metricText,
                    style: AppTextStyles.brandPill.copyWith(
                      fontSize: 11,
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Text(
          brandTitle,
          style: AppTextStyles.fieldLabel.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          campaignSubtitle,
          style: AppTextStyles.body.copyWith(
            fontSize: 13,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
