import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import 'pulse_metric_card.dart';
import 'pulse_metric_tags.dart';

/// 2x3 Grid of Marketplace Pulse metrics.
class MarketplacePulseGrid extends StatelessWidget {
  const MarketplacePulseGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      childAspectRatio: 1.45,
      children: [
        PulseMetricCard(
          icon: Icons.work_outline_rounded,
          iconColor: AppColors.primary,
          iconBgColor: const Color(0xFFEFF4FF),
          tagWidget: PulseMetricTags.pill(
            'LIVE',
            const Color(0xFFE1E0FF),
            AppColors.primary,
          ),
          value: '3',
          label: 'Active Campaigns',
        ),
        PulseMetricCard(
          icon: Icons.mark_email_unread_outlined,
          iconColor: AppColors.primary,
          iconBgColor: const Color(0x80E1E0FF),
          tagWidget: PulseMetricTags.pill(
            '2 NEW',
            const Color(0xFF6063EE),
            AppColors.textWhite,
          ),
          value: '2 Pending',
          label: 'Brand Pitches',
        ),
        PulseMetricCard(
          icon: Icons.account_balance_wallet_outlined,
          iconColor: AppColors.textPrimary,
          iconBgColor: const Color(0xFFEFF4FF),
          tagWidget: PulseMetricTags.textOnly('READY', AppColors.primary),
          value: '₹42,500',
          label: 'Available to Payout',
        ),
        PulseMetricCard(
          icon: Icons.lock_clock_outlined,
          iconColor: AppColors.textSecondary,
          iconBgColor: const Color(0xFFDCE9FF),
          tagWidget: PulseMetricTags.textOnly(
            'ESCROW',
            AppColors.textSecondary,
          ),
          value: '₹18,000',
          label: 'In Verification',
        ),
        PulseMetricCard(
          icon: Icons.visibility_outlined,
          iconColor: AppColors.primary,
          iconBgColor: const Color(0xFFEFF4FF),
          tagWidget: PulseMetricTags.trend('+14%'),
          value: '1.2M',
          label: 'Total Reach',
        ),
        PulseMetricCard(
          icon: Icons.auto_awesome_outlined,
          iconColor: AppColors.primary,
          iconBgColor: const Color(0xFFEFF4FF),
          tagWidget: PulseMetricTags.pill(
            'TOP 5%',
            const Color(0xFFE1E0FF),
            AppColors.primary,
          ),
          value: '5.8%',
          label: 'Avg Engagement',
        ),
      ],
    );
  }
}
