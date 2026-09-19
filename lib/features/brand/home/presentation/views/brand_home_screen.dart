import 'package:creator_side/core/widgets/brand/brand_side_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:creator_side/core/theme/app_colors.dart';
import 'package:creator_side/core/widgets/shared/app_empty_state.dart';
import 'package:creator_side/core/widgets/shared/app_loading_center.dart';
import 'package:creator_side/core/widgets/shared/app_scaffold.dart';
import '../../bloc/home_bloc.dart';
import '../../bloc/home_event.dart';
import '../../bloc/home_state.dart';
import '../widgets/brand_home_app_bar.dart';
import '../widgets/brand_home_section_header.dart';
import '../widgets/creator_card.dart';
import '../widgets/filter_chips_bar.dart';
import '../widgets/home_search_bar.dart';

/// Brand Home screen — fully decomposed, BLoC-wired, StatelessWidget (<100 LOC).
class BrandHomeScreen extends StatelessWidget {
  const BrandHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(const LoadCreatorsEvent());
    return AppScaffold(
      backgroundColor: AppColors.background,
      drawer: BrandSideDrawer(),
      useSafeArea: true,
      body: Column(
        children: [
          const BrandHomeAppBar(),
          Expanded(
            child: RefreshIndicator(
              color: AppColors.primary,
              onRefresh: () async =>
                  context.read<HomeBloc>().add(const LoadCreatorsEvent()),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics(),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HomeSearchBar(
                      onChanged: (q) => context
                          .read<HomeBloc>()
                          .add(SearchQueryChangedEvent(q)),
                      onFilterTap: () {},
                    ),
                    const SizedBox(height: 14),
                    BlocBuilder<HomeBloc, HomeState>(
                      buildWhen: (p, c) => p.selectedFilter != c.selectedFilter,
                      builder: (context, state) => FilterChipsBar(
                        selectedFilter: state.selectedFilter,
                        onSelected: (f) =>
                            context.read<HomeBloc>().add(SelectFilterEvent(f)),
                      ),
                    ),
                    const SizedBox(height: 20),
                    BrandHomeSectionHeader(onFilterSort: () {}),
                    const SizedBox(height: 12),
                    BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        if (state.status == HomeStatus.loading &&
                            state.creators.isEmpty) {
                          return const AppLoadingCenter();
                        }
                        if (state.creators.isEmpty) {
                          return const AppEmptyState(
                            title: 'No creators found',
                            subtitle: 'Try a different filter or search keyword',
                          );
                        }
                        return ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.creators.length,
                          separatorBuilder: (_, _) =>
                              const SizedBox(height: 12),
                          itemBuilder: (_, i) => CreatorCard(
                            creator: state.creators[i],
                            onViewProfile: () {},
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
