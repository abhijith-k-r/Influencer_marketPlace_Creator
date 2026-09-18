import 'package:flutter/material.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/theme/creator_colors.dart';
import 'creator_balance_metric_card.dart';

class CreatorBalanceOverviewCarousel extends StatelessWidget {
  const CreatorBalanceOverviewCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('BALANCE OVERVIEW', style: AppTextStyles.labelMd(color: CreatorColors.outline).copyWith(fontWeight: FontWeight.w700, letterSpacing: 0.8)),
              InkWell(
                onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Downloading Account Statements...'), duration: Duration(seconds: 2)),
                ),
                child: Row(
                  children: [
                    Text('Account Statements', style: AppTextStyles.labelSm(color: CreatorColors.primary).copyWith(fontWeight: FontWeight.w700)),
                    const Icon(Icons.chevron_right_rounded, size: 16, color: CreatorColors.primary),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 170,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            children: [
              CreatorBalanceMetricCard(
                title: 'Total Earnings',
                amount: '₹1,85,000',
                icon: Icons.account_balance_wallet_rounded,
                iconBgColor: CreatorColors.primary.withValues(alpha: 0.1),
                iconColor: CreatorColors.primary,
                subtitleWidget: Row(
                  children: [
                    Text('+18% vs last mo', style: AppTextStyles.labelSm(color: CreatorColors.primary).copyWith(fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              CreatorBalanceMetricCard(
                title: 'Pending Releases',
                amount: '₹45,000',
                icon: Icons.hourglass_top_rounded,
                iconBgColor: CreatorColors.surfaceContainerHigh,
                iconColor: CreatorColors.primary,
                subtitleWidget: Text('3 Escrow milestones in review', style: AppTextStyles.bodySm(color: CreatorColors.onSurfaceVariant)),
              ),
              const SizedBox(width: 10),
              CreatorBalanceMetricCard(
                title: 'Released Payments',
                amount: '₹1,40,000',
                icon: Icons.check_circle_rounded,
                iconBgColor: CreatorColors.surfaceContainerHighest,
                iconColor: CreatorColors.primary,
                subtitleWidget: Text('12 Settled payouts safely wired', style: AppTextStyles.bodySm(color: CreatorColors.onSurfaceVariant)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
