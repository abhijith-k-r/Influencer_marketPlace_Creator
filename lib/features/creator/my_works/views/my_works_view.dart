import 'package:flutter/material.dart';
import 'package:creator_side/core/constants/app_routes.dart';
import 'package:creator_side/core/theme/creator_colors.dart';
import '../models/creator_work_item.dart';
import '../models/mock_creator_works_data.dart';
import '../widgets/list/my_works_card.dart';
import '../widgets/list/my_works_filter_chips.dart';
import '../widgets/list/my_works_header.dart';
import '../widgets/list/my_works_metric_bento.dart';

/// Main screen displayed under the Creator bottom navigation "My Works" tab.
class MyWorksView extends StatefulWidget {
  const MyWorksView({super.key});

  @override
  State<MyWorksView> createState() => _MyWorksViewState();
}

class _MyWorksViewState extends State<MyWorksView> {
  String _selectedFilter = 'All Works (8)';

  List<CreatorWorkItem> get _filteredItems {
    if (_selectedFilter.startsWith('In Progress')) {
      return MockCreatorWorksData.items
          .where((w) => w.status == 'In Progress')
          .toList();
    } else if (_selectedFilter.startsWith('Accepted')) {
      return MockCreatorWorksData.items
          .where((w) => w.status == 'Accepted')
          .toList();
    } else if (_selectedFilter.startsWith('Applied')) {
      return MockCreatorWorksData.items
          .where((w) => w.status == 'Applied')
          .toList();
    } else if (_selectedFilter.startsWith('Completed')) {
      return MockCreatorWorksData.items
          .where((w) => w.status == 'Paid')
          .toList();
    }
    return MockCreatorWorksData.items;
  }

  void _onCardTapped(BuildContext context, CreatorWorkItem item) {
    Navigator.of(
      context,
    ).pushNamed(AppRoutes.creatorWorkDetails, arguments: item);
  }

  void _onFilterTap(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoutes.creatorWorkFilter);
  }

  @override
  Widget build(BuildContext context) {
    final items = _filteredItems;

    return Scaffold(
      backgroundColor: CreatorColors.background,
      body: SafeArea(
        child: Column(
          children: [
            MyWorksHeader(onFilterTap: () => _onFilterTap(context)),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(bottom: 24),
                children: [
                  const SizedBox(height: 8),
                  const MyWorksMetricBento(),
                  const SizedBox(height: 8),
                  MyWorksFilterChips(
                    selectedFilter: _selectedFilter,
                    onFilterSelected: (val) =>
                        setState(() => _selectedFilter = val),
                  ),
                  const SizedBox(height: 4),
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
      ),
    );
  }
}
