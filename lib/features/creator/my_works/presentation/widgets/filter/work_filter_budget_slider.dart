import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_shadows.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';

/// Monetization payout slider with frequency histogram bars and preset pills.
class WorkFilterBudgetSlider extends StatefulWidget {
  const WorkFilterBudgetSlider({super.key});

  @override
  State<WorkFilterBudgetSlider> createState() => _WorkFilterBudgetSliderState();
}

class _WorkFilterBudgetSliderState extends State<WorkFilterBudgetSlider> {
  RangeValues _currentRange = const RangeValues(20000, 100000);
  String _selectedPill = '₹25,000 – ₹75,000';

  static const List<String> pills = ['< ₹25,000', '₹25,000 – ₹75,000', '₹75,000 – ₹1.5L', '> ₹1.5L'];
  static const List<double> barHeights = [8, 12, 16, 24, 28, 32, 28, 20, 16, 12, 8];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: CreatorColors.surfaceContainerLowest,
        borderRadius: AppRadii.roundedXl,
        boxShadow: AppShadows.cardSoft,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text('Monetization Payout', style: AppTextStyles.labelLg(color: CreatorColors.onSurface).copyWith(fontWeight: FontWeight.w700), overflow: TextOverflow.ellipsis),
              ),
              Text('₹20,000 – ₹1,00,000', style: AppTextStyles.labelMd(color: CreatorColors.primary).copyWith(fontWeight: FontWeight.w800)),
            ],
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 6,
            children: pills.map((pill) {
              final isSel = pill == _selectedPill;
              return InkWell(
                onTap: () => setState(() => _selectedPill = pill),
                borderRadius: AppRadii.roundedFull,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: isSel ? CreatorColors.primary : CreatorColors.surfaceContainerLow,
                    borderRadius: AppRadii.roundedFull,
                  ),
                  child: Text(pill, style: AppTextStyles.labelSm(color: isSel ? Colors.white : CreatorColors.onSurfaceVariant).copyWith(fontSize: 10)),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: barHeights.map((h) {
              return Container(
                width: 6,
                height: h,
                decoration: BoxDecoration(
                  color: h > 20 ? CreatorColors.primary : CreatorColors.surfaceContainer,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(2)),
                ),
              );
            }).toList(),
          ),
          RangeSlider(
            values: _currentRange,
            min: 5000,
            max: 250000,
            activeColor: CreatorColors.primary,
            inactiveColor: CreatorColors.surfaceContainerHigh,
            onChanged: (vals) => setState(() => _currentRange = vals),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Min: ₹5,000', style: AppTextStyles.labelSm(color: CreatorColors.onSurfaceVariant)),
              Text('Max: ₹2,50,000+', style: AppTextStyles.labelSm(color: CreatorColors.onSurfaceVariant)),
            ],
          ),
        ],
      ),
    );
  }
}
