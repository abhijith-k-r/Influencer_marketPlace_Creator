import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';
import 'package:creator_side/features/creator/payments/data/models/creator_payment_milestone_model.dart';

class CreatorMilestoneItemCard extends StatelessWidget {
  final CreatorPaymentMilestoneModel milestone;
  final VoidCallback? onRedeem;

  const CreatorMilestoneItemCard({
    super.key,
    required this.milestone,
    this.onRedeem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: const BoxDecoration(
        color: CreatorColors.surfaceContainerLowest,
        borderRadius: AppRadii.roundedMd,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  milestone.title,
                  style: AppTextStyles.labelMd(
                    color: CreatorColors.onSurface,
                  ).copyWith(fontWeight: FontWeight.w700),
                ),
              ),
              _buildMilestoneStatusBadge(milestone.status),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            milestone.description,
            style: AppTextStyles.bodySm(
              color: CreatorColors.outline,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                milestone.amount,
                style: AppTextStyles.labelLg(
                  color: CreatorColors.primary,
                ).copyWith(fontWeight: FontWeight.w800),
              ),
              if (milestone.isRedeemable && onRedeem != null)
                ElevatedButton(
                  onPressed: onRedeem,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CreatorColors.primary,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: const RoundedRectangleBorder(borderRadius: AppRadii.roundedMd),
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    minimumSize: const Size(0, 32),
                  ),
                  child: Text(
                    'Redeem Now',
                    style: AppTextStyles.labelSm(color: Colors.white).copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMilestoneStatusBadge(CreatorMilestoneStatus status) {
    Color bg;
    Color text;
    String label;

    switch (status) {
      case CreatorMilestoneStatus.readyToRedeem:
        bg = const Color(0x1F00A86B);
        text = const Color(0xFF00A86B);
        label = 'READY TO REDEEM';
      case CreatorMilestoneStatus.escrowLocked:
        bg = CreatorColors.surfaceContainerHigh;
        text = CreatorColors.onSurfaceVariant;
        label = 'ESCROW LOCKED';
      case CreatorMilestoneStatus.paidOut:
        bg = CreatorColors.surfaceContainer;
        text = CreatorColors.outline;
        label = 'PAID OUT';
      case CreatorMilestoneStatus.inReview:
        bg = const Color(0x2EBA1A1A);
        text = CreatorColors.error;
        label = 'IN REVIEW';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: AppRadii.roundedFull,
      ),
      child: Text(
        label,
        style: AppTextStyles.labelSm(color: text).copyWith(fontSize: 10, fontWeight: FontWeight.w800),
      ),
    );
  }
}
