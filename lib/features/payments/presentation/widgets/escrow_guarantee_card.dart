import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_shadows.dart';
import '../../../../core/theme/app_text_styles.dart';
import 'escrow_breakdown_bar.dart';
import 'escrow_funding_header.dart';

/// Glowing purple escrow guarantee card highlighting net payout & safety.
class EscrowGuaranteeCard extends StatelessWidget {
  final String totalValue;
  final String feeAmount;
  final String netPayout;

  const EscrowGuaranteeCard({
    super.key,
    this.totalValue = '₹29,000',
    this.feeAmount = '-₹2,900',
    this.netPayout = '₹26,100',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: AppColors.escrowGradient,
        borderRadius: BorderRadius.circular(AppRadii.xl),
        boxShadow: AppShadows.escrow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const EscrowFundingHeader(),
          const SizedBox(height: 18),
          Text(
            'Net Creator Payout',
            style: AppTextStyles.caption.copyWith(
              color: AppColors.textWhite.withValues(alpha: 0.7),
            ),
          ),
          const SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                netPayout,
                style: AppTextStyles.h1.copyWith(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textWhite,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'INR',
                style: AppTextStyles.bodyMedium.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.textWhite.withValues(alpha: 0.8),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          EscrowBreakdownBar(
            totalValue: totalValue,
            feeAmount: feeAmount,
          ),
        ],
      ),
    );
  }
}
