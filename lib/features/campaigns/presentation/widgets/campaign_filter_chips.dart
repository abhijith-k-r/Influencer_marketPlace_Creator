import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Horizontal scrolling filter category pills.
class CampaignFilterChips extends StatelessWidget {
  final String selectedCategory;
  final ValueChanged<String> onSelect;

  const CampaignFilterChips({
    super.key,
    required this.selectedCategory,
    required this.onSelect,
  });

  static const List<String> categories = [
    'All',
    'Tech',
    'Lifestyle',
    'Gaming',
    'Beauty',
    'Fitness',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: categories.map((cat) {
          final bool isSelected = selectedCategory == cat;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ChoiceChip(
              label: Text(cat),
              selected: isSelected,
              labelStyle: AppTextStyles.brandPill.copyWith(
                color: isSelected
                    ? AppColors.surfaceWhite
                    : AppColors.textPrimary,
                fontSize: 11,
              ),
              selectedColor: AppColors.buttonPrimary,
              backgroundColor: AppColors.surfaceWhite,
              shape: const RoundedRectangleBorder(
                borderRadius: AppRadii.roundedPill,
                side: BorderSide(color: Colors.transparent),
              ),
              onSelected: (_) => onSelect(cat),
            ),
          );
        }).toList(),
      ),
    );
  }
}
