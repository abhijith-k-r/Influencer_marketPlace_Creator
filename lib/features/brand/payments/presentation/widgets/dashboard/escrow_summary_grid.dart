import 'package:flutter/material.dart';
import '../../../../../../core/theme/app_colors.dart';
import 'escrow_summary_tile.dart';

class EscrowSummaryGrid extends StatelessWidget {
  final double pendingAmount;
  final int pendingCount;
  final double completedAmount;
  final int completedCount;

  const EscrowSummaryGrid({
    super.key,
    required this.pendingAmount,
    this.pendingCount = 3,
    required this.completedAmount,
    this.completedCount = 18,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: EscrowSummaryTile(
            icon: Icons.lock_clock_rounded,
            iconColor: AppColors.outline,
            iconBg: AppColors.surfaceContainerHigh,
            badgeText: '$pendingCount Items',
            badgeBg: AppColors.surfaceContainer,
            badgeColor: AppColors.tertiary,
            title: 'Pending Escrow',
            amount: '₹65,000',
            subtitle: 'Awaiting review',
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: EscrowSummaryTile(
            icon: Icons.check_circle_rounded,
            iconColor: AppColors.secondary,
            iconBg: AppColors.secondaryContainer.withValues(alpha: 0.15),
            badgeText: '$completedCount Settled',
            badgeBg: AppColors.secondaryFixed,
            badgeColor: AppColors.onSecondaryFixed,
            title: 'Completed',
            amount: '₹4,20,000',
            subtitle: 'Delivered & closed',
          ),
        ),
      ],
    );
  }
}
