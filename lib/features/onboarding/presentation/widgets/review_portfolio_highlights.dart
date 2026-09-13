import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_colors.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'review_portfolio_item.dart';

/// Featured portfolio highlights section in Profile Review with 2 campaigns.
class ReviewPortfolioHighlights extends StatelessWidget {
  final VoidCallback? onEdit;

  const ReviewPortfolioHighlights({super.key, this.onEdit});

  @override
  Widget build(BuildContext context) {
    return Column(
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
                      'FEATURED PORTFOLIO',
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.brandPill.copyWith(
                        fontSize: 11,
                        letterSpacing: 0.66,
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: const BoxDecoration(
                      color: AppColors.liveBadgeBackground,
                      borderRadius: AppRadii.roundedPill,
                    ),
                    child: Text(
                      '2 Campaigns',
                      style: AppTextStyles.brandPill.copyWith(
                        fontSize: 10,
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: onEdit,
              child: Text(
                'Edit',
                style: AppTextStyles.fieldLabel.copyWith(
                  fontSize: 12,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Row(
          children: [
            Expanded(
              child: ReviewPortfolioItem(
                formatBadge: 'Reel',
                title: 'Sony Audio',
                subtitle: 'Noise-Canceling Showcase',
                productIcon: Icons.headphones,
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: ReviewPortfolioItem(
                formatBadge: 'Carousel',
                title: 'Nordic Watch Co.',
                subtitle: 'Autumn Launch Series',
                productIcon: Icons.watch,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
