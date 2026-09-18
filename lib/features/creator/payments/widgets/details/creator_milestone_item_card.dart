import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';
import 'package:creator_side/features/creator/payments/models/creator_payment_milestone_model.dart';

class CreatorMilestoneItemCard extends StatelessWidget {
  final CreatorPaymentMilestoneModel milestone;
  final VoidCallback? onRedeem;

  const CreatorMilestoneItemCard({super.key, required this.milestone, this.onRedeem});

  @override
  Widget build(BuildContext context) {
    final isRedeem = milestone.isAvailableToRedeem;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isRedeem ? CreatorColors.primaryContainer.withValues(alpha: 0.25) : CreatorColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(AppRadii.lg),
        border: Border.all(
          color: isRedeem ? CreatorColors.primary.withValues(alpha: 0.5) : CreatorColors.outlineVariant.withValues(alpha: 0.5),
          width: isRedeem ? 1.5 : 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(milestone.phaseLabel, style: AppTextStyles.labelSm(color: isRedeem ? CreatorColors.primary : CreatorColors.outline).copyWith(fontSize: 10, fontWeight: FontWeight.w700)),
              Text(milestone.amount, style: AppTextStyles.labelLg(color: isRedeem ? CreatorColors.primary : CreatorColors.onSurface).copyWith(fontWeight: FontWeight.w800)),
            ],
          ),
          const SizedBox(height: 6),
          Text(milestone.title, style: AppTextStyles.labelLg(color: CreatorColors.onSurface).copyWith(fontWeight: FontWeight.w700)),
          if (milestone.subtitle != null) ...[
            const SizedBox(height: 4),
            Text(milestone.subtitle!, style: AppTextStyles.labelSm(color: CreatorColors.outline)),
          ],
          const SizedBox(height: 10),
          if (milestone.isReleased)
            Row(
              children: [
                const Icon(Icons.check_circle_rounded, size: 16, color: Color(0xFF00A86B)),
                const SizedBox(width: 6),
                Text(milestone.settledDateNote ?? 'Released to Wallet', style: AppTextStyles.labelSm(color: const Color(0xFF00A86B)).copyWith(fontSize: 10, fontWeight: FontWeight.w600)),
              ],
            ),
          if (isRedeem)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: onRedeem,
                style: ElevatedButton.styleFrom(backgroundColor: CreatorColors.primary, foregroundColor: CreatorColors.onPrimary, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadii.md)), padding: const EdgeInsets.symmetric(vertical: 12)),
                icon: const Icon(Icons.bolt_rounded, size: 18),
                label: Text('Redeem Payment • ${milestone.amount}', style: AppTextStyles.labelMd(color: CreatorColors.onPrimary).copyWith(fontWeight: FontWeight.w700)),
              ),
            ),
          if (milestone.isLocked)
            Row(
              children: [
                const Icon(Icons.lock_outline_rounded, size: 14, color: CreatorColors.outline),
                const SizedBox(width: 6),
                Expanded(child: Text(milestone.progressNote ?? milestone.lockNote ?? 'Locked Milestone', style: AppTextStyles.labelSm(color: CreatorColors.outline).copyWith(fontSize: 10))),
              ],
            ),
        ],
      ),
    );
  }
}
