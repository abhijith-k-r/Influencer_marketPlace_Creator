import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_colors.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_shadows.dart';
import 'review_aggregated_reach_card.dart';
import 'review_bio_section.dart';
import 'review_deliverables_section.dart';
import 'review_portfolio_highlights.dart';
import 'review_profile_header.dart';

/// Creator Overview Card in Step 5 containing profile, bio, reach, and portfolio.
class ReviewOverviewCard extends StatelessWidget {
  final VoidCallback? onEditProfile;
  final VoidCallback? onEditBio;
  final VoidCallback? onEditReach;
  final VoidCallback? onEditPortfolio;
  final VoidCallback? onEditDeliverables;

  const ReviewOverviewCard({
    super.key,
    this.onEditProfile,
    this.onEditBio,
    this.onEditReach,
    this.onEditPortfolio,
    this.onEditDeliverables,
  });

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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ReviewProfileHeader(onEdit: onEditProfile),
          const SizedBox(height: 14),
          ReviewBioSection(onEdit: onEditBio),
          const SizedBox(height: 14),
          ReviewAggregatedReachCard(onEdit: onEditReach),
          const SizedBox(height: 14),
          ReviewPortfolioHighlights(onEdit: onEditPortfolio),
          const SizedBox(height: 14),
          ReviewDeliverablesSection(onEdit: onEditDeliverables),
        ],
      ),
    );
  }
}
