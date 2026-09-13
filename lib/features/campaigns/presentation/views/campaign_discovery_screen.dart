import 'package:flutter/material.dart';
import '../../../../core/constants/app_routes.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../data/models/campaign_model.dart';
import '../widgets/campaign_card.dart';
import '../widgets/campaign_filter_chips.dart';
import '../widgets/campaign_search_bar.dart';

/// Campaign Discovery screen allowing creators to browse and filter open sponsorships.
class CampaignDiscoveryScreen extends StatelessWidget {
  const CampaignDiscoveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Discover Sponsorships',
          style: AppTextStyles.h1.copyWith(fontSize: 20),
        ),
        AppSpacing.verticalXs,
        Text(
          'Connect with verified brands offering instant escrow contracts.',
          style: AppTextStyles.subtitle,
        ),
        AppSpacing.verticalLg,
        const CampaignSearchBar(),
        AppSpacing.verticalMd,
        CampaignFilterChips(selectedCategory: 'All', onSelect: (_) {}),
        AppSpacing.verticalLg,
        ...CampaignModel.sampleCampaigns.map(
          (campaign) => CampaignCard(
            campaign: campaign,
            onTap: () => Navigator.pushNamed(
              context,
              AppRoutes.campaignDetails,
              arguments: campaign,
            ),
          ),
        ),
        AppSpacing.verticalXl,
      ],
    );
  }
}
