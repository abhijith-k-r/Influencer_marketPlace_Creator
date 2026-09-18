import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/creator_colors.dart';
import '../models/creator_earning_campaign_model.dart';
import '../models/mock_creator_earning_campaigns.dart';
import '../widgets/dashboard/creator_balance_overview_carousel.dart';
import '../widgets/dashboard/creator_campaign_earning_card.dart';
import '../widgets/dashboard/creator_escrow_security_ribbon.dart';
import '../widgets/dashboard/creator_payment_app_bar.dart';
import '../widgets/dashboard/creator_payment_filter_pills.dart';
import '../widgets/dashboard/creator_payout_assistance_banner.dart';

class CreatorPaymentsView extends StatefulWidget {
  const CreatorPaymentsView({super.key});

  @override
  State<CreatorPaymentsView> createState() => _CreatorPaymentsViewState();
}

class _CreatorPaymentsViewState extends State<CreatorPaymentsView> {
  String _selectedFilter = 'all';

  List<CreatorEarningCampaignModel> get _filteredCampaigns {
    switch (_selectedFilter) {
      case 'escrow':
        return mockCreatorEarningCampaigns
            .where((c) => c.statusType != CreatorCampaignStatusType.settled)
            .toList();
      case 'redeem':
        return mockCreatorEarningCampaigns
            .where((c) => c.availableToRedeemAmount != null)
            .toList();
      case 'settled':
        return mockCreatorEarningCampaigns
            .where((c) => c.statusType == CreatorCampaignStatusType.settled)
            .toList();
      default:
        return mockCreatorEarningCampaigns;
    }
  }

  @override
  Widget build(BuildContext context) {
    final campaigns = _filteredCampaigns;
    return Scaffold(
      backgroundColor: CreatorColors.background,
      appBar: const CreatorPaymentAppBar(),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: CreatorEscrowSecurityRibbon()),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          const SliverToBoxAdapter(child: CreatorBalanceOverviewCarousel()),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(
            child: CreatorPaymentFilterPills(
              activeFilter: _selectedFilter,
              onFilterChanged: (f) => setState(() => _selectedFilter = f),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: CreatorCampaignEarningCard(campaign: campaigns[index]),
                ),
                childCount: campaigns.length,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 32),
              child: CreatorPayoutAssistanceBanner(),
            ),
          ),
        ],
      ),
    );
  }
}
