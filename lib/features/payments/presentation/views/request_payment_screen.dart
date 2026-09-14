import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../widgets/payout_destination_card.dart';
import '../widgets/request_payment_overview_card.dart';
import '../widgets/telemetry_verification_card.dart';

class RequestPaymentScreen extends StatefulWidget {
  const RequestPaymentScreen({super.key});

  @override
  State<RequestPaymentScreen> createState() => _RequestPaymentScreenState();
}

class _RequestPaymentScreenState extends State<RequestPaymentScreen> {
  bool _isAgreed = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
          color: AppColors.textPrimary,
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Claim Payout', style: AppTextStyles.h4),
            Text(
              'Milestone #2 • 50K Views Bonus',
              style: AppTextStyles.caption.copyWith(color: AppColors.textTertiary),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const RequestPaymentOverviewCard(),
            const SizedBox(height: 16),
            const TelemetryVerificationCard(),
            const SizedBox(height: 16),
            PayoutDestinationCard(
              isAgreed: _isAgreed,
              onAgreementChanged: (v) => setState(() => _isAgreed = v),
              onConfirm: _handleConfirm,
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  void _handleConfirm() {
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Disbursement Submitted'),
        content: const Text('Your transfer of ₹1,800 is being routed to your linked HDFC account via IMPS.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              Navigator.of(context).maybePop();
            },
            child: const Text('Done'),
          ),
        ],
      ),
    );
  }
}
