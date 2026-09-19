import 'package:flutter/material.dart';
import 'work_filter_bottom_actions.dart';
import 'work_filter_brand_search.dart';
import 'work_filter_budget_slider.dart';
import 'work_filter_date_cards.dart';
import 'work_filter_format_grid.dart';
import 'work_filter_match_banner.dart';
import 'work_filter_status_group.dart';

/// Scrollable body assembling filter sections in the Creator Work Filter view.
class WorkFilterContentList extends StatelessWidget {
  final TextEditingController searchController;
  final VoidCallback onClearSearch;
  final Set<String> selectedStatuses;
  final ValueChanged<String> onToggleStatus;
  final String activeDatePreset;
  final ValueChanged<String> onSelectPreset;
  final Set<String> selectedFormats;
  final ValueChanged<String> onToggleFormat;
  final VoidCallback onApply;
  final VoidCallback onReset;

  const WorkFilterContentList({
    super.key,
    required this.searchController,
    required this.onClearSearch,
    required this.selectedStatuses,
    required this.onToggleStatus,
    required this.activeDatePreset,
    required this.onSelectPreset,
    required this.selectedFormats,
    required this.onToggleFormat,
    required this.onApply,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      children: [
        const WorkFilterMatchBanner(matchCount: 4),
        const SizedBox(height: 12),
        WorkFilterBrandSearch(
          controller: searchController,
          onClear: onClearSearch,
        ),
        const SizedBox(height: 12),
        WorkFilterStatusGroup(
          selectedStatuses: selectedStatuses,
          onToggleStatus: onToggleStatus,
        ),
        const SizedBox(height: 12),
        WorkFilterDateCards(
          activePreset: activeDatePreset,
          onSelectPreset: onSelectPreset,
        ),
        const SizedBox(height: 12),
        const WorkFilterBudgetSlider(),
        const SizedBox(height: 12),
        WorkFilterFormatGrid(
          selectedFormats: selectedFormats,
          onToggleFormat: onToggleFormat,
        ),
        const SizedBox(height: 16),
        WorkFilterBottomActions(
          resultCount: 4,
          onApply: onApply,
          onReset: onReset,
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
