import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';
import '../../models/creator_work_deliverable.dart';

/// Single item tile in the Deliverables checklist.
class WorkDeliverableItemTile extends StatelessWidget {
  final CreatorWorkDeliverable item;

  const WorkDeliverableItemTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: item.isPending
            ? CreatorColors.surfaceContainerHighest.withValues(alpha: 0.6)
            : CreatorColors.surfaceContainerLow,
        borderRadius: AppRadii.roundedMd,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLeadingIcon(),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: AppTextStyles.bodyMd(color: CreatorColors.onSurface).copyWith(
                    fontWeight: FontWeight.w700,
                    decoration: item.isCompleted ? TextDecoration.lineThrough : null,
                    color: item.isCompleted ? CreatorColors.onSurface.withValues(alpha: 0.7) : CreatorColors.onSurface,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      item.isCompleted ? Icons.check_circle_outline_rounded : Icons.schedule_rounded,
                      size: 14,
                      color: item.isCompleted ? CreatorColors.primary : CreatorColors.error,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        item.subtitle,
                        style: AppTextStyles.labelSm(
                          color: item.isCompleted ? CreatorColors.outline : CreatorColors.error,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeadingIcon() {
    if (item.isCompleted) {
      return Container(
        width: 24,
        height: 24,
        decoration: const BoxDecoration(color: CreatorColors.primary, shape: BoxShape.circle),
        child: const Icon(Icons.check_rounded, color: Colors.white, size: 16),
      );
    }
    return Container(
      width: 24,
      height: 24,
      decoration: const BoxDecoration(color: CreatorColors.surfaceContainerLowest, shape: BoxShape.circle),
      child: Center(
        child: Container(width: 8, height: 8, decoration: const BoxDecoration(color: CreatorColors.outline, shape: BoxShape.circle)),
      ),
    );
  }
}
