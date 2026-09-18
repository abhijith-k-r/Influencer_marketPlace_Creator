import 'package:flutter/material.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';

class RecentTransactionsHeader extends StatelessWidget {
  final int totalCount;
  final VoidCallback onViewLedgerTap;

  const RecentTransactionsHeader({
    super.key,
    required this.totalCount,
    required this.onViewLedgerTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Row(
            children: [
              Text('Recent Transactions', style: AppTextStyles.headlineSm()),
              const SizedBox(width: 8),
              Text('$totalCount total', style: AppTextStyles.labelSm(color: AppColors.tertiary)),
            ],
          ),
          InkWell(
            onTap: onViewLedgerTap,
            borderRadius: BorderRadius.circular(4),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              child: Text(
                'View Ledger',
                style: AppTextStyles.labelMd(color: AppColors.primary),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
