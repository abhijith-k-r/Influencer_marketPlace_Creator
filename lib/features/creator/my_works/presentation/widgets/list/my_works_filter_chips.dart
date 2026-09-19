import 'package:flutter/material.dart';
import 'package:creator_side/core/widgets/shared/app_filter_row.dart';

/// Filter chips delegating to global AppFilterRow component (<35 LOC).
class MyWorksFilterChips extends StatelessWidget {
  final String selectedFilter;
  final ValueChanged<String> onFilterSelected;

  static const List<String> filters = [
    'All Works (8)',
    'In Progress (3)',
    'Accepted (2)',
    'Applied (2)',
    'Completed & Paid (1)',
  ];

  const MyWorksFilterChips({
    super.key,
    required this.selectedFilter,
    required this.onFilterSelected,
  });

  @override
  Widget build(BuildContext context) {
    return AppFilterRow(
      filters: filters,
      selectedFilter: selectedFilter,
      onFilterChanged: onFilterSelected,
    );
  }
}
