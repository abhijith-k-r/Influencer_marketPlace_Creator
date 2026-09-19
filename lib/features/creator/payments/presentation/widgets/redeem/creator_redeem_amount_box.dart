import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';

class CreatorRedeemAmountBox extends StatelessWidget {
  final String amount;
  final String campaignTitle;

  const CreatorRedeemAmountBox({
    super.key,
    this.amount = '₹2,000.00',
    this.campaignTitle = 'FitFuel Nutrition • Story Set 1',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: CreatorColors.surfaceContainerLowest,
        borderRadius: AppRadii.roundedXl,
        border: Border.all(color: CreatorColors.outlineVariant.withValues(alpha: 0.6)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.bolt_rounded, size: 16, color: CreatorColors.primary),
              const SizedBox(width: 4),
              Text(
                'AMOUNT READY TO DISBURSE',
                style: AppTextStyles.labelSm(
                  color: CreatorColors.primary,
                ).copyWith(letterSpacing: 0.8, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            amount,
            style: AppTextStyles.displayLg(
              color: CreatorColors.onSurface,
            ).copyWith(fontSize: 36, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 4),
          Text(
            campaignTitle,
            style: AppTextStyles.bodySm(
              color: CreatorColors.outline,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: const BoxDecoration(
              color: Color(0x1F00A86B),
              borderRadius: AppRadii.roundedFull,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.check_circle_rounded, size: 12, color: Color(0xFF00A86B)),
                const SizedBox(width: 4),
                Text(
                  'Milestone Approved by Brand',
                  style: AppTextStyles.labelSm(
                    color: const Color(0xFF00A86B),
                  ).copyWith(fontSize: 10, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
