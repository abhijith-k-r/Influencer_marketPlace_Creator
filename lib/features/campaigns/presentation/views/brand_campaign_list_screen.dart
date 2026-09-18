import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../bloc/campaign_bloc.dart';
import '../../bloc/campaign_event.dart';
import '../../bloc/campaign_state.dart';
import '../../data/models/campaign_model.dart';
import '../widgets/list/campaign_card_tile.dart';
import '../widgets/list/campaign_empty_filter_state.dart';
import '../widgets/list/campaign_search_filter_bar.dart';
import '../widgets/list/campaign_status_tabs_row.dart';
import '../widgets/list/create_campaign_mini_banner.dart';

class BrandCampaignListScreen extends StatefulWidget {
  const BrandCampaignListScreen({super.key});

  @override
  State<BrandCampaignListScreen> createState() => _BrandCampaignListScreenState();
}

class _BrandCampaignListScreenState extends State<BrandCampaignListScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CampaignBloc>().add(const LoadCampaignsEvent());
  }

  void _onCampaignTap(CampaignModel campaign) {
    context.read<CampaignBloc>().add(SelectCampaignEvent(campaign));
    Navigator.of(context).pushNamed(AppRoutes.campaignDetails);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: BlocBuilder<CampaignBloc, CampaignState>(
          builder: (context, state) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<CampaignBloc>().add(const LoadCampaignsEvent());
              },
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                children: [
                  CampaignSearchFilterBar(
                    onSearchChanged: (q) =>
                        context.read<CampaignBloc>().add(SearchCampaignsEvent(q)),
                    onFilterTap: () =>
                        Navigator.of(context).pushNamed(AppRoutes.campaignFilter),
                  ),
                  const SizedBox(height: 12),
                  CampaignStatusTabsRow(
                    activeTab: state.activeTab,
                    allCount: state.totalCount,
                    activeCount: state.activeCount,
                    completedCount: state.completedCount,
                    draftsCount: state.draftsCount,
                    onTabSelected: (tab) =>
                        context.read<CampaignBloc>().add(ChangeStatusTabEvent(tab)),
                  ),
                  const SizedBox(height: 14),
                  CreateCampaignMiniBanner(
                    onTap: () =>
                        Navigator.of(context).pushNamed(AppRoutes.campaignCreate),
                  ),
                  const SizedBox(height: 16),
                  if (state.filteredCampaigns.isEmpty)
                    const CampaignEmptyFilterState()
                  else
                    ...state.filteredCampaigns.map(
                      (c) => Padding(
                        padding: const EdgeInsets.only(bottom: 14),
                        child: CampaignCardTile(
                          campaign: c,
                          onTap: () => _onCampaignTap(c),
                        ),
                      ),
                    ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
