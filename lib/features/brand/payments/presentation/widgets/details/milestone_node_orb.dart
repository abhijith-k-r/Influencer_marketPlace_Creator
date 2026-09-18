import 'package:flutter/material.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../data/models/payment_milestone_model.dart';

class MilestoneNodeOrb extends StatelessWidget {
  final PaymentMilestoneModel milestone;

  const MilestoneNodeOrb({super.key, required this.milestone});

  @override
  Widget build(BuildContext context) {
    Color bg = AppColors.secondary;
    IconData icon = Icons.done;
    if (milestone.isCurrent) {
      bg = AppColors.primary;
      icon = Icons.done_all;
    } else if (milestone.isLocked) {
      bg = AppColors.surfaceContainerHigh;
      icon = Icons.lock;
    }
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: bg,
        shape: BoxShape.circle,
        boxShadow: milestone.isCurrent
            ? [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.25),
                  blurRadius: 0,
                  spreadRadius: 4,
                ),
              ]
            : null,
      ),
      child: Icon(
        icon,
        size: 14,
        color: milestone.isLocked ? AppColors.tertiary : Colors.white,
      ),
    );
  }
}
