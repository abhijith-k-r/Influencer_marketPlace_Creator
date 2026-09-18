import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../bloc/campaign_bloc.dart';
import '../../bloc/campaign_event.dart';
import '../../bloc/campaign_state.dart';
import '../../data/datasources/mock_campaign_data.dart';
import '../widgets/details/applied_creators_card.dart';
import '../widgets/details/campaign_overview_hero_card.dart';
import '../widgets/details/details_bottom_action_buttons.dart';
import '../widgets/details/details_context_top_bar.dart';
import '../widgets/details/details_milestones_card.dart';
import '../widgets/details/target_audience_scope_card.dart';

class BrandCampaignDetailsScreen extends StatelessWidget {
  const BrandCampaignDetailsScreen({super.key});

  void _showToast(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 2)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: BlocBuilder<CampaignBloc, CampaignState>(
          builder: (context, state) {
            final campaign = state.selectedCampaign ?? MockCampaignData.campaigns.first;

            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              children: [
                DetailsContextTopBar(
                  campaignId: campaign.id,
                  onBack: () => Navigator.of(context).pop(),
                  onEdit: () => Navigator.of(context).pushNamed(AppRoutes.campaignCreate),
                  onShare: () => _showToast(context, 'Campaign link copied to clipboard!'),
                ),
                const SizedBox(height: 12),
                CampaignOverviewHeroCard(campaign: campaign),
                const SizedBox(height: 16),
                AppliedCreatorsCard(
                  campaign: campaign,
                  onReviewApplicants: () => _showToast(context, 'Opening creator applicants list...'),
                ),
                const SizedBox(height: 16),
                DetailsMilestonesCard(milestones: campaign.milestones),
                const SizedBox(height: 16),
                TargetAudienceScopeCard(campaign: campaign),
                const SizedBox(height: 20),
                DetailsBottomActionButtons(
                  onEdit: () => Navigator.of(context).pushNamed(AppRoutes.campaignCreate),
                  onDelete: () {
                    context.read<CampaignBloc>().add(DeleteCampaignEvent(campaign.id));
                    Navigator.of(context).pop();
                    _showToast(context, 'Campaign successfully deleted');
                  },
                ),
                const SizedBox(height: 24),
              ],
            );
          },
        ),
      ),
    );
  }
}
