import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_shadows.dart';
import '../../../../core/theme/app_text_styles.dart';
import 'brand_avatar_badge.dart';

/// Context sub-header for active brand and campaign collaboration in messages.
class BrandCampaignContextBar extends StatelessWidget {
  final String brandName;
  final String campaignName;
  final String status;
  final bool isVerified;
  final String? avatarUrl;

  const BrandCampaignContextBar({
    super.key,
    required this.brandName,
    required this.campaignName,
    required this.status,
    this.isVerified = true,
    this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: const BoxDecoration(
        color: AppColors.inputBackground,
        boxShadow: AppShadows.subtle,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              BrandAvatarBadge(avatarUrl: avatarUrl),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(brandName, style: AppTextStyles.h4.copyWith(fontSize: 15)),
                      if (isVerified) ...[
                        const SizedBox(width: 4),
                        const Icon(Icons.verified, size: 16, color: AppColors.primary),
                      ],
                    ],
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Text(campaignName, style: AppTextStyles.caption),
                      const SizedBox(width: 4),
                      const Text('•', style: TextStyle(color: AppColors.dotDivider)),
                      const SizedBox(width: 4),
                      Text(
                        status,
                        style: AppTextStyles.caption.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Container(
            width: 36,
            height: 36,
            decoration: const BoxDecoration(
              color: AppColors.surfaceWhite,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.info_outline_rounded,
              size: 20,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
