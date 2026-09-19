import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:creator_side/core/constants/app_routes.dart';
import 'package:creator_side/core/theme/creator_colors.dart';
import 'package:creator_side/core/widgets/shared/app_empty_state.dart';
import 'package:creator_side/core/widgets/shared/app_loading_center.dart';
import 'package:creator_side/core/widgets/shared/app_scaffold.dart';
import '../../bloc/creator_my_works_bloc.dart';
import '../../bloc/creator_my_works_event.dart';
import '../../bloc/creator_my_works_state.dart';
import '../../data/models/creator_work_item.dart';
import '../../data/models/mock_creator_works_data.dart';
import '../widgets/list/my_works_card.dart';
import '../widgets/list/my_works_filter_chips.dart';
import '../widgets/list/my_works_header.dart';
import '../widgets/list/my_works_metric_bento.dart';

/// Pure StatelessWidget for the Creator "My Works" tab using AppScaffold (<80 LOC).
class MyWorksView extends StatelessWidget {
  const MyWorksView({super.key});

  void _onCardTapped(BuildContext context, CreatorWorkItem item) {
    Navigator.of(context).pushNamed(AppRoutes.creatorWorkDetails, arguments: item);
  }

  void _onFilterTap(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoutes.creatorWorkFilter);
  }

  @override
  Widget build(BuildContext context) {
    final myWorksBloc = context.watch<CreatorMyWorksBloc?>();
    final activeFilter = myWorksBloc?.state.activeFilter ?? 'All Works (8)';
    final items = myWorksBloc?.state.filteredWorks ?? MockCreatorWorksData.items;
    final isLoading = myWorksBloc?.state.status == CreatorMyWorksStatus.loading;

    return AppScaffold(
      backgroundColor: CreatorColors.background,
      useSafeArea: true,
      body: Column(
        children: [
          MyWorksHeader(onFilterTap: () => _onFilterTap(context)),
          Expanded(
            child: isLoading
                ? const AppLoadingCenter()
                : ListView(
                    padding: const EdgeInsets.only(bottom: 24),
                    children: [
                      const SizedBox(height: 8),
                      const MyWorksMetricBento(),
                      const SizedBox(height: 8),
                      MyWorksFilterChips(
                        selectedFilter: activeFilter,
                        onFilterSelected: (val) {
                          myWorksBloc?.add(FilterCreatorWorks(val));
                        },
                      ),
                      const SizedBox(height: 4),
                      if (items.isEmpty)
                        const AppEmptyState(
                          title: 'No Works In This Category',
                          subtitle: 'You currently do not have any works matching this filter.',
                        )
                      else
                        ...items.map(
                          (item) => MyWorksCard(
                            item: item,
                            onTap: () => _onCardTapped(context, item),
                          ),
                        ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
