import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';

/// Global horizontal filter chip row for filtering lists across features.
class AppFilterRow extends StatelessWidget {
  final List<String> filters;
  final String selectedFilter;
  final ValueChanged<String> onFilterChanged;
  final EdgeInsetsGeometry padding;
  final double height;

  const AppFilterRow({
    super.key,
    required this.filters,
    required this.selectedFilter,
    required this.onFilterChanged,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.height = 36,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: padding,
        itemCount: filters.length,
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final filter = filters[index];
          final isSelected = filter == selectedFilter;

          return InkWell(
            onTap: () => onFilterChanged(filter),
            borderRadius: AppRadii.roundedFull,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: isSelected
                    ? CreatorColors.primary
                    : CreatorColors.surfaceContainerLowest,
                borderRadius: AppRadii.roundedFull,
                border: Border.all(
                  color: isSelected
                      ? CreatorColors.primary
                      : CreatorColors.outlineVariant.withValues(alpha: 0.5),
                  width: 1,
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                filter,
                style: AppTextStyles.labelSm(
                  color: isSelected ? Colors.white : CreatorColors.onSurfaceVariant,
                ).copyWith(
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
