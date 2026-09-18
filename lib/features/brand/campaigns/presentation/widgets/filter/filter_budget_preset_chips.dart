import 'package:flutter/material.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_radii.dart';
import '../../../../../../core/theme/app_text_styles.dart';

class FilterBudgetPresetChips extends StatelessWidget {
  final double currentMax;
  final ValueChanged<double> onSelect;

  const FilterBudgetPresetChips({
    super.key,
    required this.currentMax,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    const presets = [
      ('< ₹25,000', 25000.0),
      ('₹25k – ₹75k', 75000.0),
      ('₹75k – ₹1.5L', 150000.0),
      ('> ₹1.5L', 300000.0),
    ];
    return Wrap(
      spacing: 6,
      children: presets.map((p) {
        final isSel = currentMax == p.$2;
        return InkWell(
          onTap: () => onSelect(p.$2),
          borderRadius: BorderRadius.circular(AppRadii.sm),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: isSel ? AppColors.primary : AppColors.surfaceContainer,
              borderRadius: BorderRadius.circular(AppRadii.sm),
            ),
            child: Text(p.$1, style: AppTextStyles.labelSm(color: isSel ? AppColors.onPrimary : AppColors.tertiary)),
          ),
        );
      }).toList(),
    );
  }
}
