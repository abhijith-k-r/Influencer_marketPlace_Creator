import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_text_styles.dart';

class FilterChipItem {
  final String label;
  final IconData? icon;
  final Color? iconColor;

  const FilterChipItem({
    required this.label,
    this.icon,
    this.iconColor,
  });
}

class FilterChipsBar extends StatelessWidget {
  final String selectedFilter;
  final ValueChanged<String> onSelected;

  static const List<FilterChipItem> defaultFilters = [
    FilterChipItem(label: 'All Creators'),
    FilterChipItem(
      label: 'Instagram',
      icon: Icons.photo_camera_rounded,
      iconColor: AppColors.primary,
    ),
    FilterChipItem(
      label: 'YouTube',
      icon: Icons.smart_display_rounded,
      iconColor: AppColors.primary,
    ),
    FilterChipItem(
      label: 'TikTok',
      icon: Icons.music_note_rounded,
      iconColor: AppColors.secondary,
    ),
    FilterChipItem(label: '10K–50K'),
    FilterChipItem(label: '50K+'),
    FilterChipItem(
      label: 'Verified',
      icon: Icons.verified_rounded,
      iconColor: AppColors.secondary,
    ),
    FilterChipItem(
      label: 'Top 1%',
      icon: Icons.military_tech_rounded,
      iconColor: AppColors.primary,
    ),
    FilterChipItem(label: 'Fashion & Streetwear'),
    FilterChipItem(label: 'Fitness'),
    FilterChipItem(label: 'Tech'),
  ];

  const FilterChipsBar({
    super.key,
    required this.selectedFilter,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: defaultFilters.map((filter) {
          final isSelected = filter.label == selectedFilter;

          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: InkWell(
              onTap: () => onSelected(filter.label),
              borderRadius: AppRadii.roundedPill,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.primary
                      : AppColors.surfaceContainerLowest,
                  borderRadius: AppRadii.roundedPill,
                  border: isSelected
                      ? null
                      : Border.all(
                          color: AppColors.surfaceContainer,
                          width: 1,
                        ),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: AppColors.primary.withValues(alpha: 0.25),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ]
                      : null,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (filter.icon != null) ...[
                      Icon(
                        filter.icon,
                        size: 15,
                        color: isSelected ? Colors.white : filter.iconColor,
                      ),
                      const SizedBox(width: 6),
                    ],
                    Text(
                      filter.label,
                      style: AppTextStyles.labelMd(
                        color: isSelected ? Colors.white : AppColors.onSurface,
                      ).copyWith(
                        fontWeight:
                            isSelected ? FontWeight.w700 : FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
