import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Selectable category and niche chips with active highlight states.
class NicheChipSelector extends StatelessWidget {
  final List<String> availableOptions;
  final List<String> selectedOptions;
  final ValueChanged<String> onToggle;

  const NicheChipSelector({
    super.key,
    required this.availableOptions,
    required this.selectedOptions,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: availableOptions.map((option) {
        final bool isSelected = selectedOptions.contains(option);
        return FilterChip(
          selected: isSelected,
          label: Text(option),
          labelStyle: AppTextStyles.fieldLabel.copyWith(
            color: isSelected ? AppColors.surfaceWhite : AppColors.textPrimary,
            fontSize: 12,
          ),
          backgroundColor: AppColors.inputBackground,
          selectedColor: AppColors.primary,
          checkmarkColor: AppColors.surfaceWhite,
          shape: const RoundedRectangleBorder(
            borderRadius: AppRadii.roundedPill,
            side: BorderSide(color: Colors.transparent),
          ),
          onSelected: (_) => onToggle(option),
        );
      }).toList(),
    );
  }
}
