import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../data/models/payment_milestone_model.dart';
import 'milestone_node_orb.dart';
import 'milestone_step_content.dart';

class MilestoneStepTile extends StatelessWidget {
  final PaymentMilestoneModel milestone;
  final bool isLast;

  const MilestoneStepTile({
    super.key,
    required this.milestone,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    final formattedAmount =
        '₹${milestone.amount.toInt().toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}';

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 32,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                if (!isLast)
                  Positioned(
                    top: 24,
                    bottom: 0,
                    child: Container(width: 2, color: AppColors.surfaceContainerHigh),
                  ),
                MilestoneNodeOrb(milestone: milestone),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: MilestoneStepContent(
              milestone: milestone,
              formattedAmount: formattedAmount,
            ),
          ),
        ],
      ),
    );
  }
}
