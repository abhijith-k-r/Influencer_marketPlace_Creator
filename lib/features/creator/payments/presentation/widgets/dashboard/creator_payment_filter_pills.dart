import 'package:flutter/material.dart';
import 'package:creator_side/core/widgets/shared/app_filter_row.dart';

/// Payment filter pills delegating to global AppFilterRow component (<35 LOC).
class CreatorPaymentFilterPills extends StatelessWidget {
  final String selectedFilter;
  final ValueChanged<String> onFilterChanged;

  static const List<String> filters = [
    'All Campaigns',
    'In Escrow',
    'Settled',
    'Action Required',
  ];

  const CreatorPaymentFilterPills({
    super.key,
    required this.selectedFilter,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    return AppFilterRow(
      filters: filters,
      selectedFilter: selectedFilter,
      onFilterChanged: onFilterChanged,
    );
  }
}
