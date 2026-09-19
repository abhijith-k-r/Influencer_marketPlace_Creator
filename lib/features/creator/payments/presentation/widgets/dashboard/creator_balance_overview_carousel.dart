import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';
import 'creator_balance_metric_card.dart';

class CreatorBalanceOverviewCarousel extends StatelessWidget {
  final VoidCallback onRedeemTap;

  const CreatorBalanceOverviewCarousel({
    super.key,
    required this.onRedeemTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'BALANCE OVERVIEW',
            style: AppTextStyles.labelSm(
              color: CreatorColors.outline,
            ).copyWith(letterSpacing: 0.8, fontWeight: FontWeight.w700),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 175,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              SizedBox(
                width: 260,
                child: CreatorBalanceMetricCard(
                  title: 'Redeemable Balance',
                  amount: '₹38,500',
                  subtitle: '2 milestones ready to redeem',
                  icon: Icons.account_balance_wallet_rounded,
                  isPrimary: true,
                  actionLabel: 'Redeem Payout',
                  onAction: onRedeemTap,
                ),
              ),
              const SizedBox(width: 12),
              const SizedBox(
                width: 240,
                child: CreatorBalanceMetricCard(
                  title: 'Escrow Locked',
                  amount: '₹75,000',
                  subtitle: 'Backed by Smart Contract',
                  icon: Icons.lock_clock_rounded,
                ),
              ),
              const SizedBox(width: 12),
              const SizedBox(
                width: 240,
                child: CreatorBalanceMetricCard(
                  title: 'Total Earnings',
                  amount: '₹3,42,000',
                  subtitle: 'Lifetime creator earnings',
                  icon: Icons.trending_up_rounded,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
