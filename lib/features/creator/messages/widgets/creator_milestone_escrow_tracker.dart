import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/creator_colors.dart';

class CreatorMilestoneEscrowTracker extends StatelessWidget {
  final String campaignName;
  final String milestoneStep;
  final String milestoneTitle;
  final String payoutAmount;

  const CreatorMilestoneEscrowTracker({
    super.key,
    this.campaignName = 'Sneaker Gen-2 Drop',
    this.milestoneStep = 'Milestone 2/3',
    this.milestoneTitle = 'Draft Video Sign-off',
    this.payoutAmount = '₹25,000',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: CreatorColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Color(0x060B1C30), blurRadius: 8, offset: Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.verified_rounded, size: 16, color: CreatorColors.primary),
                  const SizedBox(width: 5),
                  Text('Campaign: $campaignName', style: AppTextStyles.labelMd(color: CreatorColors.onSurface).copyWith(fontWeight: FontWeight.w700)),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: CreatorColors.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.lock_rounded, size: 12, color: CreatorColors.primary),
                    const SizedBox(width: 4),
                    Text('Escrow Protected', style: AppTextStyles.labelSm(color: CreatorColors.primary).copyWith(fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(milestoneStep, style: AppTextStyles.labelSm(color: CreatorColors.outline)),
                  Text(milestoneTitle, style: AppTextStyles.headlineSm(color: CreatorColors.onSurface)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Locked Payout', style: AppTextStyles.labelSm(color: CreatorColors.outline)),
                  Text(payoutAmount, style: AppTextStyles.headlineSm(color: CreatorColors.primary).copyWith(fontWeight: FontWeight.w800)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(child: Container(height: 5, decoration: BoxDecoration(color: CreatorColors.primary, borderRadius: BorderRadius.circular(4)))),
              const SizedBox(width: 4),
              Expanded(child: Container(height: 5, decoration: BoxDecoration(color: CreatorColors.secondary, borderRadius: BorderRadius.circular(4)))),
              const SizedBox(width: 4),
              Expanded(child: Container(height: 5, decoration: BoxDecoration(color: CreatorColors.surfaceContainerHigh, borderRadius: BorderRadius.circular(4)))),
            ],
          ),
        ],
      ),
    );
  }
}
