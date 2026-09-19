import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:creator_side/core/widgets/shared/app_scaffold.dart';
import 'package:creator_side/core/widgets/shared/app_snack_bar.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../bloc/payment_bloc.dart';
import '../../bloc/payment_state.dart';
import '../../data/datasources/mock_payment_data.dart';
import '../widgets/details/milestone_schedule_card.dart';
import '../widgets/details/payment_details_action_buttons.dart';
import '../widgets/details/payment_details_top_bar.dart';
import '../widgets/details/payment_receipt_card.dart';
import '../widgets/details/transaction_fee_breakdown_card.dart';
import '../widgets/details/transaction_method_card.dart';

class BrandPaymentDetailsScreen extends StatelessWidget {
  const BrandPaymentDetailsScreen({super.key});

  void _showToast(BuildContext context, String message) {
    AppSnackBar.showSuccess(context, message);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColors.surface,
      useSafeArea: true,
      body: BlocBuilder<PaymentBloc, PaymentState>(
          builder: (context, state) {
            final tx = state.selectedTransaction ??
                MockPaymentData.transactions.first;

            return Column(
              children: [
                PaymentDetailsTopBar(
                  onBackTap: () => Navigator.of(context).pop(),
                  onShareTap: () => _showToast(context, 'Receipt shared'),
                  onDownloadTap: () =>
                      _showToast(context, 'Downloading receipt...'),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Column(
                      children: [
                        PaymentReceiptCard(
                          transaction: tx,
                          onCopyPaymentId: () {
                            Clipboard.setData(ClipboardData(text: tx.paymentId));
                            _showToast(context, 'Payment ID copied');
                          },
                        ),
                        const SizedBox(height: 12),
                        MilestoneScheduleCard(
                          milestones: tx.milestones.isNotEmpty
                              ? tx.milestones
                              : MockPaymentData.aaravMilestones,
                        ),
                        const SizedBox(height: 12),
                        TransactionMethodCard(
                          transaction: tx,
                          onCopyUtr: () {
                            Clipboard.setData(ClipboardData(text: tx.bankUtrId));
                            _showToast(context, 'UTR ID copied');
                          },
                        ),
                        const SizedBox(height: 8),
                        TransactionFeeBreakdownCard(transaction: tx),
                        const SizedBox(height: 16),
                        PaymentDetailsActionButtons(
                          onDownloadInvoice: () =>
                              _showToast(context, 'Downloading Tax Invoice...'),
                          onRaiseDispute: () =>
                              _showToast(context, 'Dispute modal initiated'),
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
    );
  }
}
