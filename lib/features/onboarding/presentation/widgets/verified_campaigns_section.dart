import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_colors.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'add_previous_work_button.dart';
import 'verified_campaign_card.dart';

/// Verified campaigns list section with header, cards, and add work button.
class VerifiedCampaignsSection extends StatelessWidget {
  const VerifiedCampaignsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  Flexible(
                    child: Text(
                      'Verified Campaigns',
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.fieldLabel.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: const BoxDecoration(
                      color: AppColors.trustBadgeBackground,
                      borderRadius: AppRadii.roundedPill,
                    ),
                    child: Text(
                      '2 Added',
                      style: AppTextStyles.brandPill.copyWith(
                        fontSize: 11,
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'Audited metrics',
              style: AppTextStyles.fieldLabel.copyWith(
                fontSize: 12,
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        const VerifiedCampaignCard(
          platform: 'YouTube',
          metricText: '120k Views',
          metricIcon: Icons.visibility,
          brandTitle: 'Sony Audio',
          campaignSubtitle: 'WH-1000XM5 Launch',
          quote:
              'Dedicated 10-min review with 120k organic views & 14.8% high-conversion click rate.',
          linkUrl: 'youtube.com/watch?v=sample',
          productIcon: Icons.headphones,
          badgeIcon: Icons.play_circle_filled,
          badgeColor: Color(0xFFBA1A1A),
        ),
        const SizedBox(height: 12),
        const VerifiedCampaignCard(
          platform: 'Instagram',
          metricText: '8.4% Eng.',
          metricIcon: Icons.favorite,
          brandTitle: 'Nordic Watch Co.',
          campaignSubtitle: 'Minimalist Autumn Campaign',
          quote:
              '3x Carousel posts & 5 stories highlighting sustainable sapphire glass design.',
          linkUrl: 'instagram.com/p/sample',
          productIcon: Icons.watch,
          badgeIcon: Icons.photo_library,
          badgeColor: AppColors.primaryLight,
        ),
        const SizedBox(height: 16),
        const AddPreviousWorkButton(),
      ],
    );
  }
}
