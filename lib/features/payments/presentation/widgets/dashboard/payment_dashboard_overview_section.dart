import 'package:flutter/material.dart';
import '../../../bloc/payment_state.dart';
import 'escrow_protection_banner.dart';
import 'escrow_summary_grid.dart';
import 'total_outflow_card.dart';

class PaymentDashboardOverviewSection extends StatelessWidget {
  final PaymentState state;

  const PaymentDashboardOverviewSection({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 8),
          const EscrowProtectionBanner(),
          const SizedBox(height: 12),
          TotalOutflowCard(amount: state.totalOutflow),
          const SizedBox(height: 8),
          EscrowSummaryGrid(
            pendingAmount: state.pendingEscrow,
            completedAmount: state.completedEscrow,
          ),
          const SizedBox(height: 14),
        ],
      ),
    );
  }
}
