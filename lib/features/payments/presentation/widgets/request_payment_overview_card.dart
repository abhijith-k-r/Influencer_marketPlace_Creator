import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_text_styles.dart';
import 'milestone_disbursement_header.dart';

/// Overview card presenting milestone gross, platform fees, and net payout.
class RequestPaymentOverviewCard extends StatelessWidget {
  final String grossAmount;
  final String feeAmount;
  final String netAmount;

  const RequestPaymentOverviewCard({
    super.key,
    this.grossAmount = '₹2,000',
    this.feeAmount = '-₹200',
    this.netAmount = '₹1,800',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surfaceWhite,
        borderRadius: AppRadii.roundedLg,
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MilestoneDisbursementHeader(),
          const SizedBox(height: 14),
          Text('50K Views Performance Bonus', style: AppTextStyles.h4),
          const SizedBox(height: 14),
          _buildRow('Gross Milestone Value', grossAmount),
          const SizedBox(height: 8),
          _buildRow('Platform Service Fee (10%)', feeAmount, isFee: true),
          const Divider(height: 24, color: AppColors.borderLight),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Net Payout Amount',
                style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w700),
              ),
              Text(
                netAmount,
                style: AppTextStyles.h2.copyWith(
                  fontWeight: FontWeight.w800,
                  color: AppColors.emeraldDark,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRow(String label, String value, {bool isFee = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: AppTextStyles.bodySmall),
        Text(
          value,
          style: AppTextStyles.bodySmall.copyWith(
            fontWeight: FontWeight.w600,
            color: isFee ? AppColors.error : AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}
