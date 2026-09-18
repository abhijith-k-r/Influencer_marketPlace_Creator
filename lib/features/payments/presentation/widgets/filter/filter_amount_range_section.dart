import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_radii.dart';
import '../../../../../core/theme/app_shadows.dart';
import '../../../../../core/theme/app_text_styles.dart';
import 'amount_presets_grid.dart';

class FilterAmountRangeSection extends StatelessWidget {
  final String activePreset;
  final ValueChanged<String> onPresetSelected;
  final RangeValues rangeValues;
  final ValueChanged<RangeValues> onRangeChanged;

  static const List<String> presets = [
    '< ₹10,000',
    '₹10,000 – ₹50,000',
    '₹50,000 – ₹1,00,000',
    '> ₹1,00,000',
  ];

  const FilterAmountRangeSection({
    super.key,
    required this.activePreset,
    required this.onPresetSelected,
    this.rangeValues = const RangeValues(10000, 75000),
    required this.onRangeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(AppRadii.xxl),
        boxShadow: AppShadows.cardSoft,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.currency_rupee_rounded,
                    color: AppColors.primary,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text('Amount Range (₹)', style: AppTextStyles.headlineSm()),
                ],
              ),
              Text(
                '₹${rangeValues.start.toInt()} — ₹${rangeValues.end.toInt()}',
                style: AppTextStyles.labelSm(color: AppColors.primary),
              ),
            ],
          ),
          const SizedBox(height: 12),
          AmountPresetsGrid(
            presets: presets,
            activePreset: activePreset,
            onPresetSelected: onPresetSelected,
          ),
          const SizedBox(height: 14),
          RangeSlider(
            values: rangeValues,
            min: 0,
            max: 250000,
            divisions: 25,
            activeColor: AppColors.primary,
            inactiveColor: AppColors.surfaceContainerHigh,
            onChanged: onRangeChanged,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Min: ₹0', style: AppTextStyles.labelSm(color: AppColors.tertiary)),
              Text('Max: ₹2,50,000+', style: AppTextStyles.labelSm(color: AppColors.tertiary)),
            ],
          ),
        ],
      ),
    );
  }
}
