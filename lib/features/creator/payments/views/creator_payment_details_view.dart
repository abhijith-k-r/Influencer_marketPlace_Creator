import 'package:flutter/material.dart';
import 'package:creator_side/core/constants/app_routes.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';
import '../models/creator_earning_campaign_model.dart';
import '../models/mock_creator_earning_campaigns.dart';
import '../models/mock_creator_payment_milestones.dart';
import '../widgets/details/creator_linked_bank_box.dart';
import '../widgets/details/creator_milestone_item_card.dart';
import '../widgets/details/creator_payment_campaign_overview_card.dart';
import '../widgets/details/creator_payment_details_header.dart';
import '../widgets/details/creator_settlement_history_card.dart';

class CreatorPaymentDetailsView extends StatelessWidget {
  final CreatorEarningCampaignModel? campaign;

  const CreatorPaymentDetailsView({super.key, this.campaign});

  @override
  Widget build(BuildContext context) {
    final activeCampaign = campaign ?? mockCreatorEarningCampaigns.first;

    return Scaffold(
      backgroundColor: CreatorColors.background,
      appBar: const CreatorPaymentDetailsHeader(),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
        children: [
          CreatorPaymentCampaignOverviewCard(campaign: activeCampaign),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Milestones & Bonuses',
                style: AppTextStyles.labelLg(
                  color: CreatorColors.onSurface,
                ).copyWith(fontWeight: FontWeight.w700),
              ),
              Text(
                '${mockCreatorPaymentMilestones.length} Stages',
                style: AppTextStyles.labelSm(
                  color: CreatorColors.outline,
                ).copyWith(fontSize: 10),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...mockCreatorPaymentMilestones.map(
            (milestone) => CreatorMilestoneItemCard(
              milestone: milestone,
              onRedeem: () {
                Navigator.of(context).pushNamed(AppRoutes.creatorPaymentRedeem);
              },
            ),
          ),
          const SizedBox(height: 16),
          const CreatorSettlementHistoryCard(),
          const SizedBox(height: 16),
          const CreatorLinkedBankBox(),
        ],
      ),
    );
  }
}
