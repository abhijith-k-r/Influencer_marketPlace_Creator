import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_radii.dart';
import '../../../../../core/theme/app_shadows.dart';
import '../../../data/models/payment_transaction_model.dart';
import 'payment_disbursed_amount_box.dart';
import 'payment_mini_summary_bar.dart';
import 'payment_status_header_card.dart';

class PaymentReceiptCard extends StatelessWidget {
  final PaymentTransactionModel transaction;
  final VoidCallback onCopyPaymentId;

  const PaymentReceiptCard({
    super.key,
    required this.transaction,
    required this.onCopyPaymentId,
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
        children: [
          PaymentStatusHeaderCard(
            transaction: transaction,
            onCopyPaymentId: onCopyPaymentId,
          ),
          const SizedBox(height: 14),
          PaymentDisbursedAmountBox(transaction: transaction),
          const SizedBox(height: 10),
          PaymentMiniSummaryBar(
            totalCampaignAmount: transaction.totalCampaignAmount,
            escrowRemaining: transaction.escrowRemaining,
          ),
        ],
      ),
    );
  }
}
