import 'package:flutter/material.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_radii.dart';
import '../../../../../../core/theme/app_shadows.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../data/models/payment_transaction_model.dart';
import 'transaction_detail_tile.dart';

class TransactionMethodCard extends StatelessWidget {
  final PaymentTransactionModel transaction;
  final VoidCallback onCopyUtr;

  const TransactionMethodCard({
    super.key,
    required this.transaction,
    required this.onCopyUtr,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(AppRadii.xxl),
        boxShadow: AppShadows.cardSoft,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.account_balance_rounded,
                color: AppColors.secondary,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text('Transaction Breakdown', style: AppTextStyles.headlineSm()),
            ],
          ),
          const SizedBox(height: 14),
          TransactionDetailTile(
            leading: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(AppRadii.md),
              ),
              child: const Icon(
                Icons.account_balance_wallet_rounded,
                size: 18,
                color: AppColors.onSurface,
              ),
            ),
            label: 'Payment Method',
            title: transaction.paymentMethod,
            subtitle: transaction.paymentMethodDetail,
            trailing: const Icon(
              Icons.check_circle_rounded,
              size: 20,
              color: AppColors.secondary,
            ),
          ),
          const SizedBox(height: 10),
          TransactionDetailTile(
            label: 'Bank Ref UTR ID',
            title: transaction.bankUtrId,
            trailing: IconButton(
              icon: const Icon(Icons.content_copy_rounded, size: 18),
              color: AppColors.tertiary,
              onPressed: onCopyUtr,
            ),
          ),
          const SizedBox(height: 10),
          TransactionDetailTile(
            label: 'Billed Organization & GSTIN',
            title: transaction.billedOrg,
            subtitle: 'GSTIN: ${transaction.gstin}',
          ),
        ],
      ),
    );
  }
}
