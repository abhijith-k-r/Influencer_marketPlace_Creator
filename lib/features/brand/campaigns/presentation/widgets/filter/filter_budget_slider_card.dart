import 'package:flutter/material.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_radii.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import 'filter_budget_preset_chips.dart';

class FilterBudgetSliderCard extends StatelessWidget {
  final double minBudget;
  final double maxBudget;
  final ValueChanged<RangeValues> onRangeChanged;
  final ValueChanged<double> onPresetBudgetSelected;

  const FilterBudgetSliderCard({
    super.key,
    required this.minBudget,
    required this.maxBudget,
    required this.onRangeChanged,
    required this.onPresetBudgetSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(AppRadii.xl),
        boxShadow: const [BoxShadow(color: Color(0x060B1C30), blurRadius: 10, offset: Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    const Icon(Icons.payments_rounded, size: 20, color: AppColors.tertiary),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text('Budget Range (₹)', style: AppTextStyles.headlineSm(color: AppColors.onSurface), maxLines: 1, overflow: TextOverflow.ellipsis),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Text('Escrow Protected', style: AppTextStyles.labelSm(color: AppColors.primary)),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(AppRadii.md)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Selected Range', style: AppTextStyles.labelMd(color: AppColors.tertiary)),
                const SizedBox(width: 8),
                Flexible(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text('₹${(minBudget / 1000).toInt()}k — ₹${(maxBudget / 1000).toInt()}k', style: AppTextStyles.currencyDisplay(color: AppColors.primary)),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          RangeSlider(
            values: RangeValues(minBudget.clamp(0, 300000), maxBudget.clamp(0, 300000)),
            min: 0,
            max: 300000,
            divisions: 30,
            activeColor: AppColors.primary,
            inactiveColor: AppColors.surfaceContainer,
            onChanged: onRangeChanged,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('₹0', style: AppTextStyles.labelSm(color: AppColors.tertiary)),
                Text('₹75,000', style: AppTextStyles.labelSm(color: AppColors.tertiary)),
                Text('₹1,50,000', style: AppTextStyles.labelSm(color: AppColors.tertiary)),
                Text('₹3,00,000+', style: AppTextStyles.labelSm(color: AppColors.tertiary)),
              ],
            ),
          ),
          const SizedBox(height: 12),
          FilterBudgetPresetChips(currentMax: maxBudget, onSelect: onPresetBudgetSelected),
        ],
      ),
    );
  }
}
