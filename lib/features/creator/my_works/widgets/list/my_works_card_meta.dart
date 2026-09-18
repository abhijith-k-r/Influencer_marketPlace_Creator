import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';
import '../../models/creator_work_item.dart';

/// Compensation and milestones progress container in a work card.
class MyWorksCardMeta extends StatelessWidget {
  final CreatorWorkItem item;

  const MyWorksCardMeta({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final isSettled = item.status == 'Paid';
    final isApplied = item.status == 'Applied';
    final feeLabel = isSettled ? 'PAYOUT SETTLED' : (isApplied ? 'PROPOSED BUDGET' : 'AGREED FEE');
    final feeColor = isSettled ? CreatorColors.onSurface : CreatorColors.primaryContainer;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        color: CreatorColors.surfaceContainerLow,
        borderRadius: AppRadii.roundedMd,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(feeLabel, style: AppTextStyles.labelSm(color: CreatorColors.onSurfaceVariant)),
              Text(item.agreedFee, style: AppTextStyles.headlineMd(color: feeColor).copyWith(fontWeight: FontWeight.w800)),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              const Icon(Icons.schedule_rounded, size: 15, color: CreatorColors.primaryContainer),
              const SizedBox(width: 6),
              Expanded(
                child: Text(item.durationSpecs, style: AppTextStyles.bodySm(color: CreatorColors.onSurfaceVariant), overflow: TextOverflow.ellipsis),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(isApplied ? 'Brand Status' : 'Milestones Completed', style: AppTextStyles.labelSm(color: CreatorColors.outline)),
              Text(
                isApplied ? 'Application under review' : '${item.milestonesCompleted} of ${item.milestonesTotal} Done',
                style: AppTextStyles.labelSm(color: isApplied ? CreatorColors.tertiary : CreatorColors.onSurface).copyWith(fontWeight: FontWeight.w700),
              ),
            ],
          ),
          if (!isApplied) ...[
            const SizedBox(height: 6),
            ClipRRect(
              borderRadius: AppRadii.roundedFull,
              child: LinearProgressIndicator(
                value: item.progressRatio,
                minHeight: 6,
                backgroundColor: CreatorColors.surfaceContainerHighest,
                valueColor: AlwaysStoppedAnimation<Color>(isSettled ? CreatorColors.primary : CreatorColors.primaryContainer),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
