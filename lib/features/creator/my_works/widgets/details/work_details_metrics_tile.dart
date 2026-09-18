import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';

/// Metrics block in Work Details hero card displaying payout and timeline.
class WorkDetailsMetricsTile extends StatelessWidget {
  final String agreedFee;
  final String timeline;

  const WorkDetailsMetricsTile({
    super.key,
    required this.agreedFee,
    required this.timeline,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        color: CreatorColors.surfaceContainerLow,
        borderRadius: AppRadii.roundedMd,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'TOTAL CREATOR PAYOUT',
                style: AppTextStyles.labelSm(color: CreatorColors.outline).copyWith(letterSpacing: 0.5),
              ),
              const SizedBox(height: 2),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    agreedFee,
                    style: AppTextStyles.displayLg(
                      color: CreatorColors.primaryContainer,
                    ).copyWith(fontSize: 24, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(width: 4),
                  Text('INR', style: AppTextStyles.labelSm(color: CreatorColors.outline)),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'TIMELINE',
                style: AppTextStyles.labelSm(color: CreatorColors.outline).copyWith(letterSpacing: 0.5),
              ),
              const SizedBox(height: 2),
              Text(
                timeline,
                style: AppTextStyles.bodySm(color: CreatorColors.onSurface).copyWith(fontWeight: FontWeight.w600),
              ),
              Text('2 Months Active', style: AppTextStyles.labelSm(color: CreatorColors.primary)),
            ],
          ),
        ],
      ),
    );
  }
}
