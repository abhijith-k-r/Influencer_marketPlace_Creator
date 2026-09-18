import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';

class CreatorSettlementHistoryCard extends StatelessWidget {
  const CreatorSettlementHistoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CreatorColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(AppRadii.xl),
        border: Border.all(color: CreatorColors.outlineVariant.withValues(alpha: 0.6)),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.history_edu_rounded, size: 18, color: CreatorColors.primary),
              const SizedBox(width: 8),
              Text('Settlement History', style: AppTextStyles.labelLg(color: CreatorColors.onSurface).copyWith(fontWeight: FontWeight.w700)),
              const Spacer(),
              Text('2 Completed', style: AppTextStyles.labelSm(color: CreatorColors.outline).copyWith(fontSize: 10)),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(height: 1),
          const SizedBox(height: 12),
          _buildSettlementTile(title: 'Concept & Script Advance', date: 'Oct 18, 2024 • HDFC Bank ••4021', utr: 'UTR-891048201', amount: '₹15,000'),
          const SizedBox(height: 12),
          _buildSettlementTile(title: 'Draft Reel Video Approval', date: 'Oct 24, 2024 • HDFC Bank ••4021', utr: 'UTR-993810238', amount: '₹25,000'),
        ],
      ),
    );
  }

  Widget _buildSettlementTile({required String title, required String date, required String utr, required String amount}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(color: const Color(0xFF00A86B).withValues(alpha: 0.1), shape: BoxShape.circle),
          child: const Icon(Icons.check_rounded, size: 16, color: Color(0xFF00A86B)),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTextStyles.labelLg(color: CreatorColors.onSurface).copyWith(fontWeight: FontWeight.w600)),
              Text(date, style: AppTextStyles.labelSm(color: CreatorColors.outline).copyWith(fontSize: 10)),
              Text('Ref: $utr', style: AppTextStyles.labelSm(color: CreatorColors.outline).copyWith(fontSize: 10)),
            ],
          ),
        ),
        Text(amount, style: AppTextStyles.labelLg(color: const Color(0xFF00A86B)).copyWith(fontWeight: FontWeight.w700)),
      ],
    );
  }
}
