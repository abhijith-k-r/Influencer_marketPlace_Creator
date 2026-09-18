import 'package:flutter/material.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_radii.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../data/models/payment_transaction_model.dart';

class PaymentDisbursedAmountBox extends StatelessWidget {
  final PaymentTransactionModel transaction;

  const PaymentDisbursedAmountBox({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(AppRadii.xl),
      ),
      child: Column(
        children: [
          Text(
            'DISBURSED AMOUNT',
            style: AppTextStyles.labelSm(color: AppColors.tertiary),
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                '₹',
                style: AppTextStyles.headlineLg(color: AppColors.primary),
              ),
              const SizedBox(width: 2),
              Text(
                '25,000',
                style: AppTextStyles.displayLg(color: AppColors.primary),
              ),
              Text(
                '.00',
                style: AppTextStyles.headlineMd(
                  color: AppColors.primary.withValues(alpha: 0.8),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.secondary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(AppRadii.full),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.check_circle_rounded,
                  size: 16,
                  color: AppColors.secondary,
                ),
                const SizedBox(width: 6),
                Text(
                  'Paid & Escrow Released',
                  style: AppTextStyles.labelSm(color: AppColors.secondary),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.schedule, size: 14, color: AppColors.tertiary),
              const SizedBox(width: 4),
              Text(
                transaction.paidTimestampText,
                style: AppTextStyles.bodySm(color: AppColors.tertiary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
