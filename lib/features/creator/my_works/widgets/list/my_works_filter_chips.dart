import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_shadows.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';

/// Horizontal scrollable chip bar for filtering works by status.
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
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: filters.map((filter) {
          final isSelected = selectedFilter == filter;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: InkWell(
              borderRadius: AppRadii.roundedFull,
              onTap: () => onFilterSelected(filter),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected
                      ? CreatorColors.primaryContainer
                      : CreatorColors.surfaceContainerLowest,
                  borderRadius: AppRadii.roundedFull,
                  boxShadow: isSelected
                      ? const [
                          BoxShadow(
                            color: Color(0x403B46F1),
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ]
                      : AppShadows.cardSoft,
                ),
                child: Text(
                  filter,
                  style: AppTextStyles.labelMd(
                    color: isSelected
                        ? CreatorColors.onPrimary
                        : CreatorColors.onSurfaceVariant,
                  ).copyWith(
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
