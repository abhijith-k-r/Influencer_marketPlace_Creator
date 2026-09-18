import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_radii.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../data/models/payment_transaction_model.dart';

class PaymentStatusHeaderCard extends StatelessWidget {
  final PaymentTransactionModel transaction;
  final VoidCallback onCopyPaymentId;

  const PaymentStatusHeaderCard({
    super.key,
    required this.transaction,
    required this.onCopyPaymentId,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: AppColors.surfaceContainer,
                  backgroundImage: NetworkImage(transaction.creatorAvatar),
                ),
                const Positioned(
                  bottom: -2,
                  right: -2,
                  child: Icon(
                    Icons.verified_rounded,
                    size: 16,
                    color: AppColors.secondary,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(transaction.creatorName, style: AppTextStyles.headlineSm()),
                const SizedBox(height: 2),
                Text(
                  '${transaction.campaignTitle} • Milestone 2',
                  style: AppTextStyles.bodySm(color: AppColors.tertiary),
                ),
              ],
            ),
          ],
        ),
        GestureDetector(
          onTap: onCopyPaymentId,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(AppRadii.md),
            ),
            child: Row(
              children: [
                Text(
                  transaction.paymentId,
                  style: AppTextStyles.labelSm(color: AppColors.tertiary),
                ),
                const SizedBox(width: 4),
                const Icon(
                  Icons.content_copy_rounded,
                  size: 13,
                  color: AppColors.tertiary,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
