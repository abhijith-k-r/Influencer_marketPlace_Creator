import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:creator_side/core/constants/app_routes.dart';
import 'package:creator_side/core/theme/creator_colors.dart';
import 'package:creator_side/core/widgets/shared/app_empty_state.dart';
import 'package:creator_side/core/widgets/shared/app_loading_center.dart';
import 'package:creator_side/core/widgets/shared/app_scaffold.dart';
import '../../bloc/creator_payments_bloc.dart';
import '../../bloc/creator_payments_event.dart';
import '../../bloc/creator_payments_state.dart';
import '../../data/models/creator_earning_campaign_model.dart';
import '../../data/models/mock_creator_earning_campaigns.dart';
import '../widgets/dashboard/creator_balance_overview_carousel.dart';
import '../widgets/dashboard/creator_campaign_earning_card.dart';
import '../widgets/dashboard/creator_escrow_security_ribbon.dart';
import '../widgets/dashboard/creator_payment_app_bar.dart';
import '../widgets/dashboard/creator_payment_filter_pills.dart';
import '../widgets/dashboard/creator_payout_assistance_banner.dart';

/// Pure StatelessWidget for the Creator Payments dashboard tab using AppScaffold (<80 LOC).
class CreatorPaymentsView extends StatelessWidget {
  const CreatorPaymentsView({super.key});

  void _onCampaignTap(BuildContext context, CreatorEarningCampaignModel campaign) {
    Navigator.of(context).pushNamed(AppRoutes.creatorPaymentDetails, arguments: campaign);
  }

  @override
  Widget build(BuildContext context) {
    final paymentsBloc = context.watch<CreatorPaymentsBloc?>();
    final activeFilter = paymentsBloc?.state.activeFilter ?? 'All Campaigns';
    final campaigns = paymentsBloc?.state.filteredCampaigns ?? mockCreatorEarningCampaigns;
    final isLoading = paymentsBloc?.state.status == CreatorPaymentsStatus.loading;

    return AppScaffold(
      backgroundColor: CreatorColors.background,
      appBar: const CreatorPaymentAppBar(),
      body: isLoading
          ? const AppLoadingCenter()
          : ListView(
              padding: const EdgeInsets.only(bottom: 24),
              children: [
                const SizedBox(height: 8),
                const CreatorEscrowSecurityRibbon(),
                const SizedBox(height: 16),
                CreatorBalanceOverviewCarousel(
                  onRedeemTap: () {
                    Navigator.of(context).pushNamed(AppRoutes.creatorPaymentRedeem);
                  },
                ),
                const SizedBox(height: 16),
                CreatorPaymentFilterPills(
                  selectedFilter: activeFilter,
                  onFilterChanged: (f) {
                    paymentsBloc?.add(FilterCreatorPaymentsByStatus(f));
                  },
                ),
                const SizedBox(height: 8),
                if (campaigns.isEmpty)
                  const AppEmptyState(
                    title: 'No Earnings Found',
                    subtitle: 'Earnings from completed milestones will be listed here.',
                  )
                else
                  ...campaigns.map(
                    (c) => CreatorCampaignEarningCard(
                      campaign: c,
                      onTap: () => _onCampaignTap(context, c),
                    ),
                  ),
                const SizedBox(height: 12),
                const CreatorPayoutAssistanceBanner(),
              ],
            ),
    );
  }
}
