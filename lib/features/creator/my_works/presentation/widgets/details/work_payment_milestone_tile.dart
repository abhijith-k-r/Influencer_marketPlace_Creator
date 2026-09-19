import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';
import 'package:creator_side/features/creator/my_works/data/models/creator_work_milestone.dart';

/// Single row tile for a payment milestone in Work Details.
class WorkPaymentMilestoneTile extends StatelessWidget {
  final CreatorWorkMilestone item;

  const WorkPaymentMilestoneTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: item.isEscrowLocked
            ? CreatorColors.surfaceContainerHigh.withValues(alpha: 0.5)
            : CreatorColors.surfaceContainerLow,
        borderRadius: AppRadii.roundedMd,
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: item.isReleased ? CreatorColors.primaryFixed : CreatorColors.surfaceContainerHighest,
              shape: BoxShape.circle,
            ),
            child: Icon(
              item.isReleased ? Icons.verified_rounded : Icons.lock_rounded,
              size: 16,
              color: item.isReleased ? CreatorColors.primary : CreatorColors.onSurfaceVariant,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: AppTextStyles.labelMd(color: CreatorColors.onSurface).copyWith(fontWeight: FontWeight.w700),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(item.subtitle, style: AppTextStyles.bodySm(color: CreatorColors.outline)),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                item.amount,
                style: AppTextStyles.labelLg(color: CreatorColors.onSurface).copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 2),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: item.isReleased ? CreatorColors.surfaceContainerHighest : CreatorColors.surfaceContainer,
                  borderRadius: AppRadii.roundedFull,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (item.isEscrowLocked) ...[
                      const Icon(Icons.lock_rounded, size: 10, color: CreatorColors.onSurfaceVariant),
                      const SizedBox(width: 2),
                    ],
                    Text(
                      item.isReleased ? 'Released' : 'Escrow Locked',
                      style: AppTextStyles.labelSm(
                        color: item.isReleased ? CreatorColors.primary : CreatorColors.onSurfaceVariant,
                      ).copyWith(fontSize: 10, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
