import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:creator_side/core/theme/creator_colors.dart';
import 'package:creator_side/core/widgets/creator/creator_side_drawer.dart';
import 'package:creator_side/core/widgets/shared/app_empty_state.dart';
import 'package:creator_side/core/widgets/shared/app_loading_center.dart';
import 'package:creator_side/core/widgets/shared/app_scaffold.dart';
import '../../bloc/creator_home_bloc.dart';
import '../../bloc/creator_home_event.dart';
import '../../bloc/creator_home_state.dart';
import '../../data/models/mock_creator_opportunities.dart';
import '../widgets/creator_filter_tray.dart';
import '../widgets/creator_hero_match_banner.dart';
import '../widgets/creator_home_app_bar.dart';
import '../widgets/creator_opportunity_card.dart';
import '../widgets/creator_pulse_toast_row.dart';

/// Pure StatelessWidget for Creator Home tab using global AppScaffold (<80 LOC).
class CreatorHomeView extends StatelessWidget {
  const CreatorHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final homeBloc = context.watch<CreatorHomeBloc?>();
    final activeFilter = homeBloc?.state.activeFilter ?? 'all';
    final opps =
        homeBloc?.state.filteredOpportunities ?? mockCreatorOpportunities;
    final isLoading = homeBloc?.state.status == CreatorHomeStatus.loading;

    return AppScaffold(
      backgroundColor: CreatorColors.background,
      drawer: const CreatorSideDrawer(),
      useSafeArea: true,
      body: Builder(
        builder: (scaffoldCtx) => Column(
          children: [
            CreatorHomeAppBar(
              onDrawerTap: () => Scaffold.of(scaffoldCtx).openDrawer(),
            ),
            Expanded(
              child: isLoading
                  ? const AppLoadingCenter()
                  : ListView(
                      padding: const EdgeInsets.only(bottom: 24),
                      children: [
                        const SizedBox(height: 8),
                        const CreatorHeroMatchBanner(),
                        const SizedBox(height: 12),
                        const CreatorPulseToastRow(),
                        const SizedBox(height: 14),
                        CreatorFilterTray(
                          activeFilter: activeFilter,
                          onFilterChanged: (f) {
                            homeBloc?.add(FilterCreatorHomeOpportunities(f));
                          },
                        ),
                        const SizedBox(height: 8),
                        if (opps.isEmpty)
                          const AppEmptyState(
                            title: 'No Opportunities Found',
                            subtitle:
                                'Try switching filters to view more opportunities.',
                          )
                        else
                          ...opps.map(
                            (opp) => CreatorOpportunityCard(
                              opportunity: opp,
                              onDetailsTap: () {},
                              onApplyTap: () {},
                            ),
                          ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
