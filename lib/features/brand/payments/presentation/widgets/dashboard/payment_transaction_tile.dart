import 'package:flutter/material.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_radii.dart';
import '../../../../../../core/theme/app_shadows.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../data/models/payment_transaction_model.dart';
import 'payment_status_badge.dart';
import 'transaction_avatar.dart';
import 'transaction_milestone_strip.dart';

class PaymentTransactionTile extends StatelessWidget {
  final PaymentTransactionModel transaction;
  final ValueChanged<PaymentTransactionModel> onTap;

  const PaymentTransactionTile({
    super.key,
    required this.transaction,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final amountText =
        '₹${transaction.amount.toInt().toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}';

    return GestureDetector(
      onTap: () => onTap(transaction),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(AppRadii.xxl),
          boxShadow: AppShadows.cardSoft,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    TransactionAvatar(
                      avatarUrl: transaction.creatorAvatar,
                      status: transaction.status,
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(transaction.creatorName, style: AppTextStyles.labelLg()),
                            const SizedBox(width: 4),
                            const Icon(Icons.verified, size: 14, color: AppColors.secondary),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Text(
                          transaction.campaignTitle,
                          style: AppTextStyles.bodySm(color: AppColors.tertiary),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      amountText,
                      style: AppTextStyles.headlineSm(
                        color: transaction.isFailed
                            ? AppColors.onSurface
                            : AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: 2),
                    PaymentStatusPill(status: transaction.status),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            TransactionMilestoneStrip(
              milestoneDescription: transaction.milestoneDescription,
              dateText: transaction.dateText,
            ),
          ],
        ),
      ),
    );
  }
}
