import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_colors.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_shadows.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'external_portfolio_hub_item.dart';

/// Card containing External Portfolio Hubs (Behance, Website, Media Kit).
class ExternalPortfolioHubsCard extends StatelessWidget {
  const ExternalPortfolioHubsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: AppColors.surfaceWhite,
        borderRadius: AppRadii.roundedCard,
        boxShadow: AppShadows.cardSoft,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.public, size: 20, color: AppColors.primary),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'External Portfolio Hubs',
                  style: AppTextStyles.fieldLabel.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            'Provide verified archives where enterprise marketing heads can '
            'inspect raw analytics and high-resolution deliverables.',
            style: AppTextStyles.body.copyWith(
              fontSize: 13,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 16),
          const ExternalPortfolioHubItem(
            icon: Icons.palette_outlined,
            iconBgColor: AppColors.trustBadgeBackground,
            iconColor: AppColors.textPrimary,
            label: 'Portfolio Showreel / Behance',
            value: 'behance.net/creator-studio',
            trailing: Icon(Icons.check_circle, size: 18, color: AppColors.primary),
          ),
          const SizedBox(height: 10),
          const ExternalPortfolioHubItem(
            icon: Icons.language,
            iconBgColor: AppColors.trustBadgeBackground,
            iconColor: AppColors.textPrimary,
            label: 'Personal Website / Journal',
            value: 'alexandra-creates.com',
            trailing: Icon(Icons.check_circle, size: 18, color: AppColors.primary),
          ),
          const SizedBox(height: 10),
          ExternalPortfolioHubItem(
            icon: Icons.description_outlined,
            iconBgColor: AppColors.pillBackground,
            iconColor: AppColors.primary,
            label: 'Media Kit Document (PDF)',
            value: 'Alexandra_MediaKit_Q3.pdf',
            trailing: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.strengthInactive,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Replace',
                style: AppTextStyles.brandPill.copyWith(
                  fontSize: 11,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
