import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_shadows.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';
import '../../models/creator_work_deliverable.dart';
import 'work_deliverable_item_tile.dart';

/// Container for Campaign Deliverables checklist.
class WorkDeliverablesChecklist extends StatelessWidget {
  final List<CreatorWorkDeliverable> deliverables;

  const WorkDeliverablesChecklist({super.key, required this.deliverables});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: CreatorColors.surfaceContainerLowest,
        borderRadius: AppRadii.roundedXl,
        boxShadow: AppShadows.cardSoft,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Campaign Deliverables',
                      style: AppTextStyles.headlineSm(
                        color: CreatorColors.onSurface,
                      ).copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'Track milestones and handoffs',
                      style: AppTextStyles.bodySm(color: CreatorColors.outline),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: const BoxDecoration(
                  color: CreatorColors.surfaceContainer,
                  borderRadius: AppRadii.roundedFull,
                ),
                child: Text(
                  '2 of 3 Completed',
                  style: AppTextStyles.labelSm(
                    color: CreatorColors.primary,
                  ).copyWith(fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: deliverables.length,
            separatorBuilder: (_, _) => const SizedBox(height: 8),
            itemBuilder: (context, index) => WorkDeliverableItemTile(item: deliverables[index]),
          ),
        ],
      ),
    );
  }
}
