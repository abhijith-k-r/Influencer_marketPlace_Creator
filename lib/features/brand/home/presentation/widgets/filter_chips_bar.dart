import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../data/models/filter_chip_item.dart';
import 'filter_chip_bubble.dart';

/// Horizontal scrollable bar for filtering creators by category (<65 LOC).
class FilterChipsBar extends StatelessWidget {
  final String selectedFilter;
  final ValueChanged<String> onSelected;

  static const List<FilterChipItem> defaultFilters = [
    FilterChipItem(label: 'All Creators'),
    FilterChipItem(label: 'Instagram', icon: Icons.photo_camera_rounded, iconColor: AppColors.primary),
    FilterChipItem(label: 'YouTube', icon: Icons.smart_display_rounded, iconColor: AppColors.primary),
    FilterChipItem(label: 'TikTok', icon: Icons.music_note_rounded, iconColor: AppColors.secondary),
    FilterChipItem(label: '10K–50K'),
    FilterChipItem(label: '50K+'),
    FilterChipItem(label: 'Verified', icon: Icons.verified_rounded, iconColor: AppColors.secondary),
    FilterChipItem(label: 'Top 1%', icon: Icons.military_tech_rounded, iconColor: AppColors.primary),
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
          return FilterChipBubble(
            item: filter,
            isSelected: filter.label == selectedFilter,
            onTap: () => onSelected(filter.label),
          );
        }).toList(),
      ),
    );
  }
}
