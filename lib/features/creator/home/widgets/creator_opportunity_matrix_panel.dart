import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/creator_colors.dart';
import '../models/creator_opportunity_model.dart';

class CreatorOpportunityMatrixPanel extends StatelessWidget {
  final CreatorOpportunityModel opportunity;

  const CreatorOpportunityMatrixPanel({super.key, required this.opportunity});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: CreatorColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text('Assured Budget', style: AppTextStyles.labelMd(color: CreatorColors.outline)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    opportunity.assuredBudget,
                    style: AppTextStyles.headlineMd(color: CreatorColors.primary).copyWith(fontWeight: FontWeight.w800),
                  ),
                  Text(opportunity.budgetNote, style: AppTextStyles.labelSm(color: CreatorColors.onSurfaceVariant)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 6),
          const Divider(color: CreatorColors.surfaceContainerHigh, height: 1),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.timelapse_rounded, size: 14, color: CreatorColors.outline),
              const SizedBox(width: 4),
              Text(opportunity.duration, style: AppTextStyles.bodySm(color: CreatorColors.onSurfaceVariant)),
              const SizedBox(width: 8),
              const Text('•', style: TextStyle(color: CreatorColors.outlineVariant)),
              const SizedBox(width: 8),
              const Icon(Icons.category_rounded, size: 14, color: CreatorColors.outline),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  opportunity.category,
                  style: AppTextStyles.bodySm(color: CreatorColors.onSurfaceVariant),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: CreatorColors.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(opportunity.deliverableIcon, size: 15, color: CreatorColors.primary),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    'Deliverable: ${opportunity.deliverable}',
                    style: AppTextStyles.labelMd(color: CreatorColors.onSurface),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
