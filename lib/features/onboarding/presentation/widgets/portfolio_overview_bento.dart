import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_colors.dart';
import 'portfolio_overview_bento_item.dart';

/// Executive Overview Stats Bento (2 columns: Experience & Track Record).
class PortfolioOverviewBento extends StatelessWidget {
  const PortfolioOverviewBento({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: PortfolioOverviewBentoItem(
            title: 'Experience',
            value: '3+ Years',
            label: 'Content creation',
            icon: Icons.history_edu,
            iconBgColor: AppColors.pillBackground,
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: PortfolioOverviewBentoItem(
            title: 'Track Record',
            value: '18 Collabs',
            label: 'Vetted deliveries',
            icon: Icons.handshake_outlined,
            iconBgColor: AppColors.liveBadgeBackground,
          ),
        ),
      ],
    );
  }
}
