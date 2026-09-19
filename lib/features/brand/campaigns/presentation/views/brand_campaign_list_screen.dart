import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/app_routes.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/shared/app_loading_center.dart';
import '../../../../../core/widgets/shared/app_scaffold.dart';
import '../../bloc/campaign_bloc.dart';
import '../../bloc/campaign_event.dart';
import '../../bloc/campaign_state.dart';
import '../../data/models/campaign_model.dart';
import '../widgets/list/campaign_card_tile.dart';
import '../widgets/list/campaign_empty_filter_state.dart';
import '../widgets/list/campaign_search_filter_bar.dart';
import '../widgets/list/campaign_status_tabs_row.dart';
import '../widgets/list/create_campaign_mini_banner.dart';

/// Pure StatelessWidget for Brand Campaign List using AppScaffold & AppLoadingCenter (<85 LOC).
class BrandCampaignListScreen extends StatelessWidget {
  const BrandCampaignListScreen({super.key});

  void _onCampaignTap(BuildContext context, CampaignModel campaign) {
    context.read<CampaignBloc>().add(SelectCampaignEvent(campaign));
    Navigator.of(context).pushNamed(AppRoutes.campaignDetails);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColors.background,
      useSafeArea: true,
      body: BlocBuilder<CampaignBloc, CampaignState>(
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () async {
              context.read<CampaignBloc>().add(const LoadCampaignsEvent());
            },
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              children: [
                CampaignSearchFilterBar(
                  onSearchChanged: (q) => context
                      .read<CampaignBloc>()
                      .add(SearchCampaignsEvent(q)),
                  onFilterTap: () => Navigator.of(context)
                      .pushNamed(AppRoutes.campaignFilter),
                ),
                const SizedBox(height: 12),
                CampaignStatusTabsRow(
                  activeTab: state.activeTab,
                  allCount: state.totalCount,
                  activeCount: state.activeCount,
                  completedCount: state.completedCount,
                  draftsCount: state.draftsCount,
                  onTabSelected: (tab) => context
                      .read<CampaignBloc>()
                      .add(ChangeStatusTabEvent(tab)),
                ),
                const SizedBox(height: 12),
                CreateCampaignMiniBanner(
                  onTap: () => Navigator.of(context)
                      .pushNamed(AppRoutes.campaignCreate),
                ),
                const SizedBox(height: 12),
                if (state.status == CampaignStatusState.loading)
                  const AppLoadingCenter()
                else if (state.filteredCampaigns.isEmpty)
                  const CampaignEmptyFilterState()
                else
                  ...state.filteredCampaigns.map(
                    (campaign) => CampaignCardTile(
                      campaign: campaign,
                      onTap: () => _onCampaignTap(context, campaign),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
