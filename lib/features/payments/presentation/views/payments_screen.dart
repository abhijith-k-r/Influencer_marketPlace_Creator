import 'package:flutter/material.dart';
import '../../../../core/constants/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/automated_settlement_card.dart';
import '../widgets/escrow_guarantee_card.dart';
import '../widgets/milestone_progress_timeline.dart';
import '../widgets/payment_action_buttons.dart';
import '../widgets/payments_header.dart';

class PaymentsScreen extends StatelessWidget {
  final VoidCallback? onBack;

  const PaymentsScreen({
    super.key,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          PaymentsHeader(onBack: onBack),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const EscrowGuaranteeCard(),
                  const SizedBox(height: 24),
                  MilestoneProgressTimeline(
                    onClaimMilestone: () => _goToClaim(context),
                  ),
                  const SizedBox(height: 20),
                  const AutomatedSettlementCard(),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          PaymentActionButtons(
            onRequestPayout: () => _goToClaim(context),
            onViewAgreement: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Opening Escrow Agreement PDF...')),
              );
            },
          ),
        ],
      ),
    );
  }

  void _goToClaim(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoutes.requestPayment);
  }
}
