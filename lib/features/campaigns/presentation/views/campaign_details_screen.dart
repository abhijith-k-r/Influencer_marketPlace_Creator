import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_colors.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_spacing.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/widgets/app_scaffold.dart';
import 'package:creator_side/features/auth/presentation/widgets/primary_button.dart';
import '../widgets/apply_campaign_modal.dart';
import '../widgets/campaign_deliverables_card.dart';
import '../widgets/campaign_guidelines_card.dart';
import '../../data/models/campaign_model.dart';

/// Full details screen for an individual brand sponsorship campaign.
class CampaignDetailsScreen extends StatelessWidget {
  final CampaignModel? campaign;

  const CampaignDetailsScreen({super.key, this.campaign});

  @override
  Widget build(BuildContext context) {
    final item = campaign ?? CampaignModel.sampleCampaigns.first;

    return AppScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_rounded),
                onPressed: () => Navigator.pop(context),
              ),
              Text(item.brandName, style: AppTextStyles.brandPill),
              const Icon(Icons.bookmark_border_rounded),
            ],
          ),
          AppSpacing.verticalMd,
          Text(item.title, style: AppTextStyles.h1.copyWith(fontSize: 22)),
          AppSpacing.verticalSm,
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: const BoxDecoration(
              color: AppColors.pillBackground,
              borderRadius: AppRadii.roundedPill,
            ),
            child: Text(
              '${item.payout} Escrow Guaranteed • ${item.deadline}',
              style: AppTextStyles.brandPill,
            ),
          ),
          AppSpacing.verticalLg,
          CampaignDeliverablesCard(deliverables: item.deliverables),
          AppSpacing.verticalMd,
          const CampaignGuidelinesCard(),
          AppSpacing.verticalXl,
          PrimaryButton(
            label: 'Apply for Sponsorship',
            onPressed: () => _showApplyModal(context, item),
          ),
          AppSpacing.verticalXl,
        ],
      ),
    );
  }

  void _showApplyModal(BuildContext context, CampaignModel item) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => ApplyCampaignModal(
        campaignTitle: item.title,
        brandName: item.brandName,
      ),
    );
  }
}
