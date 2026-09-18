import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';

class CreatorRedeemAmountBox extends StatelessWidget {
  final String amount;

  const CreatorRedeemAmountBox({
    super.key,
    this.amount = '₹2,000.00',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
      decoration: BoxDecoration(
        color: CreatorColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(AppRadii.xl),
        border: Border.all(color: CreatorColors.primary.withValues(alpha: 0.3)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            CreatorColors.surfaceContainerLowest,
            CreatorColors.primaryContainer.withValues(alpha: 0.15),
          ],
        ),
      ),
      child: Column(
        children: [
          Text(
            'Amount to Redeem',
            style: AppTextStyles.labelSm(
              color: CreatorColors.outline,
            ).copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Text(
            amount,
            style: AppTextStyles.currencyDisplay(
              color: CreatorColors.primary,
            ).copyWith(fontSize: 32, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFF00A86B).withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(AppRadii.full),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.bolt_rounded, size: 14, color: Color(0xFF00A86B)),
                const SizedBox(width: 4),
                Text(
                  'Brand Escrow Protocol • Instant Transfer Eligible',
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
