import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_radii.dart';
import '../../../../../core/theme/app_text_styles.dart';

class PaymentMiniSummaryBar extends StatelessWidget {
  final double totalCampaignAmount;
  final double escrowRemaining;

  const PaymentMiniSummaryBar({
    super.key,
    required this.totalCampaignAmount,
    required this.escrowRemaining,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(AppRadii.xl),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Campaign',
                  style: AppTextStyles.labelSm(color: AppColors.tertiary),
                ),
                const SizedBox(height: 2),
                Text('₹50,000', style: AppTextStyles.headlineSm()),
              ],
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(AppRadii.xl),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Escrow Remaining',
                  style: AppTextStyles.labelSm(color: AppColors.tertiary),
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Text(
                      '₹10,000',
                      style: AppTextStyles.headlineSm(color: AppColors.primary),
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.lock, size: 16, color: AppColors.tertiary),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
