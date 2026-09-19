import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_shadows.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';
import 'my_works_progress_gauge.dart';

/// Quick metric overview bento card showing pipeline totals and completion gauge.
class MyWorksMetricBento extends StatelessWidget {
  final String amount;
  final String activeCollabsText;
  final double completionPercentage;

  const MyWorksMetricBento({
    super.key,
    this.amount = '₹1,27,000',
    this.activeCollabsText = '3 active collaborations underway',
    this.completionPercentage = 0.68,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: CreatorColors.surfaceContainerLowest,
        borderRadius: AppRadii.roundedXl,
        boxShadow: AppShadows.cardSoft,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ACTIVE DELIVERABLES',
                  style: AppTextStyles.labelSm(
                    color: CreatorColors.onSurfaceVariant,
                  ).copyWith(letterSpacing: 0.8),
                ),
                const SizedBox(height: 4),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      amount,
                      style: AppTextStyles.displayLg(
                        color: CreatorColors.onSurface,
                      ).copyWith(fontSize: 26, fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'in pipeline',
                      style: AppTextStyles.labelMd(
                        color: CreatorColors.primaryContainer,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  activeCollabsText,
                  style: AppTextStyles.bodySm(color: CreatorColors.outline),
                ),
              ],
            ),
          ),
          MyWorksProgressGauge(percentage: completionPercentage),
        ],
      ),
    );
  }
}
