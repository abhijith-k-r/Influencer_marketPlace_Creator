import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_colors.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_shadows.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'review_reach_card_header.dart';
import 'review_reach_channels_row.dart';

/// Aggregated audience reach banner with 437k total and individual channels.
class ReviewAggregatedReachCard extends StatelessWidget {
  final VoidCallback? onEdit;

  const ReviewAggregatedReachCard({super.key, this.onEdit});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: AppRadii.roundedCard,
        boxShadow: AppShadows.cardSoft,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.surfaceWhite,
            AppColors.inputBackground.withValues(alpha: 0.4),
            AppColors.trustBadgeBackground,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReviewReachCardHeader(onEdit: onEdit),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                '437,000+',
                style: AppTextStyles.h1.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  'Verified Audience',
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.body.copyWith(
                    fontSize: 13,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const ReviewReachChannelsRow(),
        ],
      ),
    );
  }
}
