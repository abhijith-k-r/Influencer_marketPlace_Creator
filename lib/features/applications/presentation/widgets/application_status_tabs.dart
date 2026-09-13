import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Status filter segmented tabs for submitted applications.
class ApplicationStatusTabs extends StatelessWidget {
  final String selectedTab;
  final ValueChanged<String> onTabChanged;

  const ApplicationStatusTabs({
    super.key,
    required this.selectedTab,
    required this.onTabChanged,
  });

  static const List<String> tabs = [
    'All',
    'In Review',
    'Accepted',
    'Completed',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: tabs.map((tab) {
          final bool isSelected = selectedTab == tab;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ChoiceChip(
              label: Text(tab),
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
              onSelected: (_) => onTabChanged(tab),
            ),
          );
        }).toList(),
      ),
    );
  }
}
